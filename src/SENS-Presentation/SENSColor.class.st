Class {
	#name : #SENSColor,
	#superclass : #Object,
	#category : #'SENS-Presentation-Roassal Visualizations'
}

{ #category : #'as yet unclassified' }
SENSColor class >> colorValue: aValue min: minValue max: maxValue baseColor: baseColor [
	
	| alpha |
	alpha := (aValue - minValue) / (maxValue - minValue).
	alpha := 1 - alpha.

	^ Color
		r: baseColor red * alpha
		g: baseColor green * alpha
		b: baseColor blue * alpha
]
