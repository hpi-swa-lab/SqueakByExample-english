updating
themeProperties
	"Ensure that #applyUserInterfaceTheme is sent."

	^ super themeProperties
		, {{#placeholder. '<placeholder>'. 'Just a placeholder to ensure that this class is sent #applyUserInterfaceTheme updates.'}}