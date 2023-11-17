Extension { #name : #ASN1 }

{ #category : #'*asn1-codec' }
ASN1 class >> codecStreamClass [
	^ BERTLVStream 
]

{ #category : #'*asn1-codec' }
ASN1 class >> readEncodedValuesFrom: aStream [
	| encodedValue |
	encodedValue := self 
		readEncodedValuesFrom: aStream 
		usingCodecStream: self codecStreamClass.
	encodedValue hasError ifTrue: [ 
		ASN1EncodedValueError new encodedValue: encodedValue; signal  ].
	^ encodedValue
]

{ #category : #'*asn1-codec' }
ASN1 class >> readEncodedValuesFrom: aStream usingCodecStream: aClass [
	^ (aClass on: aStream) next
]
