function secs2clock(sec) {
    var out = ''

    var h = Math.floor(sec / 3600)
    var m = Math.floor(sec / 60) % 60
    var s = sec % 60

    if (h < 10) { out += '0' + h + ':' } else { out += h + ':' }
    if (m < 10) { out += '0' + m + ':' } else { out += m + ':' }
    if (s < 10) { out += '0' + s } else { out += s }

    return out
}
