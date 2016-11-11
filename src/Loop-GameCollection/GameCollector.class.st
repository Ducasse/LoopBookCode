Class {
	#name : #GameCollector,
	#superclass : #Object,
	#instVars : [
		'games'
	],
	#category : #'Loop-GameCollection'
}

{ #category : #adding }
GameCollector >> addGame: aGame [

	games add: aGame
]

{ #category : #adding }
GameCollector >> findMatchingTitle: aString [

	^ games select: [ :each | each matches: aString ]
]

{ #category : #initialize }
GameCollector >> initialize [

	super initialize.
	games := OrderedCollection new. 
]
