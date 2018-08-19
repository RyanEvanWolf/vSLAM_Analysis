
"use strict";

let getStereoFeatures = require('./getStereoFeatures.js')
let ~setDetector = require('./~setDetector.js')
let singleImageDetection = require('./singleImageDetection.js')
let windowMatching = require('./windowMatching.js')
let ~singleStereo = require('./~singleStereo.js')
let ~singleImageDescription = require('./~singleImageDescription.js')
let ~detectCurrent = require('./~detectCurrent.js')
let stereoMatching = require('./stereoMatching.js')
let ~singleImageExtraction = require('./~singleImageExtraction.js')

module.exports = {
  getStereoFeatures: getStereoFeatures,
  ~setDetector: ~setDetector,
  singleImageDetection: singleImageDetection,
  windowMatching: windowMatching,
  ~singleStereo: ~singleStereo,
  ~singleImageDescription: ~singleImageDescription,
  ~detectCurrent: ~detectCurrent,
  stereoMatching: stereoMatching,
  ~singleImageExtraction: ~singleImageExtraction,
};
