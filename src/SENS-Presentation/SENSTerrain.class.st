Class {
	#name : #SENSTerrain,
	#superclass : #Object,
	#instVars : [
		'name',
		'svgPath',
		'members',
		'researchUnit'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #'instance creation' }
SENSTerrain class >> named: aString [

	^ self new 
		name: aString;
		yourself.
]

{ #category : #accessing }
SENSTerrain >> ciradResearchers [

	^ self researchers select: [ :each |
		each institute isNotNil and: [ each institute name = 'CIRAD' ] ]
]

{ #category : #initialization }
SENSTerrain >> initialize [

	super initialize.
	members := OrderedCollection new.
]

{ #category : #inspector }
SENSTerrain >> inspectorMembersDistribution [
	<inspectorPresentationOrder: 1 title: 'Members Distribution'>
	^ (SENSTerrainPieChart forTerrain: self) asPresenter
]

{ #category : #inspector }
SENSTerrain >> inspectorMembersDistributionContext: aContext [
	aContext withoutEvaluator
]

{ #category : #accessing }
SENSTerrain >> irdResearchers [

	^ self researchers select: [ :each |
		each institute isNotNil and: [ each institute name = 'IRD' ] ]
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
SENSTerrain >> researchUnit [

	^ researchUnit
]

{ #category : #accessing }
SENSTerrain >> researchUnit: anObject [

	researchUnit := anObject
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

{ #category : #accessing }
SENSTerrain >> upvmResearchers [

	^ self researchers select: [ :each |
		each institute isNotNil and: [ each institute name = 'UPVM' ] ]
]
