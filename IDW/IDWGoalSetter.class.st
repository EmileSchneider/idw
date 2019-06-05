Class {
	#name : #IDWGoalSetter,
	#superclass : #WAComponent,
	#instVars : [
		'goals',
		'goal',
		'newG'
	],
	#category : #IDW
}

{ #category : #initialization }
IDWGoalSetter >> getNewGoal [
	^ IDWGoal new user: self session user
	
]

{ #category : #initialization }
IDWGoalSetter >> initialize [ 	
	super initialize .
	goal := IDWGoal new user: (IDWUser new userName: '').
	goals := OrderedCollection new .
	newG := false .
]

{ #category : #rendering }
IDWGoalSetter >> renderContentOn: html [
	html heading level2 class: 'appHeading'; with: 'Goal Setter' . 
	self session isLoggedIn ifTrue: [ 
		html strong: self session user userName . html break.
		self renderGoalsList: html. ]. 
	html form: [ 
		html anchor callback: [goal := self getNewGoal . newG := true ]; with: 'newGoal' ] .
		newG ifTrue: [ 
			self renderNewGoalForm: html ]
]

{ #category : #rendering }
IDWGoalSetter >> renderGoal: html goal: g [
	html break.
	html text: 'USER: '. html text: g user userName. 
	html break.
	html text:  'GOAL = '. html text: g title.
	html break.
	html text: 'MILESTONE: '. html text: g milestone .
	html break.
	html text: 'CONTEXT: '. html text: g context .
	html break.
	html text: 'META: '. html text: g meta .
	html break. 
	html form: [ 
		html submitButton callback: [ goal := g  ];with: 'select'.  
		html submitButton callback: [ goals remove: g.  ];with: 'delete'  ].
	
]

{ #category : #rendering }
IDWGoalSetter >> renderGoalsList: html [
	html text: 'all goals'.
	goals do: [ :g |
		g isNotNil ifTrue: [ 
			self renderGoal: html goal: g ] ]
]

{ #category : #rendering }
IDWGoalSetter >> renderNewGoalForm: html [
  html form: [
		  html text: 'goal title'.
      	  html textInput
            callback: [ :value | goal title: value ];
            value: goal title.
		  html text: 'goal milestone'.
      	  html textInput
            callback: [ :value | goal milestone:  value ];
            value: goal milestone.
        html break.
		   html text: 'goal context'.
      	  html textInput
            callback: [ :value | goal context: value ];
            value: goal context.
		  html text: 'goal meta'.
      	  html textInput
            callback: [ :value | goal meta: value ];
            value: goal meta . 
        html submitButton
            callback: [ goals add: goal. goal := self getNewGoal  ];
            value: 'Save']
]
