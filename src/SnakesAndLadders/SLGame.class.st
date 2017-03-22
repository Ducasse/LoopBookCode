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
	
	(tiles at: 1) addPlayer: aPlayer
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
