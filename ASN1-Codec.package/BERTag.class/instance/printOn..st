printing
printOn: aStream
        ^ aStream 
			nextPutAll: self class printString;
			nextPut: Character space;
			nextPutAll: self asTuple printString