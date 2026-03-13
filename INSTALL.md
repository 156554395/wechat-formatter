# 安装和配置指南

## 前置要求

- Node.js >= 18.0.0
- npm 或 yarn
- Chrome 浏览器（或 Chromium）

## 快速开始

### 1. 克隆项目

```bash
cd /Users/seostar/.openclaw/workspace/wechat-formatter
```

### 2. 安装依赖

```bash
npm install
```

### 3. 准备图标

在 `public/icons/` 目录下添加以下图标文件：

- `icon16.png` - 16x16 像素
- `icon48.png` - 48x48 像素
- `icon128.png` - 128x128 像素

**快速生成图标的方法：**

使用在线工具：
- https://www.favicon-generator.org/
- https://www.icoconverter.com/

或者使用 Canvas 绘制简单图标（见下面的脚本）

### 4. 开发构建

```bash
npm run dev
```

### 5. 生产构建

```bash
npm run build
```

构建完成后，`dist` 目录包含所有需要的文件。

## 在 Chrome 中加载插件

1. 打开 Chrome，访问 `chrome://extensions/`
2. 打开右上角的"开发者模式"开关
3. 点击"加载已解压的扩展程序"
4. 选择项目的 `dist` 目录
5. 插件安装成功！

## 使用方法

### Popup 方式（推荐）

1. 点击浏览器工具栏上的插件图标
2. 在弹出的编辑器中：
   - 输入或粘贴你的文章内容
   - 使用工具栏格式化文本
   - 插入代码块并选择语言和主题
   - 添加图片并设置样式
3. 点击"复制到微信编辑器"
4. 打开微信公众号编辑器，粘贴内容（Ctrl+V / Cmd+V）

### 内容脚本方式

1. 打开微信公众号编辑器页面（https://mp.weixin.qq.com/）
2. 插件会自动注入辅助功能
3. 使用页面右侧的悬浮工具栏

## 功能详解

### 1. 标题样式

点击工具栏的 H1、H2、H3 按钮设置标题级别：
- H1：24px，加粗
- H2：20px，加粗
- H3：18px，加粗

### 2. 文本格式

- **B**：加粗
- *I*：斜体
- ~~S~~：删除线

### 3. 代码高亮

1. 点击"代码块"按钮插入代码块
2. 在下拉菜单中选择编程语言
3. 在下拉菜单中选择主题
4. 支持的语言：JavaScript、TypeScript、Python、Java、Go、Rust 等
5. 支持的主题：GitHub、Monokai、Dracula、One Dark、Nord

### 4. 图片样式

1. 插入图片（拖拽或粘贴）
2. 点击图片选中它
3. 点击"🖼️ 图片"按钮打开图片工具栏
4. 选择样式：
   - 默认：无特殊样式
   - 阴影：添加柔和阴影
   - 边框：添加圆角边框
   - 阴影+边框：组合样式
5. 选择对齐方式：左、中、右

### 5. 复制到微信编辑器

点击"📋 复制到微信编辑器"按钮后：
- HTML 内容会复制到剪贴板
- 样式表会自动包含
- 在微信编辑器中粘贴即可保留格式

## 故障排除

### 问题：构建失败

```bash
# 清理缓存并重新安装
rm -rf node_modules dist
npm install
npm run build
```

### 问题：插件加载失败

检查 `dist/manifest.json` 是否存在且格式正确。

### 问题：图标不显示

确保 `public/icons/` 目录下有三个 PNG 图标文件。

### 问题：复制到微信后样式丢失

确保在微信编辑器中使用"粘贴"而不是"纯文本粘贴"。

## 开发技巧

### 热重载

开发模式下修改代码后会自动重新构建，但在 Chrome 中需要：
1. 在 `chrome://extensions/` 页面点击插件的"刷新"按钮
2. 重新打开插件 Popup

### 调试

- Popup: 右键点击 Popup，选择"检查"
- Background: 在扩展详情页点击"service worker"
- Content: 在微信编辑器页面按 F12

## 下一步

- 查看 [README.md](./README.md) 了解项目结构
- 查看 [src/App.vue](./src/App.vue) 了解组件实现
- 自定义样式模板
- 添加更多功能
