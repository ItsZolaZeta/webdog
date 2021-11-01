# Webdog

Webdog is the capstone project of Tatiana Tuor for the EPFLx web development program. 

Live demo link of website deployed on Heroku: [Webdog](https://chilling-caverns-73628.herokuapp.com/)


## Summary

Webdog is the website that allows a dog training center of a handful of certified dog trainers to interact and **organize classes** more easily with their clients. The website has a **forum** for clients to ask questions and for dog trainers to answer and give advice as well as a **blog** for admins and trainers to publish longer articles. Through the **chat** service on the website, any registered user of the website can communciate instanteously with others.

## Challenges

Implementing the chat room feature was very challenging. Learning about Action Cable and how WebSockets work completely on my own was very rewarding. There were some more hiccups along the way, especially for deploying the app into production on Heroku. Lots of additional configuration was necessary in order for the connection to be correctly set up, but like any programmer, searching online for the solution was the way to go. 

## Differences from the [project proposal](https://github.com/epfl-extension-school/capstone-proposal-wad-c5-s1-4920-2690)

The chat room was a bonus feature in the proposal, but since it's working, there are a few extra gems and models added to the project.
* ```redis```: 4.0 - used by ActionCable as a data store for transient data
* ```jquery-rails```: to be able to write jquery javascript

### _Conversation: details the characteristics of 1 conversation between 2 users_

Associations: | Attributes:
------------ | -------------
belongs_to :sender (User) | sender_id
belongs_to :recipient (User) | recipient_id
has_many :messages | \-

### _Message: details the characteristics of message in a conversation_

Associations: | Attributes:
------------ | -------------
belongs_to :user | user_id
belongs_to :conversation | conversation_id
\- | body

## What could be different

Since the guidelines for the capstone project require the usage of a third party API, I decided to use Calendly to handle the scheduling and booking of classes on the website. Unfortunately, the types of events suited for a dog training center fall under Calendly's paying features. Therefore, the website's calendly widget only has the option for the private 1-on-1 class. 

If there was no constraint to use a third party API, the entire scheduling and booking of events could've been coded into the app as models. Trainers could create events to which clients could subscribe to. A model that could serve this purpose:

### _Event: details the characteristics of an event_

Associations: | Attributes:
------------ | -------------
belongs_to :trainer (User) | trainer_id
has_many :participants (User) | [ participant_id ]
\- | date and time
\- | maximum capacity (number)
\- | restrictions on age of dogs (date)
 
## Technologies

* Supported Languages
    * English, French

* Ruby gems or JavaScript libraries outside of those bundled with Ruby on Rails by default.
    * ```Ruby```: 2.6.6
    * ```Rails```: 5.1.7
    * ```bcrypt```: 3.1.16 - for password encryption
    * ```pg```: 1.2.3 - for database in production
    * ```kaminari```: 1.2.1 - for pagination
    * ```carrierwave```: 1.1.0 - for image configuration
    * ```figaro```: 1.2.0 - for protection of sensitive information like api keys
    * ```fog-aws```: 3.12.0 - for connecting to AWS S3 to store images 
    * ```bulma-rails```: 0.9.1 - for css framework
    * ```redis```: 4.0 - used by ActionCable as a data store for transient data
    * ```jquery-rails```: to be able to write jquery javascript

* CSS frameworks
    * Bulma (through ruby gem)

* Third party APIs
    * Calendly - Third Party API for scheduling and booking events (for more advanced features, a paid subscription is necessary)
    * Amazon Web Service S3 - to store images on the cloud


* Deployment services
    * Heroku - Deployment of website


