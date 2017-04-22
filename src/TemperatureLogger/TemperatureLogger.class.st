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

{ #category : #initialization }
TemperatureLogger >> initialize [

	location := 'Home'.
	measures := OrderedCollection new. 
]

{ #category : #operation }
TemperatureLogger >> latestRecord [

	^ measures last
]

{ #category : #operation }
TemperatureLogger >> latestRecords: aNumber [

	| records reversed | 
	records := OrderedCollection new.
	reversed := measures reversed. 
	1 to: aNumber do: [ :each | 
			records add: ( reversed at: each ) ].
	^ records
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
