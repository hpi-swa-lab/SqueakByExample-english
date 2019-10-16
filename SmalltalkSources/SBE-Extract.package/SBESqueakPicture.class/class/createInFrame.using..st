screenshots
createInFrame: aFrameSpecifier using: aBlock

	| helper priorHand priorWorld process |
	[helper := SBEWorldHelper new worldSize: 1000 @ 1000; frameSpecifier: aFrameSpecifier; setUp.
	helper world color: Color transparent.
	
	priorWorld := ActiveWorld.
	priorHand := ActiveHand.
	ActiveWorld := helper world.
	ActiveHand := helper hand.
	
	process := [
		[Processor yield. helper takeScreenshot] forkAt: 41.
		aBlock cull: helper
	] forkAt: 41.
	
	ActiveWorld := priorWorld.
	ActiveHand := priorHand.
	
	^ helper picture]
		ensure: [helper tearDown]