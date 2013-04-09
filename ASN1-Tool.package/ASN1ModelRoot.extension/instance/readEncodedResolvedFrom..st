*asn1-tool
readEncodedResolvedFrom: anObject
	^ [ self readEncodedFrom: anObject readStream ]
		on: ASN1UnresolvedOid 
		do: [:err| 
			err resume: (self moduleDefiningOid: err oid)]