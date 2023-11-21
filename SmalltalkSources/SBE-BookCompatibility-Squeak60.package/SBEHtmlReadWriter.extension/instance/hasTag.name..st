*SBE-BookCompatibility-Squeak60-private
hasTag: aTag name: tagNameLt

	| after |
	(aTag beginsWith: tagNameLt caseSensitive: false) ifFalse: [^ false].
	after := aTag at: tagNameLt size + 1 ifAbsent: [^ true].
	^ after = $> or: [after isSeparator]