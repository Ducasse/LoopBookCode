Class {
	#name : #SL0AbstractTile,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #SnakesAndLadders
}

{ #category : #'in/out' }
SL0AbstractTile >> enter: aPlayer [

	aPlayer position: position.
]

{ #category : #testing }
SL0AbstractTile >> isLadder [ 

	^ false
]

{ #category : #testing }
SL0AbstractTile >> isSnake [

	^ false
]

{ #category : #'in/out' }
SL0AbstractTile >> leave: aPlayer [
	"subclasses may redefine me to notify, log or whatever the fact that a player is leaving its current position"
	
]

{ #category : #accessing }
SL0AbstractTile >> position [
	^ position
]

{ #category : #accessing }
SL0AbstractTile >> position: anObject [
	position := anObject
]

{ #category : #printing }
SL0AbstractTile >> printOn: aStream [

	aStream << '['.
	self printOnInside: aStream.
	aStream << ']'
]

{ #category : #printing }
SL0AbstractTile >> printOnInside: aStream [


	aStream << position printString.

]
