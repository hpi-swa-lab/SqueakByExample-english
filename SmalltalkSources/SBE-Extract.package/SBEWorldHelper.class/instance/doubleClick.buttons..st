events
doubleClick: aWidget buttons: aCollection

	2 timesRepeat: [
		self click: aWidget buttons: aCollection.
		world doOneCycle]