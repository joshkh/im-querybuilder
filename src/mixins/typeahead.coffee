typeahead = require 'typeahead.js'
$ = require 'jquery'


substringMatcher = (strs) ->
  (q, cb) ->
    matches = undefined
    substringRegex = undefined
    # an array that will be populated with substring matches
    matches = []
    # regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i')
    # iterate through the pool of strings and for any string that
    # contains the substring `q`, add it to the `matches` array
    $.each strs, (i, str) ->
      if substrRegex.test(str)
        matches.push str
      return
    cb matches
    return


module.exports = {substringMatcher}
