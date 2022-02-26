# crimes-database
Criminology Database containing the most significant crime-related entities, views and queries

To create the Crimes Database:

1. Download and open MySQL Workbench.
2. Sign in as administrator.
3. Drag & drop the `crimesDB.sql` file from the `database` folder, or just open it through MySQL Workbench.
4. Press the lightning symbol to run the executable and create the database.
5. In order for it to appear in the `schemes` tab, you might need to refresh it.


To create the users:

1. Open a new query file in MySQL Workbench and transfer `users.sql` from `database` folder in it.
2. Press the lightning symbol to run the executable and create the users.


To sign in as a user:

1. In the home tab, create a new connection.
2. Type the name of the user you want to sign in as.
3. Use as password, the one declared during the creation of the user. This can be obtained from the 
   `users.sql` file in `database` folder. Just look through the code.
4. Now you are logged in and can verify the restricted usage capabilities of each user, compared to 
   the administrator's full access.


To try out the queries:

1. Open a new query in MySQL Workbench.
2. Transfer the code of the desired query from `queries` folder.
3. Hit the lightning button to see that the database indeed returns what was requested.

