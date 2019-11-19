code generation
compileScripts: scripts

	scripts do: [:script | self compileScript: script]