*SBE-Environment
testSuffixFound 
	self assert: 'txt' equals: 'readme.txt' suffix.
	self assert: 'txt' equals: 'read.me.txt' suffix.