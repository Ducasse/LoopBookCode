"
Simple holder of a game collection
"
Class {
	#name : #GameCollector,
	#superclass : #Object,
	#instVars : [
		'games',
		'currentId'
	],
	#classInstVars : [
		'current'
	],
	#category : #'Loop-GameCollection'
}

{ #category : #example }
GameCollector class >> addKlonoa [
	"self addKlonoa"
	^ self current addGame: (GameItem exampleKlonoa)
]

{ #category : #'instance creation' }
GameCollector class >> current [

	^ current ifNil: [  current := self new ]
]

{ #category : #neojson }
GameCollector class >> neoJsonMapping: aMapper [

	aMapper for: self do: [ :mapping |
		mapping mapInstVars: #(games)]
]

{ #category : #adding }
GameCollector >> addGame: aGame [

	games add: (aGame id: self nextId; yourself)
]

{ #category : #adding }
GameCollector >> findMatchingTitle: aString [

	^ games select: [ :each | '*', aString, '*' match: each title ]
]

{ #category : #adding }
GameCollector >> games [ 

	^ games
]

{ #category : #initialize }
GameCollector >> initialize [

	super initialize.
	currentId := 0.
	games := OrderedCollection new. 
]

{ #category : #initialize }
GameCollector >> nextId [
	
	currentId := currentId + 1.
	^ currentId 
]
