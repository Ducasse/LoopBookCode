Class {
	#name : #SLPassiveTile,
	#superclass : #SLAbstractTile,
	#instVars : [
		'players'
	],
	#category : #SnakesAndLadders
}

{ #category : #adding }
SLPassiveTile >> addPlayer: aPlayer [

	players add: aPlayer.
]

{ #category : #'in/out' }
SLPassiveTile >> enter: aPlayer [
	super enter: aPlayer. 
	self addPlayer: aPlayer
]

{ #category : #initialization }
SLPassiveTile >> initialize [
	players := OrderedCollection new. 
]

{ #category : #'in/out' }
SLPassiveTile >> leave: aPlayer [
	super leave: aPlayer.
	self removePlayer: aPlayer
]

{ #category : #accessing }
SLPassiveTile >> players [
	^ players
]

{ #category : #accessing }
SLPassiveTile >> players: anObject [
	players := anObject
]

{ #category : #printing }
SLPassiveTile >> printOnInside: aStream [

	super printOnInside: aStream. 
	players isNotEmpty ifTrue: [ players do: [ :aPlayer | aStream << aPlayer printString ]].
	
]

{ #category : #adding }
SLPassiveTile >> removePlayer: aPlayer [

	players remove: aPlayer.
]
