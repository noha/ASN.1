as yet unclassified
resolveLocalName: aString
	^ self localNames 
		at: aString
		ifAbsent: [ nil ]
