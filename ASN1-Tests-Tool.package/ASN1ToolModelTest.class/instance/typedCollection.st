accessing
typedCollection 
	^ ASN1AdaptiveTypeCollection type: (self bindingAt: 'TypedComplexSequence')
		