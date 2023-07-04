Class {
	#name : #SENSResearcher,
	#superclass : #SENSMember,
	#instVars : [
		'projects',
		'terrains',
		'field'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #accessing }
SENSResearcher >> field [

	^ field
]

{ #category : #accessing }
SENSResearcher >> field: anObject [

	field := anObject
]

{ #category : #testing }
SENSResearcher >> isResearcher [

	^ true
]

{ #category : #accessing }
SENSResearcher >> projects [

	^ projects
]

{ #category : #accessing }
SENSResearcher >> projects: anObject [

	projects := anObject
]

{ #category : #accessing }
SENSResearcher >> terrains [

	^ terrains
]

{ #category : #accessing }
SENSResearcher >> terrains: anObject [

	terrains := anObject
]
