visiting
visit: aNode
	| object |
	aNode isNil ifTrue: [ ^ nil ].
	objects at: aNode ifPresent: [:obj| ^ obj ].
	object := super visit: aNode.
	aNode isAssigned ifTrue: [
		objects at: aNode put: object ].
	 (object isAsn1Type and: [ aNode isAsn1ReferenceNode not ]) ifTrue: [
		object definingModule:module ].
	^ object
	