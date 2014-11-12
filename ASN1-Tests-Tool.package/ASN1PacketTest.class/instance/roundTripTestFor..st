as yet unclassified
roundTripTestFor: anObject
	| object data  |
	self model resolveOidsWhile: [
		object := self readResolvedFrom: anObject.
		data := ASN1
			encodeToByteArray: object
			usingModule: self tcapModel ].
	self assert: data = anObject