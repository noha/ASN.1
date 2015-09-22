converting
encodedValue
	"an enumerated is encoded as an integer. The integer is the numeric presentation
	of the enum selected by the label"
	^ type encodedValue: (type atName: value) number