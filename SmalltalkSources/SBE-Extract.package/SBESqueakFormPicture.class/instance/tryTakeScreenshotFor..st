private
tryTakeScreenshotFor: helper
	
	^ self
		executeSafely: [
			(self buildBlock cull: helper) asMorph openInWorld.
			helper assureScreenshot]
		wrappedBy: [:block | helper useScreenshotSettingsDuring: block]