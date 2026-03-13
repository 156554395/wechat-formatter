import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'path'
import { viteStaticCopy } from 'vite-plugin-static-copy'

export default defineConfig({
  plugins: [
    vue(),
    viteStaticCopy({
      targets: [
        {
          src: 'public/manifest.json',
          dest: '.'
        },
        {
          src: 'public/icons',
          dest: '.'
        },
        {
          src: 'src/background.ts',
          dest: '.'
        },
        {
          src: 'src/content.ts',
          dest: '.'
        }
      ]
    })
  ],
  build: {
    outDir: 'dist',
    rollupOptions: {
      input: {
        popup: resolve(__dirname, 'src/popup.html'),
        content: resolve(__dirname, 'src/content.ts'),
        background: resolve(__dirname, 'src/background.ts')
      }
    }
  },
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src')
    }
  }
})
