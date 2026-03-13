# 📦 安装指南

## 方法一：从源码安装（推荐）

### 1. 克隆项目
```bash
git clone https://github.com/156554395/wechat-formatter.git
cd wechat-formatter
```

### 2. 安装依赖
```bash
npm install
```

### 3. 构建
```bash
npm run build
```

### 4. 加载到 Chrome

1. 打开 Chrome 浏览器
2. 访问 `chrome://extensions/`
3. 开启右上角的 **"开发者模式"**
4. 点击 **"加载已解压的扩展程序"**
5. 选择项目中的 `dist` 文件夹

### 5. 使用插件

1. 打开微信公众号编辑器：https://mp.weixin.qq.com
2. 点击浏览器工具栏中的插件图标
3. 在弹出的编辑器中编辑文章
4. 点击 **"复制到微信"** 按钮
5. 在微信编辑器中粘贴（Ctrl+V / Cmd+V）

---

## 方法二：直接下载（即将支持）

待发布到 Chrome Web Store 后，可直接从商店安装。

---

## ⚠️ 注意事项

1. **首次使用**：需要允许插件访问微信公众号页面
2. **复制功能**：使用普通粘贴（Ctrl+V），不要使用纯文本粘贴
3. **图片上传**：需要手动上传图片到微信后台
4. **样式兼容**：部分复杂样式可能不完全兼容微信编辑器

---

## 🔧 开发模式

```bash
# 开发模式（热更新）
npm run dev

# 类型检查
npm run build:check

# 重新生成图标
node scripts/generate-icons.cjs
```

---

## 📱 支持的平台

- ✅ Chrome 90+
- ✅ Edge 90+
- ⏳ Firefox（计划中）
- ⏳ Safari（计划中）

---

## ❓ 常见问题

### Q: 插件图标不显示？
A: 确保 `dist/icons/` 目录下有图标文件，重新构建即可。

### Q: 复制后粘贴没有样式？
A: 使用普通粘贴（Ctrl+V），不要使用纯文本粘贴（Ctrl+Shift+V）。

### Q: 代码高亮在微信中显示异常？
A: 微信对部分 CSS 样式有限制，建议使用简单的代码主题。

---

## 🐛 问题反馈

如遇到问题，请在 GitHub 提交 Issue：
https://github.com/156554395/wechat-formatter/issues
