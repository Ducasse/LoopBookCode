Class {
	#name : #SLActiveTile,
	#superclass : #SLAbstractTile,
	#instVars : [
		'targetTile'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLActiveTile >> enter: aPlayer [
	"Instead of entering the current tile, the player is in fact entering the target one."
	self target enter: aPlayer
]

{ #category : #accessing }
SLActiveTile >> to: aTile [

	targetTile := aTile
]
