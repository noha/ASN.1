X.680 grammar
valueRange
	^ super valueRange ==> [:nodes| 
		(ASN1RangeConstraintNode 
			lowerValue: nodes first first
			upperValue: nodes second second)
				lowerExcluded: (nodes first second = $<);
				upperExcluded: (nodes second first = $<);
				yourself ]