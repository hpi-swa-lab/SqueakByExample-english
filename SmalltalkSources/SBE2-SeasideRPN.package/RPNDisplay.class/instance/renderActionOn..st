rendering
renderActionOn: html 
	^ html tableRow: 
			[html tableData
				class: 'key';
				class: 'small';
				with: [
					html anchor
						callback: [ self call: (RPNDisplayStack new setStackMachine: stackMachine)];
						with: 'open']]