code generation
collectCommandsFromStream: fileStream

	| prefix suffix |
	prefix := '%%{SBESqueakPicture'.
	suffix := '%%]}'.
	^ Array streamContents: [:results |
		[fileStream atEnd] whileFalse: [
			| match |
			fileStream upToAll: prefix.
			match := prefix, (fileStream upToAll: suffix), suffix.
			fileStream atEnd ifFalse: [
				| script |
				[script := (match lines
					do: [:line | (line beginsWith: '%%') ifFalse: [self error: #%%]];
					collect: [:line | line allButFirst: 2])
						joinSeparatedBy: String cr.
				script := script copyFrom: 2 to: script size - 1]
					ifError: [:text | ^ self error: 'Invalid SmalltalkInTex format: ', text].
				results nextPut: script]]]