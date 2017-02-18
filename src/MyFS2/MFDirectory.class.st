Class {
	#name : #MFDirectory,
	#superclass : #MFElement,
	#instVars : [
		'files'
	],
	#category : #MyFS2
}

{ #category : #initialization }
MFDirectory >> addElement: aFile [
	aFile parent: self. 
	files add: aFile
]

{ #category : #initialization }
MFDirectory >> children [
	^ files
]

{ #category : #initialization }
MFDirectory >> initialize [
	files := OrderedCollection new
]

{ #category : #describe }
MFDirectory >> kind [ 

	^ 'directory'
]

{ #category : #printing }
MFDirectory >> printOn: aStream [
	parent isNil ifFalse: [ 
		parent printOn: aStream ].
	aStream << name.
	aStream nextPutAll: '/'
]

{ #category : #'typing/selecting keys' }
MFDirectory >> search: aString [
	^ files select: [ :eachFile | eachFile search: aString ]
]

{ #category : #size }
MFDirectory >> size [
	| sum |
	sum := 0.
	files do: [ :each | sum := sum + each size ].
	sum := sum + name size.
	sum := sum + 2.
	^ sum
]
