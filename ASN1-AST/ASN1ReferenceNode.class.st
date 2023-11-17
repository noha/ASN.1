Class {
	#name : #ASN1ReferenceNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'label'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #comparing }
ASN1ReferenceNode >> = aReference [
	(aReference class = self class) ifFalse: [ ^ false ]. 
	^ label = aReference label
]

{ #category : #visiting }
ASN1ReferenceNode >> accept: aVisitor [ 
	^ aVisitor visitReferenceNode: self  
]

{ #category : #converting }
ASN1ReferenceNode >> asString [
	^ self label
]

{ #category : #converting }
ASN1ReferenceNode >> asn1Reference [ 
	^ self
]

{ #category : #binding }
ASN1ReferenceNode >> bindingOf: aString [
	self hasParameters ifTrue: [ 
		self parameters do: [:each| 
			(each bindingOf: aString)
				ifNotNil: [:val| ^ val ]]].
	self definition 
		ifNotNil: [ (self definition bindingOf: aString) ifNotNil: [:val |
				^ val ]]
		ifNil: [ 
			self hasType ifTrue: [ 
				(self type definition bindingOf: aString) ifNotNil: [ :val |
					^ val  ] ] ].
	^ nil 
]

{ #category : #accessing }
ASN1ReferenceNode >> declaration [
	^ self propertyAt: #declaration ifAbsent: [ false ]
]

{ #category : #accessing }
ASN1ReferenceNode >> declaration: anObject [
	self propertyAt: #declaration put: anObject 
]

{ #category : #accessing }
ASN1ReferenceNode >> definition [
	^ self propertyAt: #definition ifAbsent: [ nil ]
]

{ #category : #accessing }
ASN1ReferenceNode >> definition: anObject [
	self propertyAt: #definition put: anObject 
]

{ #category : #'as yet unclassified' }
ASN1ReferenceNode >> dereferenced [ 
	^ self definition dereferenced
]

{ #category : #testing }
ASN1ReferenceNode >> hasDefinition [
	^ self definition notNil
]

{ #category : #testing }
ASN1ReferenceNode >> hasParameters [
	^ self parameters notNil
]

{ #category : #testing }
ASN1ReferenceNode >> hasType [
	^ self type notNil
]

{ #category : #comparing }
ASN1ReferenceNode >> hash [
	^ label hash
]

{ #category : #testing }
ASN1ReferenceNode >> isAsn1ReferenceNode [ 
	^ true
]

{ #category : #testing }
ASN1ReferenceNode >> isDeclaration [ 
	^ self declaration
]

{ #category : #testing }
ASN1ReferenceNode >> isTypeNode [
	^ self definition isTypeNode
]

{ #category : #testing }
ASN1ReferenceNode >> isUnresolved [
	^ self isDeclaration not and: [ (self propertyAt: #definition ifAbsent: [ nil ]) isNil ]
]

{ #category : #testing }
ASN1ReferenceNode >> isValueNode [
	^ self definition isValueNode
]

{ #category : #accessing }
ASN1ReferenceNode >> label [
	^ label
]

{ #category : #accessing }
ASN1ReferenceNode >> label: anObject [
	label := anObject
]

{ #category : #testing }
ASN1ReferenceNode >> matchesSyntax: anObject [
	anObject isAsn1Node ifFalse: [ ^ false ].
	^ anObject isAsn1ReferenceNode 
]

{ #category : #testing }
ASN1ReferenceNode >> matchesTypeOf: anASN1Object [ 
	^ self definition matchesTypeOf: anASN1Object 
]

{ #category : #accessing }
ASN1ReferenceNode >> name [
	self label
]

{ #category : #accessing }
ASN1ReferenceNode >> parameters [
	^ self propertyAt: #parameters ifAbsent: [ nil ]
]

{ #category : #accessing }
ASN1ReferenceNode >> parameters: aCollection [
	"((aCollection notNil and: [aCollection notEmpty]) and: [ aCollection first isCollection ]) ifTrue: [ self halt ]."
	^ self propertyAt: #parameters put: aCollection
]

{ #category : #parsing }
ASN1ReferenceNode >> parse: aStream into: aDictionary [
	aStream next ifNotNil: [:val|
		aDictionary at: label put: val]
]

{ #category : #printing }
ASN1ReferenceNode >> printOn: aStream [
	aStream
		nextPutAll: label printString.
	aStream nextPut: $<.
	self type ifNotNil: [
		self type printOn: aStream ].
	aStream nextPut: $> .
	self parameters notNil ifTrue: [
		self parameters printElementsOn: aStream ].
	super printOn: aStream
]

{ #category : #testing }
ASN1ReferenceNode >> providesScope [
	^ self hasType | self hasParameters 
]

{ #category : #accessing }
ASN1ReferenceNode >> type [
	^ self propertyAt: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
ASN1ReferenceNode >> type: anObject [
	anObject isAsn1Node ifFalse: [ Error signal: 'type of reference node needs to be an ASN.1 object' ].
	self propertyAt: #type put: anObject
]
