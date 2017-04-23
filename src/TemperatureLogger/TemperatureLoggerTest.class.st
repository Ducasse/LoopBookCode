Class {
	#name : #TemperatureLoggerTest,
	#superclass : #TestCase,
	#category : #TemperatureLogger
}

{ #category : #tests }
TemperatureLoggerTest >> testAlternateAverageTemperature [

	| office |
	office := TemperatureLogger new location: 'Office'.
	office recordTemperature: 19.
	office recordTemperature: 21.
	office recordTemperature: 17.
	
	self assert: office alternateAverage equals: 19
]

{ #category : #tests }
TemperatureLoggerTest >> testAverageTemperature [

	| office |
	office := TemperatureLogger new location: 'Office'.
	office recordTemperature: 19.
	office recordTemperature: 21.
	office recordTemperature: 17.
	
	self assert: office average equals: 19
]

{ #category : #tests }
TemperatureLoggerTest >> testAverageWithinTemperature [

	| office |
	office := TemperatureLogger new location: 'Office'.
	#( 16 17 17 16 18 17 18 19 19 19 18 19 19 20 19 20 19 20 20 20 19 20 ) 
		do: [ :aMeasure | office recordTemperature: aMeasure ].
	self assert: office average equals: 409/22.
	self assert: (office averageLast: 7) equals: 409/22
]

{ #category : #tests }
TemperatureLoggerTest >> testLatestRecord [

	| office |
	office := TemperatureLogger new location: 'Office'.
	office recordTemperature: 19.
	office recordTemperature: 18.
	self assert: office latestRecord equals: 18.
	office recordTemperature: 21.
	self assert: office latestRecord equals: 21.
]

{ #category : #tests }
TemperatureLoggerTest >> testLatestRecords [

	| office |
	office := TemperatureLogger new location: 'Office'.
	office recordTemperature: 16.
	office recordTemperature: 17.
	office recordTemperature: 19.
	office recordTemperature: 18.
	office recordTemperature: 21.
	self assert: (office latestRecords: 3) equals: #(21 18 19) asOrderedCollection
]

{ #category : #tests }
TemperatureLoggerTest >> testLatestRecordsNewVersion [

	| office |
	office := TemperatureLogger new location: 'Office'.
	office recordTemperature: 16.
	office recordTemperature: 17.
	office recordTemperature: 19.
	office recordTemperature: 18.
	office recordTemperature: 21.
	self assert: (office latestRecords: 3) equals: #(21 18 19) asOrderedCollection
]

{ #category : #tests }
TemperatureLoggerTest >> testRecords [

	| office |
	office := TemperatureLogger new location: 'Office'.
	"Perform two measures that are logged"
	office recordTemperature: 19.
	office recordTemperature: 21.
	
	"We got effectively two measures"
	self assert: office recordCount equals: 2.
]
