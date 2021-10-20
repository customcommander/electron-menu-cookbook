const path = require('path');
const {app, BrowserWindow} = require('electron');

const recipe_dir = process.argv[2];
const preload_script = path.resolve('recipes', recipe_dir, 'preload.js');
const html_page = path.join('recipes', recipe_dir, 'index.html');
const main_process = `./recipes/${recipe_dir}/main.js`;

app.whenReady().then(() => {
  require(main_process);
  new BrowserWindow({webPreferences: {preload: preload_script}}).loadFile(html_page);
});
