initialization
initializeFrom: anObject
	| stream |
	stream := BERTLVStream on: anObject readStream.
	[ stream atEnd ] whileFalse: [ 
		(stream peek = 0) ifTrue: [
			stream nextByte.
			stream nextByte.
			^ self ].
		collection add: stream next]