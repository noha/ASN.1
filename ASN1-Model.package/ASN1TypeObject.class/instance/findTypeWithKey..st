finding
findTypeWithKey: aString
	^ ASN1FindByKeyVisitor new 
		key: aString;
		visit: self;
		object