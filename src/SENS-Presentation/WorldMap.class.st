Class {
	#name : #WorldMap,
	#superclass : #RSAbstractContainerBuilder,
	#category : #'SENS-Presentation-Countries SVG'
}

{ #category : #'instance creation' }
WorldMap class >> open [
	<script>
	self new open
]

{ #category : #'instance creation' }
WorldMap class >> openInspector [
	<script>
	| b |
	b := self new.
	b build.
	b canvas inspect
]

{ #category : #'accessing - defaults' }
WorldMap >> defaultContainer [
	| controller canvas |
	controller := RSCanvasController new.
	controller configuration maxScale: 100.
	canvas := RSCanvas new.
	canvas inspectorContext: RSEmptyContextInteraction new.
	^ canvas @ controller
]

{ #category : #'as yet unclassified' }
WorldMap >> displayClickableRegion: aPath withColor: aColor onCanvas: aCanvas [

	| country |
	
	country := RSSVGPath new.
	country svgPath: aPath.
	country model: aPath.
	country border: (RSBorder new width: 0.5; color: Color black).
	country when: RSMouseClick send: #processClick: to: self.
	country color: aColor.
	
	aCanvas add: country
]

{ #category : #'as yet unclassified' }
WorldMap >> displayNonClickableRegion: aPath withColor: aColor onCanvas: aCanvas [

	| country |
	
	country := RSSVGPath new.
	country svgPath: aPath.
	country model: aPath.
	country border: (RSBorder new width: 0.5; color: Color black).
	country color: aColor.
	
	aCanvas add: country
]

{ #category : #'as yet unclassified' }
WorldMap >> processClick: evt [
	| shape |
	shape := evt shape.
	shape model inspect.
]

{ #category : #hooks }
WorldMap >> renderIn: aCanvas [

	self terrains do: [ :each |
		self
			displayClickableRegion: each
			withColor: Color random
			onCanvas: aCanvas ].
	
	self
		displayNonClickableRegion: CountrySVG nonCoveredRegions
		withColor: Color gray
		onCanvas: aCanvas.
]

{ #category : #'as yet unclassified' }
WorldMap >> terrains [

	"^ CountrySVG class definedSelectors collect: [ :each | CountrySVG perform: each ]."
	
	^ {
		CountrySVG subSaharanAfrica .
		CountrySVG latinAmerica .
		CountrySVG maghreb .
		CountrySVG europe .
		CountrySVG southEastAsia .
		CountrySVG pacific .
		CountrySVG madagascarAndIndianOcean
	}
]
