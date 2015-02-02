as yet unclassified
resolveToComponents: aNode
	| leadingComponent components |
	components := aNode components.
	leadingComponent := components first.
	[ leadingComponent class = ASN1ObjectIdComponentNode ] whileFalse: [
		components := (OrderedCollection withAll: leadingComponent definition value components)  addAll: components allButFirst; yourself.
		leadingComponent := components first ].
	^ components