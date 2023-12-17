documentation
dependencies

	self flag: #dependencies.
	"* SOH must not be a character (https://lists.squeakfoundation.org/archives/list/squeak-dev@lists.squeakfoundation.org/thread/D6FTOBYCYZS5JLM3BTFNTXMO7BKMHOJV/)
	* Fix TextStream>>reset (Collections-ct.1055)
	* Load DomainCode package from sb-tree-sitter (currently only possible via Squit)
	* When running the extractor for the first time, return entered value: nil from #prepareGrammar: and proceed"