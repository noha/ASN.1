sanitizing
sanitizeValues
	"enumerated values can be a mix of named numbers and identifiers. In case of identifiers we need
	to automatically assign numbers. We count from zero on upwards. For every number that has not 
	been assigned, yet, we assign the number to the next value without a number"
	| unassigned assignedValues number |
	unassigned := OrderedCollection new.
	assignedValues := OrderedCollection new.
	(elements reject: #isExtension) do: [ :element |
		element number isNil 
			ifTrue: [ unassigned add: element ]
			ifFalse: [ assignedValues add: element number ] ].
	number := 0.
	[ unassigned isEmpty ] whileFalse: [ 
		[  assignedValues includes: number ] whileTrue: [ number := number + 1 ].
		unassigned removeFirst number: number.
		assignedValues add: number ]
	