visiting
visitObjectIdentifierNode: anObjectId
	self 
		provideType: anObjectId type 
		during: [   
			anObjectId components: (self visitAll: anObjectId components).
			^ anObjectId ]