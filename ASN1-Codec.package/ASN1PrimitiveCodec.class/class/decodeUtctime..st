decoding
decodeUtctime: aString 
self halt.
	^ self utcTimeParser parse: aString.