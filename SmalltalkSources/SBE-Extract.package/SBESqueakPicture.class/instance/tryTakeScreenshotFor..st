private
tryTakeScreenshotFor: helper
	
	^ self
		executeSafely: [
			self buildBlock cull: helper.
			helper assureScreenshot]
		wrappedBy: [:block | helper useScreenshotSettingsDuring: block]