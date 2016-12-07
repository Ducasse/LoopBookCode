Class {
	#name : #TemperatureConverterTest,
	#superclass : #TestCase,
	#category : #Converter
}

{ #category : #tests }
TemperatureConverterTest >> testCelciusToFahrenheit [

	| converter |
	converter := TemperatureConverter new. 
	self assert: ((converter convertCelsius: 30) closeTo: 86.0)
]

{ #category : #tests }
TemperatureConverterTest >> testFToCScale [

	| converter results exceptedCelcius |
	converter := TemperatureConverter new. 
	results := (converter convertFahrenheitFrom: 50 to: 70 by: 2).
	exceptedCelcius := #(10.0 11.1 12.2 13.3 14.4 15.5 16.6 17.7 18.8 20.0 21.1).
	
	1 to: results size do: [:i |
		self assert: ((results at: i) value closeTo: (exceptedCelcius at: i) precision: 0.1) ] 
]

{ #category : #tests }
TemperatureConverterTest >> testFToCScaleUsingWithDo [

	| converter results expectedCelcius |
	converter := TemperatureConverter new. 
	results := (converter convertFahrenheitFrom: 50 to: 70 by: 2).
	expectedCelcius := #(10.0 11.1 12.2 13.3 14.4 15.5 16.6 17.7 18.8 20.0 21.1).
	
	results with: expectedCelcius 
		do: [ :res :cel | res value closeTo: cel ] 
]

{ #category : #tests }
TemperatureConverterTest >> testFahrenheitToCelcius [

	| converter |
	converter := TemperatureConverter new. 
	self assert: ((converter convertFahrenheit: 86) closeTo: 30.0 precision: 0.1).
	self assert: ((converter convertFahrenheit: 50) closeTo: 10 precision: 0.1)
]

{ #category : #tests }
TemperatureConverterTest >> testLocationAndDate [

	| converter |
	converter := TemperatureConverter new location: 'Lille'. 
	converter measureCelsius: 19.
	converter measureCelsius: 21.
	self assert: converter measureCount equals: 2. 
	self assert: converter dates equals: {Date today . Date today} asOrderedCollection.
	self assert: converter temperatures equals: { 19 . 21 } asOrderedCollection
	
]

{ #category : #tests }
TemperatureConverterTest >> testLocationAndDateWithConversion [

	| converter |
	converter := TemperatureConverter new location: 'Lille'. 
	converter measureFahrenheit: 86.
	converter measureFahrenheit: 50.
	self assert: converter measureCount equals: 2. 
	self assert: converter dates equals: {Date today . Date today} asOrderedCollection.
	self assert: converter temperatures equals: { converter convertFahrenheit: 86 . converter convertFahrenheit: 50 } asOrderedCollection
	
]

{ #category : #tests }
TemperatureConverterTest >> testTwoLocations [

	| office home |
	office := TemperatureConverter new location: 'office'. 
	office measureFahrenheit: 19.
	office measureFahrenheit: 21.
	self assert: office location equals: 'office'.
	self assert: office measureCount equals: 2. 
	home := TemperatureConverter new location: 'home'. 
	home measureFahrenheit: 22.
	home measureFahrenheit: 22.
	home measureFahrenheit: 22.
	self assert: home location equals: 'home'.
	self assert: home measureCount equals: 3. 
	
	
]
