Class {
	#name : #ASN1ModelTest,
	#superclass : #TestCase,
	#category : 'ASN1-Tests-Model'
}

{ #category : #'as yet unclassified' }
ASN1ModelTest >> bitStringType [	
	^ ASN1BitStringType new 
]

{ #category : #'as yet unclassified' }
ASN1ModelTest >> bitStringTypeWithNamedBits [
	^ ASN1BitStringType new 
		namedBits: { 
			ASN1NamedValue name: 'one' value: 0 . 
			ASN1NamedValue name: 'two' value: 1 .
			ASN1NamedValue name: 'three' value: 2 .
			ASN1NamedValue name: 'four' value: 3 }
]

{ #category : #'as yet unclassified' }
ASN1ModelTest >> testBitStringAddNamedBitNoContents [
	|  bitStringValue |

	bitStringValue := self bitStringTypeWithNamedBits newValue.
	bitStringValue addNamedBit: 'two'.
	self assert: (bitStringValue namedBits includes: 'two').	
	self deny: (bitStringValue namedBits includes: 'three').	
	self assert: bitStringValue contents equals: '0100'.
	
]

{ #category : #'as yet unclassified' }
ASN1ModelTest >> testBitStringAddNamedBitWithContents [
	|  bitStringValue |
	bitStringValue := self bitStringTypeWithNamedBits newValue.
	bitStringValue contents: '100'.
	bitStringValue addNamedBit: 'two'.
	self assert: (bitStringValue namedBits includes: 'one').	
	self assert: (bitStringValue namedBits includes: 'two').	
	self deny: (bitStringValue namedBits includes: 'three').	
	self assert: bitStringValue contents equals: '1100'.
	
]

{ #category : #'as yet unclassified' }
ASN1ModelTest >> testBitStringValueCollection [
	|  bitStringValue |
	
	bitStringValue := self bitStringTypeWithNamedBits newValue.
	bitStringValue namedBits: #( one three ).
	self assert: (bitStringValue namedBits includes: 'one').	
	self assert: (bitStringValue namedBits includes: 'three').	
	self assert: bitStringValue contents equals: '1010'.
	
]

{ #category : #'as yet unclassified' }
ASN1ModelTest >> testBitStringValueCollectionBogusBits [
	|  bitStringValue |
	
	bitStringValue := self bitStringTypeWithNamedBits newValue.
	self
		should: [ bitStringValue contents: #( one five ) ]
		raise: Error.
	
]

{ #category : #'as yet unclassified' }
ASN1ModelTest >> testBitStringValueString [
	|  bitStringValue |
	
	bitStringValue := self bitStringTypeWithNamedBits newValue.
	bitStringValue contents: '0100'.
	self assert: (bitStringValue namedBits includes: 'two').	
	self assert: bitStringValue contents equals: '0100'.
	
]

{ #category : #'as yet unclassified' }
ASN1ModelTest >> testBitStringValueStringAdding [
	|  bitStringValue |
	
	bitStringValue := self bitStringTypeWithNamedBits newValue.
	bitStringValue contents: '0100'.
	bitStringValue contents: '0010'.
	self deny: (bitStringValue namedBits includes: 'two').	
	self assert: (bitStringValue namedBits includes: 'three').	
	self assert: bitStringValue contents equals: '0010'.
	
]

{ #category : #'as yet unclassified' }
ASN1ModelTest >> testEnumeratedValue [
	| type value encoded |

	type := ASN1EnumeratedType new 
		elements: { 
			ASN1NamedNumber  name: 'one' number: 1 .
			ASN1NamedNumber  name: 'two' number: 2 .
			ASN1NamedNumber  name: 'three' number: 3
			}.
	
	value := type newValue.
	value contents: 'two'.
	encoded := ASN1 write: value usingType: type.
	self assert: encoded contents = #[2].
	self assert: encoded tag number = 10
	
	
	
]

{ #category : #'as yet unclassified' }
ASN1ModelTest >> testEnumeratedWithExtension [
	"constrcut a enumerated type containing an extension and try to read it. The enumerated type should
	skip the extension "
	| result |
	result := ASN1 
		read: (ASN1EncodedPrimitiveValue new
			contents: #[ 3 ];
			tag: (ASN1Tag clazz: 'CONTEXT' number: 3 ))
		usingType: (ASN1EnumeratedType new 
			elements: {
				ASN1NamedNumber new name: 'foo';  number: 1.
				ASN1Extension new.
				ASN1NamedNumber new name: 'bar'; number: 3 }).
	self assert: result contents equals: 'bar'
]

{ #category : #'as yet unclassified' }
ASN1ModelTest >> testNumericString [
	self assert: (ASN1NumericStringType decode: #[48 48 48 48]) equals: '0000'.
	self assert: (ASN1NumericStringType encode: '0000') equals: #[48 48 48 48].
]
