Class {
	#name : #SENSInstitute,
	#superclass : #Object,
	#instVars : [
		'name',
		'members'
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
	members := OrderedCollection new.
]

{ #category : #accessing }
SENSInstitute >> members [

	^ members
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

	^ members select: [ :each | each isResearcher ]
]

{ #category : #accessing }
SENSInstitute >> students [

	^ members select: [ :each | each isPhdStudent ]
]

{ #category : #accessing }
SENSInstitute >> supportStaff [

	^ members select: [ :each | each isSupportStaff ]
]
