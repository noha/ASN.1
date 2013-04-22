accessing
nextPutConstructed: aConstructedTaggedValue
	aConstructedTaggedValue do: [:each|
		self nextPut: each ]