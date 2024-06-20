import { resolve } from 'path'
import { defineConfig, externalizeDepsPlugin } from 'electron-vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  main: {
    plugins: [externalizeDepsPlugin()]
  },
  preload: {
    plugins: [externalizeDepsPlugin()]
  },
  renderer: {
    resolve: {
      alias: {
        '@': resolve('src/renderer/src')
      }
    },
    plugins: [vue()],
    server: {
      port: 5000,
      hmr: true,
      proxy: {
        '/api': {
          target: 'http://localhost:5050',
          changeOrigin: true, //解决跨域
          pathRewrite: {
            '^/api': '/api'
          }
          // rewrite: (path) => path.replace(/^\/api/, '')
        }
      }
    }
  }
})
