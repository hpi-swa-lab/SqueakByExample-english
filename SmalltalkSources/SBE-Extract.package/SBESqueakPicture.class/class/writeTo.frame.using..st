as yet unclassified
writeTo: aPathString frame: aFrameSpecifier using: aBlock

	| picture helper priorHand priorWorld promise |
	helper := SBEWorldHelper new worldSize: 1000 @ 1000; setUp.
	helper world color: Color transparent.
	
	priorWorld := ActiveWorld.
	priorHand := ActiveHand.
	promise := Promise new.
	ActiveWorld := helper world.
	ActiveHand := helper hand.
	[
		aBlock cull: helper.
		
		aFrameSpecifier isBlock ifTrue: [
			picture := helper world imageFormForRectangle: (aFrameSpecifier value: helper morphsArea)].
		aFrameSpecifier = #morphs ifTrue: [
			picture := helper world imageFormForRectangle: helper morphsArea].
		aFrameSpecifier isRectangle ifTrue: [
			picture := helper world imageFormForRectangle: aFrameSpecifier]
	] forkAt: 41.
	
	ActiveWorld := priorWorld.
	ActiveHand := priorHand.
	
	picture ifNil: [self error: 'Invalid frame specified (or error occured in picture block): ', aFrameSpecifier printString].
	picture writePNGfileNamed: (self currentDirectory resolve: aPathString) fullName.
	helper tearDown