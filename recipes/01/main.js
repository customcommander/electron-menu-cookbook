const {Menu} = require('electron');

Menu.setApplicationMenu(
  Menu.buildFromTemplate([
    {role: 'appMenu'}, // <- Warning: macOS-only role
    {label: 'Stuff', type: 'submenu', submenu: [
      {label: 'Do this'},
      {label: 'Do that'}]},
    {label: 'Misc.', type: 'submenu', submenu: [
      {label: 'Foo'},
      {label: 'Bar'},
      {label: 'Baz'}]}
    ]));
