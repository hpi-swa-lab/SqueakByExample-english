code generation
generateBuildersIn: aFileReference

	| files allCommands builders |
	(UIManager default confirm: 'Careful, this will run all code matching the SmalltalkInTex pattern, without any safety checks. Proceed?') = true ifFalse: [^ false].
	
	files := self getTexFilesIn: aFileReference.
	allCommands := (files progressing: 'Collecting commands ...')
		collect: [:file | file -> (self collectCommandsFromFile: file)]
		as: Dictionary.
	builders := Set new.
	Project current uiManager informUserDuring: [:bar |
		bar value: 'Generating builders ...'.
		allCommands keysAndValuesDo: [:file :commands |
			commands ifNotEmpty: [
				builders add: (self generateBuilderFor: file with: commands)]]].
	^ builders