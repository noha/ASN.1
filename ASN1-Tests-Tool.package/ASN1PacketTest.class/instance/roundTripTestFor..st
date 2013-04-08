as yet unclassified
roundTripTestFor: anObject
	| object data  |
	self asn1 model beContextDuring: [
		object := self readEncodedFrom: anObject.
		data := ASN1
			encodeToByteArray: object
			usingModule: self asn1 model modules first ].
	self assert: data = anObject