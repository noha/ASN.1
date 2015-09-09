*asn1-tool
octetStringFrom: aTaggedValue withTagNumber: aNumber
	^ (aTaggedValue valueWithTag: (
		ASN1Tag clazz: 'APPLICATION' number: aNumber))
			ifNotNil: [ :value | ASN1OctetStringType decode: value contents ]