Class {
	#name : #SLTile,
	#superclass : #SLAbstractTile,
	#instVars : [
		'players'
	],
	#category : #SnakesAndLadders
}

{ #category : #'enter/leave' }
SLTile >> acceptPlayer: aPlayer [

	self addPlayer: aPlayer. 
	aPlayer position: self position. 
]

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
SLTile >> printInsideOn: aStream [

	super printInsideOn: aStream.
	players do: [ :aPlayer | aPlayer printOn: aStream ].

]

{ #category : #'enter/leave' }
SLTile >> releasePlayer: aPlayer [
	self removePlayer: aPlayer
]

{ #category : #'add/remove' }
SLTile >> remove: aPlayer [ 
	players remove: aPlayer
]

{ #category : #adding }
SLTile >> removePlayer: aPlayer [
	players remove: aPlayer
]
