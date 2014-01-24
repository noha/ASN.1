as yet unclassified
testExtensionMissingSecondMandatory

	self 
		should: [   
			self
				readStream:  #[48 5 160 3 2 1 3] readStream
				withBinding: 'SequenceWithExtension'
				tagEnvironment: ASN1ExplicitTags ]
		raise: ASN1MandatoryElementNotFound 