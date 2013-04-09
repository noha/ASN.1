visiting
visitAssociation: anAssociation 
	self visitObject: anAssociation.
	self visit: anAssociation value.
	^ anAssociation