code generation
generateBuildersIn: aFileReference

	| files allCommands builders |
	(UIManager default confirm: 'Careful, this will run all code matching the SmalltalkInTex pattern, without any safety checks. Proceed?') = true ifFalse: [^ false].
	
	Project current uiManager informUserDuring: [:bar |
		bar value: 'Gathering tex files'.
		files := self getTexFilesIn: aFileReference.
		bar value: 'Collecting commands from files'.
		allCommands := files
			collect: [:file | file -> (self collectCommandsFromFile: file)]
			as: Dictionary.
		bar value: 'Generating builders ...'.
		builders := Set new.
		allCommands keysAndValuesDo: [:file :commands |
			commands ifNotEmpty: [
				builders add: (self generateBuilderFor: file with: commands)]]].
	^ builders