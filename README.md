# simple-timer
A simple timer that contains a start, pause, and reset buttons. 
This was written using programming only, ignoring the given storyboard, to cut down development time.

Motivation: 
A timer is an easy first project for someone beginning to learn Swift.

Problems I ran into: 
- When I created the timer as one uniform UILabel, the entire label would shake as the seconds changed numbers. That is why I decided to break up the hours, minutes, seconds, as well as the semicolons, into separate UILabels. 
- At first, I was confused how to position the buttons after separating the time into separate labels. Then, I realized I can center the buttons based on the position of the minutesLabel instead of trying to match the leadingAnchor with the hoursLabel like I was attempting to do beforehand. 
