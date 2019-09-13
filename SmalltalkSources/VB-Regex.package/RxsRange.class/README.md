-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
-- See `documentation' protocol of RxParser class for user's guide.
--
I represent a range of characters as appear in character classes such as
	[a-ZA-Z0-9].
I appear in a syntax tree only as an element of RxsCharSet.
Instance Variables:
	first	<Character>
	last	<Character>