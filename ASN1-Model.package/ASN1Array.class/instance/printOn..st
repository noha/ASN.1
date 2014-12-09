as yet unclassified
printOn: aStream
	aStream nextPutAll: 'ASN1Array ['.
	collection do: [:each|
		each printOn: aStream.
		aStream nextPut: Character cr ].
	aStream nextPutAll: ' ]'