printing
printOn: aStream
	self name 
		ifNotNil: [ self name printOn: aStream ]
		ifNil: [ aStream nextPutAll: 'default' ].
	self oid ifNotNil: [
		aStream
			nextPutAll: ' ( ';
			nextPutAll: self oid oidString;
			nextPutAll: ' )' ]