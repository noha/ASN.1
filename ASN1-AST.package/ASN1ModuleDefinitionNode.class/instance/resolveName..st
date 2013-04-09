as yet unclassified
resolveName: aString
	^ (self resolveLocalName: aString) ifNil: [
		(self resolveImportedName: aString)
			ifNotNil: [:val| ^ val ]
			ifNil: [ Error signal: 'could not resolve name ', aString ]]