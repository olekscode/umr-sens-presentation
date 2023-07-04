Class {
	#name : #SENSColor,
	#superclass : #Object,
	#category : #'SENS-Presentation-Roassal Visualizations'
}

{ #category : #'as yet unclassified' }
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

{ #category : #'accessing - defaults' }
SENSColor class >> darkGreen [

	^ Color fromHexString: '597244'
]

{ #category : #'accessing - defaults' }
SENSColor class >> green [

	^ Color fromHexString: '1da22d'
]

{ #category : #'accessing - defaults' }
SENSColor class >> lightGreen [

	^ Color fromHexString: '98be2a'
]

{ #category : #'accessing - defaults' }
SENSColor class >> pink [

	^ Color fromHexString: 'd90375'
]
