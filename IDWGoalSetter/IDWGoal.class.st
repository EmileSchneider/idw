Class {
	#name : #IDWGoal,
	#superclass : #Object,
	#instVars : [
		'user',
		'title',
		'milestone',
		'context',
		'meta',
		'plan',
		'isAccomplished',
		'failed',
		'dueDate',
		'subGoals'
	],
	#category : #IDWGoalSetter
}

{ #category : #initialization }
IDWGoal >> addSubGoal [
	| newSGoal |
	newSGoal := IDWGoal new.
	subGoals add: newSGoal .
	^ newSGoal
]

{ #category : #initialization }
IDWGoal >> addSubGoal: t milestone: m [ 
	| newSGoal |
	newSGoal := IDWGoal new title: t; milestone: m .
]

{ #category : #initialization }
IDWGoal >> addSubGoal: t milestone: m user: u [
	| newSGoal |
	newSGoal := IDWGoal new title: t; milestone: m; user: u.
	subGoals add: newSGoal 
]

{ #category : #accessing }
IDWGoal >> context [
	^ context
]

{ #category : #accessing }
IDWGoal >> context: anObject [
	context := anObject
]

{ #category : #accessing }
IDWGoal >> dueDate [
	^ dueDate
]

{ #category : #accessing }
IDWGoal >> dueDate: anObject [
	dueDate := anObject
]

{ #category : #accessing }
IDWGoal >> failed [
	^ failed
]

{ #category : #accessing }
IDWGoal >> failed: anObject [
	failed := anObject
]

{ #category : #initialization }
IDWGoal >> initialize [
	super initialize . 
	title := ''.
	milestone :=''.
	context := ''.
	meta := ''.
	subGoals := OrderedCollection new .
]

{ #category : #accessing }
IDWGoal >> isAccomplished [
	^ isAccomplished
]

{ #category : #accessing }
IDWGoal >> isAccomplished: anObject [
	isAccomplished := anObject
]

{ #category : #accessing }
IDWGoal >> meta [
	^ meta
]

{ #category : #accessing }
IDWGoal >> meta: anObject [
	meta := anObject
]

{ #category : #accessing }
IDWGoal >> milestone [
	^ milestone
]

{ #category : #accessing }
IDWGoal >> milestone: anObject [
	milestone := anObject
]

{ #category : #accessing }
IDWGoal >> plan [
	^ plan
]

{ #category : #accessing }
IDWGoal >> plan: anObject [
	plan := anObject
]

{ #category : #accessing }
IDWGoal >> subGoals [
	^ subGoals
]

{ #category : #accessing }
IDWGoal >> subGoals: anObject [
	subGoals := anObject
]

{ #category : #accessing }
IDWGoal >> title [
	^ title
]

{ #category : #accessing }
IDWGoal >> title: anObject [
	title := anObject
]

{ #category : #accessing }
IDWGoal >> user [
	^ user
]

{ #category : #accessing }
IDWGoal >> user: anObject [
	user := anObject
]
