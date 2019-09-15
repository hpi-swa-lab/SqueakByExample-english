testing
generateTestMethod: source
	self ensureTestCase.
	self testCase compile: source.