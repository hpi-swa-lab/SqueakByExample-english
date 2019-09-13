rendering
style
	^ 'body {
	font: 12pt Arial, Helvetica, sans-serif, Times New Roman;
}
table.keypad {
	/* border-collapse: collapse; */
	float: left;
}
td.key {
	border: 1px solid #CCCCCC;
	border-right-color: grey;
	border-bottom-color: grey;
	background: #F0F0F0;
	padding: 4px;
	text-align: center;
}
td.key:hover {
	background: white;
}
a:active {
	color: blue;
	text-decoration: none;
}
table.stack {
	border-collapse: collapse;
	float: left;
}
td.stackcell {
	border: 2px solid white;
	border-left-color: grey;
	border-right-color: grey;
	border-bottom-color: grey;
	padding: 4px;
	text-align: right;
}
td.small {
	font-size: 8pt;
}
a:link {
	color: black;
	text-decoration: none;
}
a:visited {
	color: black;
	text-decoration: none;
}
a:hover {
	color: #992222;
	text-decoration: none;
}
'