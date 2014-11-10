*asn1-tool
asAsn1AdaptiveTypeObjectIn: aContext
	^ ASN1AdaptiveTypeObject type: (aContext bindingNamed: self) value parent: nil