Class {
	#name : #BaselineOfSENSPresentation,
	#superclass : #BaselineOf,
	#category : #BaselineOfSENSPresentation
}

{ #category : #baselines }
BaselineOfSENSPresentation >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec postLoadDoIt: #postLoad.
		
		self 
			specForBaselines: spec;
			specForPackages: spec ].
]

{ #category : #'as yet unclassified' }
BaselineOfSENSPresentation >> loadBackgroundImage [
	"Load UMR SENS logo as background image"

	(SENSGitBridge imagesPath / 'sens-logo.png') ifExists: [ :file |
		PolymorphSystemSettings desktopLogoFileName: file fullName ].
]

{ #category : #script }
BaselineOfSENSPresentation >> postLoad [

	self loadBackgroundImage.
]

{ #category : #'as yet unclassified' }
BaselineOfSENSPresentation >> specForBaselines: spec [

	spec
		baseline: 'GitBridge'
		with: [ spec repository: 'github://jecisc/GitBridge/src' ].
		
	spec
		baseline: 'DataFrame'
		with: [ spec repository: 'github://PolyMathOrg/DataFrame/src' ].

]

{ #category : #'as yet unclassified' }
BaselineOfSENSPresentation >> specForPackages: spec [

	spec
		package: 'SENS-Presentation' with: [ spec requires: #('GitBridge' 'DataFrame') ];
		package: 'SENS-Presentation-Tests' with: [ spec requires: #('SENS-Presentation') ]

]
