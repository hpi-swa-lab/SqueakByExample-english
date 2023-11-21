comparing
hash

	^ (self dyeMode hash
		bitXor: self extent hash)
		bitXor: self image bits hash