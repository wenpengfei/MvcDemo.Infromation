//Array
if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function indexOf(item, offset) {
        if (offset == null) {
            offset == 0;
        }
        for (var i=offset; i < this.length; i++) {
            if (this[i] === item) {
                return i;
            }
        }
        return -1;
    }
}

//String
if (!String.prototype.endWith) {
    String.prototype.endWith = function (pattern) {
        var d = this.length - pattern.length;
        return d >= 0 && this.indexOf(pattern, d) === d;
    }
}
if (!String.prototype.startWith) {
    String.prototype.startWith = function (pattern) {
        return this.substr(0, pattern.length) === pattern;
    }
}
