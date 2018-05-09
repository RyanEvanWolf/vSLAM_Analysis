
"use strict";

let extractFeatures = require('./extractFeatures.js')
let updateImage = require('./updateImage.js')
let updateSettings = require('./updateSettings.js')
let publishImage = require('./publishImage.js')
let extractFAST = require('./extractFAST.js')
let rectifiedSettings = require('./rectifiedSettings.js')
let extractSURF = require('./extractSURF.js')
let extractBRISK = require('./extractBRISK.js')
let extractSIFT = require('./extractSIFT.js')
let getDatasetInfo = require('./getDatasetInfo.js')
let extractORB = require('./extractORB.js')
let stereoInliers = require('./stereoInliers.js')
let extractAKAZE = require('./extractAKAZE.js')
let resetDataset = require('./resetDataset.js')

module.exports = {
  extractFeatures: extractFeatures,
  updateImage: updateImage,
  updateSettings: updateSettings,
  publishImage: publishImage,
  extractFAST: extractFAST,
  rectifiedSettings: rectifiedSettings,
  extractSURF: extractSURF,
  extractBRISK: extractBRISK,
  extractSIFT: extractSIFT,
  getDatasetInfo: getDatasetInfo,
  extractORB: extractORB,
  stereoInliers: stereoInliers,
  extractAKAZE: extractAKAZE,
  resetDataset: resetDataset,
};
