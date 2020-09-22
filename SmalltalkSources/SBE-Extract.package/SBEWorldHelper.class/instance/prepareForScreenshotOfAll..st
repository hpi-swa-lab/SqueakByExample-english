screenshots
prepareForScreenshotOfAll: morphs

	self world doOneCycleNow.
	(self okToAdjustMorphsAreaOf: morphs) ifTrue: [
		self adjustMorphsAreaOf: morphs].
	self displayForegroundWindowFocused.