tests
testReadNonExistingField
	| object |
	object := self object.
	self 
		should: [ object oof ]
		raise: ASN1InvalidFieldName 