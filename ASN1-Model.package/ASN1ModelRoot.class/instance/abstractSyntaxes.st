accessing
abstractSyntaxes
	^ self modules 
		inject: Set new 
		into: [:col :module|
			col addAll: modules abstractSyntaxes ] 