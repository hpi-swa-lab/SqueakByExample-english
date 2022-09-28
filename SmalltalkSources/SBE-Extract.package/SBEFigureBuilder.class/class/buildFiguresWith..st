building
buildFiguresWith: builders
	"Return a boolean for whether the build has passed"

	| suite |
	suite := self buildSuiteFromClasses: builders.
	"Kind of workaround. If this wasn't that teribbly slow and global, we could just set it per test in SBEWorldHelper>>#useScreenshotSettingsDuring:."
	^ SBEWorldHelper useScaleFactorDuring: [
		self runSuite: suite]