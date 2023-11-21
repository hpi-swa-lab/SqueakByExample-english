emitting
emitCodeDuring: aBlock

	^ self stream withAttribute: TextColor blue do:
		[| oldStream wasVerbatim code |
		wasVerbatim := verbatim.
		verbatim := true.
		[oldStream := self stream.
		stream := TextStream on: Text new.
		[aBlock value.
		
		code := self stream contents.
		code := (Dictionary new
			at: 'BANG' put: '!';
			at: 'UNDERSCORE' put: '_';
			associations) inject: code into: [:oldCode :replacement |
				oldCode copyReplaceAll: replacement key with: replacement value]]
			ensure:
				[stream := oldStream].
		
		self basicVisitText: code]
			ensure:
				[verbatim := wasVerbatim]]