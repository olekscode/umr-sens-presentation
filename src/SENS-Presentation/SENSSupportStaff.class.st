Class {
	#name : #SENSSupportStaff,
	#superclass : #SENSMember,
	#instVars : [
		'field'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #accessing }
SENSSupportStaff >> field [

	^ field
]

{ #category : #accessing }
SENSSupportStaff >> field: anObject [

	field := anObject
]

{ #category : #testing }
SENSSupportStaff >> isSupportStaff [

	^ true
]
