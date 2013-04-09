accessing
tagEnvironment
	^ self propertyAt: #tagEnvironment ifAbsentPut: [ 
		ASN1ExplicitTags ]