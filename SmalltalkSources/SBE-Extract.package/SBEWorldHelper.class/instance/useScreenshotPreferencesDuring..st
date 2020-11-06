private utils
useScreenshotPreferencesDuring: aBlock

	^ Preferences
		setPreferences: ({
			"Necessary for proper simulation"
			#(UIManager >> #openToolsAttachedToMouseCursor) -> false.
			
			"Appearance"
			#menuAppearance3d -> false.
			#(DialogWindow >> roundedDialogCorners) -> true.
			#(MenuMorph >> roundedMenuCorners) -> true.
			#(Model >> #useColorfulWindows) -> true.
			#(PluggableButtonMorph >> roundedButtonCorners) -> true.
			#(ScrollBar >> roundedScrollBarLook) -> true.
			#(SystemWindow >> roundedWindowCorners) -> true.
			#(Workspace >> #shouldStyle) -> true }
				collect: [:setting | setting key join asSymbol -> setting value])
		during: aBlock