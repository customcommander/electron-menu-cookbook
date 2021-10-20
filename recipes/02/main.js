const {Menu} = require('electron');

const click = menuitem => {
  console.log(`Click on ${menuitem.label}`);
}

module.exports = () => {
  Menu.setApplicationMenu(
    Menu.buildFromTemplate([
      {role: 'appMenu'}, // <- Warning: macOS-only role
      {label: 'Stuff', type: 'submenu', submenu: [
        {label: 'Submenu 1', click}]},
      {label: 'Misc.', type: 'submenu', submenu: [
        {label: 'Submenu 2', click}]}
      ]));
};


