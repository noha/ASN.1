Class {
	#name : #ASN1RelativeOidResolvingVisitor,
	#superclass : #ASN1RewriteVisitor,
	#instVars : [
		'module'
	],
	#category : 'ASN1-AST-Visitor'
}

{ #category : #'as yet unclassified' }
ASN1RelativeOidResolvingVisitor >> resolveReferencesOf: aCollection [
	"dereferencing values needs improvement"
	self flag: #hack.
	^ aCollection collect: [:each|
		(each isAsn1ReferenceNode )  
			ifTrue: [ 
				ASN1ObjectIdComponentNode new
					number: each definition value value asInteger;
					name: each label]
			ifFalse: [ each ]]
]

{ #category : #'as yet unclassified' }
ASN1RelativeOidResolvingVisitor >> resolveToComponents: aNode [
	| leadingComponent components |
	components := aNode components.
	leadingComponent := components first.
	[ leadingComponent class = ASN1ObjectIdComponentNode ] whileFalse: [
		components := (OrderedCollection withAll: leadingComponent definition value components)  addAll: components allButFirst; yourself.
		leadingComponent := components first ].
	^ components
]

{ #category : #visiting }
ASN1RelativeOidResolvingVisitor >> visitModuleDefinitionNode: aModuleDefinition [
	module := aModuleDefinition.
	[ ^ super visitModuleDefinitionNode: aModuleDefinition ]
		ensure: [ module := nil ]
]

{ #category : #visiting }
ASN1RelativeOidResolvingVisitor >> visitObjectIdentifierNode: aNode [
	| components |
	components := self resolveToComponents: aNode.
	components := self resolveReferencesOf: components.
	^ aNode components: components
		
]
