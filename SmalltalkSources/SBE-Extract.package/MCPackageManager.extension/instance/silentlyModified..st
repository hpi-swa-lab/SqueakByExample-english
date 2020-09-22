*SBE-Extract-accessing
silentlyModified: aBoolean

	modified = aBoolean ifTrue: [^ self].
	modified := aBoolean.
	self changed: #modified.