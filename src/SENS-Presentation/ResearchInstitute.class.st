Class {
	#name : #ResearchInstitute,
	#superclass : #Object,
	#instVars : [
		'name',
		'members'
	],
	#category : #'SENS-Presentation'
}

{ #category : #accessing }
ResearchInstitute >> members [

	^ members
]

{ #category : #accessing }
ResearchInstitute >> members: anObject [

	members := anObject
]

{ #category : #accessing }
ResearchInstitute >> name [

	^ name
]

{ #category : #accessing }
ResearchInstitute >> name: anObject [

	name := anObject
]
