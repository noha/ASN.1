*asn1-builder
model
	^ self properties 
		at:#model 
		ifAbsentPut:[ self buildModel ]