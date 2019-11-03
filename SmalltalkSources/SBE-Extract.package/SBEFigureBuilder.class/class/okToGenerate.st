user interface
okToGenerate

	| existingClasses |
	existingClasses := SystemOrganizer default classesInCategory: 'SBEGenerated'.
	existingClasses ifEmpty: [^ true].
	(UIManager default confirm: ('This will REMOVE all {2} classes in the "{1}" category. Proceed?' format: {self builderSystemCategory. existingClasses size}))
		ifFalse: [^ false].
	existingClasses do: #removeFromSystem.
	^ true