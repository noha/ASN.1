Class {
	#name : #ASN1AmbiguitySolvingVisitor,
	#superclass : #ASN1RewriteVisitor,
	#instVars : [
		'root',
		'module'
	],
	#category : 'ASN1-AST-Visitor'
}

{ #category : #accessing }
ASN1AmbiguitySolvingVisitor >> module [
	^ module
]

{ #category : #accessing }
ASN1AmbiguitySolvingVisitor >> module: anObject [
	module := anObject
]

{ #category : #accessing }
ASN1AmbiguitySolvingVisitor >> root [
	^ root
]

{ #category : #accessing }
ASN1AmbiguitySolvingVisitor >> root: anObject [
	root := anObject
]

{ #category : #visiting }
ASN1AmbiguitySolvingVisitor >> visit: anObject [
	anObject isNil ifTrue: [ ^ nil ].
	^ anObject isAsn1Node 
		ifTrue: [ anObject accept: self ]
		ifFalse: [ anObject ]
]

{ #category : #visiting }
ASN1AmbiguitySolvingVisitor >> visitAmbiguousNode: anAmbiguousType [
	"^ (anAmbiguousType alternatives detect: [:each| | type |
		type := each properties at: #definition ifAbsent: [ nil ].
		each matchesType: type ])"
	| type |
	type := ASN1ClosestTypeDefinition value.
	^ anAmbiguousType alternatives 
		detect: [:each| each canBeAssignedTo: type ]
]

{ #category : #visiting }
ASN1AmbiguitySolvingVisitor >> visitAssignmentNode: aNode [
	^ self 
		provideType: aNode left type
		during: [  super visitAssignmentNode: aNode ]
]

{ #category : #visiting }
ASN1AmbiguitySolvingVisitor >> visitComponentTypeNode: aNode [
	^ self 
		provideType: aNode
		during: [  super visitComponentTypeNode: aNode ]
]

{ #category : #visiting }
ASN1AmbiguitySolvingVisitor >> visitImportNode: aNode [ 
		^ self 
		provideType: ASN1ObjectIdentifierTypeNode  new
		during: [ super visitImportNode: aNode  ]
]

{ #category : #visiting }
ASN1AmbiguitySolvingVisitor >> visitModuleDefinitionNode: aModuleDefinition [
	module := aModuleDefinition.
	^ self 
		provideType: aModuleDefinition  
		during: [ super visitModuleDefinitionNode: aModuleDefinition  ]
]

{ #category : #visiting }
ASN1AmbiguitySolvingVisitor >> visitReferenceNode: aReferenceNode [
	aReferenceNode type ifNotNil: [
		self visit: aReferenceNode type].
	(aReferenceNode definition notNil and: [ aReferenceNode definition class = ASN1AmbiguousNode ]) ifTrue: [ 
		aReferenceNode definition: (self visit: aReferenceNode definition)  ].
	^ aReferenceNode
]
