Class {
	#name : #SLGame,
	#superclass : #Object,
	#instVars : [
		'tiles',
		'players',
		'turns'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLGame >> addPlayer: aPlayer [
	aPlayer position: 1.
	players add: aPlayer. 
	(tiles at: 1) addPlayer: aPlayer
]

{ #category : #testing }
SLGame >> canMoveToPosition: aNumber [
	"We can only move if we stay within the game.
	This implies that the player should draw an exact number to land on the finish tile."
	^ aNumber <= tiles size
]

{ #category : #accessing }
SLGame >> currentPlayer [

	| rest |
	rest := (turns \\ players size).
	^ players at: (rest isZero
		ifTrue: [ players size ]
		ifFalse: [ rest ])	
]

{ #category : #initialize }
SLGame >> initialize [
	players := OrderedCollection new. 
	turns := 0
]

{ #category : #testing }
SLGame >> isOver [

	^ players anySatisfy: [ :each | each position = tiles size ]
]

{ #category : #move }
SLGame >> movePlayer: aPlayer distance: anInteger [ 
	| targetTile | 
	targetTile := self tileFor: aPlayer atDistance: anInteger.
	(self tileOfPlayer: aPlayer) releasePlayer: aPlayer.
	targetTile acceptPlayer: aPlayer. 
	
]

{ #category : #play }
SLGame >> playOneStepWithRoll: aNumber [
		
	| currentPlayer |
	turns := turns + 1.
	currentPlayer := self currentPlayer. 
	Transcript show: currentPlayer printString, 'drew ', aNumber printString, ': '. 
	(self canMoveToPosition: currentPlayer position + aNumber)
		ifTrue: [ self movePlayer: currentPlayer distance: aNumber ].
	Transcript show: self; cr.
		
]

{ #category : #printing }
SLGame >> printOn: aStream [

	tiles do: [ :aTile | 
		aStream << aTile printString ]
]

{ #category : #initialize }
SLGame >> setLadderFrom: aSourcePosition to: aTargetPosition [

	tiles 
		at: aSourcePosition 
		put: (SLLadderTile new 
					position: aSourcePosition ; 
					to: (tiles at: aTargetPosition) ; yourself)
]

{ #category : #initialize }
SLGame >> setSnakeFrom: aSourcePosition to: aTargetPosition [

	tiles 
		at: aSourcePosition 
		put: (SLSnakeTile new 
					position: aSourcePosition; 
					to: (tiles at: aTargetPosition) ; yourself)
]

{ #category : #accessing }
SLGame >> tileAt: aNumber [

	^ tiles at: aNumber
]

{ #category : #query }
SLGame >> tileFor: aSLPlayer atDistance: anInteger [ 
	^ tiles at: aSLPlayer position + anInteger
]

{ #category : #accessing }
SLGame >> tileNumber [
	
	^ tiles size
]

{ #category : #accessing }
SLGame >> tileNumber: aNumber [

	tiles := Array new: aNumber. 
	1 to:	tiles size do: [ :i | 
		tiles at: i put: (SLTile new position: i) ].
]

{ #category : #queries }
SLGame >> tileOfPlayer: aSLPlayer [ 
	^ tiles at: aSLPlayer position
]

{ #category : #private }
SLGame >> turns: aNumber [
	turns := aNumber
]
