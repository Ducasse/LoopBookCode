Class {
	#name : #SL0LadderTile,
	#superclass : #SL0ActiveTile,
	#category : #SnakesAndLadders
}

{ #category : #testing }
SL0LadderTile >> isLadder [

	^ true
]

{ #category : #printing }
SL0LadderTile >> printOnInside: aStream [ 
	
	super printOnInside: aStream.
	aStream nextPutAll: '->', targetTile position printString
]
