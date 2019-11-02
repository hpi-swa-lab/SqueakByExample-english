private
setUpHelper

	| helper |
	helper := SBEWorldHelper new
		worldSize: self worldSize;
		frameSpecifier: self frameSpecifier;
		setUp.
	helper world color: self paperColor.
	^ helper