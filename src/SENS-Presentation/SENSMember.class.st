Class {
	#name : #SENSMember,
	#superclass : #Object,
	#instVars : [
		'firstName',
		'lastName',
		'institute'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #accessing }
SENSMember >> firstName [

	^ firstName
]

{ #category : #accessing }
SENSMember >> firstName: anObject [

	firstName := anObject
]

{ #category : #accessing }
SENSMember >> institute [

	^ institute
]

{ #category : #accessing }
SENSMember >> institute: anObject [

	institute := anObject
]

{ #category : #accessing }
SENSMember >> lastName [

	^ lastName
]

{ #category : #accessing }
SENSMember >> lastName: anObject [

	lastName := anObject
]

{ #category : #printing }
SENSMember >> printOn: aStream [

	aStream
		nextPutAll: firstName;
		space;
		nextPutAll: lastName.
]
