initialize-release
initialize

	super initialize.
	
	book := SBEBook new
		title: 'Squeak by Example';
		yourself.
	nodeStack := Stack new.
	nodeStack push: book.
	pendingLabels := OrderedCollection new.
	self imageScaleFactor: self defaultImageScaleFactor.
	appendix := false.