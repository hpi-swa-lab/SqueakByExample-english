visiting - environments
environmentEnumerateStar: contentBlock options: options
	<environment: 'enumerate*'>

	| result |
	listModeStack push: #enumerateStar.
	enumerateStack push: 0.
	result := contentBlock value.
	listModeStack pop.
	^ result