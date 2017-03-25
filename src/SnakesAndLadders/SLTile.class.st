Class {
	#name : #SLTile,
	#superclass : #SLAbstractTile,
	#instVars : [
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

{ #category : #printing }
SLTile >> printOn: aStream [

	aStream << '['.
	aStream << position printString.
	players do: [ :aPlayer | aPlayer printOn: aStream ].
	aStream << ']'
]

{ #category : #'add/remove' }
SLTile >> remove: aPlayer [ 
	players remove: aPlayer
]

{ #category : #adding }
SLTile >> removePlayer: aPlayer [
	players remove: aPlayer
]
