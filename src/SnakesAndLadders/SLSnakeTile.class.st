Class {
	#name : #SLSnakeTile,
	#superclass : #SLActiveTile,
	#category : #SnakesAndLadders
}

{ #category : #printing }
SLSnakeTile >> printOn: aStream [
	aStream << '['.
	targetTile position printOn: aStream. 
	aStream << '<-'.
	position printOn: aStream.
	aStream << ']'
]
