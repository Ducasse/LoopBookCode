"
I'm a game.
I'm characterized by an id (because we can have two times the same game., a title and a kind (Ps2, Ps3).

I have optional information such as stars
"
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
		'paidPrice',
		'id',
		'language',
		'zone'
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
GameItem >> EU [
	zone := #EU
]

{ #category : #constants }
GameItem >> JP [
	zone := #JP
]

{ #category : #constants }
GameItem >> US [
	zone := #US
]

{ #category : #constants }
GameItem >> english [
	language := #english
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
GameItem >> french [
	language := #french
]

{ #category : #constants }
GameItem >> gameboy [
	kind := #gameboy
]

{ #category : #constants }
GameItem >> german [
	language := #german
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
	id := self nextId.
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

{ #category : #initialization }
GameItem >> nextId [

	
]

{ #category : #constants }
GameItem >> oneStar [
	
	star := 1
]

{ #category : #accessing }
GameItem >> paidPrice [

	^ paidPrice
]

{ #category : #accessing }
GameItem >> paidPrice: anInteger [

	paidPrice := anInteger
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
GameItem >> spanish [
	language := #spanish
]

{ #category : #constants }
GameItem >> threeStar [
	
	star := 3
]

{ #category : #accessing }
GameItem >> title [

	^ title
]

{ #category : #accessing }
GameItem >> title: aString [

	title := aString
]

{ #category : #constants }
GameItem >> twoStar [
	
	star := 2
]
