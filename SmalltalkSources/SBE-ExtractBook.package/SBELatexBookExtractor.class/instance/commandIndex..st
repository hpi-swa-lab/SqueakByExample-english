visiting - commands
commandIndex: arguments
	<command: 'index'>

	| full matcher keys label ref |
	self assert: arguments size = 1.
	full := self contentsIn: arguments first.
	
	"format: ( parent_entry '!' ) * entry ( '@' label | 'see' '{' ref_list '}' )"
	matcher := '((?<entry>[^!|@]+)!)*(?<entry>[^!|@]+)(\s*@\s*(?<label>[^!|@]+))?(\s*\|\s*(?<refcommand>(seealso|see))\s*(?<ref>[^,\r\n]+)\s*(,\s*(?<ref>[^\r\n,]+\s*))*)?' asRegex.
	self flag: #bug. "we don't support 'Collection, ,' atm"
	(matcher matches: full)
		ifFalse: [^ self notify: 'invalid index'].
	
	keys := matcher keyedSubexpressions: 'entry'.
	label := (matcher keyedSubexpression: 'label')
		ifNil: [label := keys last].
	ref := (matcher keyedSubexpression: 'refcommand') ifNotNil: [:refCommand |
		(refCommand caseOf: {['seealso'] -> ['see also']} otherwise: [refCommand])
			-> (matcher keyedSubexpressions: 'ref')].
	
	self
		emitIndexEntry: label
		keys: (keys collect: [:key | key asString])
		forwardReference: ref.