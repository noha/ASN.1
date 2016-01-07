as yet unclassified
adjustContentsSize
	"adjust the size of the binary string representation to the amount of named
	bits available"
	(self type namedBits size > self contents size) ifTrue: [  
		contents := String streamContents: [ :stream | 
			stream nextPutAll: contents.
			self contents size + 1 to: self type namedBits size do: [ :n |
				stream nextPut: $0 ] ] ]