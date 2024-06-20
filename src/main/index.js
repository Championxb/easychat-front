import { app, shell, BrowserWindow, Menu, Tray } from 'electron'
import { join } from 'path'
import { electronApp, optimizer, is } from '@electron-toolkit/utils'
// import icon from '../../resources/icon.png?asset'
import icon from '../../resources/chat.png?asset'
import { onloginOrRegister, onLoginSuccess, winTitleOp } from './ipc.js'
import { on } from 'events'

const NODE_ENV = process.env.NODE_ENV

const login_width = 300
const login_height = 370
const register_height = 490
function createWindow() {
  // Create the browser window.
  const mainWindow = new BrowserWindow({
    title: 'EasyChat',
    icon: icon,
    width: login_width,
    height: login_height,
    show: false,
    autoHideMenuBar: true,
    titleBarStyle: 'hidden',
    resizable: false,
    frame: false,
    transparent: true,
    // ...(process.platform === 'linux' ? { icon } : {}),
    webPreferences: {
      preload: join(__dirname, '../preload/index.js'),
      sandbox: false,
      contextIsolation: false
    }
  })

  //打开控制台
  if (NODE_ENV === 'development') {
    mainWindow.webContents.openDevTools()
  }

  mainWindow.on('ready-to-show', () => {
    mainWindow.show()
    mainWindow.setTitle('EasyChat')
  })

  mainWindow.webContents.setWindowOpenHandler((details) => {
    shell.openExternal(details.url)
    return { action: 'deny' }
  })

  // HMR for renderer base on electron-vite cli.
  // Load the remote URL for development or the local html file for production.
  if (is.dev && process.env['ELECTRON_RENDERER_URL']) {
    mainWindow.loadURL(process.env['ELECTRON_RENDERER_URL'])
  } else {
    mainWindow.loadFile(join(__dirname, '../renderer/index.html'))
  }
  //托盘
  const tray = new Tray(icon)
  const contextMenu = [
    {
      label: '退出EasyChat',
      click: () => {
        app.quit()
      }
    }
  ]
  const menu = Menu.buildFromTemplate(contextMenu)
  tray.setToolTip('EasyChat')
  tray.setContextMenu(menu)
  tray.on('click', () => {
    mainWindow.setSkipTaskbar(false)
    mainWindow.show()
  })
  //监听登录注册
  onloginOrRegister((isLogin) => {
    mainWindow.setResizable(true)
    mainWindow.setSize(login_width, isLogin ? login_height : register_height)
    mainWindow.setResizable(false)
  })

  onLoginSuccess((config) => {
    mainWindow.setResizable(true)
    mainWindow.setSize(850, 800)
    mainWindow.center()
    //可最大化
    mainWindow.setMaximizable(true)
    //设置最小的窗口大小
    mainWindow.setMinimumSize(800, 600)

    //TODO管理后台的窗口操作
    if (config.admin) {
    }

    contextMenu.unshift({
      label: '用户：' + config.nickName,
      click: () => {}
    })
    tray.setContextMenu(Menu.buildFromTemplate(contextMenu))
  })

  winTitleOp((e, { action, data }) => {
    const webContendts = e.sender //获取当前窗口的webContents
    const win = BrowserWindow.fromWebContents(webContendts) //获取当前窗口
    switch (action) {
      case 'close': {
        if (data.closeType == 0) {
          win.close() //关闭窗口
        } else if (data.closeType == 1) {
          win.setSkipTaskbar(true) //隐藏任务栏
          win.hide() //隐藏窗口
        }
        break
      }
      case 'minimize': {
        win.minimize()
        break
      }
      case 'maximize': {
        win.maximize()
        break
      }
      case 'unmaximize': {
        win.unmaximize()
        break
      }
      case 'top': {
        win.setAlwaysOnTop(data.top)
        break
      }
    }
  })
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
  // Set app user model id for windows
  electronApp.setAppUserModelId('com.electron')

  // Default open or close DevTools by F12 in development
  // and ignore CommandOrControl + R in production.
  // see https://github.com/alex8088/electron-toolkit/tree/master/packages/utils
  app.on('browser-window-created', (_, window) => {
    optimizer.watchWindowShortcuts(window)
  })

  createWindow()

  app.on('activate', function () {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

// In this file you can include the rest of your app"s specific main process
// code. You can also put them in separate files and require them here.
