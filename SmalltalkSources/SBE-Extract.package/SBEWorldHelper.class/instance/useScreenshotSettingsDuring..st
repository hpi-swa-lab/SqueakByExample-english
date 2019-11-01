screenshots
useScreenshotSettingsDuring: aBlock

	thisContext
		wrap: [:block | self hideProgressMorphDuring: block];
		wrap: [:block | self useScreenshotPreferencesDuring: block];
		wrap: [:block | self useWorldAndHandDuring: block];
		wrap: [:block | ToolSet setDefault: StandardToolSet during: block].
	
	^ aBlock value