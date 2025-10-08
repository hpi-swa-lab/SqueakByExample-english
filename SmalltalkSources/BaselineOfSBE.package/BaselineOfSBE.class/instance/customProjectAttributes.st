accessing
customProjectAttributes

	| attributes |
	attributes := super customProjectAttributes.
	(Smalltalk classNamed: #SystemVersion) ifNotNil: [:versionClass |
		versionClass current isRelease ifTrue:
			[attributes := attributes ,
				(MetacelloPlatform current defaultPlatformAttributes
					select: [:ea | ea matchesRegex: 'squeak\d.*']
					thenCollect: [:ea | ea , '.release'])]].
	^ attributes