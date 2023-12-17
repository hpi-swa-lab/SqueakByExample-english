resolving
tryResolveFile: fileName extensions: extensions

	^ self
		tryResolveFile: fileName
		extensions: extensions
		paths: #()