Class {
	#name : #SENSTerrainMap,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'terrains'
	],
	#category : #'SENS-Presentation-Roassal Visualizations'
}

{ #category : #'as yet unclassified' }
SENSTerrainMap class >> forTerrains: aCollection [

	^ self new
		terrains: aCollection;
		yourself
]

{ #category : #'accessing - defaults' }
SENSTerrainMap >> defaultContainer [
	| controller canvas |
	controller := RSCanvasController new.
	controller configuration maxScale: 100.
	canvas := RSCanvas new.
	"canvas inspectorContext: RSEmptyContextInteraction new."
	^ canvas @ controller
]

{ #category : #'as yet unclassified' }
SENSTerrainMap >> displayDefaultRegion: aPath withColor: aColor onCanvas: aCanvas [

	| country |
	
	country := RSSVGPath new.
	country svgPath: aPath.
	country border: (RSBorder new width: 0.5; color: Color black).
	country color: aColor.
	
	aCanvas add: country
]

{ #category : #'as yet unclassified' }
SENSTerrainMap >> displayTerrain: aTerrain withColor: aColor onCanvas: aCanvas [

	| country |
	
	country := RSSVGPath new.
	country svgPath: aTerrain svgPath.
	country model: aTerrain.
	country border: (RSBorder new width: 0.5; color: Color black).
	"country when: RSMouseClick send: #processClick: to: self."
	country color: aColor.
	
	aCanvas add: country
]

{ #category : #'as yet unclassified' }
SENSTerrainMap >> processClick: evt [
	| shape |
	shape := evt shape.
	shape model inspect.
]

{ #category : #hooks }
SENSTerrainMap >> renderIn: aCanvas [

	| color minMembersOnTerrain maxMembersOnTerrain |
	
	minMembersOnTerrain := (terrains collect: [ :each | each members size ]) min.
	maxMembersOnTerrain := (terrains collect: [ :each | each members size ]) max.

	terrains do: [ :each |
		color := SENSColor
			colorValue: each members size
			min: minMembersOnTerrain
			max: maxMembersOnTerrain
			baseColor: SENSColor mapColor.
		
		self
			displayTerrain: each
			withColor: color
			onCanvas: aCanvas ].
	
	self
		displayDefaultRegion: CountrySVG nonCoveredRegions
		withColor: SENSColor inactiveGrayColor
		onCanvas: aCanvas.
]

{ #category : #'as yet unclassified' }
SENSTerrainMap >> terrains [
	
	^ terrains
]

{ #category : #accessing }
SENSTerrainMap >> terrains: anObject [

	terrains := anObject
]
