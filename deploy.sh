#!/bin/bash

# 星核动力科技网站部署脚本

echo "🚀 开始部署星核动力科技网站..."

# 检查Hugo是否安装
if ! command -v hugo &> /dev/null; then
    echo "❌ Hugo未安装，请先安装Hugo Extended版本"
    echo "📖 安装指南: https://gohugo.io/installation/"
    exit 1
fi

# 检查Hugo版本
HUGO_VERSION=$(hugo version | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+')
echo "✅ Hugo版本: $HUGO_VERSION"

# 清理之前的构建
echo "🧹 清理之前的构建文件..."
rm -rf public/

# 构建网站
echo "🔨 构建网站..."
hugo --minify

# 检查构建是否成功
if [ $? -eq 0 ]; then
    echo "✅ 网站构建成功！"
    echo "📁 构建文件位于 public/ 目录"
    
    # 如果是GitHub Pages部署
    if [ -d ".git" ]; then
        echo "📤 准备部署到GitHub Pages..."
        
        # 添加所有文件到Git
        git add .
        
        # 提交更改
        COMMIT_MSG="Deploy website - $(date '+%Y-%m-%d %H:%M:%S')"
        git commit -m "$COMMIT_MSG"
        
        # 推送到远程仓库
        git push origin main
        
        echo "🎉 部署完成！"
        echo "🌐 网站将在几分钟后更新: https://stellercore.github.io"
    else
        echo "ℹ️  这不是一个Git仓库，跳过自动部署"
    fi
else
    echo "❌ 网站构建失败！"
    exit 1
fi