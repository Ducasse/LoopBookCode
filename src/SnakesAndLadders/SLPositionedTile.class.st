Class {
	#name : #SLPositionedTile,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #SnakesAndLadders
}

{ #category : #'in/out' }
SLPositionedTile >> enter: aPlayer [

	aPlayer position: position.
]

{ #category : #testing }
SLPositionedTile >> isLadder [ 

	^ false
]

{ #category : #testing }
SLPositionedTile >> isSnake [

	^ false
]

{ #category : #testing }
SLPositionedTile >> isSnaker [

	^ false
]

{ #category : #'in/out' }
SLPositionedTile >> leave: aPlayer [
	"subclasses may redefine me to notify, log or whatever the fact that a player is leaving its current position"
	
]

{ #category : #accessing }
SLPositionedTile >> position [
	^ position
]

{ #category : #accessing }
SLPositionedTile >> position: anObject [
	position := anObject
]

{ #category : #printing }
SLPositionedTile >> printOn: aStream [

	aStream << '['.
	self printOnInside: aStream.
	aStream << ']'
]

{ #category : #printing }
SLPositionedTile >> printOnInside: aStream [


	aStream << position printString.

]
