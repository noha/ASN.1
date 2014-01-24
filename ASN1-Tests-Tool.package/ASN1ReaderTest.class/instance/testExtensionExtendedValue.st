as yet unclassified
testExtensionExtendedValue
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
