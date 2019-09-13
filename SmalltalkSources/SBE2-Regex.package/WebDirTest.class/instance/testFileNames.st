running
testFileNames
	| files |
	files := home htmlFiles.
	self assert: [ files size = 2 ].
	self assert: [ files includes: 'index.html' ].
	self assert: [ files includes: 'spe.html' ].
	