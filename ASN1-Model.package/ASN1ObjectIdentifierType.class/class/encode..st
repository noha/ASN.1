codec
encode: anOidOrString
	| components stream octets |
	octets := OrderedCollection new.
	components := ($. split: anOidOrString value) collect: [:each| each asNumber ].
	"first octet is the combination of the first two components: (X * 40) + Y"
	components at: 1 put: (((components removeAt: 1) * 40) + components first).
	stream := components reverse readStream.
	[ stream atEnd ] whileFalse: [ | octet |
		octet := stream next.
		octets addFirst: (octet bitAnd: 127).
		[ octet > 127 ] whileTrue: [
			octet := octet bitShift: -7.
			octets addFirst: ((octet bitAnd: 127) bitOr: 128) ]].
	^octets asByteArray
	