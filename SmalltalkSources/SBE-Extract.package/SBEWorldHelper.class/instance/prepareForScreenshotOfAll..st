screenshots
prepareForScreenshotOfAll: morphs

	(self okToAdjustMorphsAreaOf: morphs) ifTrue: [
		self adjustMorphsAreaOf: morphs].
	self displayForegroundWindowFocused.