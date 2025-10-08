visiting - environments
environmentEnumerate: contentBlock options: options
	<environment: 'enumerate'>

	| result |
	listModeStack push: #enumerate.
	enumerateStack push: 0.
	result := contentBlock value.
	listModeStack pop.
	^ result