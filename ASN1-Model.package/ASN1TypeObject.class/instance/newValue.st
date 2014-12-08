instance-creation
newValue
	^ self basicType asn1ValueClass new
		type: self basicType