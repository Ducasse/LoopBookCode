Class {
	#name : #SLSnakeTile,
	#superclass : #SLActiveTile,
	#category : #SnakesAndLadders
}

{ #category : #printing }
SLSnakeTile >> printOn: aStream [
	aStream << '['.
	aStream << targetTile position printString << '<-'.
	aStream << position printString.
	aStream << ']'
]
