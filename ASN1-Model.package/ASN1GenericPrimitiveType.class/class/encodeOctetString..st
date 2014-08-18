codec
encodeOctetString: anOctetString
	"an octet string maps 1:1 from data to stream. "
	^ anOctetString asByteArray
