Class {
	#name : #SLLadderTile,
	#superclass : #SLActiveTile,
	#category : #SnakesAndLadders
}

{ #category : #printing }
SLLadderTile >> printOn: aStream [
	aStream << '['.
	aStream << position printString.
	aStream << '->' << targetTile position printString.
	aStream << ']'
]
