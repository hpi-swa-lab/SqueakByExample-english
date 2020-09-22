*SBE-Extract-compatibility
subexpressions
        | result |
        result := Array new: self subexpressionCount.
        1 to: self subexpressionCount do: [:index |
                result
                        at: index
                        put: (self subexpression: index) ].
        ^ result