as yet unclassified
testQueryOidBindingName
	| name |
	name := self model bindingNameOfOid: '0.4.0.0.1.1.1.1'.
	self assert: name = 'map-DialogueAS'