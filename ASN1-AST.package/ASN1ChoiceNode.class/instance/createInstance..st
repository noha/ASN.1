as yet unclassified
createInstance: aNode
	| type |
	type := (self elementAt: aNode choice) type.
	^ type createInstance: aNode value