codec
decode: aByteArray
	self flag: #needsRedsign.
	"decode as latin-1 although teletex is encoded with T.61"
	^ aByteArray asString convertFromEncoding: 'latin-1'