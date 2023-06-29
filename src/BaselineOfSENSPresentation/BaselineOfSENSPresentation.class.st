Class {
	#name : #BaselineOfSENSPresentation,
	#superclass : #BaselineOf,
	#category : #BaselineOfSENSPresentation
}

{ #category : #baselines }
BaselineOfSENSPresentation >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'SENS-Presentation';
				package: 'SENS-Presentation-Tests' with: [ spec requires: #('SENS-Presentation') ] ]
]
