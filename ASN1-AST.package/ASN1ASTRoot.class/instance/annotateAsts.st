actions
annotateAsts
	self
		resolveImportSymbols;
		resolveAmbiguities;
		resolveAllSymbols;
		resolveRelativeOids;
		detectPDUs