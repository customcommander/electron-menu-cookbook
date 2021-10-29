const {Menu, ipcMain} = require('electron');

module.exports = () => {
  const menu = Menu.buildFromTemplate([
    {role: 'appMenu'}, // <- Warning: macOS-only role

    {label: 'Menu A', type: 'submenu', submenu: [
      {id: 'item-a1', label: 'Item A1'}
    ]},

    {label: 'Menu B', type: 'submenu', submenu: [
      {id: 'item-b1', label: 'Item B1'}
    ]}
  ]);

  Menu.setApplicationMenu(menu);

  ipcMain.on('enable', (ev, id) => {
    menu.getMenuItemById(id).enabled = true;
  });

  ipcMain.on('disable', (ev, id) => {
    menu.getMenuItemById(id).enabled = false;
  });
};
