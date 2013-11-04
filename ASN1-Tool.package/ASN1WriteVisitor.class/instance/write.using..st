accessing
write: anObject using: anAsn1Type
	stack push: anObject.
	^ self visit: anAsn1Type
