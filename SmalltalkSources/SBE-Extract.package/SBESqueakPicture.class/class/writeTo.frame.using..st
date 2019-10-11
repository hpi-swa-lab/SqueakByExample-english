as yet unclassified
writeTo: aPathString frame: aFrameSpecifier using: aBlock

	| picture wrapper priorHand priorWorld error |
	wrapper := SBEWorldHelper new worldSize: 1000 @ 1000; setUp.
	wrapper world color: Color transparent.
	
	priorWorld := ActiveWorld.
	priorHand := ActiveHand.
	error := nil.
	ActiveWorld := wrapper world.
	ActiveHand := wrapper hand.
	[
		[
			aBlock value: wrapper.
			
			aFrameSpecifier isBlock ifTrue: [
				picture := wrapper world imageFormForRectangle: (aFrameSpecifier value: wrapper morphsArea)].
			aFrameSpecifier = #morphs ifTrue: [
				picture := wrapper world imageFormForRectangle: wrapper morphsArea].
			aFrameSpecifier isRectangle ifTrue: [
				picture := wrapper world imageFormForRectangle: aFrameSpecifier]
		] on: Error do: [:err | error := err].
	
	] ensure: [
		ActiveWorld := priorWorld.
		ActiveHand := priorHand].
	
	error ifNotNil: #signal.
	
	picture ifNil: [self error: 'Invalid frame specified: ', aFrameSpecifier printString].
	picture writePNGfileNamed: (self currentDirectory resolve: aPathString) fullName.
	wrapper tearDown