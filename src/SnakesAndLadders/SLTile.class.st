Class {
	#name : #SLTile,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLTile >> position: anInteger [ 
	position := anInteger
]

{ #category : #printing }
SLTile >> printOn: aStream [

	aStream << '['.
	aStream << position printString.
	aStream << ']'
]
