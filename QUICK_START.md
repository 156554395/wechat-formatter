# 快速开始指南 🚀

欢迎使用微信公众号排版助手！这个指南将帮助你在 5 分钟内完成安装和使用。

## 前置条件

✅ 已安装 Node.js >= 18.0.0
✅ 已安装 Chrome 浏览器

## 三步快速开始

### 第一步：安装依赖

```bash
cd /Users/seostar/.openclaw/workspace/wechat-formatter
npm install
```

### 第二步：构建项目

```bash
npm run build
```

### 第三步：加载到 Chrome

1. 打开 Chrome，访问 `chrome://extensions/`
2. 打开右上角的"开发者模式"
3. 点击"加载已解压的扩展程序"
4. 选择项目的 `dist` 文件夹
5. 完成！🎉

## 使用指南

### 方式一：Popup 编辑器（推荐）

1. 点击浏览器工具栏上的插件图标
2. 在弹出的编辑器中：
   - 输入或粘贴你的文章内容
   - 使用工具栏格式化文本
   - 插入代码块并选择语言和主题
   - 添加图片并设置样式
3. 点击"📋 复制到微信编辑器"
4. 打开微信公众号编辑器，粘贴内容（Ctrl+V / Cmd+V）

### 方式二：内容脚本辅助

1. 打开微信公众号编辑器（https://mp.weixin.qq.com/）
2. 右侧会出现悬浮工具栏
3. 使用工具栏快速格式化内容

## 功能速查

| 功能 | 操作 |
|------|------|
| 设置标题 | 点击 H1/H2/H3 按钮 |
| 加粗/斜体/删除线 | 点击 B/I/S 按钮 |
| 插入代码块 | 点击 `</>` 按钮 |
| 设置代码语言 | 选择下拉菜单中的语言 |
| 设置代码主题 | 选择下拉菜单中的主题 |
| 图片样式 | 选中图片 → 点击"🖼️ 图片" → 选择样式 |
| 图片对齐 | 选中图片 → 选择对齐方式 |
| 复制到微信 | 点击"📋 复制到微信编辑器" |
| 清空内容 | 点击"🗑️ 清空" |
| 加载模板 | 点击"📄 加载模板" |

## 支持的代码语言

- JavaScript
- TypeScript
- Python
- Java
- Go
- Rust
- HTML
- CSS
- SQL
- Bash

## 支持的代码主题

- GitHub（浅色）
- Monokai（深色）
- Dracula（深色）
- One Dark（深色）
- Nord（冷色）

## 图片样式选项

- **默认**：无特殊样式
- **阴影**：添加柔和阴影效果
- **边框**：添加圆角边框
- **阴影+边框**：组合效果

## 常见问题

### Q: 图标不显示怎么办？

A: 需要在 `public/icons/` 目录下添加三个 PNG 图标文件：
- `icon16.png` (16x16 像素)
- `icon48.png` (48x48 像素)
- `icon128.png` (128x128 像素)

可以使用在线工具生成图标：
- https://www.favicon-generator.org/
- https://www.icoconverter.com/

### Q: 复制到微信后样式丢失？

A: 确保在微信编辑器中使用"粘贴"（Ctrl+V / Cmd+V），而不是"纯文本粘贴"。

### Q: 如何重新加载插件？

A: 在 `chrome://extensions/` 页面点击插件的"刷新"按钮。

### Q: 如何更新插件？

A: 运行 `npm run build`，然后在 Chrome 中刷新插件。

## 获取帮助

- 📖 查看完整文档：[README.md](./README.md)
- 🔧 安装配置：[INSTALL.md](./INSTALL.md)
- 💻 开发指南：[DEVELOPMENT.md](./DEVELOPMENT.md)
- 📝 更新日志：[CHANGELOG.md](./CHANGELOG.md)

## 反馈和建议

如果你有任何问题或建议，欢迎提出 Issue 或 Pull Request！

---

**开始创作吧！** ✨
