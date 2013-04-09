visiting
visitAssociation: anAssociation
	| result | 
	result := self visit: anAssociation value.
	^ anAssociation  key -> (
		(result class = Association)
			ifTrue: [
				ASN1Dictionary new
					at: result key put: result value;
					yourself]
			ifFalse: [ result ])