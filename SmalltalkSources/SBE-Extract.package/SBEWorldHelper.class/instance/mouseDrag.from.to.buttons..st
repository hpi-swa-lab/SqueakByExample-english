events
mouseDrag: aWidget from: aStartPoint to: aStopPoint buttons: aButtonsCollection
	self
		mouseEnter: aWidget at: aStartPoint;
		mousePress: aWidget at: aStartPoint buttons: aButtonsCollection;
		mouseMoveTo: aStopPoint buttons: #(left) in: aWidget.