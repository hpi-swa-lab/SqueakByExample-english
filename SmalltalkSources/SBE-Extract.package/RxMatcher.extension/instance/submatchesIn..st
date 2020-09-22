*SBE-Extract-compatibility
submatchesIn: aString
        "Search aString repeatedly for the matches of the receiver.  Answer an OrderedCollection with an array of subexpressions per match."
        | result |
        result := OrderedCollection new.
        self
                submatchesOnStream: aString readStream
                do: [:subexprs | result add: subexprs].
        ^result