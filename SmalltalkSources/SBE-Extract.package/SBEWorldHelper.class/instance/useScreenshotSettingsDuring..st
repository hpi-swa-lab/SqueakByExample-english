screenshots
useScreenshotSettingsDuring: aBlock

	thisContext
		wrap: [:block | self hideProgressMorphDuring: block];
		wrap: [:block | self useScreenshotPreferencesDuring: block];
		wrap: [:block | Utilities useAuthorInitials: self authorInitials during: block];
		wrap: [:block | self useWorldAndHandDuring: block];
		wrap: [:block | ToolSet setDefault: StandardToolSet during: block];
		wrap: [:block | self useTemporaryChangeSetDuring: block].
	
	^ aBlock value