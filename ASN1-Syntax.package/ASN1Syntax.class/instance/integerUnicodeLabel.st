X.680 grammar
integerUnicodeLabel
	self flag: #incomplete.
	self flag: #nottested.
	^ #digit asParser optional ==> [:n| self notYetImplemented  ]