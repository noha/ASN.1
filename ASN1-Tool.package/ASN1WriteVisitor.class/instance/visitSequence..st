as yet unclassified
visitSequence: aSequence 
	|  encoded |
	encoded := ASN1ConstructedTaggedValue new
		tag: aSequence universalTag.
	stack top keysAndValuesDo: [:key :value|
		self 
			push: value
			during: [ encoded elements add: (self visitDecoded: (aSequence elementAt: key) value) ]].
	^ encoded