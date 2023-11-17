Extension { #name : #Object }

{ #category : #'*asn1-model' }
Object >> asAsn1Value [
	^ self asn1TypeClass new newValue: self 
]

{ #category : #'*asn1-model' }
Object >> definesOid: aString [
	^ false
]

{ #category : #'*asn1-model' }
Object >> isAsn1 [
	^ false
]

{ #category : #'*asn1-model' }
Object >> isAsn1Composite [
	^ false
]

{ #category : #'*asn1-model' }
Object >> isAsn1Object [ 
	^ false
]

{ #category : #'*asn1-model' }
Object >> isAsn1Primitive [ 
	^ false
]

{ #category : #'*asn1-model' }
Object >> isAsn1PrimitiveValue [
	^ false
]

{ #category : #'*asn1-model' }
Object >> isAsn1Type [
	^ false
]

{ #category : #'*asn1-model' }
Object >> isAsn1Value [
	^ false
]
