Class {
	#name : #IDWStudyGroups,
	#superclass : #WAComponent,
	#instVars : [
		'groups',
		'groupName'
	],
	#category : #IDWStudyGroups
}

{ #category : #'as yet unclassified' }
IDWStudyGroups >> createGroup [ 
	| newG |
	newG := IDWStudyGroup new .
	newG groupName: groupName .
	(self groupAlreadyExist: newG ) ifFalse: [ 
		 groups add: newG]
	
]

{ #category : #'as yet unclassified' }
IDWStudyGroups >> groupAlreadyExist: aGroup [
	| t |
	t := false.
	groups do: [ :g |
		g groupName = aGroup groupName ifTrue: [
			t := true . ]
		].
	^ t   
]

{ #category : #initialization }
IDWStudyGroups >> initialize [ 
	super initialize .
	groups := OrderedCollection new .
]

{ #category : #'as yet unclassified' }
IDWStudyGroups >> iniviteUser: aUserName [
	self session users do: [ :u |
		u username = aUserName ]
]

{ #category : #rendering }
IDWStudyGroups >> renderContentOn: html [
	html heading: 'Study Groupszs' .
	groups do: [ :g |
		html render: g ].
	self renderNewGroupForm: html
]

{ #category : #rendering }
IDWStudyGroups >> renderNewGroupForm: html [
	html text: 'Create a new group'. html break.
	html form: [ 
		html text: 'GROUP NAME: '.  html break. 
		html textInput callback: [ :v | groupName := v  ]. 
		html submitButton callback: [ self createGroup ]; with: 'create group' ]
]
