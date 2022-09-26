drawing
drawOn: aCanvas

	super drawOn: aCanvas.
	(self perform: ('face' , dieValue) asSymbol)
		do: [:aPoint | self drawDotOn: aCanvas at: aPoint].