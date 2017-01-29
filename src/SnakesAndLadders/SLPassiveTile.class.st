Class {
	#name : #SLPassiveTile,
	#superclass : #SLPositionedTile,
	#instVars : [
		'players'
	],
	#category : #SnakesAndLadders
}

{ #category : #adding }
SLPassiveTile >> addPlayer: aPlayer [

	players add: aPlayer.
]

{ #category : #initialization }
SLPassiveTile >> initialize [
	players := OrderedCollection new. 
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
