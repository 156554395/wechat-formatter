// Chrome Extension Background Script
console.log('WeChat Formatter background script loaded')

chrome.runtime.onInstalled.addListener(() => {
  console.log('WeChat Formatter extension installed')
})

// 监听来自 popup 的消息
chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
  if (request.action === 'openEditor') {
    console.log('Opening editor...')
  }
})

export {}
