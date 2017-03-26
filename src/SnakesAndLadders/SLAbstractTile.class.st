Class {
	#name : #SLAbstractTile,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLAbstractTile >> position [
	^ position
]

{ #category : #accessing }
SLAbstractTile >> position: anInteger [ 
	position := anInteger
]

{ #category : #printing }
SLAbstractTile >> printInsideOn: aStream [

	aStream << position printString.

]

{ #category : #printing }
SLAbstractTile >> printOn: aStream [

	aStream << '['.
	self printInsideOn: aStream.
	aStream << ']'
]
