Class {
	#name : #SENSProject,
	#superclass : #Object,
	#instVars : [
		'title',
		'members'
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
	members := OrderedCollection new.
]

{ #category : #accessing }
SENSProject >> members [

	^ members
]

{ #category : #printing }
SENSProject >> printOn: aStream [

	aStream nextPutAll: title
]

{ #category : #accessing }
SENSProject >> researchers [

	^ members select: [ :each | each isResearcher ]
]

{ #category : #accessing }
SENSProject >> students [

	^ members select: [ :each | each isPhdStudent ]
]

{ #category : #accessing }
SENSProject >> title [

	^ title
]

{ #category : #accessing }
SENSProject >> title: anObject [

	title := anObject
]
