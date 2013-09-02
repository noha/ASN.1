as yet unclassified
roundTripTestFor: anObject
	| object data  |
	self model resolveOidsWhile: [
		object := self readResolvedFrom: anObject.
		data := ASN1
			encodeToByteArray: object
			usingModule: self model modules first ].
	self assert: data = anObject