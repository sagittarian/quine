var s = "var q = String.fromCharCode(34);\n\
var n = String.fromCharCode(10);\n\
var sl = String.fromCharCode(92);\n\
var qn = sl + String.fromCharCode(110);\n\
console.log('var s = ' + q + s.split(n).join(qn+sl+n) + q + ';');\n\
console.log(s);";
var q = String.fromCharCode(34);
var n = String.fromCharCode(10);
var sl = String.fromCharCode(92);
var qn = sl + String.fromCharCode(110);
console.log('var s = ' + q + s.split(n).join(qn+sl+n) + q + ';');
console.log(s);
