Class {
	#name : #SENSTerrain,
	#superclass : #Object,
	#instVars : [
		'name',
		'svgPath',
		'researchers',
		'students'
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
	
	researchers := OrderedCollection new.
	students := OrderedCollection new.
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

	^ researchers
]

{ #category : #accessing }
SENSTerrain >> students [

	^ students
]

{ #category : #accessing }
SENSTerrain >> svgPath [

	^ svgPath
]

{ #category : #accessing }
SENSTerrain >> svgPath: anObject [

	svgPath := anObject
]
