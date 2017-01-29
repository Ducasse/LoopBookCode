Class {
	#name : #SLLadderTile,
	#superclass : #SLActiveTile,
	#category : #SnakesAndLadders
}

{ #category : #testing }
SLLadderTile >> isLadder [

	^ true
]

{ #category : #printing }
SLLadderTile >> printOnInside: aStream [ 
	
	super printOnInside: aStream.
	aStream nextPutAll: '->', targetTile position printString
]
