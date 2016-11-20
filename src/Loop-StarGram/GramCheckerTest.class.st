"
[ [ [ 
[  'ALTRUISME' isIsogramSetImplementation ] bench  '334,371 per second'

[  'ALTRUISME' isIsogramFastestImplementation ] bench  '546,823 per second'

[  'ALTRUISME' isIsogramUsingBagImplementation ] bench  '142,432 per second'

[  'ALTRUISME' isIsogramDictionaryImplementation ] bench  '147,276 per second'

[  'ALTRUISME' isIsogramBitImplementation ] bench  '1,137,976 per second'
]]]

[[[
| lines | 			
lines := (ZnDefaultCharacterEncoder 
  value: ZnCharacterEncoder latin1 
  during: [
    ZnClient new 
      get: 'http://www.pallier.org/ressources/dicofr/liste.de.mots.francais.frgut.txt' ]) lines.
]]]



| lines bits dicts  bags strings sets |
lines := (ZnDefaultCharacterEncoder 
  value: ZnCharacterEncoder latin1 
  during: [
    ZnClient new 
      get: 'http://www.pallier.org/ressources/dicofr/liste.de.mots.francais.frgut.txt' ]) lines.

bits := lines select: #isIsogramBitImplementation. 
dicts := lines select: #isIsogramDictionaryImplementation. 
bags := lines select: #isIsogramBagImplementation.
strings := lines select: #isIsogramStringImplementation.
sets := lines select: #isIsogramSetImplementation.
recurs := lines select: #isIsogramRecursiveImplementation.
{ bits . dicts .  bags . strings . sets} collect: #size. 

""#(23118 47674 47674 47668 47674)""




isPangramIn: should probably use #asLowercase as well:

'The quick brown fox jumps over a lazy dog' isEnglishPangram
""false -- now the $t is missing, there is only $T""


Kicking things off, here are my solutions:

isPangramAllSatisfyIn: alphabet
    ""Just a small change to the original.""
    | lowercase |
    lowercase := self asLowercase.
    ^ alphabet allSatisfy: [ :aChar |
        lowercase includes: aChar ]

isPangramCopyWithoutAllIn: alphabet
    ^ (alphabet copyWithoutAll: self asLowercase) isEmpty

isPangramDifferenceIn: alphabet
    ^ (alphabet difference: self asLowercase) isEmpty


The performance:

