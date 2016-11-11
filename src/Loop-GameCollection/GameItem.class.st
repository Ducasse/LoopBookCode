Class {
	#name : #GameItem,
	#superclass : #Object,
	#instVars : [
		'title',
		'kind',
		'hasDoc',
		'grade',
		'stars',
		'isCollectorEdition',
		'star'
	],
	#category : #'Loop-GameCollection'
}

{ #category : #'as yet unclassified' }
GameItem class >> exampleKlonoa [

	^ self new 	
		title: 'Klonoa';
		ps2;
		threeStar;
		grade: '(16/15)';
		paid: 1
]

{ #category : #constants }
GameItem >> fiveStar [
	
	star := 5
]

{ #category : #constants }
GameItem >> fourStar [
	
	star := 4
]

{ #category : #constants }
GameItem >> gameboy [
	kind := #gameboy
]

{ #category : #accessing }
GameItem >> grade [
	^ grade
]

{ #category : #accessing }
GameItem >> grade: anObject [
	grade := anObject
]

{ #category : #accessing }
GameItem >> hasDoc [
	^ hasDoc
]

{ #category : #accessing }
GameItem >> hasDoc: aBoolean [
	hasDoc := aBoolean
]

{ #category : #initialization }
GameItem >> initialize [
	super initialize.
	hasDoc := true.
	isCollectorEdition := true.
	
]

{ #category : #accessing }
GameItem >> isCollectorEdition [
	^ isCollectorEdition 
]

{ #category : #accessing }
GameItem >> isCollectorEdition: aBoolean [
	isCollectorEdition := aBoolean
]

{ #category : #constants }
GameItem >> oneStar [
	
	star := 1
]

{ #category : #constants }
GameItem >> ps2 [
	kind := #PS2
]

{ #category : #constants }
GameItem >> ps3 [
	kind := #PS3
]

{ #category : #constants }
GameItem >> threeStar [
	
	star := 3
]

{ #category : #constants }
GameItem >> twoStar [
	
	star := 2
]
