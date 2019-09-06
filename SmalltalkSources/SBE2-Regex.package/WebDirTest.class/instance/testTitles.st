running
testTitles
	| titles |
	titles := home webPages collect: [ : each | each title ].
	self assert: [ titles size = 2 ].
	self assert: [ titles includes: 'Squeak By Example -- Home Page' ].
	self assert: [ titles includes: 'Squeak Par L''Exemple -- Home Page' ].
	