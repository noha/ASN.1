decoding
fromTuple: aTuple
        classType := aTuple first bitAnd: 16r3.
        constructed := aTuple second.
        tagValue := aTuple third.
