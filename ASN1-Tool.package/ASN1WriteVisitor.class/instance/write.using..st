as yet unclassified
write: anObject using: anAsn1Type
	stack push: anObject.
	^ self visitDecoded: anAsn1Type
