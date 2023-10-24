Class {
	#name : 'FibonacciProgressionTest',
	#superclass : 'TestCase',
	#category : 'Loop-Progression',
	#package : 'Loop-Progression'
}

{ #category : 'tests' }
FibonacciProgressionTest >> testIncrement [

	| fib |
	fib := FibonacciProgression new.
	fib 
		firstValue: 0;
		second: 1.
	self assert: fib nextValue equals: 1.
	self assert: fib nextValue equals: 2.
	self assert: fib nextValue equals: 3.
	self assert: fib nextValue equals: 5.
	self assert: fib nextValue equals: 8.
]