[ 'The quick brown fox jumps over the lazy dog' isPangramIn: 'abcdefghijklmnopqrstuvwxyz' ] bench.
""182,096 per second (I added #asLowercase here as well)""

[ 'The quick brown fox jumps over the lazy dog' isPangramAllSatisfyIn: 'abcdefghijklmnopqrstuvwxyz' ] bench.
""159,546 per second""

[ 'The quick brown fox jumps over the lazy dog' isPangramCopyWithoutAllIn: 'abcdefghijklmnopqrstuvwxyz' ] bench.
""159,850 per second""

[ 'The quick brown fox jumps over the lazy dog' isPangramDifferenceIn: 'abcdefghijklmnopqrstuvwxyz' ] bench.
""25,400 per second""


Michal








"
Class {
	#name : #GramCheckerTest,
	#superclass : #TestCase,
	#category : #'Loop-StarGram'
}

{ #category : #data }
GramCheckerTest >> isograms [
	^  #('pharo' 'pathfinder' 'xavier' 'francois' 'lumberjack' 'altruisme' 'antipode')
]

{ #category : #data }
GramCheckerTest >> noIsograms [
	^  #('pharo' 'pathfinder' 'xavier' 'francois' 'lumberjack' 'altruisme' 'antipode')
]

{ #category : #data }
GramCheckerTest >> notIsograms [
	^  #('phaoro' 'stephane' 'idiot' 'freedom')
]

{ #category : #'tests-isogram-string' }
GramCheckerTest >> testAllIsogramBagImplementation [
	
	self isograms do: [ :word |
		self assert: word isIsogramBagImplementation ].
	self notIsograms do: [ :word |
				self deny: word isIsogramBagImplementation ]
]

{ #category : #'tests-isogram-string' }
GramCheckerTest >> testAllIsogramDictionaryImplementation [
	
	self isograms do: [ :word |
		self assert: word isIsogramDictionaryImplementation ].
	self notIsograms do: [ :word |
				self deny: word isIsogramDictionaryImplementation ]
]

{ #category : #'tests-isogram-string' }
GramCheckerTest >> testAllIsogramRecursivegImplementation [
	
	self isograms do: [ :word |
		self assert: word isIsogramRecursiveImplementation ].
	self notIsograms do: [ :word |
		self deny: word isIsogramRecursiveImplementation ]
]

{ #category : #'tests-isogram-string' }
GramCheckerTest >> testAllIsogramSetImplementation [
	
	self isograms do: [ :word |
		self assert: word isIsogramSetImplementation ].
	self notIsograms do: [ :word |
				self deny: word isIsogramSetImplementation ]
]

{ #category : #'tests-isogram-string' }
GramCheckerTest >> testAllIsogramStringImplementation [
	
	self isograms do: [ :word |
		self assert: word isIsogramStringImplementation ].
	self notIsograms do: [ :word |
		self deny: word isIsogramStringImplementation ]
]

{ #category : #'tests-pangram' }
GramCheckerTest >> testDetectAllMissingLetters [

	self assert: ('the quick brown fox jumps over the lzy do' detectAllMissingLettersFor: 'abcdefghijklmnopqrstuvwxyz') equals:  (Set withAll: #($a $g)).
	self assert: ('the uick brwn fx jumps ver the lazy dg' detectAllMissingLettersFor: 'abcdefghijklmnopqrstuvwxyz') equals: #($q $o) asSet.
	
	
]

{ #category : #'tests-pangram' }
GramCheckerTest >> testDetectFirstMissingLetter [

	self assert: ('the quick brown fox jumps over the lzy dog' detectFirstMissingLetterFor: 'abcdefghijklmnopqrstuvwxyz') equals: $a.
	self assert: ('the uick brown fox jumps over the lazy dog' detectFirstMissingLetterFor: 'abcdefghijklmnopqrstuvwxyz') equals: $q.
	
	
]

{ #category : #'tests-pangram' }
GramCheckerTest >> testIsEnglishPangram [

	self assert: 'the quick brown fox jumps over the lazy dog' isEnglishPangram.
	self assert: 'the five boxing wizards jump quickly' isEnglishPangram.
	self deny: 'the quick brown fox jumps over the  dog' isEnglishPangram.
]

{ #category : #'tests-palindromg' }
GramCheckerTest >> testIsPalindrome [

	self assert: 'ete' isPalindrome.
	self assert: 'kayak' isPalindrome.
	self deny: 'etat' isPalindrome.
]

{ #category : #'tests-palindromg' }
GramCheckerTest >> testIsPalindrome2 [

	self assert: 'ete' isPalindrome2.
	self assert: 'kayak' isPalindrome2.
	self deny: 'etat' isPalindrome2.
]

{ #category : #'tests-pangram' }
GramCheckerTest >> testIsPangramIn [

	self assert: ('The quick brown fox jumps over the lazy dog' isPangramIn: 'abcdefghijklmnopqrstuvwxyz').
	self assert: ('ma papa mama' isPangramIn: 'apm').
	
]

{ #category : #tests }
GramCheckerTest >> testIsogram [
	| checker |
	checker := GramChecker new.
	self assert: (checker isIsogramFastest: 'ALTRUISME').
]

{ #category : #tests }
GramCheckerTest >> testIsogramBag [
	| checker |
	checker := GramChecker new.
	self assert: (checker isIsogramBag: 'ALTRUISME').
]

{ #category : #tests }
GramCheckerTest >> testIsogramDict [
	| checker |
	checker := GramChecker new.
	self assert: (checker isIsogramDictionaryImplementation: 'ALTRUISME').
]

{ #category : #'tests-isogram-string' }
GramCheckerTest >> testIsogramSetImplementation [
	
	self assert: 'pharo' isIsogramSetImplementation.
	self assert: 'pharo' isIsogramSetImplementation equals: true.
	
	self assert: 'phaoro' isIsogramSetImplementation not.
	self deny: 'phaoro' isIsogramSetImplementation.
]

{ #category : #tests }
GramCheckerTest >> testIsograms [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogram: each)]
]

{ #category : #tests }
GramCheckerTest >> testIsogramsFastest [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogramFastest: each)]
]

{ #category : #tests }
GramCheckerTest >> testIsogramsSetImp [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogramSetImplementation: each)]
]
