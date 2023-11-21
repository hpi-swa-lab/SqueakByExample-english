private
contentsInGroup: node full: full optionalBrackets: optionalBrackets

	^ self
		contentsInGroup: node
		full: full
		brackets: '{}'
		optional: optionalBrackets