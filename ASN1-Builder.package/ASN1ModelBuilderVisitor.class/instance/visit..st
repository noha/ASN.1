visiting
visit: aNode
	| object |
	aNode isNil ifTrue: [ ^ nil ].
	"do not convert objects multiple times. If it is the same input object we return the cached 
	version that has been generated earlier"
	objects at: aNode ifPresent: [:obj| ^ obj ].
	object := super visit: aNode.
	"while visiting aNode it could be already defined by a recursive redefinition. In that case
	throw away the return type and use the cached object in order to only have identical objects"
	objects at: aNode ifPresent: [ :o|  ^ o  ].
	aNode isAssigned ifTrue: [
		objects at: aNode put:  object ].
	^ object
