// JavaScript auxiliary library
// Copyright (C) 2012 Dario Giovannetti <dev@dariogiovannetti.net>
//
// This file is part of JavaScript auxiliary library.
//
// JavaScript auxiliary library is free software: you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation, either version 3
// of the License, or (at your option) any later version.
//
// JavaScript auxiliary library is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with JavaScript auxiliary library.
// If not, see <http://www.gnu.org/licenses/>.

/* eslint-disable no-sync */
import fs from 'fs'
import path from 'path'


function walk(directory) {
  const list = fs.readdirSync(directory)

  return list.reduce((acc, fName) => {
    const fPath = path.join(directory, fName)
    const stat = fs.statSync(fPath)
    if (stat && stat.isDirectory()) {
      return acc.concat(walk(fPath))
    }
    return acc.concat(fPath)
  }, [])
}


export function walk2Json({root}) {
  console.log(walk(root))
}
