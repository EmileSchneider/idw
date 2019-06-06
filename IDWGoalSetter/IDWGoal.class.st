Class {
	#name : #IDWGoal,
	#superclass : #Object,
	#instVars : [
		'user',
		'title',
		'milestone',
		'context',
		'meta',
		'isAccomplished',
		'failed',
		'dueDate'
	],
	#category : #IDWGoalSetter
}

{ #category : #accessing }
IDWGoal >> context [
	^ context
]

{ #category : #accessing }
IDWGoal >> context: anObject [
	context := anObject
]

{ #category : #initialization }
IDWGoal >> initialize [
	super initialize . 
	title := ''.
	milestone :=''.
	context := ''.
	meta := ''.
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
