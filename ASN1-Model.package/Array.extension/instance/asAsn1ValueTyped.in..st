*asn1-model
asAsn1ValueTyped: aString in: aModelRoot 
	^ (aString asAsn1TypeIn: aModelRoot)
		newValue: self asDictionary  