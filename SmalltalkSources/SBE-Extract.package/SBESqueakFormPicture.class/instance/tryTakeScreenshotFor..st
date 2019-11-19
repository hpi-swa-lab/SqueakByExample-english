private
tryTakeScreenshotFor: helper
	
	helper useScreenshotSettingsDuring: [
		(self buildBlock cull: helper) asMorph openInWorld.
		^ helper assureScreenshot]