visiting
read: anEncodedType usingModule: aModule
	^ self 
		push: anEncodedType
		during: [ self visit: aModule pdu ]