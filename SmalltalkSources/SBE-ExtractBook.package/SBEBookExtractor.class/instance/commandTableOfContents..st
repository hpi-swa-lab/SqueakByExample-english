visiting - commands
commandTableOfContents: arguments
	<command: 'tableofcontents'>

	counters at: #chapter put:
		(counters at: #chapter ifAbsent: [0])
			+ 1.