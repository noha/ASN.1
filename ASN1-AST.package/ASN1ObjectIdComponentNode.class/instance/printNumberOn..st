printing
printNumberOn: aStream
	self flag: #needsRedesign.
	self number 
		ifNotNil: [ aStream nextPutAll: number asString ]
		ifNil: [ aStream nextPutAll: 'N/A' ]