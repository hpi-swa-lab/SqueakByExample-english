testing
removeTestCase
	"for cleanup"
	self testCase ifNotNil:
		[ self testCase removeFromSystem.
		self testCase: nil ]