Class {
	#name : #SENSTheme,
	#superclass : #Object,
	#instVars : [
		'title',
		'researchers',
		'students'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #'instance creation' }
SENSTheme class >> titled: aString [

	^ self new
		title: aString;
		yourself
]

{ #category : #initialization }
SENSTheme >> initialize [

	super initialize.
	
	researchers := OrderedCollection new.
	students := OrderedCollection new.
]

{ #category : #printing }
SENSTheme >> printOn: aStream [

	aStream nextPutAll: title
]

{ #category : #accessing }
SENSTheme >> researchers [

	^ researchers
]

{ #category : #accessing }
SENSTheme >> students [

	^ students
]

{ #category : #accessing }
SENSTheme >> title [

	^ title
]

{ #category : #accessing }
SENSTheme >> title: anObject [

	title := anObject
]
