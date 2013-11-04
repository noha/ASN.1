accessing
write: anObject usingModule: aModule
	stack push: anObject.
	^ self visit: aModule pdu
	
