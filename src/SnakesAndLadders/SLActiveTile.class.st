Class {
	#name : #SLActiveTile,
	#superclass : #SLAbstractTile,
	#instVars : [
		'targetTile'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLActiveTile >> acceptPlayer: aPlayer [
	
	targetTile acceptPlayer: aPlayer 
	
]

{ #category : #accessing }
SLActiveTile >> to: aTile [

	targetTile := aTile
]
