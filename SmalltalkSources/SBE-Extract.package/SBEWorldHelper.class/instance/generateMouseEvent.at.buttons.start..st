private
generateMouseEvent: aType at: aPoint buttons: buttons start: aStartPoint

	^ MouseEvent readFrom: ({aType.
		0 milliSeconds asMilliSeconds.
		aPoint x rounded. aPoint y rounded.
		self mapButtons: buttons.
		aStartPoint x rounded. aStartPoint y rounded }
			joinSeparatedBy: ' ') readStream