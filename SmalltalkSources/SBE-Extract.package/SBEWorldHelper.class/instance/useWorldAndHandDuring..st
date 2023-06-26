private utils
useWorldAndHandDuring: aBlock

	{self world.
	self hand.
	"Do not leave it to chance what was the last event before starting the screenshot generation. In smalltalkCI, it is a mouseMove 0@0. Use a position outside world bounds because new windows are initially built at 0@0 but should not be hovered during construction. Otherwise, they might be displayed with an incorrect fill style. See PluggableButtonMorph>>#updateFillStyle: for an example."
	self generateMouseEvent: #mouseMove at: -1 @ -1 buttons: #() start: -1 @ -1
	} do: [:ea |
		thisContext home wrap: [:block |
			ea becomeActiveDuring: block]].
	
	^ aBlock value