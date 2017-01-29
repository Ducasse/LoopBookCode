Class {
	#name : #SLSnakeTile,
	#superclass : #SLActiveTile,
	#category : #SnakesAndLadders
}

{ #category : #testing }
SLSnakeTile >> isSnake [

	^ true
]

{ #category : #testing }
SLSnakeTile >> printOnInside: aStream [ 
	aStream nextPutAll: targetPosition printString,  '<-'.
	super printOnInside: aStream.
	
]
