*asn1-tool
asAsn1ValueTyped: aString in: aModelRoot 
	^ (aString asAsn1TypeIn: aModelRoot)
		newValue: self asDictionary  