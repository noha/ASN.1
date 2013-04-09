*asn1-tool
selectorFor: aString
	| parts |
	parts := Character space split: self type.
	^ (String streamContents: [:stream|
		stream nextPutAll: aString.
		parts do: [:each|
			stream nextPutAll: each asLowercase capitalized ]]) asSymbol