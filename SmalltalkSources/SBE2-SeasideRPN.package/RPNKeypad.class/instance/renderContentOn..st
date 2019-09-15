rendering
renderContentOn: html 
	self ensureStackMachineNotEmpty.
	html table
		class: 'keypad';
		with: [
			html tableRow: [
					self renderStackButton: '+' callback: [self stackOp: #add] on: html.
					self renderStackButton: '&ndash;' callback: [self stackOp: #min] on: html.
					self renderStackButton: '&times;' callback: [self stackOp: #mul] on: html.
					self renderStackButton: '&divide;' callback: [self stackOp: #div] on: html.
					self renderStackButton: '&plusmn;' callback: [self stackOp: #neg] on: html ].
				html tableRow: [
					self renderStackButton: '1' callback: [self type: '1'] on: html.
					self renderStackButton: '2' callback: [self type: '2'] on: html.
					self renderStackButton: '3' callback: [self type: '3'] on: html.
					self renderStackButton: 'Drop' callback: [self stackOp: #pop] colSpan: 2 on: html ].
				html tableRow: [
					self renderStackButton: '4' callback: [self type: '4'] on: html.
					self renderStackButton: '5' callback: [self type: '5'] on: html.
					self renderStackButton: '6' callback: [self type: '6'] on: html.
					self renderStackButton: 'Rot &uarr;' callback: [self stackOp: #rotUp] colSpan: 2 on: html ].
				html tableRow: [
					self renderStackButton: '7' callback: [self type: '7'] on: html.
					self renderStackButton: '8' callback: [self type: '8'] on: html.
					self renderStackButton: '9' callback: [self type: '9'] on: html.
					self renderStackButton: 'Exch' callback: [self stackOp: #exch] colSpan: 2 on: html ].
				html tableRow: [
					self renderStackButton: '0' callback: [self type: '0'] colSpan: 2 on: html.
					self renderStackButton: 'C' callback: [self stackClearTop] on: html.
					self renderStackButton: 'Enter' callback:  [self stackOp: #dup. self setClearMode] colSpan: 2 on: html]
				]