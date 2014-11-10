accessing
keys
	| col |
	col := OrderedCollection new.
	elements do: [ :each |  
		each isAsn1Association ifTrue: [ col add: each key ] ].
	^ col