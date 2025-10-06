comparing
= other

	^ other class == self class
		and: [other initialExtent = self initialExtent]
		and: [other imageBitsOrNil = self imageBitsOrNil]