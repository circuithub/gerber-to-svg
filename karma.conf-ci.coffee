# Karma configuration
# Generated on Mon Sep 08 2014 18:24:39 GMT-0400 (EDT)

module.exports = (config) ->
  # Browsers to run on Sauce Labs
  customLaunchers = {
    'SL_Chrome': {
      base: 'SauceLabs'
      browserName: 'chrome'
    }
    'SL_WinChrome': {
      base: 'SauceLabs'
      browserName: 'chrome'
      platform: 'Windows 7'
    }
    'SL_MacChrome': {
      base: 'SauceLabs'
      browserName: 'chrome'
      platform: 'OS X 10.9'
    }
    'SL_Firefox': {
      base: 'SauceLabs'
      browserName: 'firefox'
    }
    # 'SL_WinFirefox': {
    #   base: 'SauceLabs'
    #   browserName: 'firefox'
    #   platform: 'Windows 7'
    # }
    # 'SL_MacFirefox': {
    #   base: 'SauceLabs'
    #   browserName: 'firefox'
    #   platform: 'OS X 10.9'
    # }
    'SL_IE9': {
      base: 'SauceLabs',
      browserName: 'internet explorer',
      version: '9'
    }
    'SL_IE10': {
      base: 'SauceLabs',
      browserName: 'internet explorer',
      version: '10'
    }
    'SL_IE11': {
      base: 'SauceLabs',
      browserName: 'internet explorer',
      version: '11'
    }
    # 'SL_Safari5': {
    #   base: 'SauceLabs',
    #   browserName: 'safari',
    #   version: '5'
    # }
    'SL_Safari6': {
      base: 'SauceLabs',
      browserName: 'safari',
      version: '6'
    }
    'SL_Safari7': {
      base: 'SauceLabs',
      browserName: 'safari',
      version: '7'
    }
  }


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
    customLaunchers: customLaunchers

    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: Object.keys(customLaunchers)
    singleRun: true
