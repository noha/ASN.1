as yet unclassified
testDefinedObjectFromDefinedSyntax
	| object |
	object:= self modelBindingValue: 'purgeMS' .
	self assert: object isAsn1Node not.
	self assert: (object attributeAt: 'operationCode') = 67
