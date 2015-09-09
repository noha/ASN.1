visiting
visitTypedSequence: aTypedSequence 
	"All elements that are on the top of the stack are encoded with the type
	of the typed sequence"
	|  encoded |
	encoded := ASN1EncodedConstructedValue new
		tag: aTypedSequence universalTag.
	currentValue elements do: [:assoc|
		self 
			push: assoc
			during: [ encoded elements add: (self visit: aTypedSequence type) ]].
	^ encoded