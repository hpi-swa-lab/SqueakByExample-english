visiting - commands
ignoredCommands

	self flag: #todo. "do we need colors?"
	^ #('pagestyle' 'renewpagestyle' 'includepdf' 'labelformat' 'soulregister' 'hypersetup' 'urlstyle' 'bibliographystyle' 'titleformat'
	'definecolor'
	'lstdefinelanguage lstset' "!"
	'setlist' 'renewlist' 'setlistdepth'
	'newlength' 'setlength' 'addtolength'
	'hspace' 'hspace*' 'vspace' 'vspace*'
	'needlines' 'needspace'
	'bibliography')