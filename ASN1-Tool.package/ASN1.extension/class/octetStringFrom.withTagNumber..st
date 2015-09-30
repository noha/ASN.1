*asn1-tool
octetStringFrom: anEncodedValue withTagNumber: aNumber
	^ (anEncodedValue valueWithTag: (
		ASN1Tag clazz: 'APPLICATION' number: aNumber))
			ifNotNil: [ :value | ASN1OctetStringType decode: value contents ]