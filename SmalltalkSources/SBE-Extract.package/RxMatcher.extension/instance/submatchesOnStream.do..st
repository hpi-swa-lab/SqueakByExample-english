*SBE-Extract-compatibility
submatchesOnStream: aStream do: aBlock
        [self searchStream: aStream] whileTrue:
                [aBlock value: self subexpressions]