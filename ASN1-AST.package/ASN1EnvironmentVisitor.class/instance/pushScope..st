actions
pushScope: aScopeObject
	"bring aScopeObject to the front of the scope chain"
	| currentScope |
	currentScope := ASN1Scope new scopeObject: aScopeObject.
	scope ifNotNil: [
		currentScope setParent: scope ].
	scope := currentScope