# JavaScript auxiliary library
# Copyright (C) 2012 Dario Giovannetti <dev@dariogiovannetti.net>
#
# This file is part of JavaScript auxiliary library.
#
# JavaScript auxiliary library is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 3
# of the License, or (at your option) any later version.
#
# JavaScript auxiliary library is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with JavaScript auxiliary library.
# If not, see <http://www.gnu.org/licenses/>.


module.exports.escapePattern = (string) ->
    # Escaping any other characters is not necessary, references:
    # - https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions
    # - http://stackoverflow.com/questions/3561493/is-there-a-regexp-escape-function-in-javascript
    # - http://stackoverflow.com/questions/2593637/how-to-escape-regular-expression-in-javascript
    # - http://stackoverflow.com/questions/494035/how-do-you-pass-a-variable-to-a-regular-expression-javascript
    # - http://stackoverflow.com/questions/3446170/escape-string-for-use-in-javascript-regex
    # - http://stackoverflow.com/questions/399078/what-special-characters-must-be-escaped-in-regular-expressions
    #
    # Note for Wiki Monkey: do *not* escape '\s' here so that it will be
    # safe to use prepareRegexpWhitespace in WM.Parser
    return string.replace(/[-[\]{}()^$*+?.|\\]/g, "\\$&")

module.exports.matchAll = (source, regExp) ->
    result = []
    while true
        match = regExp.exec(source)
        if match
            L = match[0].length
            result.push({
                            "match": match
                            "index": regExp.lastIndex - L
                            "length": L
                        })
        else
            break
    return result

module.exports.matchAllConditional = (source, regExp, test) ->
    result = []
    while true
        match = regExp.exec(source)
        if match and test(match)
            L = match[0].length
            result.push({
                            "match": match
                            "index": regExp.lastIndex - L
                            "length": L
                        })
        else
            break
    return result
