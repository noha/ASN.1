as yet unclassified
testExtensionMissingFirstMandatory

	self 
		should: [   
			self
				readStream:  #[48 5 161 3 2 1 3] readStream
				withBinding: 'SequenceWithExtension'
				tagEnvironment: ASN1ExplicitTags ]
		raise: ASN1MandatoryElementNotFound 