*asn1-tool
readNoResolvingWith: aBlock
	^ aBlock
		on: ASN1UnresolvedOid 
		do: [:err| 
			err resume: nil]