Class {
	#name : #IDWCollaborationNetwork,
	#superclass : #WAComponent,
	#instVars : [
		'requests',
		'newRequest'
	],
	#category : #IDWCollaborationNetwork
}

{ #category : #initialization }
IDWCollaborationNetwork >> initialize [ 
	super initialize .
	newRequest := IDWCollaborationNetworkRequest new user: self session user.
]

{ #category : #rendering }
IDWCollaborationNetwork >> renderContentOn: html [
	html heading level4 with: 'Collaboration Network' .
]

{ #category : #rendering }
IDWCollaborationNetwork >> renderNewRequestForm: html [
	html break. 
	html strong: 'New Request'. html break.
	html form: [ 
		 html textInput: [ :value | newRequest title: value ] ].
	html text: 'Target Network '.
        html select 
            list: #(#Close #Near);
            selected: newRequest destination;
            callback: [ :value |
                newRequest destination: value ].
        html break.
]
