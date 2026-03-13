<template>
  <div class="wechat-formatter">
    <div class="header">
      <h2>📝 微信公众号排版助手</h2>
    </div>
    
    <div class="editor-container">
      <!-- 工具栏 -->
      <div class="toolbar">
        <el-button-group>
          <el-button size="small" @click="setHeading(1)">H1</el-button>
          <el-button size="small" @click="setHeading(2)">H2</el-button>
          <el-button size="small" @click="setHeading(3)">H3</el-button>
        </el-button-group>
        
        <el-divider direction="vertical" />
        
        <el-button-group>
          <el-button size="small" @click="toggleBold" :type="editor.isActive('bold') ? 'primary' : ''">
            <span style="font-weight: bold">B</span>
          </el-button>
          <el-button size="small" @click="toggleItalic" :type="editor.isActive('italic') ? 'primary' : ''">
            <span style="font-style: italic">I</span>
          </el-button>
          <el-button size="small" @click="toggleStrike" :type="editor.isActive('strike') ? 'primary' : ''">
            <span style="text-decoration: line-through">S</span>
          </el-button>
        </el-button-group>
        
        <el-divider direction="vertical" />
        
        <el-button-group>
          <el-button size="small" @click="toggleCodeBlock" :type="editor.isActive('codeBlock') ? 'primary' : ''">
            &lt;/&gt;
          </el-button>
          <el-button size="small" @click="insertCodeBlock">
            代码块
          </el-button>
        </el-button-group>
        
        <el-divider direction="vertical" />
        
        <el-button-group>
          <el-button size="small" @click="toggleImageToolbar">
            🖼️ 图片
          </el-button>
        </el-button-group>
      </div>
      
      <!-- 图片工具栏 -->
      <div v-if="showImageToolbar" class="image-toolbar">
        <el-space>
          <span>图片样式:</span>
          <el-button size="small" @click="setImageStyle('default')">默认</el-button>
          <el-button size="small" @click="setImageStyle('shadow')">阴影</el-button>
          <el-button size="small" @click="setImageStyle('border')">边框</el-button>
          <el-button size="small" @click="setImageStyle('both')">阴影+边框</el-button>
        </el-space>
        <el-space style="margin-left: 20px;">
          <span>对齐:</span>
          <el-button size="small" @click="setImageAlign('left')">左</el-button>
          <el-button size="small" @click="setImageAlign('center')">中</el-button>
          <el-button size="small" @click="setImageAlign('right')">右</el-button>
        </el-space>
      </div>
      
      <!-- 代码高亮设置 -->
      <div v-if="editor.isActive('codeBlock')" class="code-settings">
        <el-space>
          <span>语言:</span>
          <el-select v-model="codeLanguage" size="small" style="width: 120px">
            <el-option label="JavaScript" value="javascript" />
            <el-option label="TypeScript" value="typescript" />
            <el-option label="Python" value="python" />
            <el-option label="Java" value="java" />
            <el-option label="Go" value="go" />
            <el-option label="Rust" value="rust" />
            <el-option label="HTML" value="html" />
            <el-option label="CSS" value="css" />
            <el-option label="SQL" value="sql" />
            <el-option label="Bash" value="bash" />
          </el-select>
          
          <span style="margin-left: 20px;">主题:</span>
          <el-select v-model="codeTheme" size="small" style="width: 120px">
            <el-option label="GitHub" value="github" />
            <el-option label="Monokai" value="monokai" />
            <el-option label="Dracula" value="dracula" />
            <el-option label="One Dark" value="one-dark" />
            <el-option label="Nord" value="nord" />
          </el-select>
        </el-space>
      </div>
      
      <!-- 编辑器区域 -->
      <div class="editor-content">
        <editor-content :editor="editor" />
      </div>
      
      <!-- 操作按钮 -->
      <div class="actions">
        <el-button type="primary" @click="copyToClipboard" :loading="copying">
          📋 复制到微信编辑器
        </el-button>
        <el-button @click="clearContent">
          🗑️ 清空
        </el-button>
        <el-button @click="loadTemplate">
          📄 加载模板
        </el-button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, watch } from 'vue'
