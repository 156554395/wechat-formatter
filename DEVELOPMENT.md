# 开发指南

## 项目架构

### 技术栈详解

#### Vue 3 + TypeScript
- 使用 Composition API (`<script setup>`)
- TypeScript 提供类型安全
- 响应式数据管理

#### Tiptap 编辑器
- 基于 ProseMirror 的 Vue 3 封装
- 可扩展的富文本编辑器
- 支持自定义扩展和命令

#### Prism.js / Lowlight
- 代码语法高亮
- 支持多种编程语言和主题
- 基于 CommonJS 规范的语法包

#### Element Plus
- Vue 3 UI 组件库
- 提供按钮、下拉框、提示等组件
- 统一的设计风格

#### Vite
- 快速的前端构建工具
- 支持 HMR（热模块替换）
- 优化的生产构建

## 目录结构

```
wechat-formatter/
├── public/                   # 静态资源
│   ├── manifest.json         # Chrome 扩展配置
│   └── icons/                # 插件图标
│       ├── icon16.png
│       ├── icon48.png
│       └── icon128.png
├── src/
│   ├── App.vue               # 主应用组件
│   ├── popup.ts              # Popup 入口文件
│   ├── popup.html            # Popup 页面
│   ├── background.ts         # 后台脚本
│   ├── content.ts            # 内容脚本
│   ├── content.css           # 内容脚本样式
│   └── vite-env.d.ts         # Vite 类型声明
├── scripts/
│   └── setup.sh              # 快速设置脚本
├── package.json              # 项目依赖
├── tsconfig.json             # TypeScript 配置
├── tsconfig.node.json        # Node TypeScript 配置
├── vite.config.ts            # Vite 配置
├── .gitignore
├── README.md
└── INSTALL.md
```

## 核心组件解析

### App.vue

主应用组件，包含：

1. **工具栏区域**
   - 标题按钮（H1-H6）
   - 文本格式按钮（加粗、斜体、删除线）
   - 代码块按钮
   - 图片工具按钮

2. **编辑器区域**
   - Tiptap 编辑器实例
   - 支持实时预览
   - 响应式布局

3. **设置区域**
   - 代码语言选择器
   - 代码主题选择器
   - 图片样式和对齐设置

4. **操作区域**
   - 复制到剪贴板
   - 清空内容
   - 加载模板

### Tiptap 配置

```typescript
const editor = useEditor({
  content: '',                  // 初始内容
  extensions: [                 // 编辑器扩展
    StarterKit,                 // 基础功能
    Image,                      // 图片支持
    TextAlign,                  // 文本对齐
    CodeBlockLowlight           // 代码高亮
  ],
  editorProps: {                // 编辑器属性
    attributes: {
      class: 'prose ...'
    }
  }
})
```

### 扩展开发

#### 添加新的 Tiptap 扩展

1. 安装扩展包：
```bash
npm install @tiptap/extension-<extension-name>
```

2. 在 App.vue 中引入：
```typescript
import ExtensionName from '@tiptap/extension-<extension-name>'
```

3. 添加到编辑器配置：
```typescript
extensions: [
  // ... 其他扩展
  ExtensionName.configure({
    // 扩展配置
  })
]
```

#### 常用 Tiptap 扩展

- `@tiptap/extension-link` - 链接支持
- `@tiptap/extension-table` - 表格支持
- `@tiptap/extension-underline` - 下划线
- `@tiptap/extension-text-style` - 文本样式
- `@tiptap/extension-color` - 文本颜色

## Chrome Extension 开发

### 扩展类型

Chrome Extension 有三种主要脚本类型：

#### 1. Background Script（后台脚本）
- 文件：`src/background.ts`
- 作用：监听扩展事件、管理扩展状态
- 生命周期：浏览器打开时启动，关闭时停止

#### 2. Content Script（内容脚本）
- 文件：`src/content.ts` + `src/content.css`
- 作用：在网页中注入脚本和样式
- 可以访问网页 DOM
- 与页面 DOM 交互

#### 3. Popup（弹出页面）
- 文件：`src/popup.html` + `src/popup.ts` + `src/App.vue`
- 作用：用户点击图标时显示的界面
- 独立于网页

