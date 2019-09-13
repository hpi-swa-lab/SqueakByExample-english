testing
runTests
	| tr |
	tr := TestRunner new.
	ToolBuilder open: tr.
	
	tr categoryAt: (tr categoryList indexOf: self class testCategory) put: true;
		categoryAt: (tr categoryList indexOf: 'CollectionsTests-Text') put: true;
		categoryAt: (tr categoryList indexOf: 'SBE-Quinto') put: true;
		categoryAt: (tr categoryList indexOf: 'SBE-Environment') put: true;
		categoryAt: (tr categoryList indexOf: 'SBE-Streams') put: true;
		categoryAt: (tr categoryList indexOf: 'SBE-Morphic') put: true;
		selectAllClasses;
		runAll.
