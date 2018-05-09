
"use strict";

let singleStereo = require('./singleStereo.js')
let ~setDetector = require('./~setDetector.js')
let singleImageDetection = require('./singleImageDetection.js')
let ~detectCurrent = require('./~detectCurrent.js')
let singleImageDescription = require('./singleImageDescription.js')
let ~singleImageExtraction = require('./~singleImageExtraction.js')

module.exports = {
  singleStereo: singleStereo,
  ~setDetector: ~setDetector,
  singleImageDetection: singleImageDetection,
  ~detectCurrent: ~detectCurrent,
  singleImageDescription: singleImageDescription,
  ~singleImageExtraction: ~singleImageExtraction,
};
