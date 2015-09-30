converting
basicEncodeToByteArray
	^ ByteArray streamContents: [ :stream | 
		self writeEncodedValuesOn: stream ]