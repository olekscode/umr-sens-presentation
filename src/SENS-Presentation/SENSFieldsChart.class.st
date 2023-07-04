Class {
	#name : #SENSFieldsChart,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'fields',
		'colorPalette'
	],
	#category : #'SENS-Presentation-Roassal Visualizations'
}

{ #category : #'as yet unclassified' }
SENSFieldsChart class >> forFields: aCollection [

	^ self new
		fields: aCollection;
		yourself.
]

{ #category : #creation }
SENSFieldsChart >> createEllipseFor: aField extent: anExtent radiusProportion: aRadiusProportion angle: anAngle [

	| solidColor ellipse |
	solidColor := colorPalette scale: aField.
	
	ellipse := RSEllipse new
		model: aField;
		color: (solidColor alpha: 0.4);
		border: (RSBorder new width: 1; color: solidColor);
		extent: anExtent;
		position: 0@0;
		"draggable;"
		yourself.
		
	ellipse propertyAt: #angle put: anAngle.
	ellipse translateTo: anAngle cos @ anAngle sin * (ellipse width * aRadiusProportion).
	ellipse rotateByRadians: anAngle.
		
	^ ellipse
]

{ #category : #'as yet unclassified' }
SENSFieldsChart >> createLabelsFrom: ellipses [

	| labelBuilder radius angle text label |
	
	labelBuilder := RSMultilineLabelBuilder new.
	labelBuilder layout alignCenter.
	labelBuilder labelShape fontFamily: 'Arial'.
	labelBuilder wrapStrategy: (RSWrapStrategy new wrapMaxWidth: 170).
	
	^ ellipses collect: [ :each |
		radius := each baseRectangle width * 0.60.
		angle := each propertyAt: #angle.
		text := each model shortName.
		label := labelBuilder shapeFor: text.
		label scaleBy: 1.1.
		label position: angle cos @ angle sin * radius.
		label ].
]

{ #category : #'accessing - defaults' }
SENSFieldsChart >> defaultContainer [
	^ RSCanvas new @ RSCanvasController
]

{ #category : #'accessing - defaults' }
SENSFieldsChart >> ellipseExtent [
	^ 250@120
]

{ #category : #accessing }
SENSFieldsChart >> fields [

	^ fields
]

{ #category : #accessing }
SENSFieldsChart >> fields: anObject [

	fields := anObject
]

{ #category : #initialization }
SENSFieldsChart >> initialize [

	super initialize.
	
	colorPalette := NSScale ordinal 
		range: ({ SENSColor blue . SENSColor lightGreen . SENSColor pink } 
			collect: [:each | Color colorFrom: each ])
]

{ #category : #hooks }
SENSFieldsChart >> renderIn: aCanvas [

	| shsField sveField stField shsSveIntersectionSize shsStIntersectionSize sveStIntersectionSize shsSveStIntersectionSize shsEllipse sveEllipse stEllipse ellipses labels |
	
	shsField := fields detect: [ :each | each shortName = 'SHS' ].
	sveField := fields detect: [ :each | each shortName = 'SVE' ].
	stField := fields detect: [ :each | each shortName = 'ST' ].
	
	shsSveIntersectionSize := (shsField members asSet intersection: sveField members asSet) size.
	shsStIntersectionSize := (shsField members asSet intersection: stField members asSet) size.
	sveStIntersectionSize := (sveField members asSet intersection: stField members asSet) size.
	shsSveStIntersectionSize := ((shsField members asSet intersection: sveField members asSet) intersection: stField members asSet) size.
	
	shsEllipse := RSEllipse new
		model: shsField;
		color: (SENSColor pink alpha: 0.4);
		border: (RSBorder new width: 1; color: SENSColor pink);
		extent: 370@220;
		position: 0@(-120);
		yourself.
		
	sveEllipse := RSEllipse new
		model: sveField;
		color: (SENSColor yellow alpha: 0.4);
		border: (RSBorder new width: 1; color: SENSColor yellow);
		extent: 200@120;
		position: (-50)@0;
		yourself.
		
	stEllipse := RSEllipse new
		model: stField;
		color: (SENSColor lightBlue alpha: 0.4);
		border: (RSBorder new width: 1; color: SENSColor lightBlue);
		extent: 230@170;
		position: 50@(-30);
		yourself.
		
	shsEllipse propertyAt: #angle put: 0 degreesToRadians.
	sveEllipse propertyAt: #angle put: 0 degreesToRadians.
	stEllipse propertyAt: #angle put: 0 degreesToRadians.
	
	ellipses := { shsEllipse . sveEllipse . stEllipse }.
	
	labels := self createLabelsFrom: ellipses.
	aCanvas addAll: ellipses; addAll: labels.
]
