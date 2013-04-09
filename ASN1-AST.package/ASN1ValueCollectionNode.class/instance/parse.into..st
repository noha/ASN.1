parsing
parse: aStream into: aDictionary
	| pos |
	elements do: [:each|
		pos := aStream position.
		[ each parse: aStream into: aDictionary ]
			on: ASN1ParseError 
			do: [:err| 
				aStream position: pos.
				each isOptional
					ifFalse: [ err pass ]]]