*asn1-tool
resolveOidsWhile: aBlock
	^ aBlock
		on: ASN1UnresolvedOid 
		do: [:err| 
			err resume: (self moduleDefiningOid: err oid)]