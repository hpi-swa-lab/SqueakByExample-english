events
focus: aMorph

	aMorph ifNil: [self hand newKeyboardFocus: nil].
	"The only real way of side-effect free focusing"
	Preferences
		setPreference: #mouseOverForKeyboardFocus
		toValue: true
		during: [
			self mouseEnter: aMorph]