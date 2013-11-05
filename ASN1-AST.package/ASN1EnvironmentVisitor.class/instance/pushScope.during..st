visiting
pushScope: aScopeObject during: aBlock
	self pushScope: aScopeObject.
	aBlock value.
	self popScope 