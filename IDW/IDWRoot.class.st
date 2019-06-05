"
IDW Root
"
Class {
	#name : #IDWRoot,
	#superclass : #WAComponent,
	#instVars : [
		'controllBar',
		'auth',
		'goalSetter'
	],
	#category : #IDW
}

{ #category : #testing }
IDWRoot class >> canBeRoot [
	^ true
]

{ #category : #hooks }
IDWRoot >> children [
	| c |
	c := OrderedCollection new .
	c add: controllBar .
	c add: auth .
	c add: goalSetter .
	^ c 
]

{ #category : #initialization }
IDWRoot >> initialize [ 
	super initialize.
	controllBar := IDWControllBar new.
	auth := IDWAuthentication new .
	goalSetter := IDWGoalSetter new .
	
]

{ #category : #rendering }
IDWRoot >> renderContentOn: html [
	html render: controllBar .
	html heading: 'IDW'.
	html render: auth .
	html render: goalSetter .
	
]
