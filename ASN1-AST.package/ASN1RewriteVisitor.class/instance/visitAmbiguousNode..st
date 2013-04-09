visiting
visitAmbiguousNode: anAmbiguousNode 
	^ anAmbiguousNode alternatives: (self visitAll: anAmbiguousNode alternatives)
