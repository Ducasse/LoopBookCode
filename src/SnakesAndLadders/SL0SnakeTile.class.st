Class {
	#name : #SL0SnakeTile,
	#superclass : #SL0ActiveTile,
	#category : #SnakesAndLadders
}

{ #category : #testing }
SL0SnakeTile >> isSnake [

	^ true
]

{ #category : #testing }
SL0SnakeTile >> printOnInside: aStream [ 
	aStream nextPutAll: targetTile position printString,  '<-'.
	super printOnInside: aStream.
	
]
