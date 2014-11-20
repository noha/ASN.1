writing
write: anObject using: anAsn1Type
	currentValue := anObject.
	^ self visit: anAsn1Type
