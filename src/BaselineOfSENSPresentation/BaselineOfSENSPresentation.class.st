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

{ #category : #script }
BaselineOfSENSPresentation >> postLoad [

	"do something"
]

{ #category : #'as yet unclassified' }
BaselineOfSENSPresentation >> specForBaselines: spec [

	spec
		baseline: 'GitBridge'
		with: [ spec repository: 'github://jecisc/GitBridge/src' ].

]

{ #category : #'as yet unclassified' }
BaselineOfSENSPresentation >> specForPackages: spec [

	spec
		package: 'SENS-Presentation';
		package: 'SENS-Presentation-Tests' with: [ spec requires: #('SENS-Presentation') ]

]
