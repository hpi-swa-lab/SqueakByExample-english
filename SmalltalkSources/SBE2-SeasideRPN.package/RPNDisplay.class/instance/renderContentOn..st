rendering
renderContentOn: html 
	(html table)
		class: 'keypad';
		with: [self renderStackStateOn: html.
			self renderActionOn: html ]