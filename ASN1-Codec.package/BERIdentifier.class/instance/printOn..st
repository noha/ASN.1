printing
printOn: aStream
	tag printOn: aStream.
	aStream 
		nextPutAll: ' - ';
		nextPutAll: (self isConstructed 
			ifTrue: [ 'constructed' ] 
			ifFalse: [ ' primitive' ])		