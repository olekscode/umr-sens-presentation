Class {
	#name : #SENSColor,
	#superclass : #Object,
	#category : #'SENS-Presentation-Roassal Visualizations'
}

{ #category : #'named colors' }
SENSColor class >> blue [

	^ Color fromHexString: '4c9196'
]

{ #category : #'domain colors' }
SENSColor class >> ciradResearcherColor [
	
	^ self green
]

{ #category : #utilities }
SENSColor class >> colorValue: aValue min: minValue max: maxValue baseColor: baseColor [
	
	| lightColor darkColor alpha |
	alpha := (aValue - minValue) / (maxValue - minValue).
	
	"lightColor := baseColor alphaMixed: 0.1 with: Color white."
	"darkColor := baseColor alphaMixed: 0.4 with: Color black."
	
	lightColor := Color white.
	darkColor := baseColor.
	
	^ darkColor alphaMixed: alpha with: lightColor.
	
	"

	^ Color
		r: baseColor red * alpha
		g: baseColor green * alpha
		b: baseColor blue * alpha"
]

{ #category : #'named colors' }
SENSColor class >> darkGreen [

	^ Color fromHexString: '597244'
]

{ #category : #'named colors' }
SENSColor class >> green [

	^ Color fromHexString: '1da22d'
]

{ #category : #'domain colors' }
SENSColor class >> inactiveGrayColor [
	
	^ self lightGray
]

{ #category : #'domain colors' }
SENSColor class >> irdResearcherColor [
	
	^ self lightGreen
]

{ #category : #'named colors' }
SENSColor class >> lightBlue [

	^ Color fromHexString: '9abfcf'
]

{ #category : #'named colors' }
SENSColor class >> lightGray [

	^ Color fromHexString: 'dee2df'
]

{ #category : #'named colors' }
SENSColor class >> lightGreen [

	^ Color fromHexString: '98be2a'
]

{ #category : #'domain colors' }
SENSColor class >> mapColor [
	
	^ self green
]

{ #category : #'named colors' }
SENSColor class >> marine [

	^ Color fromHexString: 'a3ccbe'
]

{ #category : #'named colors' }
SENSColor class >> orange [

	^ Color fromHexString: 'ec944f'
]

{ #category : #'domain colors' }
SENSColor class >> phdStudentColor [
	
	^ self pink
]

{ #category : #'named colors' }
SENSColor class >> pink [

	^ Color fromHexString: 'd90375'
]

{ #category : #'domain colors' }
SENSColor class >> upvmResearcherColor [
	
	^ self darkGreen
]

{ #category : #'named colors' }
SENSColor class >> yellow [

	^ Color fromHexString: 'f2d34b'
]
