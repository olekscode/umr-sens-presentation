Class {
	#name : #SENSPhdStudent,
	#superclass : #SENSMember,
	#instVars : [
		'terrains'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #testing }
SENSPhdStudent >> isPhdStudent [

	^ true
]

{ #category : #accessing }
SENSPhdStudent >> terrains [

	^ terrains
]

{ #category : #accessing }
SENSPhdStudent >> terrains: anObject [

	terrains := anObject
]
