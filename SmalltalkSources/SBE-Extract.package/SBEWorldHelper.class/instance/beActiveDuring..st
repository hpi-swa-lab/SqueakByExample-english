running
beActiveDuring: aBlock

	| previousHiddenMorphs |
	previousHiddenMorphs := hiddenMorphs.
	hiddenMorphs := OrderedCollection new.
	^ [self useScreenshotSettingsDuring: aBlock]
		ensure: [
			hand showHardwareCursor: true. "Nasty side-effect"
			hiddenMorphs do: #show.
			(hiddenMorphs := previousHiddenMorphs) do: #hide]