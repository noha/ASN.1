finding
objectMapForClass: aString 
	| col |
	col := Dictionary new.
	modules do: [:each|
		col addAll: (each objectMapForClass: aString) ].
	^ col