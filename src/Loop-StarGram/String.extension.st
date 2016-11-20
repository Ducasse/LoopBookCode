Extension { #name : #String }

{ #category : #'*Loop-StarGram' }
String >> detectAllMissingLettersFor: alphabet [
	
	| res |
	res := Set new. 
	alphabet do: [ :aChar |
		(self includes: aChar)
			ifFalse: [ res add: aChar ]
		].
	^ res
]

{ #category : #'*Loop-StarGram' }
String >> detectFirstMissingLetterFor: alphabet [

	alphabet do: [ :aChar |
		(self includes: aChar)
			ifFalse: [ ^ aChar ]
		].
	^ ''
]

{ #category : #'*Loop-StarGram' }
String >> isEnglishPangram [
	"Returns true is the receiver is a pangram i.e., that it uses all the characters of a given alphabet."
	"'The quick brown fox jumps over the lazy dog' isEnglishPangram
	>>> true"
	"'The quick brown fox jumps over the dog' isEnglishPangram
	>>> false"
	
	^ self isPangramIn: 'abcdefghijklmnopqrstuvwxyz'.
	
]

{ #category : #'*Loop-StarGram' }
String >> isIsogramBagImplementation [
	"'ALTRUISME' isIsogramUsingBagImplementation"
	
	| bag |
	bag := Bag new. 
	self do: [ :each |
			bag add: each. 
			].
	^ bag sortedCounts first key = 1
]

{ #category : #'*Loop-StarGram' }
String >> isIsogramBitImplementation [
	"'ALTRUISME' isIsogramBitImplementation"

   | i |
   i := 0.
   self asLowercase do: [ :char |
         | val |
         val := (char  asInteger - 96).
         (val between: 1 and: 26) ifFalse: [ ^ false ].
         (i bitAt: val ) == 1 ifTrue: [ ^ false ].
         i := (i bitAt: val put: 1)
         ].
     ^ true
]

{ #category : #'*Loop-StarGram' }
String >> isIsogramContainCharacter: aCharacter [
	
 	^ (self includes: aCharacter) 
			ifTrue: [ false ]
			ifFalse: [ self isIsogramRecursiveImplementation ]	
]

{ #category : #'*Loop-StarGram' }
String >> isIsogramDictionaryImplementation [
	"'ALTRUISME' isIsogramDictionaryImplementation"
	| letters |
	letters := Dictionary new. 
	self do: [ :aChar |
			letters at: aChar 
				ifPresent: [^ false] 
				ifAbsent: [ letters at: aChar put: 1]. 
			].
	^ true
]

{ #category : #'*Loop-StarGram' }
String >> isIsogramRecursiveImplementation [
	"'ALTRUISME' isIsogramDroppingImplementation"
	"'ALTRUISMEA' isIsogramDroppingImplementation"
	^ self isEmpty
		ifTrue: [ ^ true ] 
		ifFalse: [ self allButFirst isIsogramContainCharacter: self first ]
 
]

{ #category : #'*Loop-StarGram' }
String >> isIsogramSetImplementation [
	"Returns true if the receiver is an isogram, i.e., a word using no repeatitive character."
	"'Pharo' isIsogramSetImplementation
	>>> true"
	"'Phaoro' isIsogramSetImplementation
	>>> false"
	
	^ self size = self asSet size 
]

{ #category : #'*Loop-StarGram' }
String >> isIsogramStringImplementation [
	"'ALTRUISME' isIsogramFastestImplementation"

	1 to: self size -1 do: [ :ix |
		(self  
			findString: (self at: ix) asString 
			startingAt: ix +1 
			caseSensitive: false
		) ~~ 0 ifTrue: [ ^ false ] 	
	].
	^ true

]

{ #category : #'*Loop-StarGram' }
String >> isPalindrome [

	self reverse with: self 
		do: [ :rev :dir | rev = dir ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #'*Loop-StarGram' }
String >> isPalindrome2 [
	"Returns true whether the receiver is an palindrome.
	'anna' isPalindrome2
		true
	'andna' isPalindrome2 
		true
	'avdna' isPalindrome2 
		false
	"
	1 
		to: self size//2 
		do: [ :i | (self at: i) = (self at: self size + 1 - i)
						ifFalse: [ ^false ]
				].
	^true
]

{ #category : #'*Loop-StarGram' }
String >> isPangramIn: alphabet [
	"Returns true is the receiver is a pangram i.e., that it uses all the characters of a given alphabet."
	"'The quick brown fox jumps over the lazy dog' isPangramIn: 'abcdefghijklmnopqrstuvwxyz'
	>>> true"
	"'tata' isPangramIn: 'at'
	>>> true"

	alphabet do: [ :aChar |
		(self includes: aChar)
			ifFalse: [ ^ false ]
		].
	^ true
]
