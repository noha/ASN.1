visiting
visitTypedCollection: aCollection
	| seq  |
	seq := ASN1Array new
		type: aCollection.
	stack top elements do: [:content| 
		self 
			push: content
			during: [
				seq add: (self visit: aCollection type) ]].
	^ seq