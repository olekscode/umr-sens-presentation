Class {
	#name : #SENSTerrain,
	#superclass : #Object,
	#instVars : [
		'name',
		'svgPath',
		'members'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #'instance creation' }
SENSTerrain class >> named: aString [

	^ self new 
		name: aString;
		yourself.
]

{ #category : #initialization }
SENSTerrain >> initialize [

	super initialize.
	members := OrderedCollection new.
]

{ #category : #accessing }
SENSTerrain >> members [

	^ members
]

{ #category : #accessing }
SENSTerrain >> name [

	^ name
]

{ #category : #accessing }
SENSTerrain >> name: anObject [

	name := anObject
]

{ #category : #printing }
SENSTerrain >> printOn: aStream [

	aStream nextPutAll: name
]

{ #category : #accessing }
SENSTerrain >> researchers [

	^ members select: [ :each | each isResearcher ]
]

{ #category : #accessing }
SENSTerrain >> students [

	^ members select: [ :each | each isPhdStudent ]
]

{ #category : #accessing }
SENSTerrain >> svgPath [

	^ svgPath
]

{ #category : #accessing }
SENSTerrain >> svgPath: anObject [

	svgPath := anObject
]
