Class {
	#name : #IDWGoalsetter,
	#superclass : #WAComponent,
	#instVars : [
		'editGoal',
		'goals',
		'newG'
	],
	#category : #IDWGoalSetter
}

{ #category : #initialization }
IDWGoalsetter >> initialize [ 
	super initialize . 
	goals := OrderedCollection new .
	newG := false.
	
]

{ #category : #rendering }
IDWGoalsetter >> renderContentOn: html [
	html heading level3 with: 'Goal Setter'.
	html heading level5 with: 'Goals List'.
	goals do: [ :g | self renderGoal: html goal: g ] .
	self session isLoggedIn ifTrue: [ 
		self renderNewGoalForm: html editGoal: ((editGoal isNotNil) ifTrue:[ ^ editGoal]; ifFalse: [ IDWGoal new user: self session user]).
		 ]
]

{ #category : #rendering }
IDWGoalsetter >> renderGoal: html goal: g [
	html strong: 'GOAL Title: '. html text: g title.
	html form: [ 
		html submitButton callback: [ goals remove: g ]; with: 'delete goal' .
		html submitButton callback: [ editGoal := g ]; with: 'edit goal' .
		].
	html break.
]

{ #category : #rendering }
IDWGoalsetter >> renderNewGoalForm: html editGoal: goal [  
	html text: 'New Goal'. html break.
	html form: [ 
		html text: 'goal title'. html textInput callback: [ :value |
			goal title: value ]; value: goal title.
		html submitButton callback: [ goals add: goal. newG := false ]; with: 'add new goal'
		 ]
]
