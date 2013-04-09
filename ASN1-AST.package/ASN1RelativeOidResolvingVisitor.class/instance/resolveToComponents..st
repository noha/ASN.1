as yet unclassified
resolveToComponents: aNode
	| leadingComponent components |
	components := aNode components.
	leadingComponent := components first.
	[ leadingComponent class = ASN1ObjectIdComponentNode ] whileFalse: [
		components := leadingComponent definition value components asOrderedCollection addAll: components allButFirst; yourself.
		leadingComponent := components first ].
	^ components