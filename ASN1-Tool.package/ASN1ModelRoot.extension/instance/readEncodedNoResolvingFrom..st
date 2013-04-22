*asn1-tool
readEncodedNoResolvingFrom: anObject
	^ [ self readFrom: anObject readStream ]
		on: ASN1UnresolvedOid 
		do: [:err| 
			err resume: nil]