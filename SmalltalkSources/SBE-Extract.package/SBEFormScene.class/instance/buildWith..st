building
buildWith: aWorldHelper

	aWorldHelper recordScene: self during: [
		| form formInWorld |
		form := self basicBuildWith: aWorldHelper.
		[formInWorld := form asMorph openInWorld.
		^ aWorldHelper takeScreenshotOf: {formInWorld}]
			ensure: [formInWorld abandon]]