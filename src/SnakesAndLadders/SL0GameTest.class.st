Class {
	#name : #SL0GameTest,
	#superclass : #TestCase,
	#category : #SnakesAndLadders
}

{ #category : #tests }
SL0GameTest >> testBoardCurrentPlayer [
	
	| jill jack board |
	board := SL0Game new tileNumber: 12.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	board addPlayer: jill. "first player" 
	board addPlayer: jack. 
	board turns: 9.
	self assert: board currentPlayer equals: jill.
	board turns: 10.
	self assert: board currentPlayer equals: jack.
]

{ #category : #tests }
SL0GameTest >> testCanMoveTo [
	
	| jill jack game |
	game := SL0Game new tileNumber: 12.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: (game canMoveTo: 8).
	self assert: (game canMoveTo: 12).
	self deny: (game canMoveTo: 13).
	
]

{ #category : #tests }
SL0GameTest >> testFullGamePrintString [

	| game |
	game := SL0Game new tileNumber: 12.
	self assert: game printString equals: '[1][2][3][4][5][6][7][8][9][10][11][12]'.
	game	setLadderFrom: 2 to: 6;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	self assert: game printString equals: '[1][2->6][3][4][5][6][7->9][8][9][10][5<-11][12]'
]

{ #category : #tests }
SL0GameTest >> testFullGameSetUp [

	| game |
	game := SL0Game new 
		tileNumber: 12; 
		setLadderFrom: 2 to: 4;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	self assert: (game tileAt: 2) isLadder. 
	self deny: (game tileAt: 3) isLadder.
	self assert: (game tileAt: 11) isSnake.
]

{ #category : #tests }
SL0GameTest >> testIsOver [
	
	| jack game |
	game := SL0Game fullGame.
	jack := SL0Player new name: 'Jack'.
	game addPlayer: jack. 
	(game tileAt: 12) addPlayer: jack. 
	jack position: 12. 
	self assert: game isOver.
]

{ #category : #tests }
SL0GameTest >> testPlayOneStep [
	
	| jill jack game |
	game := SL0Game new tileNumber: 12.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: jill position equals: 1. 
	game playOneStepWithRoll: 3.
	self assert: jill position equals: 4.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: ((game tileAt: 4) players includes: jill). 
]

{ #category : #tests }
SL0GameTest >> testPlayOneStepOnALadder [
	
	| jill jack game |
	game := SL0Game fullGame.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. 
	game addPlayer: jack. 
	game playOneStepWithRoll: 1.
	self assert: jill position equals: 6.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: ((game tileAt: 6) players includes: jill). 
]

{ #category : #tests }
SL0GameTest >> testPlayOneStepOnASnake [
	
	| jill jack game |
	game := SL0Game fullGame.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. 
	game addPlayer: jack. 

	game playOneStepWithRoll: 10.
	self assert: jill position equals: 5.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: ((game tileAt: 5) players includes: jill). 
]

{ #category : #tests }
SL0GameTest >> testPlayOneStepOnExactFinish [
	
	| jill jack game |
	game := SL0Game fullGame.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. 
	game addPlayer: jack. 

	game playOneStepWithRoll: 11.
	"we land on the finish!"
	self assert: jill position equals: 12.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: ((game tileAt: 12) players includes: jill).
	self assert: game isOver.
]

{ #category : #tests }
SL0GameTest >> testPlayOneStepOnInexactFinish [
	
	| jill jack game |
	game := SL0Game fullGame.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. 
	game addPlayer: jack. 
	"jill moves"
	game playOneStepWithRoll: 9.
	self assert: jill position equals: 10.
	self assert: ((game tileAt: 10) players includes: jill).
	"jack moves"
	game playOneStepWithRoll: 2. 
	"jill moves but in fact stays at her place"
	game playOneStepWithRoll: 5.
	self assert: jill position equals: 10.
	self assert: ((game tileAt: 10) players includes: jill).
	self deny: game isOver.
]

{ #category : #tests }
SL0GameTest >> testPlayTwoSteps [
	
	| jill jack game |
	game := SL0Game new tileNumber: 12.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: jill position equals: 1. 
	game playOneStepWithRoll: 3.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: jill position equals: 4.
	self assert: ((game tileAt: 4) players includes: jill). 
	game playOneStepWithRoll: 2.
	"nothing changes for jill"
	self assert: jill position equals: 4.
	self assert: ((game tileAt: 4) players includes: jill). 
	"now let us verify that jack moved correctly"	
	self assert: (game tileAt: 1) players size equals: 0. 
	self assert: jack position equals: 3.
	self assert: ((game tileAt: 3) players includes: jack). 

]

{ #category : #tests }
SL0GameTest >> testPlayerAtStart [

	| game jill |
	game := SL0Game new 
		tileNumber: 12; 
		setLadderFrom: 2 to: 4;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. 
	self assert: ((game tileAt: 1) players includes: jill).
]

{ #category : #tests }
SL0GameTest >> testPrintingSimpleGame [

	| game |
	game := SL0Game new tileNumber: 12.
	self assert: game printString equals: '[1][2][3][4][5][6][7][8][9][10][11][12]'
]

{ #category : #tests }
SL0GameTest >> testPrintingSimpleGameWithPlayers [

	| game jill jack |
	game := SL0Game new 
		tileNumber: 12.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: game printString equals: '[1<Jill><Jack>][2][3][4][5][6][7][8][9][10][11][12]'
]

{ #category : #tests }
SL0GameTest >> testTileAt [

	| game |
	game := SL0Game new tileNumber: 12.
	self assert: (game tileAt: 6) printString equals: '[6]'
]

{ #category : #tests }
SL0GameTest >> testTileForAtDistance [
	
	| jill jack game |
	game := SL0Game new tileNumber: 12.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: (game tileFor: jill atDistance: 4) position equals: 5.
]

{ #category : #tests }
SL0GameTest >> testTileOfPlayer [
	
	| jill jack game |
	game := SL0Game new tileNumber: 12.
	jack := SL0Player new name: 'Jack'.
	jill := SL0Player new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: (game tileOfPlayer: jill) position equals: 1.
]
