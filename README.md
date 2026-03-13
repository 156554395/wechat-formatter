# 微信公众号排版助手 📝

一个基于 Vue 3 + Tiptap 的微信公众号文章排版工具 Chrome 插件。

## 功能特性

### P0 核心功能 ✅

1. **基础富文本编辑器**
   - 使用 Tiptap 编辑器
   - 支持加粗、斜体、删除线等基础格式
   - 实时预览编辑效果

2. **标题样式（H1-H6）**
   - 一键应用不同级别标题
   - 预设样式，符合微信文章规范

3. **代码高亮**
   - 支持多种编程语言：JavaScript、TypeScript、Python、Java、Go、Rust 等
   - 支持多种主题：GitHub、Monokai、Dracula、One Dark、Nord
   - 基于 Prism.js / Lowlight 实现

4. **图片排版**
   - 图片对齐：左对齐、居中、右对齐
   - 图片样式：默认、阴影、边框、阴影+边框
   - 支持拖拽上传

5. **一键复制到微信编辑器**
   - 保留格式化内容
   - 自动添加样式表
   - 支持富文本和纯文本两种格式

## 技术栈

- **前端框架**: Vue 3 + TypeScript
- **编辑器**: Tiptap (基于 ProseMirror)
- **代码高亮**: Prism.js / Lowlight
- **UI 组件**: Element Plus
- **构建工具**: Vite
- **插件平台**: Chrome Extension V3

## 安装开发

### 1. 安装依赖

```bash
npm install
```

### 2. 开发模式

```bash
npm run dev
```

### 3. 构建生产版本

```bash
npm run build
```

## 在 Chrome 中加载插件

1. 打开 Chrome 浏览器，访问 `chrome://extensions/`
2. 打开右上角的"开发者模式"
3. 点击"加载已解压的扩展程序"
4. 选择项目的 `dist` 目录
5. 插件安装完成

## 使用方法

### 方式一：通过 Popup 使用

1. 点击浏览器工具栏上的插件图标
2. 在弹出的编辑器中输入或粘贴内容
3. 使用工具栏应用格式
4. 点击"复制到微信编辑器"按钮
5. 在微信公众号编辑器中粘贴（Ctrl+V / Cmd+V）

### 方式二：在微信编辑器中使用

1. 打开微信公众号编辑器页面
2. 插件会自动注入辅助功能
3. 使用辅助按钮快速格式化内容

## 项目结构

```
wechat-formatter/
├── public/
│   ├── manifest.json       # Chrome 扩展配置
│   └── icons/              # 插件图标
├── src/
│   ├── App.vue             # 主应用组件
│   ├── popup.ts            # Popup 入口
│   ├── popup.html          # Popup 页面
│   ├── background.ts       # 后台脚本
│   ├── content.ts          # 内容脚本
│   ├── content.css         # 内容脚本样式
│   └── vite-env.d.ts       # 类型声明
├── package.json
├── tsconfig.json
├── vite.config.ts
└── README.md
```

## 开发计划

### 已完成 ✅
- [x] 项目初始化
- [x] Vite + Vue 3 + TypeScript 配置
- [x] Tiptap 编辑器集成
- [x] 基础富文本功能
- [x] 代码高亮功能
- [x] 图片样式功能
- [x] 复制到剪贴板功能

### 后续优化 🚧
- [ ] 添加更多代码主题
- [ ] 支持自定义样式模板
- [ ] 添加表情符号支持
- [ ] 添加表格支持
- [ ] 添加本地存储功能
- [ ] 添加预览功能
- [ ] 添加导出功能
- [ ] 添加快捷键支持

## 许可证

MIT
