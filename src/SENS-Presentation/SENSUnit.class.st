Class {
	#name : #SENSUnit,
	#superclass : #Object,
	#instVars : [
		'researchers',
		'students',
		'supportStaff',
		'projects',
		'themes',
		'institutes',
		'terrains'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #defaults }
SENSUnit class >> defaultInstitutes [

	^ #(CIRAD IRD UPVM) collect: [ :each |
		SENSInstitute named: each ].
]

{ #category : #defaults }
SENSUnit class >> defaultProjects [

	^ { 
		'Ariser' .
		'AFD/GRET' .
		'Terramaz' .
		'VARUNA' .
		'Makis'
	} collect: [ :each | SENSProject titled: each ].
]

{ #category : #defaults }
SENSUnit class >> defaultTerrains [

	^ { 
		'Africa' .
		'Latin America' .
		'South-East Asia' .
		'Madagascar and Indian Ocean' .
		'Pacific' .
		'France/Europe' .
		'Maghreb'
	} collect: [ :each | SENSTerrain named: each ].
]

{ #category : #defaults }
SENSUnit class >> defaultThemes [

	^ { 
		'Dynamique des pratiques, des appartenances et des paysages' .
		'Ethique et justice environnementales' .
		'Gouvernance de la natureet des ressources' .
		'Construction et usages des savoirs sur l’environnement'
	} collect: [ :each | SENSTheme titled: each ].
]

{ #category : #initialization }
SENSUnit >> initialize [

	super initialize.
	
	institutes := self class defaultInstitutes.
	projects := self class defaultProjects.
	themes := self class defaultThemes.
	terrains := self class defaultTerrains.
	
	supportStaff := OrderedCollection new.
	researchers := OrderedCollection new.
	students := OrderedCollection new.
]

{ #category : #accessing }
SENSUnit >> institutes [

	^ institutes
]

{ #category : #accessing }
SENSUnit >> projects [

	^ projects
]

{ #category : #accessing }
SENSUnit >> researchers [

	^ researchers
]

{ #category : #accessing }
SENSUnit >> students [

	^ students
]

{ #category : #accessing }
SENSUnit >> supportStaff [

	^ supportStaff
]

{ #category : #accessing }
SENSUnit >> themes [

	^ themes
]
