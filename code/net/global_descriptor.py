import torch
from torch.nn import functional as F
import torch.nn as nn
import torch.nn.init as init


class L2Norm(nn.Module):
    def __init__(self):
        super().__init__()

    def forward(self, x):
        assert x.dim() == 2, 'the input tensor of L2Norm must be the shape of [B, C]'
        return F.normalize(x, p=2, dim=-1)


class GlobalDescriptor(nn.Module):
    def __init__(self, p=1):
        super().__init__()
        self.p = p

    def forward(self, x):
        assert x.dim() == 4, 'the input tensor of GlobalDescriptor must be the shape of [B, C, H, W]'
        if self.p == 1:
            return x.mean(dim=[-1, -2])
        elif self.p == float('inf'):
            return torch.flatten(F.adaptive_max_pool2d(x, output_size=(1, 1)), start_dim=1)
        else:
            sum_value = x.pow(self.p).mean(dim=[-1, -2])
            return torch.sign(sum_value) * (torch.abs(sum_value).pow(1.0 / self.p))

    def extra_repr(self):
        return 'p={}'.format(self.p)


class CGD_GlobalDescriptor(nn.Module):
    def __init__(self, num_ftrs, gd_config, feature_dim):
        super().__init__()
        n = len(gd_config)

        self.global_descriptors, self.main_modules = [], []
        for i in range(n):
            if gd_config[i].upper() == 'S':
                p = 1
            elif gd_config[i].upper() == 'M':
                p = float('inf')
            elif gd_config[i].upper() == 'G':
                p = 3
            else:
                raise KeyError('no such gd_config')
            self.global_descriptors.append(GlobalDescriptor(p=p))
            self.main_modules.append(nn.Sequential(nn.Linear(num_ftrs, feature_dim, bias=False), L2Norm()))
        self.global_descriptors = nn.ModuleList(self.global_descriptors)
        self.main_modules = nn.ModuleList(self.main_modules)
        self.fusion_layer = nn.Linear(n * feature_dim, feature_dim)

    def forward(self, x):
        global_descriptors = []
        for i in range(len(self.global_descriptors)):
            global_descriptor = self.global_descriptors[i](x)
            global_descriptor = self.main_modules[i](global_descriptor)
            global_descriptors.append(global_descriptor)
        global_descriptors = torch.cat(global_descriptors, dim=-1)
        global_descriptors = self.fusion_layer(global_descriptors)
        global_descriptors = F.normalize(global_descriptors, dim=-1)
        return global_descriptors

    def _initialize_weights(self):
        for main_module in self.main_modules:
            init.kaiming_normal_(main_module[0].weight, mode='fan_out')

class CGD_Globaldescriptor_addition(nn.Module):
    def __init__(self, num_ftrs, gd_config, feature_dim):
        super().__init__()
        n = len(gd_config)

        self.global_descriptors, self.main_modules = [], []
        for i in range(n):
            if gd_config[i].upper() == 'S':
                p = 1
            elif gd_config[i].upper() == 'M':
                p = float('inf')
            elif gd_config[i].upper() == 'G':
                p = 3
            else:
                raise KeyError('no such gd_config')
            self.global_descriptors.append(GlobalDescriptor(p=p))
        
        self.global_descriptors = nn.ModuleList(self.global_descriptors)
        self.FFN = nn.Linear(num_ftrs, feature_dim)

    def forward(self, x):
        global_descriptors = []
        for i in range(len(self.global_descriptors)):
            global_descriptor = self.global_descriptors[i](x)
            global_descriptors.append(global_descriptor)
        global_descriptors = sum(global_descriptors)
        global_descriptors = global_descriptors.view(global_descriptors.size(0), -1)
        global_descriptors = self.FFN(global_descriptors)
        global_descriptors = F.normalize(global_descriptors, dim=-1)
        return global_descriptors

    def _initialize_weights(self):
        init.kaiming_normal_(self.FFN.weight, mode='fan_out')

