Class {
	#name : #TemperatureLoggerTest,
	#superclass : #TestCase,
	#category : #TemperatureLogger
}

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