import { useEditor, EditorContent } from '@tiptap/vue-3'
import StarterKit from '@tiptap/starter-kit'
import Image from '@tiptap/extension-image'
import TextAlign from '@tiptap/extension-text-align'
import CodeBlockLowlight from '@tiptap/extension-code-block-lowlight'
import { common, createLowlight } from 'lowlight'
import { ElMessage } from 'element-plus'

const lowlight = createLowlight(common)

const showImageToolbar = ref(false)
const copying = ref(false)
const codeLanguage = ref('javascript')
const codeTheme = ref('github')

// 初始化编辑器
const editor = useEditor({
  content: '',
  extensions: [
    StarterKit.configure({
      heading: {
        levels: [1, 2, 3, 4, 5, 6]
      },
      codeBlock: false // 使用自定义的代码块扩展
    }),
    Image.configure({
      inline: true,
      allowBase64: true
    }),
    TextAlign.configure({
      types: ['heading', 'paragraph', 'image']
    }),
    CodeBlockLowlight.configure({
      lowlight,
      defaultLanguage: codeLanguage.value
    })
  ],
  editorProps: {
    attributes: {
      class: 'prose prose-sm sm:prose lg:prose-lg xl:prose-2xl mx-auto focus:outline-none'
    }
  }
})

// 设置标题级别
const setHeading = (level: number) => {
  editor.value?.chain().focus().toggleHeading({ level }).run()
}

// 切换加粗
const toggleBold = () => {
  editor.value?.chain().focus().toggleBold().run()
}

// 切换斜体
const toggleItalic = () => {
  editor.value?.chain().focus().toggleItalic().run()
}

// 切换删除线
const toggleStrike = () => {
  editor.value?.chain().focus().toggleStrike().run()
}

// 切换代码块
const toggleCodeBlock = () => {
  editor.value?.chain().focus().toggleCodeBlock().run()
}

// 插入代码块
const insertCodeBlock = () => {
  editor.value?.chain().focus().toggleCodeBlock().run()
}

// 切换图片工具栏
const toggleImageToolbar = () => {
  showImageToolbar.value = !showImageToolbar.value
}

// 设置图片样式
const setImageStyle = (style: string) => {
  const imgElement = document.querySelector('.ProseMirror-selectednode img')
  if (imgElement) {
    imgElement.className = ''
    switch (style) {
      case 'shadow':
        imgElement.classList.add('image-shadow')
        break
      case 'border':
        imgElement.classList.add('image-border')
        break
      case 'both':
        imgElement.classList.add('image-shadow', 'image-border')
        break
    }
    ElMessage.success('图片样式已应用')
  } else {
    ElMessage.warning('请先选择一张图片')
  }
}

// 设置图片对齐
const setImageAlign = (align: 'left' | 'center' | 'right') => {
  editor.value?.chain().focus().setTextAlignment(align).run()
}

// 复制到剪贴板
const copyToClipboard = async () => {
  try {
    copying.value = true
    const html = editor.value?.getHTML()
    
    if (!html) {
      ElMessage.error('没有内容可复制')
      return
    }
    
    // 添加样式
    const styledHtml = `
      <style>
        .image-shadow { box-shadow: 0 4px 12px rgba(0,0,0,0.15); }
        .image-border { border: 2px solid #e0e0e0; border-radius: 4px; }
        pre { background: #f5f5f5; padding: 16px; border-radius: 4px; overflow-x: auto; }
        code { font-family: 'Consolas', 'Monaco', monospace; }
        h1 { font-size: 24px; font-weight: bold; margin: 20px 0 10px; }
        h2 { font-size: 20px; font-weight: bold; margin: 18px 0 8px; }
        h3 { font-size: 18px; font-weight: bold; margin: 16px 0 6px; }
      </style>
      ${html}
    `
    
    // 复制到剪贴板
    await navigator.clipboard.write([
      new ClipboardItem({
        'text/html': new Blob([styledHtml], { type: 'text/html' }),
        'text/plain': new Blob([editor.value?.getText() || ''], { type: 'text/plain' })
      })
    ])
    
    ElMessage.success('已复制到剪贴板，可直接粘贴到微信编辑器')
  } catch (error) {
    console.error('复制失败:', error)
    ElMessage.error('复制失败，请重试')
  } finally {
    copying.value = false
  }
}

