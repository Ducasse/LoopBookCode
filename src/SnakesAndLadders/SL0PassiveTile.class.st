Class {
	#name : #SL0PassiveTile,
	#superclass : #SL0AbstractTile,
	#instVars : [
		'players'
	],
	#category : #SnakesAndLadders
}

{ #category : #adding }
SL0PassiveTile >> addPlayer: aPlayer [

	players add: aPlayer.
]

{ #category : #'in/out' }
SL0PassiveTile >> enter: aPlayer [
	super enter: aPlayer. 
	self addPlayer: aPlayer
]

{ #category : #initialization }
SL0PassiveTile >> initialize [
	players := OrderedCollection new. 
]

{ #category : #'in/out' }
SL0PassiveTile >> leave: aPlayer [
	super leave: aPlayer.
	self removePlayer: aPlayer
]

{ #category : #accessing }
SL0PassiveTile >> players [
	^ players
]

{ #category : #accessing }
SL0PassiveTile >> players: anObject [
	players := anObject
]

{ #category : #printing }
SL0PassiveTile >> printOnInside: aStream [

	super printOnInside: aStream. 
	players isNotEmpty ifTrue: [ players do: [ :aPlayer | aStream << aPlayer printString ]].
	
]

{ #category : #adding }
SL0PassiveTile >> removePlayer: aPlayer [

	players remove: aPlayer.
]