### Manifest V3 配置

`public/manifest.json` 是扩展的核心配置：

```json
{
  "manifest_version": 3,          // V3 版本
  "name": "扩展名称",
  "version": "1.0.0",
  "permissions": [                // 权限声明
    "storage",
    "activeTab",
    "clipboardWrite"
  ],
  "action": {                     // 工具栏图标配置
    "default_popup": "popup.html"
  },
  "background": {                 // 后台脚本
    "service_worker": "background.js"
  },
  "content_scripts": [            // 内容脚本
    {
      "matches": ["<all_urls>"],
      "js": ["content.js"]
    }
  ]
}
```

## 样式系统

### 全局样式

编辑器使用 ProseMirror 的样式系统：

```css
.ProseMirror {
  min-height: 400px;
  outline: none;
}

.ProseMirror h1 {
  font-size: 24px;
  font-weight: bold;
}

.ProseMirror pre {
  background: #f5f5f5;
  padding: 16px;
}
```

### 图片样式

```css
.image-shadow {
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}

.image-border {
  border: 2px solid #e0e0e0;
  border-radius: 4px;
}
```

## 开发工作流

### 1. 修改代码

```bash
# 编辑源文件
vim src/App.vue
```

### 2. 开发构建

```bash
npm run dev
```

### 3. 测试

在 Chrome 中重新加载扩展：
1. 访问 `chrome://extensions/`
2. 点击插件的刷新按钮
3. 打开插件 Popup 测试

### 4. 调试

- **Popup 调试**：右键点击 Popup → 检查
- **Background 调试**：扩展详情页 → Service Worker
- **Content 调试**：F12 开发者工具

## 添加新功能

### 示例：添加自定义按钮

1. 在工具栏添加按钮：
```vue
<el-button size="small" @click="customAction">
  自定义按钮
</el-button>
```

2. 实现功能函数：
```typescript
const customAction = () => {
  // 你的逻辑
  editor.value?.chain().focus().insertContent('自定义内容').run()
}
```

### 示例：添加快捷键

在 Tiptap 编辑器配置中添加快捷键：
```typescript
extensions: [
  StarterKit.configure({
    keyboardShortcuts: {
      'Mod-e': () => editor.value?.chain().focus().toggleItalic().run(),
    }
  })
]
```

### 示例：添加本地存储

使用 Chrome Storage API：
```typescript
// 保存数据
await chrome.storage.local.set({ key: value })

// 读取数据
const result = await chrome.storage.local.get(['key'])
const value = result.key
```

## 测试建议

1. **功能测试**
   - 测试所有按钮和工具
   - 测试复制粘贴功能
   - 测试代码高亮

2. **兼容性测试**
   - 在不同尺寸屏幕测试
   - 在不同 Chrome 版本测试
   - 在微信编辑器测试

3. **性能测试**
   - 大文本编辑性能
   - 多图片加载性能
   - 扩展启动速度

## 部署

### 构建

```bash
npm run build
```

### 打包

```bash
cd dist
zip -r wechat-formatter.zip *
```

### 发布

将 `wechat-formatter.zip` 上传到 Chrome Web Store：

1. 访问 [Chrome Web Store Developer Dashboard](https://chrome.google.com/webstore/devdashboard)
2. 创建新项目
3. 上传 zip 文件
4. 填写商店信息
5. 提交审核

## 常见问题

### Q: 如何修改编辑器尺寸？

修改 `App.vue` 中的 `.wechat-formatter` 样式：
```css
.wechat-formatter {
  width: 800px;   /* 修改宽度 */
  height: 600px;  /* 修改高度 */
}
```

### Q: 如何添加新的代码语言？

修改 `App.vue` 中的下拉选项：
```vue
<el-option label="Your Language" value="your-language" />
```

### Q: 如何自定义代码主题？

Lowlight 支持自定义主题，可以创建新的主题配置。

## 贡献指南

欢迎提交 Issue 和 Pull Request！

1. Fork 本项目
2. 创建特性分支
3. 提交更改
4. 推送到分支
5. 创建 Pull Request
