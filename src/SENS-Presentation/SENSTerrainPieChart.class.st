Class {
	#name : #SENSTerrainPieChart,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'terrain',
		'colorPalette'
	],
	#category : #'SENS-Presentation-Roassal Visualizations'
}

{ #category : #'as yet unclassified' }
SENSTerrainPieChart class >> forTerrain: aTerrain [

	^ self new
		terrain: aTerrain
		yourself
]

{ #category : #hooks }
SENSTerrainPieChart >> renderIn: aCanvas [

	| pie data color pieLabel pieTitle |
	
	data := {
		{ 'CIRAD Researchers' . 'CIRAD Researchers' . (terrain ciradResearchers size) } .
		{ 'IRD Researchers' .  'IRD Researchers' . (terrain irdResearchers size) } .
		{ 'UPVM Researchers' . 'UPVM Researchers' . (terrain upvmResearchers) size } .
		{ 'PhD Students' . 'PhD Students' . (terrain students size) }
	}.
		
	color := NSScale ordinal rangeFrom: { 
		SENSColor ciradResearcherColor asHexString .
		SENSColor irdResearcherColor asHexString .
		SENSColor upvmResearcherColor asHexString .
		SENSColor phdStudentColor asHexString }.
		
	pie := RSPie new
		container: aCanvas;
		objects: data;
		slice: #third.
		
	pie sliceShape
		externalRadius: 200;
		innerRadius: 140;
		segmentSpacing: 1.
		
	pie sliceColor: color.

	pieLabel := RSPieLabeledInteraction new.
	pieLabel labelShape
		fontSize: 16;
		fontName: 'Source Code Pro'.
	pieLabel
		labelColor: color;
		labelText: [ :obj | (obj third * 100 / pie totalSum) rounded asString, '%' ];
		rotated;
		offset: 60.
	pieTitle := RSPieTitleInteraction new.
	pieTitle labelShape
		fontSize: 30.
	pieTitle labelText: terrain name.
	pie build.

	pie shapes @ (RSPopup text: [ :obj |
		obj first capitalized, '. ', obj third asString, ' hrs' ] ).
	pie shapes @ pieLabel.
	pie canvas @ pieTitle.
]

{ #category : #accessing }
SENSTerrainPieChart >> terrain [

	^ terrain
]

{ #category : #accessing }
SENSTerrainPieChart >> terrain: anObject [

	terrain := anObject
]
