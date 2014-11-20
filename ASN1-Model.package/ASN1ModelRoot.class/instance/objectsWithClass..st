accessing
objectsWithClass: aString
	| col |
	col := Dictionary new.
	modules do: [:each|
		col addAll: (each objectsWithClass: aString) ].
	^ col