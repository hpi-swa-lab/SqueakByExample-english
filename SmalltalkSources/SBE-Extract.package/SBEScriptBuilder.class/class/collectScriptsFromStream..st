code generation
collectScriptsFromStream: fileStream

	| prefix suffix |
	prefix := '\begin{ExecuteSmalltalkScript}'.
	suffix := '\end{ExecuteSmalltalkScript}'.
	^ Array streamContents: [:results |
		[fileStream upToAll: prefix.
		fileStream atEnd] whileFalse: [
			| script |
			script := (fileStream upToAll: suffix) withBlanksTrimmed.
			fileStream atEnd ifTrue: [
				self error: ('Invalid SmalltalkInTex syntax (suffix expected).  In file: {1}. Script starts with: "{2}".'
					format: {fileStream name. (script first: 100) , '...'})].
			results nextPut: script]]