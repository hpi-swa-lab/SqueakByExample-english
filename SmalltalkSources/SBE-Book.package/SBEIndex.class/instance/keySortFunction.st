private
keySortFunction

	^ [:key | key first isLetter asBit] ascending "special characters before letters"
		, [:key :otherKey | (key compare: otherKey caseSensitive: false) - 2]