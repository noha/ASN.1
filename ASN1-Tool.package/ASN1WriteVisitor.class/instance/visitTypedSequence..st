as yet unclassified
visitTypedSequence: aTypedSequence 
	"All elements that are on the top of the stack are encoded with the type
	of the typed sequence"
	|  encoded |
	encoded := ASN1ConstructedTaggedValue new
		tag: aTypedSequence universalTag.
	stack top elements do: [:assoc|
		self 
			push: assoc value
			during: [ encoded elements add: (self visitDecoded: aTypedSequence type) ]].
	^ encoded