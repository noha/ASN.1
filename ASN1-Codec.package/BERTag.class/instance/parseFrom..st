decoding
parseFrom: aStream
	| tmp |
        tmp := aStream next asInteger.
        classType := (tmp bitAnd: 16rC0) bitShift: -6.
        constructed := (tmp bitAnd: 16r20) > 0.
        tagValue := tmp bitAnd: 16r1F.

        "This is an extended tag"
        (tagValue = 16r1F) ifTrue: [
            self parseExtendedTag: aStream.
        ].
