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

在 Bazel 中，config_setting 规则用于定义构建配置，而 "compilation_mode" 是其中一个常用的属性之一。它用于指定编译器的优化级别，以便生成更快、更小的可执行文件。

"compilation_mode" 属性可以设置为以下三个值之一：

- "dbg"：调试模式。编译器将生成未优化的代码，并在可执行文件中包含调试符号，以便进行调试和分析。

- "opt"：优化模式。编译器将生成经过优化的代码，以提高可执行文件的性能和效率。

- "fastbuild"：快速构建模式。编译器将生成经过优化的代码，但不包括调试符号和其他调试信息，以加快构建速度。

例如，在 Bazel 的 BUILD 文件中，您可以定义一个名为 "opt_build" 的构建配置，其中包含以下 config_setting 规则：

```
config_setting(
    name = "opt_build",
    values = {
        "compilation_mode": "opt",
    },
)
```

这将启用优化模式，以便生成经过优化的代码，并提高可执行文件的性能和效率。在使用 Bazel 构建时，您可以使用 -c 选项指定要使用的构建配置。例如，使用以下命令构建名为 "my_binary" 的 C++ 可执行文件：

```
bazel build -c opt //path/to/my_binary
```
