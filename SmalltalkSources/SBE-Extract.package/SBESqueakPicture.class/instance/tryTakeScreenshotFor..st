private
tryTakeScreenshotFor: helper
	
	helper useScreenshotSettingsDuring: [
		self buildBlock cull: helper.
		^ helper assureScreenshot]