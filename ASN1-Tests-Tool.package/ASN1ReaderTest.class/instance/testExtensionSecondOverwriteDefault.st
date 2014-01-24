as yet unclassified
testExtensionSecondOverwriteDefault
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
