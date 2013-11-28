as yet unclassified
resolve: anObject withType: aType
	self 
		pushScope: aType
		during: [  self visit: anObject ] 