@echo off
chcp 65001 >nul
echo 🚀 开始部署星核动力科技网站...

REM 设置Hugo路径
set HUGO_PATH=E:\AxelWork\SourceV\gitsrc\hugo.exe

REM 检查Hugo是否存在
if exist "%HUGO_PATH%" (
    echo ✅ 使用指定路径的Hugo: %HUGO_PATH%
    "%HUGO_PATH%" version
    set HUGO_CMD="%HUGO_PATH%"
) else (
    REM 尝试使用系统PATH中的Hugo
    hugo version >nul 2>&1
    if %errorlevel% equ 0 (
        echo ✅ 使用系统PATH中的Hugo
        hugo version
        set HUGO_CMD=hugo
    ) else (
        echo ❌ Hugo未找到，请检查以下位置：
        echo    1. 指定路径: %HUGO_PATH%
        echo    2. 系统PATH环境变量
        echo 📖 安装指南: https://gohugo.io/installation/
        pause
        exit /b 1
    )
)

REM 清理之前的构建
echo 🧹 清理之前的构建文件...
if exist public rmdir /s /q public

REM 构建网站
echo 🔨 构建网站...
%HUGO_CMD% --minify

REM 检查构建是否成功
if %errorlevel% equ 0 (
    echo ✅ 网站构建成功！
    echo 📁 构建文件位于 public\ 目录
    
    REM 检查是否是Git仓库
    if exist .git (
        echo 📤 准备部署到GitHub Pages...
        
        REM 添加所有文件到Git
        git add .
        
        REM 提交更改
        for /f "tokens=1-4 delims=/ " %%i in ('date /t') do set mydate=%%k-%%j-%%i
        for /f "tokens=1-2 delims=: " %%i in ('time /t') do set mytime=%%i:%%j
        git commit -m "Deploy website - %mydate% %mytime%"
        
        REM 推送到远程仓库
        git push origin main
        
        echo 🎉 部署完成！
        echo 🌐 网站将在几分钟后更新: https://stellercore.github.io
    ) else (
        echo ℹ️  这不是一个Git仓库，跳过自动部署
    )
) else (
    echo ❌ 网站构建失败！
    pause
    exit /b 1
)

pause