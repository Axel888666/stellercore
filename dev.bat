@echo off
chcp 65001 >nul
echo 🚀 启动星核动力科技网站开发服务器...

REM 设置Hugo路径
set HUGO_PATH=E:\AxelWork\SourceV\gitsrc\hugo.exe

REM 检查Hugo是否存在
if not exist "%HUGO_PATH%" (
    echo ❌ Hugo未找到，请检查路径: %HUGO_PATH%
    pause
    exit /b 1
)

echo ✅ Hugo已找到
"%HUGO_PATH%" version

echo 🌐 启动开发服务器...
echo 📱 网站地址: http://localhost:1313
echo 🔄 文件更改将自动重新加载
echo 🛑 按 Ctrl+C 停止服务器

"%HUGO_PATH%" server -D --bind 0.0.0.0 --baseURL http://localhost:1313