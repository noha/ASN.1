as yet unclassified
roundTripTestFor: anObject
	| object data  |
	self model beContextDuring: [
		object := self readEncodedResolvedFrom: anObject.
		data := ASN1
			encodeToByteArray: object
			usingModule: self model modules first ].
	self assert: data = anObject