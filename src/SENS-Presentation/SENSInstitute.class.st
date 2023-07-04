Class {
	#name : #SENSInstitute,
	#superclass : #Object,
	#instVars : [
		'name',
		'researchers',
		'students',
		'supportStaff'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #'instance creation' }
SENSInstitute class >> named: aString [

	^ self new
		name: aString;
		yourself
]

{ #category : #initialization }
SENSInstitute >> initialize [

	super initialize.
	
	researchers := OrderedCollection new.
	students := OrderedCollection new.
	supportStaff := OrderedCollection new.
]

{ #category : #accessing }
SENSInstitute >> name [

	^ name
]

{ #category : #accessing }
SENSInstitute >> name: anObject [

	name := anObject
]

{ #category : #printing }
SENSInstitute >> printOn: aStream [

	aStream nextPutAll: name
]

{ #category : #accessing }
SENSInstitute >> researchers [

	^ researchers
]

{ #category : #accessing }
SENSInstitute >> students [

	^ students
]

{ #category : #accessing }
SENSInstitute >> supportStaff [

	^ supportStaff
]
