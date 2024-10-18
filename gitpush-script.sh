#!/bin/bash

# 检查当前目录是否是Git仓库
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "错误：当前目录不是Git仓库。"
    exit 1
fi

# 获取当前Git仓库的根目录
repo_root=$(git rev-parse --show-toplevel)

# 切换到仓库根目录
cd "$repo_root"

# 检查是否有更改
if [[ -z $(git status -s) ]]; then
    echo "没有检测到更改。"
    exit 0
fi

# 添加所有更改
git add .

# 提交更改
git commit -m "add somethings"

# 推送到远程仓库
git push

# 检查推送是否成功
if [ $? -eq 0 ]; then
    echo "Git 操作完成：更改已成功推送到远程仓库。"
else
    echo "推送失败。请检查您的网络连接或远程仓库设置。"
fi