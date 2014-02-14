accessing
encodedValue: aBitStringValue
	^ super encodedValue: (aBitStringValue isString 
		ifTrue: [ aBitStringValue  ]
		ifFalse: [ aBitStringValue stringValue  ])