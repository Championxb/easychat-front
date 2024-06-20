"use strict";
const electron = require("electron");
const path = require("path");
const utils = require("@electron-toolkit/utils");
require("events");
const icon = path.join(__dirname, "../../resources/chat.png");
const Store = require("electron-store");
const store = new Store();
let userId = null;
const initUserId = (_userId) => {
  userId = _userId;
};
const getUserId = () => {
  return userId;
};
const setData = (key, value) => {
  store.set(key, value);
};
const getData = (key) => {
  return store.get(key);
};
const setUserData = (key, value) => {
  setData(userId + key, value);
};
const getUserData = (key) => {
  return getData(userId + key);
};
const deleteUser = (key) => {
  store.delete(userId + key);
};
const store$1 = {
  setData,
  getData,
  initUserId,
  getUserId,
  setUserData,
  getUserData,
  deleteUser
};
process.env.NODE_ENV;
const onloginOrRegister = (callback) => {
  electron.ipcMain.on("loginOrRegister", (e, isLogin) => {
    callback(isLogin);
  });
};
const onLoginSuccess = (callback) => {
  electron.ipcMain.on("openChat", (e, config) => {
    store$1.initUserId(config.userId);
    store$1.setUserData("token", config.token);
    callback(config);
  });
};
const winTitleOp = (callback) => {
  electron.ipcMain.on("winTitleOp", (e, data) => {
    callback(e, data);
  });
};
const NODE_ENV = process.env.NODE_ENV;
const login_width = 300;
const login_height = 370;
const register_height = 490;
function createWindow() {
  const mainWindow = new electron.BrowserWindow({
    title: "EasyChat",
    icon,
    width: login_width,
    height: login_height,
    show: false,
    autoHideMenuBar: true,
    titleBarStyle: "hidden",
    resizable: false,
    frame: false,
    transparent: true,
    // ...(process.platform === 'linux' ? { icon } : {}),
    webPreferences: {
      preload: path.join(__dirname, "../preload/index.js"),
      sandbox: false,
      contextIsolation: false
    }
  });
  if (NODE_ENV === "development") {
    mainWindow.webContents.openDevTools();
  }
  mainWindow.on("ready-to-show", () => {
    mainWindow.show();
    mainWindow.setTitle("EasyChat");
  });
  mainWindow.webContents.setWindowOpenHandler((details) => {
    electron.shell.openExternal(details.url);
    return { action: "deny" };
  });
  if (utils.is.dev && process.env["ELECTRON_RENDERER_URL"]) {
    mainWindow.loadURL(process.env["ELECTRON_RENDERER_URL"]);
  } else {
    mainWindow.loadFile(path.join(__dirname, "../renderer/index.html"));
  }
  const tray = new electron.Tray(icon);
  const contextMenu = [
    {
      label: "退出EasyChat",
      click: () => {
        electron.app.quit();
      }
    }
  ];
  const menu = electron.Menu.buildFromTemplate(contextMenu);
  tray.setToolTip("EasyChat");
  tray.setContextMenu(menu);
  tray.on("click", () => {
    mainWindow.setSkipTaskbar(false);
    mainWindow.show();
  });
  onloginOrRegister((isLogin) => {
    mainWindow.setResizable(true);
    mainWindow.setSize(login_width, isLogin ? login_height : register_height);
    mainWindow.setResizable(false);
  });
  onLoginSuccess((config) => {
    mainWindow.setResizable(true);
    mainWindow.setSize(850, 800);
    mainWindow.center();
    mainWindow.setMaximizable(true);
    mainWindow.setMinimumSize(800, 600);
    if (config.admin)
      ;
    contextMenu.unshift({
      label: "用户：" + config.nickName,
      click: () => {
      }
    });
    tray.setContextMenu(electron.Menu.buildFromTemplate(contextMenu));
  });
  winTitleOp((e, { action, data }) => {
    const webContendts = e.sender;
    const win = electron.BrowserWindow.fromWebContents(webContendts);
    switch (action) {
      case "close": {
        if (data.closeType == 0) {
          win.close();
        } else if (data.closeType == 1) {
          win.setSkipTaskbar(true);
          win.hide();
        }
        break;
      }
      case "minimize": {
        win.minimize();
        break;
      }
      case "maximize": {
        win.maximize();
        break;
      }
      case "unmaximize": {
        win.unmaximize();
        break;
      }
      case "top": {
        win.setAlwaysOnTop(data.top);
        break;
      }
    }
  });
}
electron.app.whenReady().then(() => {
  utils.electronApp.setAppUserModelId("com.electron");
  electron.app.on("browser-window-created", (_, window) => {
    utils.optimizer.watchWindowShortcuts(window);
  });
  createWindow();
  electron.app.on("activate", function() {
    if (electron.BrowserWindow.getAllWindows().length === 0)
      createWindow();
  });
});
electron.app.on("window-all-closed", () => {
  if (process.platform !== "darwin") {
    electron.app.quit();
  }
});
