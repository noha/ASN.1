accessing
tagByteValue
	^(Array streamContents: [:str | self tag writeOn:  str constructed: self isConstructed] ) first