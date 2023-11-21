accessing
squeakVersion
	
	^ squeakVersion ifNil: [SystemVersion current]