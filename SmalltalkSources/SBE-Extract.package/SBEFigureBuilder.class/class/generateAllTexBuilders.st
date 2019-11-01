code generation
generateAllTexBuilders

	^ [self generateBuildersIn: self resourceDirectory]
		valueSuppressingMessages: #('*safety checks*')