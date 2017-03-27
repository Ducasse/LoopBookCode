Class {
	#name : #SLGame,
	#superclass : #Object,
	#instVars : [
		'tiles'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLGame >> addPlayer: aPlayer [
	aPlayer position: 1.
	(tiles at: 1) addPlayer: aPlayer
]

{ #category : #move }
SLGame >> movePlayer: aPlayer distance: anInteger [ 
	| targetTile | 
	targetTile := self tileFor: aPlayer atDistance: anInteger.
	(self tileOfPlayer: aPlayer) remove: aPlayer.
	targetTile addPlayer: aPlayer. 
	aPlayer position: targetTile position. 
]

{ #category : #printing }
SLGame >> printOn: aStream [

	tiles do: [ :aTile | 
		aStream << aTile printString ]
]

{ #category : #accessing }
SLGame >> tileAt: aNumber [

	^ tiles at: aNumber
]

{ #category : #query }
SLGame >> tileFor: aSLPlayer atDistance: anInteger [ 
	^ tiles at: aSLPlayer position + anInteger
]

{ #category : #accessing }
SLGame >> tileNumber [
	
	^ tiles size
]

{ #category : #accessing }
SLGame >> tileNumber: aNumber [

	tiles := Array new: aNumber. 
	1 to:	tiles size do: [ :i | 
		tiles at: i put: (SLTile new position: i) ].
]

{ #category : #queries }
SLGame >> tileOfPlayer: aSLPlayer [ 
	^ tiles at: aSLPlayer position
]
