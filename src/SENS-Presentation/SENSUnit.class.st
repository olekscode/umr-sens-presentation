Class {
	#name : #SENSUnit,
	#superclass : #Object,
	#instVars : [
		'members',
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
		SENSTerrain new
			name: 'Africa';
			svgPath: CountrySVG subSaharanAfrica;
			yourself .
			
		SENSTerrain new
			name: 'Latin America';
			svgPath: CountrySVG latinAmerica;
			yourself .
			
		SENSTerrain new
			name: 'South-East Asia';
			svgPath: CountrySVG southEastAsia;
			yourself .
			
		SENSTerrain new
			name: 'Madagascar and Indian Ocean';
			svgPath: CountrySVG madagascarAndIndianOcean;
			yourself .
			
		SENSTerrain new
			name: 'Pacific';
			svgPath: CountrySVG pacific;
			yourself .
			
		SENSTerrain new
			name: 'France/Europe';
			svgPath: CountrySVG europe;
			yourself .
			
		SENSTerrain new
			name: 'Maghreb';
			svgPath: CountrySVG maghreb;
			yourself
	}
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

{ #category : #defaults }
SENSUnit class >> loadMembers [

	| file df supportStaffCondition supportStaff researchers |
	file := SENSGitBridge dataPath / 'members.csv'.
	df := DataFrame readFromCsv: file.
	
	supportStaffCondition := [ :row |
		((row at: 'Field') = 'J') or: [
			(row at: 'Grade') isNotNil and: [
				(row at: 'Grade') beginsWith: 'NonCadre' ] ] ].
	
	supportStaff := (df select: supportStaffCondition) rows collect: [ :row |
		SENSSupportStaff new
			firstName: (row at: 'First Name');
			lastName: (row at: 'Last Name');
			institute: (#(CIRAD IRD UPVM) detect: [ :each | row at: each ] ifNone: [ nil ]);
			yourself ].
		
	researchers := (df reject: supportStaffCondition) rows collect: [ :row |
		SENSResearcher new
			firstName: (row at: 'First Name');
			lastName: (row at: 'Last Name');
			institute: (#(CIRAD IRD UPVM) detect: [ :each | row at: each ] ifNone: [ nil ]);
			yourself ].
		
	^ supportStaff, researchers
]

{ #category : #'as yet unclassified' }
SENSUnit class >> openWorldMap [
	<script>
	
	| terrains |
	terrains := self defaultTerrains.
	(SENSTerrainMap forTerrains: terrains) open
]

{ #category : #initialization }
SENSUnit >> initialize [

	super initialize.
	
	institutes := self class defaultInstitutes.
	projects := self class defaultProjects.
	themes := self class defaultThemes.
	terrains := self class defaultTerrains.
	members := self class loadMembers.
]

{ #category : #inspector }
SENSUnit >> inspectorTerrainsMap [
	<inspectorPresentationOrder: 1 title: 'Terrains Map'>
	^ (SENSTerrainMap forTerrains: terrains) asPresenter
]

{ #category : #inspector }
SENSUnit >> inspectorTerrainsMapContext: aContext [
	aContext withoutEvaluator
]

{ #category : #inspector }
SENSUnit >> inspectorThemes [
	<inspectorPresentationOrder: 2 title: 'Themes'>
	^ (SENSThemesChart forThemes: themes) asPresenter
]

{ #category : #inspector }
SENSUnit >> inspectorThemesContext: aContext [
	aContext withoutEvaluator
]

{ #category : #accessing }
SENSUnit >> institutes [

	^ institutes
]

{ #category : #accessing }
SENSUnit >> members [

	^ members
]

{ #category : #accessing }
SENSUnit >> projects [

	^ projects
]

{ #category : #accessing }
SENSUnit >> researchers [

	^ members select: [ :each | each isResearcher ]
]

{ #category : #accessing }
SENSUnit >> students [

	^ members select: [ :each | each isPhdStudent ]
]

{ #category : #accessing }
SENSUnit >> supportStaff [

	^ members select: [ :each | each isSupportStaff ]
]

{ #category : #accessing }
SENSUnit >> terrains [

	^ terrains
]

{ #category : #accessing }
SENSUnit >> themes [

	^ themes
]
