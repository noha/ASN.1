printing
printOn: aStream
	self type numberOfBits isZero
		ifTrue: [ aStream nextPutAll: '(no named bits)' ]
		ifFalse: [  
			self namedBits 
				do: [ :each | aStream nextPutAll: each ]
				separatedBy: [ aStream nextPut: $, ] ].
	aStream nextPutAll: ' ['.
	type printOn: aStream.
	aStream nextPutAll: ']'