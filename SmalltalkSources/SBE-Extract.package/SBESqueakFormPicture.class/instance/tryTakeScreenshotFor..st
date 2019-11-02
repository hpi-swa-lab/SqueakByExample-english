private
tryTakeScreenshotFor: helper
	
	^ self
		executeSafely: [
			(self buildBlock cull: helper) asMorph openInWorld.
			helper takeScreenshot]
		wrappedBy: [:block | helper useScreenshotSettingsDuring: block]