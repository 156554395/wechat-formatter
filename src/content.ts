// Chrome Extension Content Script
console.log('WeChat Formatter content script loaded')

// 在微信公众号编辑器页面添加自定义功能
function initContentScript() {
  if (!location.href.includes('mp.weixin.qq.com')) {
    return
  }

  // 可以在这里添加一些页面级别的功能
  console.log('WeChat Formatter initialized on WeChat editor')
}

// 页面加载完成后初始化
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initContentScript)
} else {
  initContentScript()
}

export {}
