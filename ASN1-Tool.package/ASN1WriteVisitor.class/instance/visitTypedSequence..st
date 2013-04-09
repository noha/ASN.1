as yet unclassified
visitTypedSequence: aTypedSequence 
	|  encoded |
	encoded := ASN1ConstructedEncoding new.
	stack top elements do: [:assoc|
		self 
			push: assoc value
			during: [ encoded elements add: (self visitDecoded: aTypedSequence type) ]].
	^ encoded