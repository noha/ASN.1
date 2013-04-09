tests
testParameterList
	self parse: '{OPERATION:Invokable}' rule: #parameterList.	
	self parse: '{OPERATION:Invokable,OPERATION:Foo}' rule: #parameterList.