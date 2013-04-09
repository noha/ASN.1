*asn1-tool
readResolvedWith: aBlock
	^ aBlock
		on: ASN1UnresolvedOid 
		do: [:err| 
			err resume: (self moduleDefiningOid: err oid)]