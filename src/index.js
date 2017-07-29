'use strict';

require('./index.html');
var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');
var css = require("!style!css!../styles.css");
var app = Elm.Main.embed(mountNode);
