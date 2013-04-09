X.680 grammar
intersections
	^ super intersections ==> [:nodes| | intersectionElements |
		intersectionElements := nodes collect: [:each|
			self flag: #disabledForNow.
			"(each first isCollection ifTrue: [ self halt ])."
			ASN1ElementsNode new
				entity: each first;
				exclusions: each second].
		(intersectionElements size > 1) 
			ifTrue: [
				ASN1IntersectionNode new
					elements: intersectionElements first.]
			ifFalse: [ intersectionElements first ] ]