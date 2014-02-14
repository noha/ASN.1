testing
hasElementWithTag: aTag
	^ ([ self elementWithTag: aTag ]
		on: NotFound
		do: [ :err| nil  ]) notNil