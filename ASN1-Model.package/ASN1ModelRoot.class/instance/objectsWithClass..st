accessing
objectsWithClass: aString
	| col |
	col := Dictionary new.
	self modules do: [:each|
		col addAll: (each objectsWithClass: aString) ].
	^ col