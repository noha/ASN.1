as yet unclassified
compile: aString selector: aSelector
	self class compile: (String streamContents: [:stream| 
		stream 
			nextPutAll: aSelector; 
			nextPut: Character cr;
			nextPut: Character tab;
			nextPutAll: '^ ';
			nextPutAll: aString  storeString ]) 