// 清空内容
const clearContent = () => {
  editor.value?.commands.clearContent()
  ElMessage.success('已清空内容')
}

// 加载模板
const loadTemplate = () => {
  const template = `
    <h1>文章标题</h1>
    <p>这里是文章的导语部分，可以简要介绍文章的主要内容。</p>
    <h2>第一部分</h2>
    <p>这里是正文内容，可以自由编辑。</p>
    <pre><code class="language-javascript">const hello = 'world'
console.log(hello)</code></pre>
    <h2>第二部分</h2>
    <p>更多内容...</p>
  `
  editor.value?.commands.setContent(template)
  ElMessage.success('模板已加载')
}

// 监听代码语言变化
watch(codeLanguage, (newLang) => {
  if (editor.value?.isActive('codeBlock')) {
    // 可以在这里更新代码块的语言属性
  }
})
</script>

<style scoped>
.wechat-formatter {
  width: 800px;
  height: 600px;
  background: #fff;
  display: flex;
  flex-direction: column;
}

.header {
  padding: 16px 20px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.header h2 {
  margin: 0;
  font-size: 18px;
  font-weight: 500;
}

.editor-container {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.toolbar {
  padding: 12px 16px;
  border-bottom: 1px solid #e0e0e0;
  background: #fafafa;
}

.image-toolbar,
.code-settings {
  padding: 8px 16px;
  background: #f0f7ff;
  border-bottom: 1px solid #d4e3ff;
}

.editor-content {
  flex: 1;
  overflow-y: auto;
  padding: 20px;
}

/* Tiptap 编辑器样式 */
:deep(.ProseMirror) {
  min-height: 400px;
  outline: none;
  padding: 16px;
}

:deep(.ProseMirror-focused) {
  outline: none;
}

:deep(.ProseMirror p) {
  margin: 0.5em 0;
  line-height: 1.6;
}

:deep(.ProseMirror h1) {
  font-size: 24px;
  font-weight: bold;
  margin: 20px 0 10px;
  color: #333;
}

:deep(.ProseMirror h2) {
  font-size: 20px;
  font-weight: bold;
  margin: 18px 0 8px;
  color: #444;
}

:deep(.ProseMirror h3) {
  font-size: 18px;
  font-weight: bold;
  margin: 16px 0 6px;
  color: #555;
}

:deep(.ProseMirror pre) {
  background: #f5f5f5;
  padding: 16px;
  border-radius: 4px;
  overflow-x: auto;
  border-left: 4px solid #07c160;
}

:deep(.ProseMirror code) {
  font-family: 'Consolas', 'Monaco', monospace;
  font-size: 14px;
}

:deep(.ProseMirror img) {
  max-width: 100%;
  height: auto;
  display: block;
}

:deep(.ProseMirror img.image-shadow) {
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}

:deep(.ProseMirror img.image-border) {
  border: 2px solid #e0e0e0;
  border-radius: 4px;
}

:deep(.ProseMirror-selectednode) {
  outline: 2px solid #667eea;
}

.actions {
  padding: 16px;
  border-top: 1px solid #e0e0e0;
  display: flex;
  gap: 12px;
  justify-content: flex-end;
  background: #fafafa;
}

/* 滚动条样式 */
.editor-content::-webkit-scrollbar {
  width: 8px;
}

.editor-content::-webkit-scrollbar-track {
  background: #f1f1f1;
}

.editor-content::-webkit-scrollbar-thumb {
  background: #c1c1c1;
  border-radius: 4px;
}

.editor-content::-webkit-scrollbar-thumb:hover {
  background: #a1a1a1;
}
</style>
