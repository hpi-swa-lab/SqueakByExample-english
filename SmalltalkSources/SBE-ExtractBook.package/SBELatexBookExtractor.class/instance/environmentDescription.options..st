visiting - environments
environmentDescription: contentBlock options: options
	<environment: 'description'>

	| result |
	listModeStack push: #description.
	result := contentBlock value.
	listModeStack pop.
	^ result