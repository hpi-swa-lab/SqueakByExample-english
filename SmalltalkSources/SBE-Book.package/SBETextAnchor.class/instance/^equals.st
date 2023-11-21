comparing
= other

	^ other class == self class
		and: [other dyeMode = self dyeMode]
		and: [other extent = self extent]
		and: [other image bits = self image bits]