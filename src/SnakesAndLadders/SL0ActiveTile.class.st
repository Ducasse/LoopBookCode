Class {
	#name : #SL0ActiveTile,
	#superclass : #SL0AbstractTile,
	#instVars : [
		'targetTile'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SL0ActiveTile >> enter: aPlayer [
	"Instead of entering the current tile, the player is in fact entering the target one."
	targetTile enter: aPlayer
]

{ #category : #accessing }
SL0ActiveTile >> to: aTile [

	targetTile := aTile
]
