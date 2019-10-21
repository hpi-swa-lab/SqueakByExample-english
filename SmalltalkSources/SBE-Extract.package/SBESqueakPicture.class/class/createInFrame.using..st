screenshots
createInFrame: aFrameSpecifier using: aBlock

	| helper process |
	[helper := SBEWorldHelper new
		worldSize: 1000 @ 1000;
		frameSpecifier: aFrameSpecifier;
		setUp.
	helper world color: self paperColor.
	
	helper useWorldAndHandDuring: [
		[
			process := [aBlock cull: helper] fork.
			Processor yield.
			helper takeScreenshot
		] forkAt: Processor activePriority + 1.
		Processor yield].
	
	Project current world doOneCycleNow.
	process isSuspended ifTrue: [^ nil].
	
	^ helper picture]
		ensure: [helper tearDown]