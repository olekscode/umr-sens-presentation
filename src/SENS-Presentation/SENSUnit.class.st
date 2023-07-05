Class {
	#name : #SENSUnit,
	#superclass : #Object,
	#instVars : [
		'members',
		'projects',
		'themes',
		'institutes',
		'terrains',
		'fields'
	],
	#category : #'SENS-Presentation-Model'
}

{ #category : #defaults }
SENSUnit class >> defaultFields [

	^ { 
		SENSField new
			shortName: 'SVE';
			name: 'Sciences du Vivant et de l''Environnement';
			yourself .
			
		SENSField new
			shortName: 'SHS';
			name: 'Sciences Humaines et Sociales';
			yourself .
			
		SENSField new
			shortName: 'ST';
			name: 'Sciences et Technologies';
			yourself .
			
		SENSField new
			shortName: 'J';
			name: '';
			yourself .
	}
]

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
			svgPath: CountrySVG africa;
			yourself .
			
		SENSTerrain new
			name: 'Latin America';
			svgPath: CountrySVG latinAmerica;
			yourself .
			
		SENSTerrain new
			name: 'South-East Asia';
			svgPath: CountrySVG southEastAsia;
			yourself .
			
		"SENSTerrain new
			name: 'Madagascar and Indian Ocean';
			svgPath: CountrySVG madagascarAndIndianOcean;
			yourself ."
			
		SENSTerrain new
			name: 'Pacific';
			svgPath: CountrySVG pacific;
			yourself .
			
		SENSTerrain new
			name: 'France/Europe';
			svgPath: CountrySVG europe;
			yourself .
			
		"SENSTerrain new
			name: 'Maghreb';
			svgPath: CountrySVG maghreb;
			yourself"
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
	fields := self class defaultFields.
	
	terrains do: [ :each | each researchUnit: self ].
	
	"This must appear after projects, terrains, etc. are loaded"
	members := OrderedCollection new.
	members addAll: self loadMembers.
	members addAll: self loadPhdStudents.
]

{ #category : #inspector }
SENSUnit >> inspectorFields [
	<inspectorPresentationOrder: 3 title: 'Fields'>
	
	| fieldsOfInterest |
	fieldsOfInterest := fields reject: [ :each | each shortName = 'J' ].
	^ (SENSFieldsChart forFields: fieldsOfInterest) asPresenter
]

{ #category : #inspector }
SENSUnit >> inspectorFieldsContext: aContext [
	aContext withoutEvaluator
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

{ #category : #loading }
SENSUnit >> isSupportStaffInData: aRow [
	"A helper method that defines a condition to check if the reow of data represents a team member who is a support staff"

	^ ((aRow at: 'Field') = 'J') or: [
			(aRow at: 'Grade') isNotNil and: [
				(aRow at: 'Grade') beginsWith: 'NonCadre' ] ]
]

{ #category : #loading }
SENSUnit >> loadMembers [

	| file df |
	
	file := SENSGitBridge dataPath / 'members.csv'.
	df := DataFrame readFromCsv: file.
	
	"Joining Africas"
	df column: 'Africa' put: ((df columns: #('Africa' 'Madagascar and Indian Ocean' 'Maghreb')) rows collect: [ :row | row anySatisfy: [ :each | each ] ]).
	
	df removeColumns: #('Madagascar and Indian Ocean' 'Maghreb').
	
	^ df rows collect: [ :row |
		(self isSupportStaffInData: row)
			ifTrue: [ self loadStaffMemberFromRow: row ]
			ifFalse: [ self loadResearcherFromRow: row ] ].
]

{ #category : #loading }
SENSUnit >> loadPhdStudentFromRow: row [
	
	| student theirTerrains theirInstitute |
	
	theirInstitute := institutes
		detect: [ :institute | row at: institute name ]
		ifNone: [ nil ].
		
	theirTerrains := terrains select: [ :terrain | row at: terrain name ].
		
	student := SENSPhdStudent new
		firstName: (row at: 'First Name');
		lastName: (row at: 'Last Name');
		institute: theirInstitute;
		terrains: theirTerrains;
		yourself.
			
	theirTerrains do: [ :terrain | terrain members add: student ].
	theirInstitute ifNotNil: [ theirInstitute members add: student ].
	
	^ student
]

{ #category : #loading }
SENSUnit >> loadPhdStudents [

	| file df |
	file := SENSGitBridge dataPath / 'phd.csv'.
	df := DataFrame readFromCsv: file.
	
	"Joining Africas"
	df column: 'Africa' put: ((df columns: #('Africa' 'Madagascar and Indian Ocean' 'Maghreb')) rows collect: [ :row | row anySatisfy: [ :each | each ] ]).
	
	df removeColumns: #('Madagascar and Indian Ocean' 'Maghreb').
	
	^ df rows collect: [ :row | self loadPhdStudentFromRow: row ]
]

{ #category : #loading }
SENSUnit >> loadResearcherFromRow: row [
	
	| researcher theirTerrains theirInstitute theirField |
	
	theirInstitute := institutes
		detect: [ :institute | row at: institute name ]
		ifNone: [ nil ].
		
	theirField := fields
		detect: [ :field | (row at: 'Field') = field shortName ]
		ifNone: [ nil ].
		
	theirTerrains := terrains select: [ :terrain | row at: terrain name ].
		
	researcher := SENSResearcher new
		firstName: (row at: 'First Name');
		lastName: (row at: 'Last Name');
		institute: theirInstitute;
		terrains: theirTerrains;
		field: theirField;
		yourself.
			
	theirTerrains do: [ :terrain | terrain members add: researcher ].
	theirInstitute ifNotNil: [ theirInstitute members add: researcher ].
	theirField ifNotNil: [ theirField members add: researcher ].
	
	^ researcher
]

{ #category : #loading }
SENSUnit >> loadStaffMemberFromRow: row [

	| member theirInstitute theirField |

	theirInstitute := institutes
		detect: [ :institute | row at: institute name ]
		ifNone: [ nil ].
		
	theirField := fields
		detect: [ :field | (row at: 'Field') = field shortName ]
		ifNone: [ nil ].

	member := SENSSupportStaff new
		firstName: (row at: 'First Name');
		lastName: (row at: 'Last Name');
		institute: theirInstitute;
		field: theirField;
		yourself.
		
	theirInstitute ifNotNil: [ theirInstitute members add: member ].
	theirField ifNotNil: [ theirField members add: member ].
	^ member
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
