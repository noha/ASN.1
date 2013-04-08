accessing
utcTimeParser
	^ utcTimeParser ifNil: [
		utcTimeParser := ASN1UTCTimeParser new ]