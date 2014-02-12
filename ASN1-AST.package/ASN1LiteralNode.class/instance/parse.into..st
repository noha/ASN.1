parsing
parse: aStream into: aDictionary
	| streamToken |
	streamToken := aStream next.
	(streamToken = self) ifFalse: [
		aStream position: aStream position - 1.
		^ ASN1ParseError signal: 'literals do not match' ]