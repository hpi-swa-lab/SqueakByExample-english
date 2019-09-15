as yet unclassified
renderActionOn: html 
	^ html tableRow: 
			[(html tableData)
				class: 'key';
				class: 'small';
				with: [
					(html anchor)
						callback: [ self answer ];
						with: 'open']]