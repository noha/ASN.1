visiting
visitChoiceNode: aNode
	"If a choice has a choice as element all elements if the child choice are copied into this instance. This resolves context 
	specific tagged elements to the location where they are resolved from an encoding"
	| elements |
	elements := (self visitAll: aNode elements).
	elements := elements
		inject: SmallDictionary new
		into: [:col :elem| 
		(elem value class = ASN1ChoiceType) 
			ifTrue: [ col addAll: elem value elements ]
			ifFalse: [ col add: elem ].
			col ].
	^ ASN1ChoiceType new
		elements: elements;
		definingModule: module