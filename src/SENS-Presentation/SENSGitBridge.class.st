Class {
	#name : #SENSGitBridge,
	#superclass : #GitBridge,
	#category : #'SENS-Presentation-GitBridge'
}

{ #category : #'as yet unclassified' }
SENSGitBridge class >> dataPath [

	^ self root / 'data'
]

{ #category : #'as yet unclassified' }
SENSGitBridge class >> imagesPath [

	^ self root / 'img'
]
