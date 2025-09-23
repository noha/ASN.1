as yet unclassified
wasAddedByDefault: aKey 
	addedByDefault ifNil: [ ^ false ].
	^ addedByDefault includes: aKey