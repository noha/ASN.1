as yet unclassified
parseModelFrom: aString
	^ ASN1 new ast 
		addModule: (self parseGrammar: aString);
		yourself