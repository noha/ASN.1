codec
encode: aString
	(aString allSatisfy: [ :each | self validCharacters includes: each ]) ifFalse: [
		Error signal: aString, ' is not a valid PrintableString' ].
	^aString asByteArray