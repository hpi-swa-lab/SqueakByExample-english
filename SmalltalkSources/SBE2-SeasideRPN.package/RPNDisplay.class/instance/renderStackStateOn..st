rendering
renderStackStateOn: html 
	html tableRow: 
		[(html tableData)
			class: 'stackcell';
			with: stackMachine top]