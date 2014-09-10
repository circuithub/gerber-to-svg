# sauce labs browser launchers
# use the api to get available browsers
_ = require 'lodash'
SauceLabs = require 'saucelabs'
slAccount = new SauceLabs {
  username: process.env.SAUCE_USERNAME
  password: process.env.SAUCE_ACCESS_KEY
}

# browsers we're testing
BROWSERS = [ 'chrome', 'firefox', 'safari', 'internet explorer' ]
#BROWSERS = [ 'internet explorer' ]
# number of versions to test
LATEST = {
  chrome: 2
  firefox: 2
  safari: 3
  'internet explorer': 3
}
# include beta versions if available
BETA = true
# os's to test on
OS = {
  chrome: [ 'Windows 2008', 'Mac 10.9', 'Linux' ]
  firefox: [ 'Windows 2008', 'Mac 10.9', 'Linux' ]
  safari: [ /Mac/ ]
  'internet explorer': [ 'Windows 2008' ]
}

module.exports = (cb) ->
  slAccount.getWebDriverBrowsers (err, res) ->
    # collection of browsers according to above contants pulled from the api
    browseCollect = []
    for b in BROWSERS
      # get the browser
      allBrowsers = _.filter res, { 'api_name': b }
      # filter out per os
      for sys in OS[b]
        sysBrowsers = []
        filter = if _.isRegExp sys then (v) -> sys.test v.os else { os: sys }
        allSysBrowsers = _.filter allBrowsers, filter
        # grab the beta if there is one
        if BETA and v = _.find allSysBrowsers, { 'short_version': 'beta' }
          sysBrowsers.push v
        allSysBrowsers = _.reject allSysBrowsers, { 'short_version': 'beta' }
        # sort by version and push to collection
        allSysBrowsers = _.sortBy allSysBrowsers, (v) -> Number v['short_version']
        while sysBrowsers.length < LATEST[b] and allSysBrowsers.length
          sysBrowsers.push allSysBrowsers.pop()
        browseCollect = browseCollect.concat sysBrowsers
    # transform the collection into an object that matches Karma SL format
    browsers = _.transform browseCollect, (result, browser) ->
      name = browser['api_name']
      os = browser.os
      version = browser['short_version']
      result["SL_#{os}_#{name}_#{version}"] = {
        base: 'SauceLabs'
        browserName: name
        version: version
        platform: os
      }
    # we're done, call the callback
    cb browsers
