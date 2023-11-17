Class {
	#name : #ASN1ReaderTest,
	#superclass : #ASN1ToolTest,
	#category : 'ASN1-Tests-Tool'
}

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> simpleChoice [
	^ ASN1ExampleGrammarTestResource new modelBindingValue: 'SimpleChoice'
]

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> testConstructedComplexChoiceExplicit [
	| result |
	result := self
		readStream:  #[164 10 48 8 165 6 163 4 4 2 49 49] readStream
		withBinding: 'SequenceWithConstruction'.
		
	self assert: result basicService ext_Teleservice asString = '11'.

]

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> testConstructedComplexChoiceImplicit [
	| result |
	result := self
		readStream:  #[164 6 165 4 131 2 49 49] readStream
		withBinding: 'SequenceWithConstruction'
		tagEnvironment: ASN1ImplicitTags.
		
	self assert: result basicService ext_Teleservice asString = '11'.

]

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> testExplicitModeChoiceWithCustomTags [
	| result |
	result := self
		readStream:  { 160. 3. 2. 1. 24 } readStream
		withBinding: 'SimpleChoice'.
	self assert: result number = 24.

]

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> testExplicitModeSequenceWithCustomTags [
	| result |
	result := self 
		readStream:  { 48. 10. 160. 3 . 2. 1. 24. 161. 3. 2. 1. 34 } readStream
		withBinding:  'ImplicitTaggedSequence'.
	self assert: result number = 24.
	self assert: result othernumber = 34
]

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> testExtensionExtendedValue [
	"at the location of the extension two tags have been injected:[3] and [4]. The code should skip those
	but don't abort the processing"
	| result |
	result := self
		readStream:  #[48 20 160 3 2 1 45 163 3 2 1 3 164 3 2 1 4 166 3 2 1 6] readStream
		withBinding: 'SequenceWithExtension'
		tagEnvironment: ASN1ExplicitTags.
		
	self assert: result first = 45.
	self assert: result second = 2.
	self assert: result fifth = 5.
	self assert: result sixth = 6.
	self assert: result keys size = 4

]

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> testExtensionFirstMandatory [
	"simple test to read the first mandatory field of a sequence with extension"
	| result |
	result := self
		readStream:  #[48 10 160 3 2 1 45 166 3 2 1 6] readStream
		withBinding: 'SequenceWithExtension'
		tagEnvironment: ASN1ExplicitTags.
		
	self assert: result first = 45.
	self assert: result second = 2.
	self assert: result fifth = 5.
	self assert: result sixth = 6.
	self assert: result keys size = 4

]

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> testExtensionMissingFirstMandatory [

	self 
		should: [   
			self
				readStream:  #[48 5 161 3 2 1 3] readStream
				withBinding: 'SequenceWithExtension'
				tagEnvironment: ASN1ExplicitTags ]
		raise: ASN1MandatoryElementNotFound 
]

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> testExtensionMissingSecondMandatory [

	self 
		should: [   
			self
				readStream:  #[48 5 160 3 2 1 3] readStream
				withBinding: 'SequenceWithExtension'
				tagEnvironment: ASN1ExplicitTags ]
		raise: ASN1MandatoryElementNotFound 
]

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> testExtensionSecondOverwriteDefault [
	"simple test to read the first mandatory field of a sequence with extension"
	| result |
	result := self
		readStream:  #[48 15 160 3 2 1 45 161 3 2 1 3 166 3 2 1 6] readStream
		withBinding: 'SequenceWithExtension'
		tagEnvironment: ASN1ExplicitTags.
		
	self assert: result first = 45.
	self assert: result second = 3.
	self assert: result fifth = 5.
	self assert: result sixth = 6.
	self assert: result keys size = 4

]

{ #category : #'as yet unclassified' }
ASN1ReaderTest >> testImplicitModeSequenceWithCustomTags [
	| result |
	result := self
		readStream:  { 160. 6. 128. 1. 24. 129. 1. 34 } readStream
		withBinding: 'ImplicitTaggedSequence'
		tagEnvironment: ASN1ImplicitTags.
	self assert: result number = 24.
	self assert: result othernumber = 34
]
