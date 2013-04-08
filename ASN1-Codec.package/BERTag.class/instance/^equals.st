comparing
= aOther
        (aOther isKindOf: self class) ifTrue: [^self asTuple = aOther asTuple].
        ^ self asTuple = aOther.
