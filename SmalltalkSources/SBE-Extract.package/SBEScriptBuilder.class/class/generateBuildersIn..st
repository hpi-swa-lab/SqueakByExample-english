code generation
generateBuildersIn: aFileReference

	| files allScripts builders |
	(UIManager default confirm: 'Careful, this will run all code matching the SmalltalkInTex pattern, without any safety checks. Proceed?') = true ifFalse: [^ false].
	
	Project current uiManager informUserDuring: [:bar |
		bar value: 'Gathering tex files'.
		files := self getTexFilesIn: aFileReference.
		bar value: 'Collecting scripts from files'.
		allScripts := files
			collect: [:file | file -> (self collectScriptsFromFile: file)]
			as: Dictionary.
		bar value: 'Generating builders'.
		builders := Set new.
		allScripts keysAndValuesDo: [:file :scripts |
			scripts ifNotEmpty: [
				builders add: (self generateBuilderFor: file withScripts: scripts)]]].
	^ builders