building
buildFiguresWith: builders
	"Return a boolean for whether the build has passed"

	| suite |
	suite := self buildSuiteFromClasses: builders.
	"Kind of workaround. If Preferences>>#changeFontSize: wasn't that teribbly slow and global, we could just set it per test in SBEWorldHelper>>#useScreenshotSettingsDuring:."
	^ SBEWorldHelper useLowDpiDuring: [
		self runSuite: suite]