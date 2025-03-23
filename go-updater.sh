#!/bin/bash

for go_module in $(ls $(go env GOPATH)/bin); do
    # 获取工具的模块路径
    module_path=$(go version -m $(go env GOPATH)/bin/$go_module | grep 'path' | awk '{print $2}')
    # split module_path by blank and get second element for module name
    module_name=$(echo $module_path | awk '{print $2}')
    if [ -n "$module_name" ]; then
        echo "Updating $module_name..."
        go install "$module_name@latest"
    else
        echo "Skipping $go_module (not a Go module)"
    fi
done
echo "All go modules updated!"

