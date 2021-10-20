# Electron Menu Cookbook

A repository of examples using [Electron's Menu API](https://www.electronjs.org/docs/latest/api/menu) to do various things with native application menus. All examples work with Electron v15, `nodeIntegration` off and `contextIsolation` on.

To run any of these examples just clone and `npm install` this repository and run the corresponding recipe script.


## How do I create a menu?

This can be as simple as describing your menu with with plain JavaScript data structures. This example adds two top menus "Stuff" and "Misc." each with their own submenu.

Please note that in macOS apps the first item of a menu is always the default application menu named after the application name and with the default submenu. This *can* be changed but requires extra work.

```shell
$ npm run reciple -- 01
```

```javascript
/*** main.js ***/

const {Menu} = require('electron');

module.exports = () => {
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
};
```


## How do I know when a user clicked on a menu item?

You can add a click handler on an item. The function receives the item clicked on as its first parameter.

```shell
$ npm run reciple -- 02
```

```javascript
/*** main.js ***/

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
```

