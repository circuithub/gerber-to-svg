# Karma configuration
# Generated on Mon Sep 08 2014 18:24:39 GMT-0400 (EDT)

module.exports = (config) ->

  # customLaunchers = {
  #   'SL_Chrome': {
  #     base: 'SauceLabs'
  #     browserName: 'chrome'
  #   }
  # }

  config.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: ''

    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: [ 'mocha', 'browserify' ]

    # list of files / patterns to load in the browser
    files: [ 'test/*_test.coffee' ]

    # list of files to exclude
    exclude: []

    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      'test/*_test.coffee': [ 'browserify' ]
    }

    # browserify config
    browserify: {
      debug: false
      transform: [ 'coffeeify', 'brfs', 'uglifyify' ]
    }

    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: [ 'progress', 'saucelabs' ]

    # web server port
    port: 9876

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    logLevel: config.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: false

    # Continuous Integration settings
    sauceLabs: {
      testName: 'gerber-to-svg browser tests'
      recordScreenshots: false
    }
    captureTimeout: 120000
    singleRun: true
