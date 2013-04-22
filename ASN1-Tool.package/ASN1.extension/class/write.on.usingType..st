*asn1-tool
write: anObject on: aStream usingType: aType
	self 
		writeTaggedValues: ( self write: anObject usingType: aType )
		on: aStream 