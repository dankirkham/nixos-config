version:
builtins.getAttr version {
  "2.7.0" = {
    aarch64-darwin-cpu = {
      name = "libtorch-macos-arm64-2.7.0.zip";
      url = "https://download.pytorch.org/libtorch/cpu/libtorch-macos-arm64-2.7.0.zip";
      hash = "sha256-4d9YKUuvAESBeG/WCUsQfEHwdB2z34grnlwWslj4970=";
    };
    x86_64-linux-cpu = {
      name = "libtorch-cxx11-abi-shared-with-deps-2.7.0-cpu.zip";
      url = "https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-2.7.0%2Bcpu.zip";
      hash = "sha256-8REMU+E0DZQDRUw1zx0K5oMqVsTBJ8g88dqnLpUfcjM=";
    };
    x86_64-linux-cuda = {
      name = "libtorch-cxx11-abi-shared-with-deps-2.7.0-cu128.zip";
      url = "https://download.pytorch.org/libtorch/cu128/libtorch-cxx11-abi-shared-with-deps-2.7.0%2Bcu128.zip";
      hash = "sha256-UaX47GAwyZ6UmzgY85TeAHmy3u52pBHhiyM5NAz7ens=";
    };
  };
}
