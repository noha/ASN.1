*asn1-ast
doublePeek
	| array |
	self atEnd 
		ifTrue: [^Array with: nil with: nil].
	array := Array with: (self next) with: (self peek).
	position := position - 1.
	^array