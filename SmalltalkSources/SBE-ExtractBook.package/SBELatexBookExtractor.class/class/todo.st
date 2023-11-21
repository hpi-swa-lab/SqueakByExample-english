as yet unclassified
todo

	self flag: #todo.
	"This is all very hacked. Some of the most awkward hacks and issues include:
	* Insufficient grammar: It produces a lot of syntax errors. This has not been fully investigated but some known trigger include special characters in verbatim code like \ct{$a inspect}, \ct|{| (ah, why can't LaTeX be context-free). Maybe it would be enough to manually extend the grammar, maybe we would need a C plugin for tree-sitter.
	* Handling of syntax errors: Currently requires a LOT of hacks because some commands appear without all of their arguments, some commands appear as plain text, sometimes braces and square brackets appear as plain text nodes, etc. so we need to consume tokens from sibling nodes through the parseStack mechanism in a redundant manner.
	* Token consumption: parseStack is a fancy piece of stuff but we seem to be using generators in an unusual way (consume before produce), leading to an underflow/overflow of tokens that we have not fully understood and that prevented us from extracting a common generator logic. Further, there is a loop on the call stack (literally) while these generators are active which crashes the VM when you dare to not catch a single exception from within their block ... happy debugging!
	* Eager/lazy evaluation of tokens is not yet waterproof, just works good enough for this book. There are places such as LaTeX-inside-lstlisting
	* We could introduce better support for handling optional arguments of commands and environments.
	* Improve and refactoring handling of spaces at the beginning/end of lines, after commands, and multiple new lines in a row.
	* \makeatletter...\makeatother
	* conditional environment begins/ends
	* many more hacks i cannot count
	
	And of course there are many features not (yet) imlpemented, including tables, floatings, index/citations, labels for references, real footnotes, ..."