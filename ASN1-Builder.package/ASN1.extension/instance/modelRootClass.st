*asn1-builder
modelRootClass
	self properties 
		at:#modelRootClass 
		ifAbsentPut:[ self defaultModelRootClass ]