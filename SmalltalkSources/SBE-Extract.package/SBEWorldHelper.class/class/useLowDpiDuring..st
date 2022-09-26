utils - dpi
useLowDpiDuring: aBlock

	^ (Display respondsTo: #uiScaleFactor:)
		ifTrue: [">= Squeak 6.0" Display sbeUiScaleFactor: 1.0 during: aBlock]
		ifFalse: ["< Squeak 6.0" Preferences useFontSize: self standardFontSize during: aBlock]