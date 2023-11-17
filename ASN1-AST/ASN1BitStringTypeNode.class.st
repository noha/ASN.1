Class {
	#name : #ASN1BitStringTypeNode,
	#superclass : #ASN1PrimitiveTypeNode,
	#instVars : [
		'bits'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1BitStringTypeNode >> accept: aVisitor [ 
	^ aVisitor visitBitStringNode: self
]

{ #category : #'as yet unclassified' }
ASN1BitStringTypeNode >> bindingOf: aString [
	"a bit string consists of a collection of named bits. Resolve the named bit and 
	return its value"
	^ (bits 
		detect: [ :bit | bit name = aString ]
		ifNone: [ nil ])
			ifNotNil: [ :namedBit | namedBit value ]
]

{ #category : #accessing }
ASN1BitStringTypeNode >> bits [
	^ bits ifNil: [ 
		bits := Set new ]
]

{ #category : #accessing }
ASN1BitStringTypeNode >> bits: anObject [
	bits := anObject
]

{ #category : #testing }
ASN1BitStringTypeNode >> matchesType: aTypeNodeClass [ 
	^ self class = aTypeNodeClass 
]

{ #category : #testing }
ASN1BitStringTypeNode >> matchesTypeOf: aTypeNodeClass [ 
	^ self class = aTypeNodeClass 
]

{ #category : #printing }
ASN1BitStringTypeNode >> printOn: aStream [
	aStream nextPutAll: 'BitString('.
	bits ifNotNil: [
		bits do: [:each| each printOn: aStream ]
		separatedBy: [ aStream nextPut: $, ]].
	aStream nextPut: $)
]
