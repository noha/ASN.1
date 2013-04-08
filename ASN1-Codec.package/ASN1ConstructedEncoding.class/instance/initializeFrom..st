initialization
initializeFrom: anObject
	| stream |
	stream := DERTLVStream on: anObject readStream.
	[ stream atEnd ] whileFalse: [ 
		(stream peek = 0) ifTrue: [
			stream nextByte.
			stream nextByte.
			^ self ].
		collection add: stream next]