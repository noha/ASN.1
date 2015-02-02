codec
encode: aString
	self flag: #needsRedesign.
	"this is a quick hack to enable teletex strings. The string is not really latin-1 encoding"
	^ aString convertToEncoding: 'latin-1'