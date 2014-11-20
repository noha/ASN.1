writing
write: anObject usingModule: aModule
	currentValue := anObject.
	^ self visit: aModule pdu
	
