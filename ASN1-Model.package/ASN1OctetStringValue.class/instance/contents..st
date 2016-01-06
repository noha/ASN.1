accessing
contents: aByteArray
	"(aByteArray class = ByteArray) ifFalse: [ 
		Error signal: 'contents for octet string needs to be a byte array' ]."
	super contents: aByteArray 