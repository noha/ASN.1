as yet unclassified
findValueWithTag: aTag 
	(self tag = aTag) ifTrue: [  ^ self ].
	collection do: [ :each|
		(each findValueWithTag: aTag) ifNotNil: [ :value |
			^ value ] ]