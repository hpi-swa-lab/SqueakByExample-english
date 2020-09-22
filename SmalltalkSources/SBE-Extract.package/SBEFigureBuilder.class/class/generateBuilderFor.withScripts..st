code generation
generateBuilderFor: file withScripts: scripts

	^ (super generateBuilderFor: file withScripts: scripts)
		fileReference: file;
		yourself