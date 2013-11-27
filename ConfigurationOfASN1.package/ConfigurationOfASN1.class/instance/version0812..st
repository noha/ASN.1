versions
version0812: spec
	<version: '0.8.12' imports: #('0.8.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8.11 : Changed handling of assignments an scope chains. An assignment is now resolved on the left side (reference and type) first. The result is put onto the scope chain because for things like typed references or if paramters exist they need to be resolvable when dealing with value definitions. This fixes a bug where a defined syntax object used an enum case of the assigned type of the assignment'.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/27/2013 13:28'.
		spec 
			project: 'PetitParser' with: '1.8-snapshot';
			project: 'PetitParser Tests' with: '1.8-snapshot'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.9';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.66';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.10';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.64';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.11';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.4';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.35';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.8';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.52';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.11'. ].
