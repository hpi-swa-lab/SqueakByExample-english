pages
preface
	"This method was automatically generated. Edit it using:"
	"SBEHelp edit: #preface"
	<generated>
	^(HelpTopic
		title: 'How to use this book'
		contents: 
'How to use this book

You can read this book from beginning to end, from end to beginning, look up things in the index, or browse through random sections as your interests take you. Either way, here are some tips on how to get the most out of reading this book right in Squeak:

Interactive contents. Since Squeak is a super-duper-interactive system, you can also interact directly with the contents of this book. For example, you can select any mentioned message and press Cmd+m to browse its implementors, just like anywhere else in the image. Analogously, Cmd+b is available to browse a class definition, Cmd+p to print an expression, Cmd+D to debug it, and all your other favorite shortcuts.

Smart search. Did you notice the search bar at the top of this window? You can search the entire book with it!!!!1 More importantly, if you also have installed the SemanticText package, this will even perform a smart search powered by OpenAI. So, instead of "exception handling", you could just search for "catch errors". Note that this is an experimental feature and watch out for artificial stupidity and hallucinations.

Fallback to PDF. While we managed to parse most of the book in a satisfactory quality, we just could not get some things right (yet). (Imagine parsing a context-sensitive language with a context-free grammar?) So, if you encounter an unreadable artifact, send your thanks to Donald Knuth and yellow-click on the relevant section in the tree to open it in a PDF viewer in the great darkness outside of Squeak.!
]style[(21 92 5 161 22 173 5 15 12 53 5 44 5 4 5 16 5 4 8 42 13 409 16 392)b,,Rcode://
(SBETextLabelLink to: #index)
	openPath: (SBEHelp book pathToLabel: #index)
	in:
		(SystemWindow
			windowsIn: self currentWorld
			satisfying: [:window | window model isKindOf: HelpBrowser]) anyOne model;,,b,,i,,i,,i,,i,,i,,i,,i,,b,,b,!' readStream nextChunkText)
			key: #preface;
			shouldStyle: false;
			yourself