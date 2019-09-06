running
testLink
	| links |
	links := home webPages collect: [ : each | each link ].
	self assert: [ links size = 2 ].
	self assert: [ links includes: '<a href="index.html">Squeak By Example -- Home Page</a>' ].
	self assert: [ links includes: '<a href="spe.html">Squeak Par L''Exemple -- Home Page</a>' ].
	