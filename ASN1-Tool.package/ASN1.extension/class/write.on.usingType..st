*asn1-tool
write: anObject on: aStream usingType: aType
	self 
		writeEncodedValues: ( self write: anObject usingType: aType )
		on: aStream 