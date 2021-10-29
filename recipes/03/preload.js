const {contextBridge, ipcRenderer} = require('electron');

contextBridge.exposeInMainWorld('MY_APP', {
  enable(id) {
    ipcRenderer.send('enable', id);
  },
  disable(id) {
    ipcRenderer.send('disable', id);
  }
});
