actions
merge: aUnionNode
	^ self class new
		elements: (elements asOrderedCollection addAll: aUnionNode elements; yourself)