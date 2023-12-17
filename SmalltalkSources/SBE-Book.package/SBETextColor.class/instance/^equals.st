comparing
= other 

	^ other class == self class
		and: [other property = self property]
		and: [other scope = self scope]