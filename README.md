# 概述
这个项目存放 envoy 作为服务如何使用的逻辑, envoy 内部本身的逻辑不在这里, 也就是说不负责 envoy 本身的构建.
envoy 二进制文件也不会加入到 git 中, 但是默认此项目中的 bin 目录下有一个文件 **envoy**

# how
## how to run 
./bin/envoy -c $yaml_path