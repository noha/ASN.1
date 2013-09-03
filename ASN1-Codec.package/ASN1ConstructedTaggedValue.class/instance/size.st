accessing
size
	^ (self elements collect: [ :elem| elem size ]) sum