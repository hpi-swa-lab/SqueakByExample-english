rendering
renderContentOn: html
	html form: [
		html textInput
			on: #text of: self.
		html submitButton
			callback: [ self answer: self text ];
			text: 'ok'.
		]