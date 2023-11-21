private
contentsInGroup: node optionalBrackets: optionalBrackets

	^ self
		contentsInGroup: node
		brackets: '{}'
		optional: optionalBrackets