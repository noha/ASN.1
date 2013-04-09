accessing
universalTag
	^ ASN1Tag new
		clazz: 'UNIVERSAL';
		number: self tagNumber asInteger