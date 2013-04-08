encoding
writeOn: aStream
        tagValue >= 16r1F
            ifTrue:  [self writeExtendedTag: aStream.]
            ifFalse: [| tag |
                tag := classType bitShift: 6.
                self isConstructed ifTrue: [tag := tag bitOr: 16r20].
                tag := tag bitOr: self tagValue.
                aStream nextPut: tag.
            ].
