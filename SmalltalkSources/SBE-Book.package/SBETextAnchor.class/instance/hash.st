comparing
hash

	^ (self dyeMode hash
		bitXor: self extent hash)
		bitXor: self imageBitsOrNil hash