Class {
	#name : #SENSField,
	#superclass : #Object,
	#instVars : [
		'shortName',
		'name',
		'members'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #initialization }
SENSField >> initialize [

	super initialize.
	members := OrderedCollection new.
]

{ #category : #accessing }
SENSField >> members [

	^ members
]

{ #category : #accessing }
SENSField >> name [

	^ name
]

{ #category : #accessing }
SENSField >> name: anObject [

	name := anObject
]

{ #category : #printing }
SENSField >> printOn: aStream [

	aStream nextPutAll: shortName
]

{ #category : #accessing }
SENSField >> shortName [

	^ shortName
]

{ #category : #accessing }
SENSField >> shortName: anObject [

	shortName := anObject
]
