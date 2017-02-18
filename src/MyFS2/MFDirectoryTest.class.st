Class {
	#name : #MFDirectoryTest,
	#superclass : #TestCase,
	#category : #MyFS2
}

{ #category : #tests }
MFDirectoryTest >> testDirectories [

	| dComics dOldComics dManga |
	dComics := MFDirectory new name: 'comics'.
	dOldComics := MFDirectory new name: 'oldcomics'.
	dComics addElement: dOldComics. 
	self assert: dComics parent equals: nil.
	self assert: dOldComics parent equals: dComics.
	self assert: (dComics children includes: dOldComics).
	dManga := MFDirectory new name: 'manga'.
	dComics addElement: dManga. 
	dComics children.
	self assert: (dComics children includes: dManga).
	
]

{ #category : #tests }
MFDirectoryTest >> testPrinting [

	| el1 el2 |
	el1 := MFDirectory new name: 'comics'.
	el2 := MFDirectory new name: 'oldcomics'.
	el1 addElement: el2.
	self assert: el1 printString equals: 'comics/'.
	self assert: el2 printString equals: 'comics/oldcomics/'
]

{ #category : #tests }
MFDirectoryTest >> testSearch [ 
	| p el1 el2 |
	p := MFDirectory new name: 'comics'.
	el1 := MFFile new name: 'babar'; contents: 'Babar et Celeste'.
	p addElement: el1.
	el2 := MFFile new name: 'astroboy'; contents: 'super cool robot'.
	p addElement: el2.
	self assert: ((p search: 'Ba') includes: el1)
]

{ #category : #tests }
MFDirectoryTest >> testSize [

	| p2 el |
	el := MFFile new name: 'babar'.
	p2 := MFDirectory new name: 'oldcomics'.
	p2 addElement: el. 
	self assert: p2 size equals: 'oldcomics' size + 'babar' size + 2
]
