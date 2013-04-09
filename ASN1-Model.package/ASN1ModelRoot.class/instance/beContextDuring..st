as yet unclassified
beContextDuring: aBlock
	^ ASN1CurrentContext
		use: self 
		during: aBlock