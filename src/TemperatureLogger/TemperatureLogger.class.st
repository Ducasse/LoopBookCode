"
Unfinished. 
Current implementation is storing more recent at the end.
"
Class {
	#name : #TemperatureLogger,
	#superclass : #Object,
	#instVars : [
		'location',
		'measures'
	],
	#category : #TemperatureLogger
}

{ #category : #operation }
TemperatureLogger >> alternateAverage [
	
	| sum |
	sum := 0.
	measures do: [ :aMeasure | sum := sum + aMeasure ].
	^ sum / measures size
]

{ #category : #operation }
TemperatureLogger >> average [

	^ measures average 
]

{ #category : #operation }
TemperatureLogger >> averageLast: numberOfDays [

	^ (self latestRecords: numberOfDays) sum / numberOfDays
]

{ #category : #initialization }
TemperatureLogger >> initialize [

	location := 'Home'.
	measures := OrderedCollection new. 
]

{ #category : #accessing }
TemperatureLogger >> lastTemperature [

	^ self temperatures last.
]

{ #category : #operation }
TemperatureLogger >> latestRecord [

	^ measures last
]

{ #category : #operation }
TemperatureLogger >> latestRecords: aNumber [

	| records |
	records := OrderedCollection new.
	measures size 
		to: measures size - aNumber + 1 
		by: -1 
		do: [:i | records addFirst: (measures at: i)].
	^ records 
]

{ #category : #accessing }
TemperatureLogger >> location [
	^ location
]

{ #category : #accessing }
TemperatureLogger >> location: aString [

	location := aString
]

{ #category : #operation }
TemperatureLogger >> recordCount [

	^ measures size
]

{ #category : #operation }
TemperatureLogger >> recordTemperature: aNumber [
	"Add the temperature to the list of recorded measures"
	measures add: aNumber
]

{ #category : #operation }
TemperatureLogger >> splitEvery: n [
	^ (n
		to: measures size
		by: n)
		collect: [:index |
			(measures copyFrom: index - n + 1 to: index)]
]

{ #category : #accessing }
TemperatureLogger >> temperatures [
	^ temperatures
]

{ #category : #accessing }
TemperatureLogger >> temperatures: anOrderedCollection [ 
	temperatures := anOrderedCollection
]
