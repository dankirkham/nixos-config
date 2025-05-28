{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "cuda-merged"
    "cuda_cuobjdump"
    "cuda_gdb"
    "cuda_nvcc"
    "cuda_nvdisasm"
    "cuda_nvprune"
    "nvidia-persistenced"
    "nvidia-settings"
    "nvidia-x11"
  ];
  # nixpkgs.config.nvidia.acceptLicense = true;

  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];
}
