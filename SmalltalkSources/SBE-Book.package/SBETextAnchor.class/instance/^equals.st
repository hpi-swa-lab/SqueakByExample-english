comparing
= other

	^ other class == self class
		and: [other image bits = self image bits]