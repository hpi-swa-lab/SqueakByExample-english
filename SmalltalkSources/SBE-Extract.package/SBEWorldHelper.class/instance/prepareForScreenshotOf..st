screenshots
prepareForScreenshotOf: morphs

	(self okToAdjustMorphsAreaOf: morphs) ifTrue: [
		self adjustMorphsAreaOf: morphs].
	self displayForegroundWindowFocused.