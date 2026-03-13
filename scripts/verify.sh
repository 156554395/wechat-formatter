#!/bin/bash

# 切换到脚本所在目录
cd "$(dirname "$0")/.."

echo "🔍 微信公众号排版助手 - 项目验证脚本"
echo "======================================"
echo "📍 当前目录: $(pwd)"
echo ""

ERRORS=0

# 检查必要的文件
echo "📁 检查必要文件..."

files=(
  "package.json"
  "tsconfig.json"
  "vite.config.ts"
  "public/manifest.json"
  "src/App.vue"
  "src/popup.html"
  "src/popup.ts"
  "src/background.ts"
  "src/content.ts"
  "src/content.css"
)

for file in "${files[@]}"; do
  if [ -f "$file" ]; then
    echo "✅ $file"
  else
    echo "❌ 缺少文件: $file"
    ((ERRORS++))
  fi
done

# 检查 Node.js
echo ""
echo "🔧 检查开发环境..."

if command -v node &> /dev/null; then
  echo "✅ Node.js 版本: $(node -v)"
else
  echo "❌ 未找到 Node.js"
  ((ERRORS++))
fi

if command -v npm &> /dev/null; then
  echo "✅ npm 版本: $(npm -v)"
else
  echo "❌ 未找到 npm"
  ((ERRORS++))
fi

# 检查依赖
echo ""
echo "📦 检查依赖..."

if [ -d "node_modules" ]; then
  echo "✅ node_modules 已存在"
else
  echo "⚠️  node_modules 不存在，需要运行 npm install"
fi

# 检查图标
echo ""
echo "🎨 检查图标文件..."

icon_count=$(find public/icons -name "*.png" 2>/dev/null | wc -l)
if [ $icon_count -eq 3 ]; then
  echo "✅ 所有图标文件已准备"
elif [ $icon_count -gt 0 ]; then
  echo "⚠️  图标文件不完整（找到 $icon_count 个，需要 3 个）"
else
  echo "⚠️  未找到图标文件（需要 icon16.png, icon48.png, icon128.png）"
fi

# 检查 TypeScript 配置
echo ""
echo "📝 检查 TypeScript 配置..."

if [ -f "tsconfig.json" ]; then
  if command -v tsc &> /dev/null; then
    echo "✅ TypeScript 配置文件存在"
    echo "   运行 tsc --noEmit 检查类型..."
    npx tsc --noEmit 2>&1 | head -20
  else
    echo "⚠️  未找到 TypeScript 编译器"
  fi
fi

# 总结
echo ""
echo "======================================"
if [ $ERRORS -eq 0 ]; then
  echo "✅ 验证通过！项目可以开始构建。"
  echo ""
  echo "下一步："
  echo "1. 运行 npm install 安装依赖"
  echo "2. 运行 npm run build 构建项目"
  echo "3. 将 dist 目录加载到 Chrome"
else
  echo "❌ 发现 $ERRORS 个问题，请解决后再继续。"
fi

exit $ERRORS
