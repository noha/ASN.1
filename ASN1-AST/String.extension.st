Extension { #name : #String }

{ #category : #'*asn1-ast' }
String >> addAsModuleTo: aASTRoot [ 
	aASTRoot addModuleFrom: self
]

{ #category : #'*asn1-ast' }
String >> asn1Reference [
	^ ASN1ReferenceNode new
		label: self
]

{ #category : #'*asn1-ast' }
String >> matchesSyntax: anObject [
	^ anObject = self
]
