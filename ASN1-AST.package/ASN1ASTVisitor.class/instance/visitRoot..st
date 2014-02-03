visiting
visitRoot: aRoot
	"process all modules. For each module a new visitor is
	created to avoid side effects or recursive effects"
	aRoot modules do: [ :module | | visitor |
		visitor := self class new root: aRoot.
		visitor visit: module ].
	^ aRoot