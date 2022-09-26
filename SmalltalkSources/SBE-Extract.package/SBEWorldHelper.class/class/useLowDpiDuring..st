utils - dpi
useLowDpiDuring: aBlock

	^ (Display respondsTo: #uiScaleFactor:)
		ifTrue: [Display sbeUiScaleFactor: 1.0 during: aBlock]
		ifFalse: [Preferences useFontSize: self standardFontSize during: aBlock]