Class {
	#name : #IDWStudyGroups1,
	#superclass : #WAComponent,
	#instVars : [
		'groups',
		'newMessage'
	],
	#category : #IDWStudyGroups1
}

{ #category : #'as yet unclassified' }
IDWStudyGroups1 >> createNewStudyGroup: title [ 
	| newG |
	newG := IDWStudyGroup1 new.
	newG groupName: title.
	^ newG.
	
]

{ #category : #initialization }
IDWStudyGroups1 >> initialize [
	super initialize . 
	groups := OrderedCollection new.
]

{ #category : #rendering }
IDWStudyGroups1 >> renderContentOn: html [
	| groupTitle |
	self renderStudyGroups: html.
	self session isLoggedIn ifTrue: [ 
		html heading level4 with: 'New Group'.
		html form: [ 
		      html textInput callback: [ :value | groupTitle := value ].	
	 			html submitButton callback: [ groups add: (self createNewStudyGroup: groupTitle) ]].
		]
]

{ #category : #rendering }
IDWStudyGroups1 >> renderGroup: html group: g [ 
	html heading level4 with: 'GROUP: '  .
	html text: g groupName. html break.
	html text: 'Group USERS: '. g users do: [ :u | html text: u + ' '.  ].
	html heading level4 with: 'MESSAGES' .
	g messages do: [ :msg | 
		html text: 'SENDER: '. html text: msg sender. html break.
		html paragraph: msg content ]
	
	
]

{ #category : #rendering }
IDWStudyGroups1 >> renderStudyGroups: html [
	| groupTitle |
	html heading: 'Study Groups'.
	groups do: [ :g | 
		self renderGroup: html group: g.
		html form: [ 
			 html select
				list: (self session allUsers collect: [ :user | user userName ] );
				selected: self session user;
            		callback: [ :u | g addUser: u ] .
		html submitButton: 'invite to group'. ].
		html form: [ 
				html text: 'new MEssage to group'.
				html textInput callback: [ :value | g newMessage: (IDWmessage1 new sender: self session user; content: value) ]. 
				html submitButton with: 'new message'
				]
			  ] 
]
