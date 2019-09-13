rendering
renderContentOn: html 
	html span
		class: 'field';
		with: self text.
	html space.
	html anchor
		callback: [self text: (self call: (SeasideEditAnswerDemo new text: self text))];
		with: 'edit'