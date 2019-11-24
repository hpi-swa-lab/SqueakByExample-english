running
beActiveDuring: aBlock

	hiddenMorphs := OrderedCollection new.
	^ [self useScreenshotSettingsDuring: aBlock]
		ensure: [
			hand showHardwareCursor: true. "Nasty side-effect"
			hiddenMorphs do: #openInWorld]