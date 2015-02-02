codec
decode: anObject
	| string |
	string := anObject asString.
	(string allSatisfy: [ :each | self validCharacters includes: each ]) ifFalse: [
		Error signal: string, ' is not a valid PrintableString' ].
	^ string