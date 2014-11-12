as yet unclassified
roundTripTestFor: anObject
	| object data  |
	self asn1Model resolveOidsWhile: [
		object := self readResolvedFrom: anObject.
		data := ASN1
			encodeToByteArray: object
			usingModule: self tcapModule ].
	self assert: data = anObject