*asn1-tool
readEncodedNoResolvingFrom: anObject
	^ [ self readEncodedFrom: anObject readStream ]
		on: ASN1UnresolvedOid 
		do: [:err| 
			err resume: nil]