visiting
visitTagNode: aTag
	^ ASN1Tag new
		clazz: aTag tagClass;
		number: aTag tagNumber asInteger
	