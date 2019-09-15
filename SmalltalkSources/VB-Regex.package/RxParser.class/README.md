-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
-- See `documentation' protocol of RxParser class for user's guide.
--
The regular expression parser. Translates a regular expression read from a stream into a parse tree. ('accessing' protocol). The tree can later be passed to a matcher initialization method.  All other classes in this category implement the tree. Refer to their comments for any details.
Instance variables:
	input		<Stream> A stream with the regular expression being parsed.
	lookahead	<Character>