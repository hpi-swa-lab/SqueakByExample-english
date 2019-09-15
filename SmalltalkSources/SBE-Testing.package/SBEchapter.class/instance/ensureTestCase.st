testing
ensureTestCase
	"Create the test class. Should only be called if there actually is a test to be included."
	
	self testCase: (
		TestCase subclass: self testCaseName asSymbol
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: SBEmain testCategory
			).