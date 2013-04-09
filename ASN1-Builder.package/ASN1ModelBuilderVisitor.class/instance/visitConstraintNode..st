visiting
visitConstraintNode: aNode
	^ ASN1Constraint new
		constraint: (self visit: aNode constraint );
		exception: (self visit: aNode exception)