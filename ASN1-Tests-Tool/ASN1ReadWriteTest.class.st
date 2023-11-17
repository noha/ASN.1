Class {
	#name : #ASN1ReadWriteTest,
	#superclass : #ASN1ToolTest,
	#category : 'ASN1-Tests-Tool'
}

{ #category : #'as yet unclassified' }
ASN1ReadWriteTest >> testExplicitModeChoiceWithCustomTagsExplicit [
	|  result  array |
	result := self 
		readStream:  { 160. 3. 2. 1. 24 } readStream
		withBinding:  'SimpleChoice'.
	self assert: result number = 24.
	array := self 
		encodeToByteArray: result
		withBinding:  'SimpleChoice'
		tagEnvironment: ASN1ExplicitTags. 
	self assert: (array = #[ 160 3 2 1 24 ] ).
]

{ #category : #'as yet unclassified' }
ASN1ReadWriteTest >> testImplicitModeChoiceWithCustomTags [
	| result array |
	result := self 
		readStream:  { 128 . 1. 24 } readStream
		withBinding:  'SimpleChoice'
		tagEnvironment: ASN1ImplicitTags.
	self assert: result number = 24.
	array := self 
		encodeToByteArray: result
		withBinding:  'SimpleChoice'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[ 128  1 24 ] ).
]
