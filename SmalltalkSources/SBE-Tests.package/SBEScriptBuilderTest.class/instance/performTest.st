private
performTest

	^ self shouldntMessUpProcesses: [
		ToolSet setDefault: StandardToolSet during: [
			super performTest]]