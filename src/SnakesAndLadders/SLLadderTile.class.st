Class {
	#name : #SLLadderTile,
	#superclass : #SLActiveTile,
	#category : #SnakesAndLadders
}

{ #category : #printing }
SLLadderTile >> printInsideOn: aStream [

	super printInsideOn: aStream.
	aStream << '->'.
	(targetTile position printOn: aStream).
]
