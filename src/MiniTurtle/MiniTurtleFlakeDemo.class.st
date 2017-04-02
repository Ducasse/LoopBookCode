"
| t | 
t := self  new.
t openInWindow.
t inspect.
"
Class {
	#name : #MiniTurtleFlakeDemo,
	#superclass : #Morph,
	#instVars : [
		'surface',
		'circle',
		'frame',
		'spike',
		'position',
		'turtlePosition'
	],
	#category : #MiniTurtle
}

{ #category : #accessing }
MiniTurtleFlakeDemo >> circle [
	^ circle 
]

{ #category : #accessing }
MiniTurtleFlakeDemo >> circleShape [
	"return the precalculated shape for the turtle body"
	^ circle 
]

{ #category : #initialization }
MiniTurtleFlakeDemo >> defaultExtent [
	^ 800@800
]

{ #category : #drawing }
MiniTurtleFlakeDemo >> drawCircles: canvas [

	canvas pathTransform restoreAfter: [
		canvas pathTransform scaleBy: 0.5 .
		canvas 
			setPaint: Color black;
			setShape: self circle;
			draw.

		canvas
			pathTransform scaleBy: 0.8.
		canvas
			setPaint: Color white;
			draw.
		canvas 
			pathTransform scaleBy: 0.8.
		canvas
			setPaint: Color black;
			draw
	]
]

{ #category : #drawing }
MiniTurtleFlakeDemo >> drawOn: aCanvas [

	self render.
	surface displayOnMorphicCanvas: aCanvas at: bounds origin. 

]

{ #category : #drawing }
MiniTurtleFlakeDemo >> drawSpike: canvas [

	|  dist |
	dist := (canvas pathTransform transform: 1@0) - (canvas pathTransform transform: 0@0).
	
	canvas
		setPaint: (Color black alpha: 0.5).
		
	canvas pathTransform restoreAfter: [
 		canvas pathTransform translateX: 0 Y: 	1;
			scaleBy: 0.5 + ((frame *0.1) sin * 0.1 ).
			
		canvas pathTransform  rotateByDegrees: -180.
		1 to: 2 do:[ :i |
			canvas pathTransform  rotateByDegrees: 120 + ((frame * 0.1) cos * 20).
			canvas pathTransform  restoreAfter:  [ self drawSpike: canvas ]
		].
	]


]

{ #category : #'turtle messages' }
MiniTurtleFlakeDemo >> goTo: aPosition [

	turtlePosition := aPosition.
	self render
]

{ #category : #initialization }
MiniTurtleFlakeDemo >> initialize [ 

	super initialize.
	self extent: self defaultExtent.
	turtlePosition := 100@200.

	surface := AthensCairoSurface extent: self extent.

	circle := surface createPath: [:builder |
		builder
			absolute;
			moveTo: -1 @ 0 ; 
			ccwArcTo: 0@ 1 angle: 90 degreesToRadians ;
			ccwArcTo: 1@0 angle: 90 degreesToRadians ;
			ccwArcTo: 0@ -1 angle: 90 degreesToRadians ;
			ccwArcTo: -1@0 angle:  90 degreesToRadians 
	].

	spike := surface createPath: [:builder |
		
		builder
			absolute;
			moveTo:  -0.1 @ 0;
			lineTo: -0.05 @ 1;
			lineTo: 0.05 @ 1;
			lineTo: 0.1 @ 0		
		].

]

{ #category : #drawing }
MiniTurtleFlakeDemo >> render [ 

	surface drawDuring: [:canvas | 
		canvas pathTransform loadIdentity.
		surface clear. 
		canvas pathTransform
			translateX: turtlePosition x Y: turtlePosition y;
			scaleBy: 40.
		 self drawCircles: canvas
	].

]

{ #category : #accessing }
MiniTurtleFlakeDemo >> turtlePosition: aPosition [

	turtlePosition := aPosition
]
