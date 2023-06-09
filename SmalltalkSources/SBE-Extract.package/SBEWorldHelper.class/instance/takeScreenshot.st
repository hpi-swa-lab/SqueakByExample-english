screenshots
takeScreenshot
	"NOTE: This is done automatically after building the scene, but scripts may prepone this step before certain things are changed or reverted. In particular, while a plain #takeScreenshot send at the end of a building block may seem redundant, it often is not if that building block contains a 'thisContext wrap:' earlier."

	^ self takeScreenshotOfAll: self world submorphs