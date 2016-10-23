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
	results := (converter convertFarhenheitFrom: 50 to: 70 by: 2).
	exceptedCelcius := #(10.0 11.1 12.2 13.3 14.4 15.5 16.6 17.7 18.8 20.0 21.1).
	
	1 to: results size do: [:i |
		self assert: ((results at: i) value closeTo: (exceptedCelcius at: i) precision: 0.1) ] 
]

{ #category : #tests }
TemperatureConverterTest >> testFToCScale2 [

	| converter results expectedCelcius |
	converter := TemperatureConverter new. 
	results := (converter convertFarhenheitFrom: 50 to: 70 by: 2).
	expectedCelcius := #(10.0 11.1 12.2 13.3 14.4 15.5 16.6 17.7 18.8 20.0 21.1).
	
	results with: expectedCelcius 
		do: [ :res :cel | res value closeTo: cel ] 
]

{ #category : #tests }
TemperatureConverterTest >> testFahrenheitToCelcius [

	| converter |
	converter := TemperatureConverter new. 
	self assert: ((converter convertFarhenheit: 86) closeTo: 30.0 precision: 0.1).
	self assert: ((converter convertFarhenheit: 50) closeTo: 10 precision: 0.1)
]
