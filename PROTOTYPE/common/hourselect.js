document.write("<select style='width:40'>");
for(var i = 0; i < 24; i++) {
	document.write("<option>" + (i < 10 ? '0' + i : i) + "</option>");
}
document.write("</select>");
document.write(":");
document.write("<select style='width:40'>");
for(var i = 0; i < 60; i++) {
	if(i % 5 == 0) {
		document.write("<option>" + (i < 10 ? '0' + i : i) + "</option>");
	}
}
document.write("</select>");