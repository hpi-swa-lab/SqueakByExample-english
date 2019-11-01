private
tryTakeScreenshotFor: helper
	
	^ self
		executeSafely: [
			self buildBlock cull: helper.
			helper takeScreenshot]
		wrappedBy: [:block | helper useScreenshotSettingsDuring: block]