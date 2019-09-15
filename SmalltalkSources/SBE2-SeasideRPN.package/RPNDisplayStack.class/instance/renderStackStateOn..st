rendering
renderStackStateOn: html 
	^ stackMachine do: 
			[:each | 
			html tableRow: 
				[(html tableData)
					class: 'stackcell';
					with: each]]