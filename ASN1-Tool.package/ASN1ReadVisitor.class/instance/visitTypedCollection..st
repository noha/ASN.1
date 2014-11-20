visiting
visitTypedCollection: aCollection
	| seq  |
	seq := self collectionClass new
		type: aCollection.
	currentTaggedValue elements do: [:content| 
		self 
			push: content
			during: [
				seq add: (self visit: aCollection type) ]].
	^ seq