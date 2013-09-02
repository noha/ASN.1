*asn1-tool
read: aTaggedValue
	^ self modules first 
		read: aTaggedValue
		inContext: self