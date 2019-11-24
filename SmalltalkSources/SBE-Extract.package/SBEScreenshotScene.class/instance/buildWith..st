building
buildWith: aWorldHelper

	aWorldHelper recordScene: self during: [
		self basicBuildWith: aWorldHelper.
		^ aWorldHelper assureScreenshot]