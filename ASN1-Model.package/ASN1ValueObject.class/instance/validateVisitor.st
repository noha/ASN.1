validating
validateVisitor
	^ ASN1ValidatingVisitor new
		validate: self 
	