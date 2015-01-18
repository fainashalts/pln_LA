plnLA</br>

WDI Project 2 </br>

*Goal*: to create a social platform for finding and saving interesting activities in the Los Angeles area

*Functionality*: </br> 
Full CRUD in User model and Activity Model. I also have a comments model to create embedded comments inside activities.

Users can sign up, login, edit and delete their own profiles. Users whose admin attribute is equal to true can edit and delete all other users' profiles, while other users must pass verification to make sure that they are the user whose information they are trying to change. Users can also comment on activities once they are logged in from the activity show page.
</br>
</br>
Activities can be created, updated, and deleted by admin users. All users can read the index page and users who are logged in can access the show page for each individual activity. 
</br>
</br>
Users who are logged in can add activities they are interested in to their profile. They can they see which activities they have added from their profile page(the show page). 
</br>
</br>
I set up a permissions system that uses before_actions to check for particular conditions in order to allow users to access certain pages. I have a logged_in before action and a current user before_action, and I let each controller know when and if to skip those checks.
</br>
</br>
*Things I Still Want to Add* </br>
* I didn't have time to go back and give users the ability to reset their passwords. I'd also like to be able to retrieve users' passwords if they forget them and need to look into how to do that. 
* Additional styling- my webpage is responsive using bootstrap, but I would like to play around with js-masonry and get it working, and I'd like to move some things around (for instance, I'd like the picture on the left with description and comments on the right on the activity show page).  </br>
* User following- I'd like to set up an ability for users to follow eachother and see when users they are following add activities in a newsfeed that they would see from the root page and/or their profile page. 
* I'd like to set up a "contact us" form to send emails from users to my email address if they need assistance.