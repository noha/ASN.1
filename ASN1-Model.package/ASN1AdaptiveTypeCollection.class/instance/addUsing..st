accessing
addUsing: aBlock
	"create a new object of the nested type and hand it over
	to the given block for initialization. Add the return value in
	the internal collection"
	^ self add: (aBlock value: type type newValue)