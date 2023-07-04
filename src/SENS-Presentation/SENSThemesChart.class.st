Class {
	#name : #SENSThemesChart,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'themes',
		'colorPalette'
	],
	#category : #'SENS-Presentation-Roassal Visualizations'
}

{ #category : #'as yet unclassified' }
SENSThemesChart class >> forThemes: aCollection [

	^ self new
		themes: aCollection;
		yourself
]

{ #category : #creation }
SENSThemesChart >> createEllipseFor: aTheme [

	| solidColor |
	solidColor := colorPalette scale: aTheme.
	^ RSEllipse new
		model: aTheme;
		color: (solidColor alpha: 0.4);
		border: (RSBorder new width: 1; color: solidColor);
		extent: self ellipseExtent;
		position: 0@0;
		"draggable;"
		yourself
]

{ #category : #'as yet unclassified' }
SENSThemesChart >> createEllipses [

	| initialAngle angleSpace ellipse radius angle |
	
	initialAngle := 135.
	angleSpace := 90.
	
	^ themes collectWithIndex: [ :each :index | 
		ellipse := self createEllipseFor: each.
		radius := ellipse width / 4.
		angle := (initialAngle + (angleSpace * index)) degreesToRadians.
		ellipse propertyAt: #angle put: angle.
		ellipse translateTo: angle cos @ angle sin * radius.
		ellipse rotateByRadians: angle ].
]

{ #category : #'as yet unclassified' }
SENSThemesChart >> createLabelsFrom: ellipses [

	| labelBuilder radius angle text label |
	
	labelBuilder := RSMultilineLabelBuilder new.
	labelBuilder layout alignCenter.
	labelBuilder labelShape fontFamily: 'Arial'.
	labelBuilder wrapStrategy: (RSWrapStrategy new wrapMaxWidth: 170).
	
	^ ellipses collect: [ :each |
		radius := each baseRectangle width * 0.60.
		angle := each propertyAt: #angle.
		text := each model title.
		label := labelBuilder shapeFor: text.
		label scaleBy: 1.1.
		label position: angle cos @ angle sin * radius.
		label ].
]

{ #category : #'accessing - defaults' }
SENSThemesChart >> defaultContainer [
	^ RSCanvas new @ RSCanvasController
]

{ #category : #'accessing - defaults' }
SENSThemesChart >> ellipseExtent [
	^ 250@120
]

{ #category : #initialization }
SENSThemesChart >> initialize [

	super initialize.
	
	colorPalette := NSScale ordinal 
		range: ({'395723'. '002060'. 'c09003'. 'c55a12'} 
			collect: [:each | Color colorFrom: each ])
]

{ #category : #hooks }
SENSThemesChart >> renderIn: aCanvas [

	| ellipses labels |
	
	ellipses := self createEllipses.
	labels := self createLabelsFrom: ellipses.
	aCanvas addAll: ellipses; addAll: labels.
]

{ #category : #accessing }
SENSThemesChart >> themes [

	^ themes
]

{ #category : #accessing }
SENSThemesChart >> themes: anObject [

	themes := anObject
]
