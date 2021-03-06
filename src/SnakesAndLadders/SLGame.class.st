"
I'm an implementation of Snakes and Ladders game. 

```
| jill jack game |
Transcript open.
game := SLGame new 
			tileNumber: 12; 
			setLadderFrom: 2 to: 6;
			setLadderFrom: 7 to: 9;
			setSnakeFrom: 11 to: 5.
jack := SLPlayer new name: 'Jack'.
jill := SLPlayer new name: 'Jill'.
game addPlayer: jill.
game addPlayer: jack.
game play
```
"
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
SLGame >> play [

	Transcript show: self; cr.
	[ self isOver not ] whileTrue: [
		self playOneStepWithRoll: 6 atRandom ] 
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
