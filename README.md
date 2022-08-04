# eHealth Scheduling

Flutter mobile app for scheduling, built by students at Purdue University

## What Does This App Do?

This project uses Flutter to display an app like program that can be interacted with the user

This app uses the basic foundations of the Google Scheduling API in order to set up an order of events that is the most efficient. This app uses the knowledge of single machine scheduling in order to schedule multiple jobs in the order that is most desired. 

## What should the user enter

The user will have to enter the event duration and the priority of the event. 
The event duration will be the processing time of that specific event
The priority of the event is how important and how much weight that individual job carries.

## How to Use the App
When using the app, the user is prompted with the choice to "add event" or "create file".
If the user chooses to create a file, the user will be able to enter a string of numbers that has two meanings. The user will write each of the jobs processing time and priority of the job. After entering these values into the file, the program will run and will output a graph that shows what order each job will be finished by. The graph will also show when each individual job will be finished.
If the user chooses to "add event", the user will be able to directly enter the job's processing time and priority of the event. 
