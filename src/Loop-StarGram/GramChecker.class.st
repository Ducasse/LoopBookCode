"
An isogram is a word or phrase without a repeating letter. Examples of isograms:

- 'lumberjacks'
- 'background'
- 'downstream'
-  'subdermatoglyphic'

Have fun finding french isograms!
Tx to Sven Van Caekenberghe
```
(ZnDefaultCharacterEncoder 
  value: ZnCharacterEncoder latin1 
  during: [
    ZnClient new 
      get: 'http://www.pallier.org/extra/liste.de.mots.francais.frgut.txt' ]) lines.
```
"
Class {
	#name : #GramChecker,
	#superclass : #Object,
	#category : #'Loop-StarGram'
}

{ #category : #isograms }
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

{ #category : #isograms }
GramChecker >> isIsogramBag: aString [
	"self new isIsogramBag: 'ALTRUISME'"
	| bag |
	bag := Bag new. 
	aString do: [ :each |
			bag add: each. 
			].
	^ bag sortedCounts first key = 1
]

{ #category : #isograms }
GramChecker >> isIsogramDictionaryImplementation: aString [
	"self new isIsogramDictionaryImplementation: 'ALTRUISME'"
	| dict |
	dict := Dictionary new. 
	aString do: [ :each |
			dict at: each 
				ifPresent: [^ false] 
				ifAbsent: [ dict at: each put: 1]. 
			].
	^ true
]

{ #category : #isograms }
GramChecker >> isIsogramFastest: aString [
	"self new isIsogramFastest: 'ALTRUISME'"

	1 to: aString size -1 do: [ :ix |
		(aString  
			findString: (aString at: ix) asString 
			startingAt: ix +1 
			caseSensitive: false
		) ~~ 0 ifTrue: [ ^ false ] 	
	].

	^ true

]

{ #category : #isograms }
GramChecker >> isIsogramSetImplementation: aString [
	"self new isIsogramSetImplementation: 'ALTRUISME'"
	^ aString asSet size = aString size

]
