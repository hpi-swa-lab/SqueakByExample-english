code generation
compileCommands: commands

	commands do: [:command | self compileCommand: command]