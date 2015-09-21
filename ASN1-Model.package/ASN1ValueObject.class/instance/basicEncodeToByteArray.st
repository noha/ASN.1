converting
basicEncodeToByteArray
	^ ByteArray streamContents: [ :stream | 
		self writeTaggedValuesOn: stream ]