accessing
nodes: aCollectionOrString
	(aCollectionOrString isString or: [aCollectionOrString isAsn1Node ]) ifTrue: [
		name := aCollectionOrString.
		^ self ].
	name := aCollectionOrString first.
	number := aCollectionOrString second
	
	