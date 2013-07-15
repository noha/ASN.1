actions
parseModuleFrom: aString
	| module |
	module := ASN1ASTParser parse: aString.
	module isPetitFailure
		ifTrue: [ Error signal: 'failed to parse module from file named ', aString asString ].
	^ module