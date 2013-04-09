visiting
visitAmbiguousNode: anAmbiguousNode 
	self visitAll: anAmbiguousNode alternatives.
	^ anAmbiguousNode