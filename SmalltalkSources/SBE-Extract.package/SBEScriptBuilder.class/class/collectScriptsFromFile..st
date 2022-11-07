code generation
collectScriptsFromFile: aFile

	^ aFile readStreamDo:
		[:stream |
			self collectScriptsFromStream: stream]