Class {
	#name : #SENSTheme,
	#superclass : #Object,
	#instVars : [
		'title',
		'members'
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
	members := OrderedCollection new.
]

{ #category : #accessing }
SENSTheme >> members [

	^ members
]

{ #category : #printing }
SENSTheme >> printOn: aStream [

	aStream nextPutAll: title
]

{ #category : #accessing }
SENSTheme >> researchers [

	^ members select: [ :each | each isResearcher ]
]

{ #category : #accessing }
SENSTheme >> students [

	^ members select: [ :each | each isPhdStudent ]
]

{ #category : #accessing }
SENSTheme >> title [

	^ title
]

{ #category : #accessing }
SENSTheme >> title: anObject [

	title := anObject
]
