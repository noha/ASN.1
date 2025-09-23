Class {
	#name : 'ASN1ElementNotFound',
	#superclass : 'ASN1StructureError',
	#category : 'ASN1-Tool-Exception',
	#package : 'ASN1-Tool',
	#tag : 'Exception'
}

{ #category : 'testing' }
ASN1ElementNotFound >> isResumable [ 
	^ true
]
