accessing
nextAll
	| ret |
        ret := OrderedCollection new.

        [self atEnd] whileFalse: [ret add: self next].

        ^ ret
