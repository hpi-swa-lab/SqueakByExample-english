visiting - environments
environmentItemize: contentBlock options: options
	<environment: 'itemize'>

	| result |
	listModeStack push: #itemize.
	result := contentBlock value.
	listModeStack pop.
	^ result