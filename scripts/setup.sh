#!/bin/bash

echo "🚀 微信公众号排版助手 - 快速设置脚本"
echo "=================================="

# 检查 Node.js
if ! command -v node &> /dev/null; then
    echo "❌ 错误：未找到 Node.js，请先安装 Node.js >= 18.0.0"
    exit 1
fi

echo "✅ Node.js 版本: $(node -v)"

# 安装依赖
echo "📦 安装依赖..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ 依赖安装失败"
    exit 1
fi

echo "✅ 依赖安装成功"

# 构建项目
echo "🔨 构建项目..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ 构建失败"
    exit 1
fi

echo "✅ 构建成功"
echo ""
echo "📝 下一步操作："
echo "1. 打开 Chrome 浏览器"
echo "2. 访问 chrome://extensions/"
echo "3. 打开右上角 '开发者模式'"
echo "4. 点击 '加载已解压的扩展程序'"
echo "5. 选择项目目录下的 dist 文件夹"
echo ""
echo "⚠️  注意：public/icons/ 目录下需要放置图标文件（icon16.png, icon48.png, icon128.png）"
echo "      否则插件图标将显示为默认样式"
echo ""
