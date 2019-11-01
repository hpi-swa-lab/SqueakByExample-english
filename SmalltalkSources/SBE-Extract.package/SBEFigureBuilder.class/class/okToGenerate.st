user interface
okToGenerate

	(SystemOrganizer default classesInCategory: 'SBEGenerated') ifEmpty: [^ true].
	^ (UIManager default confirm: ('This will possibly override or delete code in the "{1}" category. Proceed?' format: {self builderSystemCategory})) = true