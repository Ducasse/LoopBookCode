"
| jill jack game |
game := SLGame new tileNumber: 12.
jack := SLPlayer new name: 'Jack'.
jill := SLPlayer new name: 'Jill'.
game addPlayer: jill. ""first player"" 
game addPlayer: jack. 
game play


[1<Jill><Jack>][2][3][4][5][6][7][8][9][10][11][12]
<Jill>drew 6: [1<Jack>][2][3][4][5][6][7<Jill>][8][9][10][11][12]
<Jack>drew 6: [1][2][3][4][5][6][7<Jill><Jack>][8][9][10][11][12]
<Jill>drew 3: [1][2][3][4][5][6][7<Jack>][8][9][10<Jill>][11][12]
<Jack>drew 4: [1][2][3][4][5][6][7][8][9][10<Jill>][11<Jack>][12]
<Jill>drew 4: [1][2][3][4][5][6][7][8][9][10<Jill>][11<Jack>][12]
<Jack>drew 2: [1][2][3][4][5][6][7][8][9][10<Jill>][11<Jack>][12]
<Jill>drew 1: [1][2][3][4][5][6][7][8][9][10][11<Jack><Jill>][12]
<Jack>drew 4: [1][2][3][4][5][6][7][8][9][10][11<Jack><Jill>][12]
<Jill>drew 1: [1][2][3][4][5][6][7][8][9][10][11<Jack>][12<Jill>]



| jill jack game |
game := SLGame new tileNumber: 12.
game 	setLadderFrom: 2 to: 6;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
jack := SLPlayer new name: 'Jack'.
jill := SLPlayer new name: 'Jill'.
game addPlayer: jill. ""first player"" 
game addPlayer: jack. 
game play

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

{ #category : #example }
SLGame class >> fullGame [
	<sampleInstance>
	
	^ SLGame new 
		tileNumber: 12; 
		setLadderFrom: 2 to: 6;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
]

{ #category : #adding }
SLGame >> addPlayer: aPlayer [
	players add: aPlayer. 
	aPlayer position: 1.
	(tiles at: 1) addPlayer: aPlayer
]

{ #category : #testing }
SLGame >> canMoveTo: aNumber [
	"We can only move if we stay within the game.
	This implies that the player should draw an exact number to land on the finish tile."
	^ (aNumber <= tiles size) 
]

{ #category : #playing }
SLGame >> currentPlayer [

	| rest |
	rest := (turns \\ players size). 
	^ players at: (rest isZero 
		ifTrue: [ players size ]
		ifFalse: [ rest ]) 
	
]

{ #category : #initialization }
SLGame >> initialize [

	players := OrderedCollection new. 
	turns := 0.
]

{ #category : #initialization }
SLGame >> initializeDefaultTiles [

	1 to: tiles size do: [ :i | 
			tiles at: i put: (SLPassiveTile new position: i) ].
	self setStartTile.
	self setEndTile.
]

{ #category : #testing }
SLGame >> isOver [

	^ players anySatisfy: [ :each | each position = tiles size ]
]

{ #category : #playing }
SLGame >> moveCurrentPlayer: aNumber [
	"Pay attention that the argument aNumber should be valid. For example, the checking logic for landing exactly on the end tile is not done here."
	| p targetTile |
	p := self currentPlayer.
	targetTile := self tileFor: p atDistance: aNumber.
	(self tileOfPlayer: p) leave: p.
	targetTile enter: p. 
 
]

{ #category : #playing }
SLGame >> play [

	Transcript show: self; cr.
	[ self isOver not ] whileTrue: [
		self playOneStepWithRoll: 6 atRandom ] 
]

{ #category : #playing }
SLGame >> playOneStepWithRoll: aNumber [

	turns := turns + 1.
	Transcript show: (self currentPlayer) printString, 'drew ', aNumber printString, ': '. 
	(self canMoveTo: (self currentPlayer position + aNumber))
		ifTrue: [ self moveCurrentPlayer: aNumber ].
	Transcript show: self; cr.
		
]

{ #category : #printing }
SLGame >> printOn: aStream [

	tiles do: [ :aTile | 
		aStream << aTile printString ]
]

{ #category : #initialization }
SLGame >> setEndTile [

	tiles at: tiles size put: (SLEndTile new position: tiles size)
]

{ #category : #initialization }
SLGame >> setLadderFrom: aSourcePosition to: aTargetPosition [

	tiles 
		at: aSourcePosition 
		put: (SLLadderTile new 
					position: aSourcePosition ; 
					to: (tiles at: aTargetPosition) ; yourself)
]

{ #category : #initialization }
SLGame >> setSnakeFrom: aSourcePosition to: aTargetPosition [

	tiles 
		at: aSourcePosition 
		put: (SLSnakeTile new 
					position: aSourcePosition; 
					to: (tiles at: aTargetPosition) ; yourself)
]

{ #category : #initialization }
SLGame >> setStartTile [

	tiles at: 1 put: SLStartTile new
]

{ #category : #accessing }
SLGame >> tileAt: aNumber [

	^ tiles at: aNumber
]

{ #category : #tiles }
SLGame >> tileFor: aPlayer atDistance: aNumber [
	
	^ self tileAt: (aPlayer position + aNumber)
]

{ #category : #accessing }
SLGame >> tileNumber: aNumber [

	tiles := Array new: aNumber. 
	self initializeDefaultTiles. 
]

{ #category : #tiles }
SLGame >> tileOfPlayer: aPlayer [ 

	^ self tileAt: aPlayer position
	
	
]

{ #category : #private }
SLGame >> turns: aNumber [

	turns := aNumber	
]
