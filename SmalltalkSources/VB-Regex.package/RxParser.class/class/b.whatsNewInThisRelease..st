DOCUMENTATION
b:x whatsNewInThisRelease: xx
"
VERSION 1.1	(October 1999)
Regular expression syntax corrections and enhancements:
1. Backslash escapes similar to those in Perl are allowed in patterns:
	\w	any word constituent character (equivalent to [a-zA-Z0-9_])
	\W	any character but a word constituent (equivalent to [^a-xA-Z0-9_]
	\d	a digit (same as [0-9])
	\D	anything but a digit
	\s 	a whitespace character
	\S	anything but a whitespace character
	\b	an empty string at a word boundary
	\B	an empty string not at a word boundary
	\<	an empty string at the beginning of a word
	\>	an empty string at the end of a word
For example, '\w+' is now a valid expression matching any word.
2. The following backslash escapes are also allowed in character sets
(between square brackets):
	\w, \W, \d, \D, \s, and \S.
3. The following grep(1)-compatible named character classes are
recognized in character sets as well:
	[:alnum:]
	[:alpha:]
	[:cntrl:]
	[:digit:]
	[:graph:]
	[:lower:]
	[:print:]
	[:punct:]
	[:space:]
	[:upper:]
	[:xdigit:]
For example, the following patterns are equivalent:
	'[[:alnum:]]+' '\w+'  '[\w]+' '[a-zA-Z0-9_]+'
4. Some non-printable characters can be represented in regular
expressions using a common backslash notation:
	\t	tab (Character tab)
	\n	newline (Character lf)
	\r	carriage return (Character cr)
	\f	form feed (Character newPage)
	\e	escape (Character esc)
5. A dot is corectly interpreted as 'any character but a newline'
instead of 'anything but whitespace'.
6. Case-insensitive matching.  The easiest access to it are new
messages CharacterArray understands: #asRegexIgnoringCase,
#matchesRegexIgnoringCase:, #prefixMatchesRegexIgnoringCase:.
7. The matcher (an instance of RxMatcher, the result of
String>>asRegex) now provides a collection-like interface to matches
in a particular string or on a particular stream, as well as
substitution protocol. The interface includes the following messages:
	matchesIn: aString
	matchesIn: aString collect: aBlock
	matchesIn: aString do: aBlock
	matchesOnStream: aStream
	matchesOnStream: aStream collect: aBlock
	matchesOnStream: aStream do: aBlock
	copy: aString translatingMatchesUsing: aBlock
	copy: aString replacingMatchesWith: replacementString
	copyStream: aStream to: writeStream translatingMatchesUsing: aBlock
	copyStream: aStream to: writeStream replacingMatchesWith: aString
Examples:
	'\w+' asRegex matchesIn: 'now is the time'
returns an OrderedCollection containing four strings: 'now', 'is',
'the', and 'time'.
	'\<t\w+' asRegexIgnoringCase
		copy: 'now is the Time'
		translatingMatchesUsing: [:match | match asUppercase]
returns 'now is THE TIME' (the regular expression matches words
beginning with either an uppercase or a lowercase T).
ACKNOWLEDGEMENTS
Since the first release of the matcher, thanks to the input from
several fellow Smalltalkers, I became convinced a native Smalltalk
regular expression matcher was worth the effort to keep it alive. For
the advice and encouragement that made this release possible, I want
to thank:
	Felix Hack
	Eliot Miranda
	Robb Shecter
	David N. Smith
	Francis Wolinski
and anyone whom I haven't yet met or heard from, but who agrees this
has not been a complete waste of time.
--Vassili Bykov
October 3, 1999
"
	self error: 'comment only'