tests
testImports
	self parse: 'IMPORTS
  OPERATION, ERROR
    FROM Remote-Operations-Information-Objects {joint-iso-itu-t
      remote-operations(4) informationObjects(5) version1(0)};' rule: #imports.
