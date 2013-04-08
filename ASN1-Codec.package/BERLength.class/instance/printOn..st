printing
printOn: aStream
	self hasDefiniteForm 
		ifTrue: [ 
			aStream
				nextPutAll: 'length: ';
				nextPutAll: self contentLength printString ]
		ifFalse: [
			aStream
				nextPutAll: 'indefinite length'] 