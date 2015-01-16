converting
encodeToByteArray
	^ ByteArray streamContents: [ :stream | 
		self writeTaggedValuesOn: stream ]