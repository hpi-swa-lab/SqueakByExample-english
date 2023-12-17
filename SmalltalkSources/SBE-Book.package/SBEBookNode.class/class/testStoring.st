documentation
testStoring

	| original store restored originalText restoredText |
	original := SBEHelp book.
	store := original storeString.
	restored := SBEBook readFrom: store.
	
	originalText := original fullText.
	restoredText := restored fullText.
	
	self assert: originalText asString = restoredText asString.
	self assert: originalText runs = restoredText runs description: 'known issue'.