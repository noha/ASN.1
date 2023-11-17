Extension { #name : #ASN1 }

{ #category : #'*asn1-builder' }
ASN1 >> addLibrary: aLibrary [
	self libraries add: aLibrary
]

{ #category : #'*asn1-builder' }
ASN1 >> buildModel [
	^ self buildAst buildModel: self modelRootClass 
	
]

{ #category : #'*asn1-builder' }
ASN1 >> defaultModelRootClass [
	^ ASN1CachedModelRoot
]

{ #category : #'*asn1-builder' }
ASN1 >> libraries [
	^ self properties
		at: #libraryCollection
		ifAbsentPut: [ ASN1LibraryCollection new ]
]

{ #category : #'*asn1-builder' }
ASN1 >> model [
	^ self properties 
		at:#model 
		ifAbsentPut:[ self buildModel ]
]

{ #category : #'*asn1-builder' }
ASN1 >> modelRootClass [
	^ self properties 
		at:#modelRootClass 
		ifAbsentPut:[ self defaultModelRootClass ]
]

{ #category : #'*asn1-builder' }
ASN1 >> modelRootClass: anObject [
	self properties
		at: #modelRootClass
		put: anObject
]
