converting
adjustContentsSize: aNumber
	"adjust the size of the binary string representation to aNumber size"
	contents := String streamContents: [ :stream | 
		stream nextPutAll: contents.
		aNumber timesRepeat: [ stream nextPut: $0 ] ]