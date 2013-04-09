visiting
visitRoot: aRoot
	aRoot modules: (self visitAll: aRoot modules).
	^ aRoot