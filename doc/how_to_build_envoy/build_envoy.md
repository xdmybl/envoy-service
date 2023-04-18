# 概述
    如何构建 envoy? 
    首先 envoy 目前并不来源于此项目, 目前我们仍直接使用 github 开源的 https://github.com/envoyproxy/envoy.git, 阅读完此文档后, 可以顺利编译出
    此 envoy-service 项目所需的 envoy相关文件(二进制文件).
    详情参考官方文档: https://github.com/envoyproxy/envoy/blob/4b5f5474f35763423684c0fe25c99cc7b2a01fcf/bazel/README.md 

# 步骤

    
    # git clone -b v1.25.5 https://github.com/envoyproxy/envoy.git
    # 在 envoy 目录下执行编译命令, 
    cd envoy && bazel build //source/exe:envoy-static
    # TODO 配置优化编译命令 bazel build -c //source/exe:envoy-static 编译报错.
    
    
# bazel 原理 和 -c opt
## 有关 bazel 的目录
    envoy 根目录下 bazel 目录的 
```shell
config_setting(
    name = "opt_build",
    values = {"compilation_mode": "opt"},
)
```
    是构建选项 opt 相关的配置, 使用 -c opt 可指定优化编译.
    这表示启用了优化，以便生成更快、更小的可执行文件
