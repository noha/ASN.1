X.680 grammar
nonIntegerUnicodeLabel
	self flag: #incomplete.
	^ 'imnotparable' asParser optional ==> [:n| self notYetImplemented  ]