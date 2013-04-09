actions
enterScope: aScope
	scope ifNotNil: [
		aScope setParent: scope ].
	scope := aScope