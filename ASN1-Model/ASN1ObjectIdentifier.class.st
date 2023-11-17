Class {
	#name : #ASN1ObjectIdentifier,
	#superclass : #ASN1PrimitiveValue,
	#category : 'ASN1-Model'
}

{ #category : #'initialize-release' }
ASN1ObjectIdentifier class >> string: aString [
	^ self new
		string: aString
]

{ #category : #comparing }
ASN1ObjectIdentifier >> = anOid [
	(anOid class = self class) ifFalse: [  ^ false ].
	^ anOid hasSameValue: contents
]

{ #category : #visiting }
ASN1ObjectIdentifier >> accept: aVisitor [ 
	^ aVisitor visitObjectIdentifier: self
]

{ #category : #converting }
ASN1ObjectIdentifier >> asAsn1Oid [
	^ self 
]

{ #category : #testing }
ASN1ObjectIdentifier >> definesOid: aString [
	^ contents = aString
]

{ #category : #testing }
ASN1ObjectIdentifier >> hasSameValue: anObject [
	^ contents = anObject
]

{ #category : #comparing }
ASN1ObjectIdentifier >> hash [
	^ contents hash
]

{ #category : #printing }
ASN1ObjectIdentifier >> printOn: aStream [
	aStream
		nextPutAll: 'oid '; 
		nextPutAll: contents asString
]

{ #category : #accessing }
ASN1ObjectIdentifier >> type [
	^ type ifNil: [ 
		type := ASN1ObjectIdentifierType new ]
]
