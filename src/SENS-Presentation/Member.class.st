Class {
	#name : #Member,
	#superclass : #Object,
	#instVars : [
		'firstName',
		'lastName',
		'email',
		'institute'
	],
	#category : #'SENS-Presentation'
}

{ #category : #accessing }
Member >> email [

	^ email
]

{ #category : #accessing }
Member >> email: anObject [

	email := anObject
]

{ #category : #accessing }
Member >> firstName [

	^ firstName
]

{ #category : #accessing }
Member >> firstName: anObject [

	firstName := anObject
]

{ #category : #accessing }
Member >> institute [

	^ institute
]

{ #category : #accessing }
Member >> institute: anObject [

	institute := anObject
]

{ #category : #accessing }
Member >> lastName [

	^ lastName
]

{ #category : #accessing }
Member >> lastName: anObject [

	lastName := anObject
]
