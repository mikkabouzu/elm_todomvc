'use strict';

// Require index.html so it gets copied to dist
require('./index.css');
require('./index.html');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('app');

// .embed() can take an optional second argument. This would be an object describing the data we need to start a program, i.e. a userID or some token
var app = Elm.Main.embed(mountNode);
