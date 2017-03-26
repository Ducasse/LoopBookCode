Class {
	#name : #SLSnakeTile,
	#superclass : #SLActiveTile,
	#category : #SnakesAndLadders
}

{ #category : #printing }
SLSnakeTile >> printInsideOn: aStream [

	targetTile position printOn: aStream. 
	aStream << '<-'.
	super printInsideOn: aStream
	
]
