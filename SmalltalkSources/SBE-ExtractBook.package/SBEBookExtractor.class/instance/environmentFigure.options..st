visiting - environments
environmentFigure: contentBlock options: options
	<environment: 'figure'>

	| oldFigure |
	oldFigure := figure.
	figure := true.
	^ contentBlock ensure:
		[figure := oldFigure]