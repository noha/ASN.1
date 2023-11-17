Class {
	#name : #ASN1WriterTest,
	#superclass : #ASN1ToolTest,
	#category : 'ASN1-Tests-Tool'
}

{ #category : #'as yet unclassified' }
ASN1WriterTest >> testComplexChoiceExplicit [
	| data array  |
	data := (self bindingAt: 'ComplexChoice') newValue beSelfExpanding.
	data one
		first: 13;
		second: 'DEADBEEF' asByteArray .
	array := self 
		encodeToByteArray: data
		withBinding:  'ComplexChoice'
		tagEnvironment: ASN1ExplicitTags. 
	self assert: (array = #[97 15 48 13 2 1 13 4 8 68 69 65 68 66 69 69 70]).
]

{ #category : #'as yet unclassified' }
ASN1WriterTest >> testComplexChoiceImplicit [
	| data array |
	data := (self bindingAt: 'ComplexChoice') newValue beSelfExpanding.
	data one
		first: 13;
		second: 'DEADBEEF' asByteArray .
	array := self 
		encodeToByteArray: data
		withBinding:  'ComplexChoice'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[97 13 2 1 13 4 8 68 69 65 68 66 69 69 70]).
]

{ #category : #'as yet unclassified' }
ASN1WriterTest >> testConstructedComplexChoice [
	| data array |
	data := (self bindingAt: 'SequenceWithConstruction') newValue.
	data beSelfExpanding basicService
		at: 'ext-Teleservice' put: '11' asByteArray.

	array := self 
		encodeToByteArray: data
		withBinding:  'SequenceWithConstruction'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[164 6 165 4 131 2 49 49]).
]

{ #category : #'as yet unclassified' }
ASN1WriterTest >> testEmptySequence [
	|  array  |
	array := self 
		encodeToByteArray: (self valueFor: 'EmptySequence')
		withBinding:  'EmptySequence'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[48 0]).
]

{ #category : #'as yet unclassified' }
ASN1WriterTest >> testExplicitModeChoiceWithCustomTags [
	| array data |
	data := (self bindingAt: 'SimpleChoice') newValue.
	array := self 
		encodeToByteArray: (data
				at: 'number' put: 24;
				yourself)
		withBinding:  'SimpleChoice'
		tagEnvironment: ASN1ExplicitTags.
	self assert: (array = #[ 160 3 2 1 24 ]).
]

{ #category : #'as yet unclassified' }
ASN1WriterTest >> testSimpleSequence [
	| data array   |
	data := (self bindingAt: 'SimpleSequence') newValue.
	data
		at: 'first' put: 13;
		at: 'second' put:  'DEADBEEF' asByteArray.
	array := self 
		encodeToByteArray: data
		withBinding:  'SimpleSequence'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[48 13 2 1 13 4 8 68 69 65 68 66 69 69 70]).
]

{ #category : #'as yet unclassified' }
ASN1WriterTest >> testTypedSetGenericNumbers [
	|  array  value |
	value := self valueFor: 'ConnectArgV1'.
	value beSelfExpanding.
	value genericNumbers
		addUsing: [:octetString | octetString contents: #[84 04 13]].
	array := self 
		encodeToByteArray: value
		withBinding:  'ConnectArgV1'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: array equals: #[48 7 174 5 4 3 84 4 13].
]
