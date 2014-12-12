as yet unclassified
valueMapAt: aKey ifAbsent: aBlock
	self objectMap at: aKey ifPresent: [ :v | ^ v value ]. 
	^ aBlock value