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

{ #category : #example }
GameItem class >> exampleKlonoa [
	<sampleInstance>
	^ self new 	
		title: 'Klonoa';
		ps2;
		threeStar;
		grade: '(16/15)';
		paidPrice: 1
]

{ #category : #example }
GameItem class >> exampleWildArm [
	<sampleInstance>
	^ self new 	
		title: 'Wild Arm';
		ps2;
		threeStar;
		grade: '(16/15)';
		paidPrice: 1
]

{ #category : #neojson }
GameItem class >> neoJsonMapping: aMapper [

	aMapper for: self do: [ :mapping |
		mapping mapInstVars: 
 #(#title #kind #hasDoc #grade #stars #isCollectorEdition #paidPrice #language #zone)]
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
	
	stars := 5
]

{ #category : #constants }
GameItem >> fourStar [
	
	stars := 4
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

{ #category : #accessing }
GameItem >> id: anId [
	"an internal id. Such id should not be serialized: a same game can have different id when loaded or reloaded. The only constraint is that internally we just want to have two different ids.
	May be this is not necessary since objects are different by construction."
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

{ #category : #accessing }
GameItem >> kind [

	^ kind
]

{ #category : #constants }
GameItem >> oneStar [
	
	stars := 1
]

{ #category : #accessing }
GameItem >> paidPrice [

	^ paidPrice
]

{ #category : #accessing }
GameItem >> paidPrice: anInteger [

	paidPrice := anInteger
]

{ #category : #printing }
GameItem >> printOn: aStream [

	aStream 
		nextPutAll: self title;
		nextPutAll: '(', self kind asString ,')'
]

{ #category : #constants }
GameItem >> ps2 [
	kind := #PS2
]

{ #category : #constants }
GameItem >> ps3 [
	kind := #PS3
]

{ #category : #testing }
GameItem >> sameAs: anotherGame [
	#(#title #kind #hasDoc #grade #stars #isCollectorEdition #paidPrice #id #language #zone)
		do:
			[ :each | (self instVarNamed: each) = (anotherGame instVarNamed: each) ifFalse: [^ false]].
	^ true
]

{ #category : #constants }
GameItem >> spanish [
	language := #spanish
]

{ #category : #constants }
GameItem >> threeStar [
	
	stars := 3
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
	
	stars := 2
]
