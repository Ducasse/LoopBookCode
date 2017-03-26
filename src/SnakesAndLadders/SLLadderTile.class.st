Class {
	#name : #SLLadderTile,
	#superclass : #SLActiveTile,
	#category : #SnakesAndLadders
}

{ #category : #printing }
SLLadderTile >> printOn: aStream [
	aStream << '['.
 	position printOn: aStream.
	aStream << '->'.
	targetTile position printOn: aStream.
	aStream << ']'
]
