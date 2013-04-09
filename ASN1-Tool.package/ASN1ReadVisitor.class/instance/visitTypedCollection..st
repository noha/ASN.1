visiting
visitTypedCollection: aCollection
	| seq  sequenceStream |
	seq := ASN1Array new
		type: aCollection.
	stack top elements do: [:content| 
		self 
			push: content
			during: [
				seq add: (self visitEncoded: aCollection type) ]].
	^ seq