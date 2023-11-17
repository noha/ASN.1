Extension { #name : #ASN1 }

{ #category : #'*asn1-tool' }
ASN1 class >> defaultModule [
	self subclassResponsibility 
]

{ #category : #'*asn1-tool' }
ASN1 class >> encodeToByteArray: anObject usingModule: aModule [
	^ aModule encodeToByteArray: anObject 
		
]

{ #category : #'*asn1-tool' }
ASN1 class >> encodeToByteArray: aValue usingType: aType [
	^ ByteArray streamContents: [:stream|
		self 
			write: aValue 
			on: stream
			usingType: aType]
]

{ #category : #'*asn1-tool' }
ASN1 class >> octetStringFrom: anEncodedValue withTagNumber: aNumber [
	^ (anEncodedValue valueWithTag: (
		ASN1Tag clazz: 'APPLICATION' number: aNumber))
			ifNotNil: [ :value | ASN1OctetStringType decode: value contents ]
]

{ #category : #'*asn1-tool' }
ASN1 class >> read: anEncodedValue usingModule: aModule [
	^ aModule read: anEncodedValue 
]

{ #category : #'*asn1-tool' }
ASN1 class >> read: anEncodedValue usingModule: aModule inContext: aContext [ 
	^ aModule read: anEncodedValue inContext: aContext
]

{ #category : #'*asn1-tool' }
ASN1 class >> read: anEncodedValue usingType: aType [
	^ self 
		read: anEncodedValue 
		usingType: aType
		inContext: nil
]

{ #category : #'*asn1-tool' }
ASN1 class >> read: anEncodedValue usingType: aType as: aClass [
	^ self 
		read: anEncodedValue 
		usingType: aType
		inContext: nil
		as: aClass
]

{ #category : #'*asn1-tool' }
ASN1 class >> read: anEncodedValue usingType: aType inContext: aContext [
	^ self 
		read: anEncodedValue 
		usingType: aType 
		inContext: aContext 
		as: nil
]

{ #category : #'*asn1-tool' }
ASN1 class >> read: anEncodedValue usingType: aType inContext: aContext as: aClass [
	^self 
		read: anEncodedValue 
		usingType: aType 
		inContext: aContext 
		skipErrors: false 
		as: aClass
]

{ #category : #'*asn1-tool' }
ASN1 class >> read: anEncodedValue usingType: aType inContext: aContext skipErrors: aBoolean [
	^ self 
		read: anEncodedValue 
		usingType: aType 
		inContext: aContext 
		skipErrors: aBoolean 
		as: nil
]

{ #category : #'*asn1-tool' }
ASN1 class >> read: anEncodedValue usingType: aType inContext: aContext skipErrors: aBoolean as: aClass [
	^ self 
		read: anEncodedValue 
		usingType: aType 
		inContext: aContext 
		skipErrors: aBoolean 
		as: aClass 
		reader: self readVisitorClass new
			
]

{ #category : #'*asn1-tool' }
ASN1 class >> read: anEncodedValue usingType: aType inContext: aContext skipErrors: aBoolean as: aClass reader: aVisitor [
	^ [ aVisitor
			skipErrors: (aBoolean ifNil: [ false ]);
			read: anEncodedValue using: aType as: aClass]
				on: ASN1UnresolvedOid 
				do: [ :err | 
					err resume: (aContext 
						ifNotNil: [ aContext moduleDefiningOid: err oid ] ) ] 
]

{ #category : #'*asn1-tool' }
ASN1 class >> readFrom: aStream [
	^ self
		readFrom: aStream readStream
		usingModule: self defaultModule
]

{ #category : #'*asn1-tool' }
ASN1 class >> readFrom: aStream inContext: aContext [
	^ self
		readFrom: aStream readStream
		usingModule: self defaultModule
		inContext: aContext
]

{ #category : #'*asn1-tool' }
ASN1 class >> readFrom: aStream usingModule: aModule [
	^ aModule readFrom: aStream
]

{ #category : #'*asn1-tool' }
ASN1 class >> readFrom: aStream usingModule: aModule inContext: aContext [
	^ aModule readFrom: aStream inContext: aContext
]

{ #category : #'*asn1-tool' }
ASN1 class >> readFrom: aStream usingType: aType [ 
	^ self  
		readFrom: aStream
		usingType: aType
		inContext: nil

]

{ #category : #'*asn1-tool' }
ASN1 class >> readFrom: aStream usingType: aType inContext: aContext [
	^ self 
		read: (self readEncodedValuesFrom: aStream)
		usingType: aType
		inContext: aContext
]

{ #category : #'*asn1-tool' }
ASN1 class >> readVisitorClass [
	^ ASN1ReadVisitor 
]

{ #category : #'*asn1-tool' }
ASN1 class >> write: anObject on: aStream usingType: aType [
	self 
		writeEncodedValues: ( self write: anObject usingType: aType )
		on: aStream 
]

{ #category : #'*asn1-tool' }
ASN1 class >> write: anObject usingModule: aModule [ 
	^ aModule write: anObject
]

{ #category : #'*asn1-tool' }
ASN1 class >> write: anObject usingType: aType [
	^ self writeVisitorClass new
		write: anObject using: aType.
]

{ #category : #'*asn1-tool' }
ASN1 class >> writeEncodedValues: aTaggedValue on: aStream [ 
	(self codecStreamClass on: aStream) nextPut: aTaggedValue
]

{ #category : #'*asn1-tool' }
ASN1 class >> writeVisitorClass [
	^ ASN1WriteVisitor
]
