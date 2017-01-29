Class {
	#name : #SLAbstractTile,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #SnakesAndLadders
}

{ #category : #'in/out' }
SLAbstractTile >> enter: aPlayer [

	aPlayer position: position.
]

{ #category : #testing }
SLAbstractTile >> isLadder [ 

	^ false
]

{ #category : #testing }
SLAbstractTile >> isSnake [

	^ false
]

{ #category : #testing }
SLAbstractTile >> isSnaker [

	^ false
]

{ #category : #'in/out' }
SLAbstractTile >> leave: aPlayer [
	"subclasses may redefine me to notify, log or whatever the fact that a player is leaving its current position"
	
]

{ #category : #accessing }
SLAbstractTile >> position [
	^ position
]

{ #category : #accessing }
SLAbstractTile >> position: anObject [
	position := anObject
]

{ #category : #printing }
SLAbstractTile >> printOn: aStream [

	aStream << '['.
	self printOnInside: aStream.
	aStream << ']'
]

{ #category : #printing }
SLAbstractTile >> printOnInside: aStream [


	aStream << position printString.

]
