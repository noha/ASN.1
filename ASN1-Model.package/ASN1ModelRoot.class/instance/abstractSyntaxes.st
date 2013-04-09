accessing
abstractSyntaxes
	"| col |
	col := Set new.
	self modules do: [:module|
		col addAll: module abstractSyntaxes ].
	^ col"
	^ self modules 
		inject: Set new 
		into: [:col :module|
			col addAll: modules abstractSyntaxes ] 