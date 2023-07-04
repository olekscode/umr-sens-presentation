Class {
	#name : #SENSProject,
	#superclass : #Object,
	#instVars : [
		'title',
		'researchers',
		'students'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #'instance creation' }
SENSProject class >> titled: aString [

	^ self new
		title: aString;
		yourself
]

{ #category : #initialization }
SENSProject >> initialize [

	super initialize.
	
	researchers := OrderedCollection new.
	students := OrderedCollection new.
]

{ #category : #printing }
SENSProject >> printOn: aStream [

	aStream nextPutAll: title
]

{ #category : #accessing }
SENSProject >> researchers [

	^ researchers
]

{ #category : #accessing }
SENSProject >> students [

	^ students
]

{ #category : #accessing }
SENSProject >> title [

	^ title
]

{ #category : #accessing }
SENSProject >> title: anObject [

	title := anObject
]
