# Train ticket booking system

*  Ruby version -> 3.1.2 
*  sqlite3 -> 1.4
*  rails version -> 7.0.4

================================================================

# Features 

| Features      | Description |
| :---        |    :---   |
| SignIn & SignUp      | different signIn for passenger and admin |
| Edit Profile      | User can edit their profile |
| Add Train      | Admin can do curd(create,update,rename,delete) operation on train  |
| Add Schedules      | Admin can do curd operation on Schedules of train  |
| Add Places      | Admin can do curd operation on places  |
| Book ticket      | Passenger and Admin can book and cancel the tickets  |
| SMS service      | On Ticket booking User get the message on mobile using twillio API's  |
| Passenger log      | Admin can see the passenger log  |
| Ticket History      | Passenger and Admin can see their ticket history  |
| Payment History      | Passenger and Admin can see their Previous transaction history  |


================================================================
## To run the project 
1) after cloning go to the train-booking-system folder
2) run 
`` 
    bundle install 
``
command (if not working then update your ruby version in the gemfile)
3) Then run
``
    rails db:migrate
``
command
4) Then run the 
``
    rails s
`` 
for starting the server 

================================================================

>## NOTE : Only Database administrator can make the admin.

## For adding admin DBA need to fire below query

``
    update users set role = 0 where id in (__id_of_user_to_whom_dba_want_to_make_admin__);
``
### example : 
``
    update users set role = 0 where id in (1,2,3);
``

================================================================

### For adding SMS services Need a twillio account no., auth token , twillio_mobile_no into ticket_controller.rb file

================================================================
## ER-Diagram
![ER-Diagram](https://user-images.githubusercontent.com/57848389/205338814-e540f5f0-16e5-4e6f-8ce0-3d1ed28be515.png)

## SignIn and SignUp Page
![SignIn and SignUp Page](https://user-images.githubusercontent.com/57848389/205338286-e7735b77-a8e0-4bf2-b841-5716ad5d09a2.jpg)

## Admin Dashboard
![Admin Dashboard](https://user-images.githubusercontent.com/57848389/205338338-286d5e66-ecb8-4f02-8324-36c5ed77c346.jpg)

## Schedule and book ticket page
![Schedule and book ticket page](https://user-images.githubusercontent.com/57848389/205338500-eba8ecbe-b11d-4f15-a100-0bf3df03bcf6.jpg)

## Ticket history
![Ticket history page](https://user-images.githubusercontent.com/57848389/205338758-893702d9-1331-4122-a87f-045c20d48ada.jpg)

## Passenger Log
![Passenger log](https://user-images.githubusercontent.com/57848389/205338685-8a5fa751-1859-4622-a2c9-1610ef111074.jpg)
