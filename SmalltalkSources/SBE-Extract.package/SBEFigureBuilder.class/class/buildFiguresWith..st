building
buildFiguresWith: builders
	"Return a boolean for whether the build has passed"

	| suite |
	suite := self buildSuiteFromClasses: builders.
	^ SBESqueakPicture useLowDpiDuring: [
		self runSuite: suite]