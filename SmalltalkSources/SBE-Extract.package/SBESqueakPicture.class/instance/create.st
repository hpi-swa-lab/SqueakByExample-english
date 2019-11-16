creating
create

	| helper |
	helper := self setUpHelper.
	^ [self tryTakeScreenshotFor: helper]
		ensure: [helper tearDown]