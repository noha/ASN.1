visiting
visitRoot: aRoot
	"the default module containing the implicit classes object identifier and abstract
	syntax is always on first place so we take the second module which is the first
	the has been explicitly loaded"
	^ self visitAll: (aRoot modules reject: [ :each | each identifier name = 'default' ])