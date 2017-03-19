Class {
	#name : #SLGameTest,
	#superclass : #TestCase,
	#category : #SnakesAndLadders
}

{ #category : #tests }
SLGameTest >> testBoardCurrentPlayer [
	
	| jill jack board |
	board := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	board addPlayer: jill. "first player" 
	board addPlayer: jack. 
	board turns: 9.
	self assert: board currentPlayer equals: jill.
	board turns: 10.
	self assert: board currentPlayer equals: jack.
]

{ #category : #tests }
SLGameTest >> testCanMoveTo [
	
	| jill jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: (game canMoveTo: 8).
	self assert: (game canMoveTo: 12).
	self deny: (game canMoveTo: 13).
	
]

{ #category : #tests }
SLGameTest >> testFullGamePrintString [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: game printString equals: '[1][2][3][4][5][6][7][8][9][10][11][12]'.
	game	setLadderFrom: 2 to: 6;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	self assert: game printString equals: '[1][2->6][3][4][5][6][7->9][8][9][10][5<-11][12]'
]

{ #category : #tests }
SLGameTest >> testFullGameSetUp [

	| game |
	game := SLGame new 
		tileNumber: 12; 
		setLadderFrom: 2 to: 4;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	self assert: (game tileAt: 2) isLadder. 
	self deny: (game tileAt: 3) isLadder.
	self assert: (game tileAt: 11) isSnake.
]

{ #category : #tests }
SLGameTest >> testIsOver [
	
	| jack game |
	game := SLGame fullGame.
	jack := SLPlayer new name: 'Jack'.
	game addPlayer: jack. 
	(game tileAt: 12) addPlayer: jack. 
	jack position: 12. 
	self assert: game isOver.
]

{ #category : #tests }
SLGameTest >> testPlayOneStep [
	
	| jill jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: jill position equals: 1. 
	game playOneStepWithRoll: 3.
	self assert: jill position equals: 4.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: ((game tileAt: 4) players includes: jill). 
]

{ #category : #tests }
SLGameTest >> testPlayOneStepOnALadder [
	
	| jill jack game |
	game := SLGame fullGame.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	game addPlayer: jack. 
	game playOneStepWithRoll: 1.
	self assert: jill position equals: 6.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: ((game tileAt: 6) players includes: jill). 
]

{ #category : #tests }
SLGameTest >> testPlayOneStepOnASnake [
	
	| jill jack game |
	game := SLGame fullGame.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	game addPlayer: jack. 

	game playOneStepWithRoll: 10.
	self assert: jill position equals: 5.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: ((game tileAt: 5) players includes: jill). 
]

{ #category : #tests }
SLGameTest >> testPlayOneStepOnExactFinish [
	
	| jill jack game |
	game := SLGame fullGame.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
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
SLGameTest >> testPlayOneStepOnInexactFinish [
	
	| jill jack game |
	game := SLGame fullGame.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
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
SLGameTest >> testPlayTwoSteps [
	
	| jill jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
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
SLGameTest >> testPlayerAtStart [

	| game jill |
	game := SLGame new 
		tileNumber: 12; 
		setLadderFrom: 2 to: 4;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	self assert: ((game tileAt: 1) players includes: jill).
]

{ #category : #tests }
SLGameTest >> testPrintingSimpleGame [

	| game |
	game := SLGame new 
		tileNumber: 12.
	self assert: game printString equals: '[1][2][3][4][5][6][7][8][9][10][11][12]'
]

{ #category : #tests }
SLGameTest >> testPrintingSimpleGameWithPlayers [

	| game jill jack |
	game := SLGame new 
		tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: game printString equals: '[1<Jill><Jack>][2][3][4][5][6][7][8][9][10][11][12]'
]

{ #category : #tests }
SLGameTest >> testTileForAtDistance [
	
	| jill jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: (game tileFor: jill atDistance: 4) position equals: 5.
]

{ #category : #tests }
SLGameTest >> testTileOfPlayer [
	
	| jill jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: (game tileOfPlayer: jill) position equals: 1.
]
