creating
create

	| helper |
	helper := self setUpHelper.
	[self tryTakeScreenshotFor: helper.
	^ helper picture]
		ensure: [helper tearDown]