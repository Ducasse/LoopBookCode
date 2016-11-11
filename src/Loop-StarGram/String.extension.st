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
String >> isIsogramFatestImplementation [
	"'ALTRUISME' isIsogramFatestImplementation"

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
String >> isIsogramSetImplementation [
	"Returns true if the receiver is an isogram, i.e., a word using no repeatitive character."
	"'Pharo' isIsogramSetImplementation
	>>> true"
	"'Phaoro' isIsogramSetImplementation
	>>> false"
	
	^ self size = self asSet size 
]

{ #category : #'*Loop-StarGram' }
String >> isIsogramUsingBagImplementation [
	"'ALTRUISME' isIsogramUsingBagImplementation"
	
	| bag |
	bag := Bag new. 
	self do: [ :each |
			bag add: each. 
			].
	^ bag sortedCounts first key = 1
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
