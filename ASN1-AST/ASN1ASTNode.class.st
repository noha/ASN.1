Class {
	#name : #ASN1ASTNode,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : #'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1ASTNode >> addModifier: aModifier [
	aModifier ifNotNil: [ 
		self modifiers add: aModifier ].
]

{ #category : #accessing }
ASN1ASTNode >> beAssigned [
	self propertyAt: #assigned put: true
]

{ #category : #binding }
ASN1ASTNode >> bindingOf: aString [ 
	^ nil 
]

{ #category : #accessing }
ASN1ASTNode >> defaultValue [
	^ (self modifiers 
		detect: [:each| each isDefaultValue ]
		ifNone: [ ^ nil ]) value
]

{ #category : #accessing }
ASN1ASTNode >> definition [
	^ self 
]

{ #category : #'as yet unclassified' }
ASN1ASTNode >> dereferenced [
	^ self
]

{ #category : #testing }
ASN1ASTNode >> hasDefaultValue [
	^ self modifiers anySatisfy: [:each| each isDefaultValue ]
]

{ #category : #testing }
ASN1ASTNode >> hasProperty: aString [
	^ (self properties at: aString ifAbsent: [ nil ]) notNil
]

{ #category : #testing }
ASN1ASTNode >> isAsn1Node [
	^ true
]

{ #category : #testing }
ASN1ASTNode >> isAsn1ReferenceNode [
	^ false
]

{ #category : #testing }
ASN1ASTNode >> isAssigned [
	^ self propertyAt: #assigned ifAbsent: [ false ]
]

{ #category : #testing }
ASN1ASTNode >> isLiteralNode [
	^ false
]

{ #category : #testing }
ASN1ASTNode >> isOptional [
	^ self modifiers anySatisfy: [:each| each isOptional ]
]

{ #category : #testing }
ASN1ASTNode >> isPrimitiveNode [
	^ false
]

{ #category : #testing }
ASN1ASTNode >> isTypeNode [
	^ false
]

{ #category : #testing }
ASN1ASTNode >> isValueNode [
	^ false
]

{ #category : #'as yet unclassified' }
ASN1ASTNode >> modifiers [
	^ self propertyAt: #modifiers ifAbsentPut: [ Set new ]
]

{ #category : #printing }
ASN1ASTNode >> printOn: aStream [
]

{ #category : #accessing }
ASN1ASTNode >> properties [
	^ properties ifNil: [
		properties := Dictionary new ]
]

{ #category : #accessing }
ASN1ASTNode >> propertyAt: aString [
	^ self properties at: aString ifAbsent: [ nil ]
]

{ #category : #accessing }
ASN1ASTNode >> propertyAt: aString ifAbsent: aBlock [
	^ self properties at: aString ifAbsent: aBlock
]

{ #category : #accessing }
ASN1ASTNode >> propertyAt: aString ifAbsentPut: aBlock [
	^ self properties at: aString ifAbsentPut: aBlock
]

{ #category : #accessing }
ASN1ASTNode >> propertyAt: aString ifPresent: aBlock [
	^ self properties at: aString ifPresent: aBlock
]

{ #category : #accessing }
ASN1ASTNode >> propertyAt: aString put: anObject [
	self properties at: aString put: anObject
]

{ #category : #testing }
ASN1ASTNode >> providesScope [
	^ false
]
