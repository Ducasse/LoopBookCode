Class {
	#name : #SLTile,
	#superclass : #Object,
	#instVars : [
		'position',
		'players'
	],
	#category : #SnakesAndLadders
}

{ #category : #adding }
SLTile >> addPlayer: aPlayer [	
	players add: aPlayer
]

{ #category : #initialization }
SLTile >> initialize [
	players := OrderedCollection new. 
]

{ #category : #accessing }
SLTile >> players [ 

	^ players
]

{ #category : #accessing }
SLTile >> position: anInteger [ 
	position := anInteger
]

{ #category : #printing }
SLTile >> printOn: aStream [

	aStream << '['.
	aStream << position printString.
	players do: [ :aPlayer | aPlayer printOn: aStream ].
	aStream << ']'
]
