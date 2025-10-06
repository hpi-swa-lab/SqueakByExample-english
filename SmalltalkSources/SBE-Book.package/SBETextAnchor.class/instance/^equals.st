comparing
= other

	^ other class == self class
		and: [other dyeMode = self dyeMode]
		and: [other extent = self extent]
		and:
			[self flag: #todo. "if other is compressed and we are not, this will mismatch"
			other imageBitsOrNil = self imageBitsOrNil]