as yet unclassified
checkDependencies
	libraries do: [ :library |
		library dependencies do: [ :dependency |
			(self includesLibrary: dependency )
				ifFalse: [ NotFound signal: library asString, ' has unsolved dependency: ', dependency asString ] 
				ifTrue: [ 
					((self libraryNamed: dependency) dependencies includes: library name)
						ifTrue: [ Error signal: 'cyclic dependency between ', library asString,' and ', dependency asString ] ] ] ]