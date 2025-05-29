{ config, lib, pkgs, ... }:
let
    libtorch-bin-27 = pkgs.callPackage ../../overrides/libtorch-bin.nix { cudaSupport = true; };
in {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "cuda-merged"

    "cuda_cccl"
    "cuda_cudart"
    "cuda_cuobjdump"
    "cuda_cupti"
    "cuda_cuxxfilt"
    "cuda_gdb"
    "cuda_nvcc"
    "cuda_nvdisasm"
    "cuda_nvml_dev"
    "cuda_nvprune"
    "cuda_nvrtc"
    "cuda_nvtx"
    "cuda_profiler_api"
    "cuda_sanitizer_api"

    "libcublas"
    "libcufft"
    "libcurand"
    "libcusolver"
    "libcusparse"
    "libnpp"
    "libnvjitlink"

    "nvidia-persistenced"
    "nvidia-settings"
    "nvidia-x11"
  ];

  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics.enable = true;
  hardware.opengl.enable = true;
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
    # (libtorch-bin-27.overrideAttrs (old: { cudaSupport = true; }))
    libtorch-bin-27
    linuxPackages.nvidia_x11
  ];

  environment.variables = {
    CUDA_PATH = pkgs.cudatoolkit;
    # EXTRA_LDFLAGS = "-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib";
    LD_LIBRARY_PATH="${pkgs.cudatoolkit}/lib64:${pkgs.cudatoolkit}/lib:$LD_LIBRARY_PATH";
    # LD_LIBRARY_PATH="/usr/lib/wsl/lib:${pkgs.linuxPackages.nvidia_x11}/lib:${pkgs.ncurses5}/lib";
    LIBTORCH = libtorch-bin-27;
    LIBTORCH_LIB = libtorch-bin-27;
    LIBTORCH_INCLUDE = libtorch-bin-27.dev;
  };
}
