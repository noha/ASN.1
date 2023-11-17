Class {
	#name : #ASN1NullType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1NullType class >> decode: anArray [ 
	^ #null
]

{ #category : #codec }
ASN1NullType class >> encode: aSymbol [ 
	^ nil
]

{ #category : #accessing }
ASN1NullType class >> universalType [
	^ 'NULL'
]

{ #category : #visiting }
ASN1NullType >> accept: aVisitor [ 
	^ aVisitor visitNullType: self
]

{ #category : #validating }
ASN1NullType >> acceptsValue: anObject [ 
	^ (anObject value asn1TypeClass = self class) and: [ anObject value isNil ]
]
