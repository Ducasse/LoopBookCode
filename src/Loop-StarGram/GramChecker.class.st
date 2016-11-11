"
An isogram is a word or phrase without a repeating letter. Examples of isograms:

- 'lumberjacks'
- 'background'
- 'downstream'
-  'subdermatoglyphic'

http://www.pallier.org/ressources/dicofr/liste.de.mots.francais.frgut.txt
"
Class {
	#name : #GramChecker,
	#superclass : #Object,
	#category : #'Loop-StarGram'
}

{ #category : #'as yet unclassified' }
GramChecker >> isIsogram2: aString [
	"self new isIsogram: 'ALTRUISME'"
	| dict |
	dict := Dictionary new. 
	aString do: [ :each |
			dict at: each 
				ifPresent: [^ false] 
				ifAbsent: [ dict at: each put: 1]. 
			].
	^ true
]

{ #category : #'as yet unclassified' }
GramChecker >> isIsogram3: aString [
	"self new isIsogram2: 'ALTRUISME'"
	^ aString asSet size = aString size

]

{ #category : #'as yet unclassified' }
GramChecker >> isIsogram4: aString [
	"self new isIsogram2: 'ALTRUISME'"

	1 to: aString size -1 do: [ :ix |
		(aString  
			findString: (aString at: ix) asString 
			startingAt: ix +1 
			caseSensitive: false
		) ~~ 0 ifTrue: [ ^ false ] 	
	].

	^ true

]

{ #category : #'as yet unclassified' }
GramChecker >> isIsogram: aString [
	"self new isIsogram: 'ALTRUISME'"
	| bag |
	bag := Bag new. 
	aString do: [ :each |
			bag add: each. 
			].
	^ bag sortedCounts first key = 1
]
