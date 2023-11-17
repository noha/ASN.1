Class {
	#name : #ConfigurationOfASN1,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfASN1'
}

{ #category : #'development support' }
ConfigurationOfASN1 class >> DevelopmentProcess [

"DEVELOPMENT Process
	- load current version:
	  	(self project version: #stable) load: 'ALL'.
	- open new version for development:
		self createNewDevelopmentVersion
	- update the the development version to match mcz file versions
		self updateToLatestPackageVersions: '- fixed bug uvw'
	- do development and periodically save mcz files and update configuration
		self saveModifiedPackages: '- fixed bug xyz'
	- do development and periodically save mcz files and configuration until ready for release
		self saveModifiedPackagesAndConfiguration: '- fixed bug xyz'
	- save configuration
		self saveConfiguration: commitMessage '- checkpoint configuration'
RELEASE Process
	- mark development version as release:
		self releaseDevelopmentVersion: 'commit comment'
	- copy configuration for general access for Squeak and Pharo:
		self copyToSqueakSource.
	- copy configuration for general access for GLASS (Dale is willing to test and release for GLASS):
		self copyToGemSource.
"
]

{ #category : #private }
ConfigurationOfASN1 class >> bootstrapPackage: aString from: aPath [ 
	| repository version |
	repository := MCHttpRepository
				location: aPath
				user: ''
				password: ''.
	repository
		versionReaderForFileNamed: aString , '.mcz'
		do: [:reader | 
			version := reader version.
			version load.
			version workingCopy repositoryGroup addRepository: repository]
]

{ #category : #'development support' }
ConfigurationOfASN1 class >> compareVersions [
	"Compare the current #stable version to current #development version"

	"self compareVersions"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	((Smalltalk at: #MetacelloToolBox) compareVersionsIn: self) inspect

]

{ #category : #'development support' }
ConfigurationOfASN1 class >> copyToGemSource [
	"Copy the current configuration mcz file to http://seaside.gemstone.com/ss/MetacelloRepository"

	"Note you before copying config to GemSource, you should have tested the release in GLASS.
	 You also need to have commit rights to the GemSource repository."

	"self copyToGemSource"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) copyConfiguration: self to: 'http://seaside.gemstone.com/ss/MetacelloRepository'
]

{ #category : #'development support' }
ConfigurationOfASN1 class >> copyToSqueakSource [
	"Copy the current configuration mcz file to http://www.squeaksource.com/MetacelloRepository"

	"self copyToSqueakSource"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) copyConfiguration: self to: 'http://www.squeaksource.com/MetacelloRepository'
]

{ #category : #'development support' }
ConfigurationOfASN1 class >> createNewBaselineVersion [
	"Create a new baseline version based upon #stable version's baseline.
	 A new baseline should be created if new packages have been added or package dependencies have changed."

	"self createNewDevelopmentVersion"
	
	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) createNewBaselineVersionIn: self description: ''

]

{ #category : #'development support' }
ConfigurationOfASN1 class >> createNewDevelopmentVersion [
	"Create a new development version using the #stable version as model."

	"self createNewDevelopmentVersion"
	
	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) createNewDevelopmentVersionIn: self description: ''
]

{ #category : #private }
ConfigurationOfASN1 class >> ensureMetacello [
	"Bootstrap Gofer (if necessary), load latest mcz file for ConfigurationOfMetacello (using old 
	 Gofer API), then load the latest version of Metacello itself."

	Smalltalk at: #MetacelloProject ifAbsent: [ | error |
		"list of repositories to try, in case primary repository is not accessible"
		(Array 
			with: 'http://www.squeaksource.com/MetacelloRepository' 
			with: 'http://seaside.gemstone.com/ss/metacello') do: [:repositoryUrl |
				([
					Smalltalk at: #Gofer ifAbsent: [
						"Current version of Gofer from which to bootstrap - as of 1.0-beta.21"
						self bootstrapPackage: 'Gofer-Core-lr.115' from: repositoryUrl ].
					Smalltalk at: #Gofer ifPresent: [:goferClass | | gofer |
						gofer := goferClass new
							url: repositoryUrl;
							yourself.
						[ gofer addPackage: 'ConfigurationOfMetacello' ] on: Warning do: [:ex | ex resume ].
						gofer load ]]
							on: Error
							do: [ :ex |
								error := ex.
								Transcript 
									cr; 
									show: 'failed ensureMetacello: ';
									show: ex description printString;
									show: '...retrying'.
								"try again"
								ex return: nil ]) ~~ nil
					ifTrue: [
						"load 'default' group of Metacello"
						(Smalltalk at: #ConfigurationOfMetacello) perform: #load.
						^self ]].
		"shouldn't get here unless the load failed ... throw an error"
		self error: 'retry with alternate repository failed: ', error description printString ]
]

{ #category : #'metacello tool support' }
ConfigurationOfASN1 class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #'metacello tool support' }
ConfigurationOfASN1 class >> lastMetacelloVersionLoad [
	"Answer the last version loaded and the list of packages loaded for that version."

	LastVersionLoad == nil ifTrue: [ LastVersionLoad := nil -> 'default' ].
	^LastVersionLoad
]

{ #category : #loading }
ConfigurationOfASN1 class >> loadDevelopment [
	^ (self project version: #development) load
]

{ #category : #loading }
ConfigurationOfASN1 class >> loadLatestVersion [
	"self loadLatestVersion"
	
	^self project latestVersion load
]

{ #category : #loading }
ConfigurationOfASN1 class >> loadStable [
	^ (self project version: #stable) load
]

{ #category : #'metacello tool support' }
ConfigurationOfASN1 class >> metacelloVersion: versionString loads: anArrayOrString [
	"Stash the last version loaded and the list of packages loaded for that version. The list
	 of packages will be used by the tools when doing 'Load Package Version'"

	LastVersionLoad := versionString -> anArrayOrString
]

{ #category : #accessing }
ConfigurationOfASN1 class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfASN1 class >> releaseDevelopmentVersion: commitMessage [
	"Release #development version (set version blessing to #release), update the #development and #stable symbolic versions and save the configuration."

	"self releaseDevelopmentVersion: '- release version 1.0.2'"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) releaseDevelopmentVersionIn: self description: commitMessage
]

{ #category : #'development support' }
ConfigurationOfASN1 class >> saveConfiguration: commitMessage [
	"Save the configuration."

	"self saveConfiguration: '- fixed bug'"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) saveConfigurationPackageFor: self name asString description: commitMessage
]

{ #category : #'development support' }
ConfigurationOfASN1 class >> saveModifiedPackages: commitMessage [
	"Save modified mcz files and update the configuration."

	"self saveModifiedPackages: '- fixed bug'"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) saveModifiedPackagesIn: self description:  commitMessage
]

{ #category : #'development support' }
ConfigurationOfASN1 class >> saveModifiedPackagesAndConfiguration: commitMessage [
	"Save modified mcz files, update and then save the configuration."

	"self saveModifiedPackagesAndConfiguration: '- fixed bug'"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) saveModifiedPackagesAndConfigurationIn: self description: commitMessage
]

{ #category : #loading }
ConfigurationOfASN1 class >> update [
	self project updateProject.
	self loadDevelopment
]

{ #category : #'development support' }
ConfigurationOfASN1 class >> updateToLatestPackageVersions: descriptionString [
	"Updates mcz file versions in current version"

	"self updateToLatestPackageVersions: '- latest mcz files for 1.0.4'"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	((Smalltalk at: #MetacelloToolBox) updateToLatestPackageVersionsIn: self description: descriptionString) isEmpty
		ifTrue: [ self inform: 'All specs up to date' ]
]

{ #category : #'development support' }
ConfigurationOfASN1 class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."
	
	"self validate"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #'as yet unclassified' }
ConfigurationOfASN1 >> baseline075: spec [ 
        <version: '0.7.5-baseline'>
        
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main'.    
		spec 
      	package: 'ASN1-Common' with: [ spec requires: #()];
			package: 'ASN1-Syntax' with: [ spec requires: #('ASN1-Common' 'PetitParser') ];
			package: 'ASN1-Tests-Syntax' with: [ spec requires: #('ASN1-Syntax') ];
        package: 'ASN1-AST' with: [ spec requires: #('ASN1-Syntax') ];
			package: 'ASN1-Tests-AST' with: [ spec requires: #('ASN1-AST' 'ASN1-Tests-Syntax') ];
       	package: 'ASN1-Model' with: [ spec requires: #('ASN1-Common')];
			package: 'ASN1-Tests-Model' with: [ spec requires: #('ASN1-Model')];
			package: 'ASN1-Builder' with: [ spec requires: #('ASN1-AST' 'ASN1-Model')];
			package: 'ASN1-Tests-Builder' with: [ spec requires: #('ASN1-Builder' 'ASN1-Tests-AST' 'ASN1-Tests-Model')];
			package: 'ASN1-Codec' with: [ spec requires: #('ASN1-Common' 'PetitParser') ];
			package: 'ASN1-Tests-Codec' with: [ spec requires: #('ASN1-Codec') ];
			package: 'ASN1-Tool' with: [ spec requires: #('ASN1-Model' 'ASN1-Codec' ) ];
			package: 'ASN1-Tests-Tool' with: [ spec requires: #('ASN1-Builder' 'ASN1-Tool' 'ASN1-Tests-Model' 'ASN1-Tests-Codec' 'ASN1-Tests-AST' 'ASN1-Tests-Builder')  ].
				
			spec
				project: 'PetitParser' with: [
					spec
						className: 'ConfigurationOfPetitParser';
						loads:  #( 'Core' );
						versionString: '1.5-baseline';
						file: 'ConfigurationOfPetitParser';
						repository: 'http://source.lukas-renggli.ch/petit' ].
					spec
						group: 'builder' with: #('ASN1-AST' 'ASN1-Model');
						group: 'builder-tests' with: #( 'ASN1-Tests-AST' 'ASN1-Tests-Model' 'ASN1-Tests-Builder');
						group: 'tool' with: #('ASN1-Tool');
						group: 'tool-tests' with: #('ASN1-Tests-Tool');
						group: 'tests' with: #('builder-tests' 'tool-tests');
						group: 'default' with: #('builder' 'tool');
						group: 'all' with: #('default' 'builder-tests' 'tool-tests')]. 
]

{ #category : #'as yet unclassified' }
ConfigurationOfASN1 >> baseline080: spec [ 
        <version: '0.8.0-baseline'>
        
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main'.    
		spec 
      	package: 'ASN1-Common' with: [ spec requires: #()];
			package: 'ASN1-Syntax' with: [ spec requires: #('ASN1-Common' 'PetitParser') ];
			package: 'ASN1-Tests-Syntax' with: [ spec requires: #('ASN1-Syntax') ];
        package: 'ASN1-AST' with: [ spec requires: #('ASN1-Syntax') ];
			package: 'ASN1-Tests-AST' with: [ spec requires: #('ASN1-AST' 'ASN1-Tests-Syntax') ];
       	package: 'ASN1-Model' with: [ spec requires: #('ASN1-Common')];
			package: 'ASN1-Tests-Model' with: [ spec requires: #('ASN1-Model')];
			package: 'ASN1-Builder' with: [ spec requires: #('ASN1-AST' 'ASN1-Model')];
			package: 'ASN1-Tests-Builder' with: [ spec requires: #('ASN1-Builder' 'ASN1-Tests-AST' 'ASN1-Tests-Model')];
			package: 'ASN1-Codec' with: [ spec requires: #('ASN1-Common' 'PetitParser') ];
			package: 'ASN1-Tests-Codec' with: [ spec requires: #('ASN1-Codec') ];
			package: 'ASN1-Tool' with: [ spec requires: #('ASN1-Model' 'ASN1-Codec' ) ];
			package: 'ASN1-Tests-Tool' with: [ spec requires: #('ASN1-Builder' 'ASN1-Tool' 'ASN1-Tests-Model' 'ASN1-Tests-Codec' 'ASN1-Tests-AST' 'ASN1-Tests-Builder')  ].
				
			spec
				project: 'PetitParser' with: [
					spec
						className: 'ConfigurationOfPetitParser';
						loads:  #( 'Core' );
						versionString: '1.6';
						file: 'ConfigurationOfPetitParser';
						repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ].
					spec
						group: 'builder' with: #('ASN1-AST' 'ASN1-Model');
						group: 'builder-tests' with: #( 'ASN1-Tests-AST' 'ASN1-Tests-Model' 'ASN1-Tests-Builder');
						group: 'tool' with: #('ASN1-Tool');
						group: 'tool-tests' with: #('ASN1-Tests-Tool');
						group: 'tests' with: #('builder-tests' 'tool-tests');
						group: 'default' with: #('builder' 'tool');
						group: 'all' with: #('default' 'builder-tests' 'tool-tests')]. 
]

{ #category : #baselines }
ConfigurationOfASN1 >> baseline0827: spec [
	<version: '0.8.27-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main'.
		spec 
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.9';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ];
			project: 'PetitParser Tests' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.9';
					loads: #('Tests' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ].
		spec 
			package: 'ASN1-Common';
			package: 'ASN1-Model' with: [
				spec requires: #('ASN1-Common' ). ];
			package: 'ASN1-Tests-Model' with: [
				spec requires: #('ASN1-Model' ). ];
			package: 'ASN1-Codec' with: [
				spec requires: #('ASN1-Common' 'PetitParser' ). ];
			package: 'ASN1-Tool' with: [
				spec requires: #('ASN1-Model' 'ASN1-Codec' ). ];
			package: 'ASN1-Tests-Codec' with: [
				spec requires: #('ASN1-Codec' ). ];
			package: 'ASN1-Syntax' with: [
				spec requires: #('ASN1-Common' 'PetitParser' ). ];
			package: 'ASN1-AST' with: [
				spec requires: #('ASN1-Syntax' ). ];
			package: 'ASN1-Builder' with: [
				spec requires: #('ASN1-AST' 'ASN1-Model' ). ];
			package: 'ASN1-Tests-Syntax' with: [
				spec requires: #('ASN1-Syntax' 'PetitParser Tests' ). ];
			package: 'ASN1-Tests-AST' with: [
				spec requires: #('ASN1-AST' 'ASN1-Tests-Syntax' ). ];
			package: 'ASN1-Tests-Builder' with: [
				spec requires: #('ASN1-Builder' 'ASN1-Tests-AST' 'ASN1-Tests-Model' ). ];
			package: 'ASN1-Tests-Tool' with: [
				spec requires: #('ASN1-Builder' 'ASN1-Tool' 'ASN1-Tests-Model' 'ASN1-Tests-Codec' 'ASN1-Tests-AST' 'ASN1-Tests-Builder' ). ].
		spec 
			group: 'builder' with: #('ASN1-AST' 'ASN1-Model' 'ASN1-Builder' );
			group: 'builder-tests' with: #('ASN1-Tests-Syntax' 'ASN1-Tests-AST' 'ASN1-Tests-Model' 'ASN1-Tests-Builder' );
			group: 'tool' with: #('ASN1-Tool' );
			group: 'tool-tests' with: #('ASN1-Tests-Tool' 'ASN1-Tests-Codec' );
			group: 'tests' with: #('builder-tests' 'tool-tests' );
			group: 'default' with: #('builder' 'tool' );
			group: 'all' with: #('default' 'builder-tests' 'tool-tests' ). ].

]

{ #category : #baselines }
ConfigurationOfASN1 >> baseline0828: spec [
	<version: '0.8.28-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main'.
		spec 
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.9';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ];
			project: 'PetitParser Tests' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.9';
					loads: #('Tests' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ].
		spec 
			package: 'ASN1-Common';
			package: 'ASN1-Model' with: [
				spec requires: #('ASN1-Common' ). ];
			package: 'ASN1-Tests-Model' with: [
				spec requires: #('ASN1-Model' ). ];
			package: 'ASN1-Codec' with: [
				spec requires: #('ASN1-Common' 'PetitParser' ). ];
			package: 'ASN1-Tool' with: [
				spec requires: #('ASN1-Model' 'ASN1-Codec' ). ];
			package: 'ASN1-Tests-Codec' with: [
				spec requires: #('ASN1-Codec' ). ];
			package: 'ASN1-Syntax' with: [
				spec requires: #('ASN1-Common' 'PetitParser' ). ];
			package: 'ASN1-AST' with: [
				spec requires: #('ASN1-Syntax' ). ];
			package: 'ASN1-Builder' with: [
				spec requires: #('ASN1-AST' 'ASN1-Model' ). ];
			package: 'ASN1-Tests-Syntax' with: [
				spec requires: #('ASN1-Syntax' 'PetitParser Tests' ). ];
			package: 'ASN1-Tests-AST' with: [
				spec requires: #('ASN1-AST' 'ASN1-Tests-Syntax' ). ];
			package: 'ASN1-Tests-Builder' with: [
				spec requires: #('ASN1-Builder' 'ASN1-Tests-AST' 'ASN1-Tests-Model' ). ];
			package: 'ASN1-Tests-Tool' with: [
				spec requires: #('ASN1-Builder' 'ASN1-Tool' 'ASN1-Tests-Model' 'ASN1-Tests-Codec' 'ASN1-Tests-AST' 'ASN1-Tests-Builder' ). ].
		spec 
			group: 'builder' with: #('ASN1-AST' 'ASN1-Model' 'ASN1-Builder' );
			group: 'builder-tests' with: #('ASN1-Tests-Syntax' 'ASN1-Tests-AST' 'ASN1-Tests-Model' 'ASN1-Tests-Builder' );
			group: 'tool' with: #('ASN1-Tool' );
			group: 'tool-tests' with: #('ASN1-Tests-Tool' 'ASN1-Tests-Codec' );
			group: 'tests' with: #('builder-tests' 'tool-tests' );
			group: 'default' with: #('builder' 'tool' );
			group: 'all' with: #('default' 'builder-tests' 'tool-tests' ). ].

]

{ #category : #baselines }
ConfigurationOfASN1 >> baseline0829: spec [
	<version: '0.8.29-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main'.
		spec 
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.9';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ];
			project: 'PetitParser Tests' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.9';
					loads: #('Tests' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ];
			project: 'Phexample' with: [
				spec
					className: #ConfigurationOfPhexample;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Phexample/Phexample/main/' ].
		spec 
			package: 'ASN1-Common';
			package: 'ASN1-Model' with: [
				spec requires: #('ASN1-Common' ). ];
			package: 'ASN1-Tests-Model' with: [
				spec requires: #('ASN1-Model' 'Phexample' ). ];
			package: 'ASN1-Codec' with: [
				spec requires: #('ASN1-Common' 'PetitParser' ). ];
			package: 'ASN1-Tool' with: [
				spec requires: #('ASN1-Model' 'ASN1-Codec' ). ];
			package: 'ASN1-Tests-Codec' with: [
				spec requires: #('ASN1-Codec' ). ];
			package: 'ASN1-Syntax' with: [
				spec requires: #('ASN1-Common' 'PetitParser' ). ];
			package: 'ASN1-AST' with: [
				spec requires: #('ASN1-Syntax' ). ];
			package: 'ASN1-Builder' with: [
				spec requires: #('ASN1-AST' 'ASN1-Model' ). ];
			package: 'ASN1-Tests-Syntax' with: [
				spec requires: #('ASN1-Syntax' 'PetitParser Tests' ). ];
			package: 'ASN1-Tests-AST' with: [
				spec requires: #('ASN1-AST' 'ASN1-Tests-Syntax' ). ];
			package: 'ASN1-Tests-Builder' with: [
				spec requires: #('ASN1-Builder' 'ASN1-Tests-AST' 'ASN1-Tests-Model' ). ];
			package: 'ASN1-Tests-Tool' with: [
				spec requires: #('ASN1-Builder' 'ASN1-Tool' 'ASN1-Tests-Model' 'ASN1-Tests-Codec' 'ASN1-Tests-AST' 'ASN1-Tests-Builder' ). ].
		spec 
			group: 'builder' with: #('ASN1-AST' 'ASN1-Model' 'ASN1-Builder' );
			group: 'builder-tests' with: #('ASN1-Tests-Syntax' 'ASN1-Tests-AST' 'ASN1-Tests-Model' 'ASN1-Tests-Builder' );
			group: 'tool' with: #('ASN1-Tool' );
			group: 'tool-tests' with: #('ASN1-Tests-Tool' 'ASN1-Tests-Codec' );
			group: 'tests' with: #('builder-tests' 'tool-tests' );
			group: 'default' with: #('builder' 'tool' );
			group: 'all' with: #('default' 'builder-tests' 'tool-tests' ). ].

]

{ #category : #'as yet unclassified' }
ConfigurationOfASN1 >> baseline082: spec [ 
        <version: '0.8.2-baseline'>
        
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main'.    
		spec 
      	package: 'ASN1-Common' with: [ spec requires: #()];
			package: 'ASN1-Syntax' with: [ spec requires: #('ASN1-Common' 'PetitParser') ];
			package: 'ASN1-Tests-Syntax' with: [ spec requires: #('ASN1-Syntax' 'PetitParser Tests') ];
        package: 'ASN1-AST' with: [ spec requires: #('ASN1-Syntax') ];
			package: 'ASN1-Tests-AST' with: [ spec requires: #('ASN1-AST' 'ASN1-Tests-Syntax') ];
       	package: 'ASN1-Model' with: [ spec requires: #('ASN1-Common')];
			package: 'ASN1-Tests-Model' with: [ spec requires: #('ASN1-Model')];
			package: 'ASN1-Builder' with: [ spec requires: #('ASN1-AST' 'ASN1-Model')];
			package: 'ASN1-Tests-Builder' with: [ spec requires: #('ASN1-Builder' 'ASN1-Tests-AST' 'ASN1-Tests-Model')];
			package: 'ASN1-Codec' with: [ spec requires: #('ASN1-Common' 'PetitParser') ];
			package: 'ASN1-Tests-Codec' with: [ spec requires: #('ASN1-Codec') ];
			package: 'ASN1-Tool' with: [ spec requires: #('ASN1-Model' 'ASN1-Codec' ) ];
			package: 'ASN1-Tests-Tool' with: [ spec requires: #('ASN1-Builder' 'ASN1-Tool' 'ASN1-Tests-Model' 'ASN1-Tests-Codec' 'ASN1-Tests-AST' 'ASN1-Tests-Builder')  ].
				
			spec
				project: 'PetitParser' with: [
					spec
						className: 'ConfigurationOfPetitParser';
						loads:  #( 'Core' );
						versionString: '1.8-snapshot';
						file: 'ConfigurationOfPetitParser';
						repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ].
			spec
				project: 'PetitParser Tests' with: [
					spec
						className: 'ConfigurationOfPetitParser';
						loads:  #( 'Tests' );
						versionString: '1.8-snapshot';
						file: 'ConfigurationOfPetitParser';
						repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ].
					spec
						group: 'builder' with: #('ASN1-AST' 'ASN1-Model');
						group: 'builder-tests' with: #( 'ASN1-Tests-Syntax' 'ASN1-Tests-AST' 'ASN1-Tests-Model' 'ASN1-Tests-Builder');
						group: 'tool' with: #('ASN1-Tool');
						group: 'tool-tests' with: #('ASN1-Tests-Tool' 'ASN1-Tests-Codec');
						group: 'tests' with: #('builder-tests' 'tool-tests');
						group: 'default' with: #('builder' 'tool');
						group: 'all' with: #('default' 'builder-tests' 'tool-tests')]. 
]

{ #category : #baselines }
ConfigurationOfASN1 >> baseline12: spec [
	<version: '1.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main'.
		spec 
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.9';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ];
			project: 'PetitParser Tests' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.9';
					loads: #('Tests' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ];
			project: 'Phexample' with: [
				spec
					className: #ConfigurationOfPhexample;
					versionString: '3.2';
					repository: 'http://smalltalkhub.com/mc/Phexample/Phexample/main/' ].
		spec 
			package: 'ASN1-Common';
			package: 'ASN1-Model' with: [
				spec requires: #('ASN1-Common' ). ];
			package: 'ASN1-Tests-Model' with: [
				spec requires: #('ASN1-Model' 'Phexample' ). ];
			package: 'ASN1-Codec' with: [
				spec requires: #('ASN1-Common' 'PetitParser' ). ];
			package: 'ASN1-Tool' with: [
				spec requires: #('ASN1-Model' 'ASN1-Codec' ). ];
			package: 'ASN1-Tests-Codec' with: [
				spec requires: #('ASN1-Codec' ). ];
			package: 'ASN1-Syntax' with: [
				spec requires: #('ASN1-Common' 'PetitParser' ). ];
			package: 'ASN1-AST' with: [
				spec requires: #('ASN1-Syntax' ). ];
			package: 'ASN1-Builder' with: [
				spec requires: #('ASN1-AST' 'ASN1-Model' ). ];
			package: 'ASN1-Tests-Syntax' with: [
				spec requires: #('ASN1-Syntax' 'PetitParser Tests' ). ];
			package: 'ASN1-Tests-AST' with: [
				spec requires: #('ASN1-AST' 'ASN1-Tests-Syntax' ). ];
			package: 'ASN1-Tests-Builder' with: [
				spec requires: #('ASN1-Builder' 'ASN1-Tests-AST' 'ASN1-Tests-Model' ). ];
			package: 'ASN1-Tests-Tool' with: [
				spec requires: #('ASN1-Builder' 'ASN1-Tool' 'ASN1-Tests-Model' 'ASN1-Tests-Codec' 'ASN1-Tests-AST' 'ASN1-Tests-Builder' ). ].
		spec 
			group: 'builder' with: #('ASN1-AST' 'ASN1-Model' 'ASN1-Builder' );
			group: 'builder-tests' with: #('ASN1-Tests-Syntax' 'ASN1-Tests-AST' 'ASN1-Tests-Model' 'ASN1-Tests-Builder' );
			group: 'tool' with: #('ASN1-Tool' );
			group: 'tool-tests' with: #('ASN1-Tests-Tool' 'ASN1-Tests-Codec' );
			group: 'tests' with: #('builder-tests' 'tool-tests' );
			group: 'default' with: #('builder' 'tool' );
			group: 'all' with: #('default' 'builder-tests' 'tool-tests' ). ].

]

{ #category : #'as yet unclassified' }
ConfigurationOfASN1 >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.8.29-baseline'.

]

{ #category : #'as yet unclassified' }
ConfigurationOfASN1 >> project [

	^ project ifNil: [ | projectAttributes |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		project := (Smalltalk at: #MetacelloMCProject) new.
		projectAttributes := #().
		Smalltalk at: #SystemVersion ifPresent: [:cl | | versionString |
			versionString := cl current version.
			((versionString beginsWith: 'Pharo-1.0') or: [versionString beginsWith: 'PharoCore1.0'])
				ifTrue: [ projectAttributes := projectAttributes, #(#'GreaseForPharo1.0') ] ].
		project projectAttributes:  projectAttributes.
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear ]
]

{ #category : #'symbolic versions' }
ConfigurationOfASN1 >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.2'.

]

{ #category : #versions }
ConfigurationOfASN1 >> version0744: spec [
	<version: '0.7.44' imports: #('0.7.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.7.43 : Changed semantics of errors happening while reading tagged values from a stream. Instead of just throwing an exception the errornous part in the stream emits an error object. This way the structure of the read stays intact only it contains errors. The visitor that converts the tagged values to the key-value structure has gotten a flag skipErrors where it just jumps over an error when detected. This way we can do a recovery read where we try to read as much information as possible to initiate further actions
0.7.44 : new baseline because changing the repository for petit parser'.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/7/2013 11:45'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.6';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.63';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.62';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.10';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.4';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.32';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.6';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.48';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.8'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version081: spec [
	<version: '0.8.1' imports: #('0.8.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8 : version bump for petit parser
0.8.1 : cleaned code for de/-encoding of tags within their respective tagging environments'.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/11/2013 18:07'.
		spec project: 'PetitParser' with: '1.6'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.6';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.63';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.62';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.11';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.4';
			package: 'ASN1-Codec' with: 'ASN1-Codec-HolgerHansPeterFreyther.33';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.8';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.49';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.10'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version082: spec [
	<version: '0.8.2' imports: #('0.8.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8.1 : cleaned code for de/-encoding of tags within their respective tagging environments'.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/11/2013 18:07'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.6';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.63';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.62';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.11';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.4';
			package: 'ASN1-Codec' with: 'ASN1-Codec-HolgerHansPeterFreyther.33';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.8';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.49';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.10'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version0833: spec [
	<version: '0.8.33' imports: #('0.8.27-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8.33'.
		spec author: 'NorbertHartl'.
		spec timestamp: '1/16/2015 13:43'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.7';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.114';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.11';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.43';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.86';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.20';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.11';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.86';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.30';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.19';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.9';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.20'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version0834: spec [
	<version: '0.8.34' imports: #('0.8.27-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8.34'.
		spec author: 'NorbertHartl'.
		spec timestamp: '7/10/2015 18:02'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.146';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.13';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.47';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.97';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.28';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-HolgerHansPeterFreyther.13';
			package: 'ASN1-AST' with: 'ASN1-AST-HolgerHansPeterFreyther.94';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.40';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.21';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.11';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.20'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version0835: spec [
	<version: '0.8.35' imports: #('0.8.27-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8.35'.
		spec author: 'NorbertHartl'.
		spec timestamp: '9/9/2015 14:09'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.150';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.14';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.48';
			package: 'ASN1-Tool' with: 'ASN1-Tool-HolgerHansPeterFreyther.98';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.28';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.14';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.98';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.41';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.21';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.11';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.20'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version0836: spec [
	<version: '0.8.36' imports: #('0.8.28-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8.36'.
		spec author: 'NorbertHartl'.
		spec timestamp: '9/9/2015 14:12'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.150';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.14';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.48';
			package: 'ASN1-Tool' with: 'ASN1-Tool-HolgerHansPeterFreyther.98';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.28';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.14';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.98';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.41';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.21';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.11';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.20'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version0840: spec [
	<version: '0.8.40' imports: #('0.8.28-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8.40'.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/25/2015 11:11'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.178';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-HolgerHansPeterFreyther.26';
			package: 'ASN1-Codec' with: 'ASN1-Codec-MarcusDenker.53';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.111';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.31';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.14';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.99';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.50';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.21';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.14';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.23'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version08: spec [
	<version: '0.8' imports: #('0.8.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.7.44 : new baseline because changing the repository for petit parser
0.8 : version bump for petit parser'.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/7/2013 11:51'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.6';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.63';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.62';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.10';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.4';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.32';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.6';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.48';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.8'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version11: spec [
	<version: '1.1' imports: #('0.8.29-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '2/9/2016 19:01'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9';
			project: 'Phexample' with: '2.1'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-HolgerHansPeterFreyther.187';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.28';
			package: 'ASN1-Codec' with: 'ASN1-Codec-MarcusDenker.53';
			package: 'ASN1-Tool' with: 'ASN1-Tool-HolgerHansPeterFreyther.113';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.31';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.15';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.101';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.54';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-HolgerHansPeterFreyther.23';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.14';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-HolgerHansPeterFreyther.25'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version12: spec [
	<version: '1.2' imports: #('1.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.2'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '3/8/2018 17:00'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9';
			project: 'Phexample' with: '3.2'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-HolgerHansPeterFreyther.188';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.28';
			package: 'ASN1-Codec' with: 'ASN1-Codec-HolgerHansPeterFreyther.54';
			package: 'ASN1-Tool' with: 'ASN1-Tool-HolgerHansPeterFreyther.113';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.32';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.15';
			package: 'ASN1-AST' with: 'ASN1-AST-HolgerHansPeterFreyther.102';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.54';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-HolgerHansPeterFreyther.23';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.14';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-HolgerHansPeterFreyther.25'. ].

]

{ #category : #versions }
ConfigurationOfASN1 >> version1: spec [
	<version: '1' imports: #('0.8.29-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '2/9/2016 19:01'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9';
			project: 'Phexample' with: '2.1'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.186';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.28';
			package: 'ASN1-Codec' with: 'ASN1-Codec-MarcusDenker.53';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.112';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.31';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.15';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.101';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.54';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.22';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.14';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.24'. ].

]
