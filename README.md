# my-users-app

## Description

1. Implement MVC architecture.
2. Create a database using `sqlite3`.
3. Users can be created, updated, deleted.
4. Views that displays users list

### Part I

---

Create a `class User`, it will be your interface in order to

create user </br>
get user </br>
get users </br>
update user </br>
destroy user in sqlite. </br>
You will use the gem `sqlite3`. </br>
The sqlite filename will be named db.sql. </br>

Your table will be name users and will have multiple attributes:

`firstname` as `string` </br>
`lastname` as `string` </br>
`age` as integer </br>
`password` as `string` </br>
`email` as `string` </br>

Your class will have the following methods:

`def create(user_info)`
It will create a user. User info will be: firstname, lastname, age, password and email
And it will return a unique ID (a positive integer)

`def get(user_id)`
It will retrieve the associated user and return all information contained in the database.

`def all`
It will retrieve all users and return a hash of users.

`def update(user_id, attribute, value)`
It will retrieve the associated user, update the attribute send as parameter with the value and return the user hash.

`def destroy(user_id)`
It will retrieve the associated user and destroy it from your database.

### Part II

---

Create/use a `User` class which will use as a backend `sqlite`. Filename will be `db.sql`. Database will be named `my_first_app`.

It will have multiple routes:

`POST` on `/users`. Receiving firstname, lastname, age, password and email. It will create a user and store in your database.

`GET` on `/users`. This action will return all users (without their passwords).

`POST` on `/sign_in`. Receiving email and password. It will add a session containing the user_id in order to be logged in.

`PUT` on `/users`. This action require a user to be logged in. It will receive a new password and will update it. It returns the hash of the user.

`DELETE` on `/sign_out`. This action require a user to be logged in. It will sign_out the current user.

`DELETE` on `/users`. This action require a user to be logged in. It will sign_out the current user and it will destroy the current user.

### Part III

---

Create subdirectory views and inside, create a file named: index.html (you will have to submit it)

```
$>cat views/index.html
<!DOCTYPE html>
<html>
    <head>
        <title>Users index page</title>
    </head>
    <body>
        <h1>Users</h1>
        <table>
            <tr>
                <th>FirstName</th>
                <th>LastName</th>
                <th>Age</th>
                <th>Email</th>
            </tr>
            <tr>
                <td>XXXX</td>
                <td>XXXX</td>
                <td>XXXX</td>
                <td>XXXX</td>
            </tr>
        </table>
    </body>
</html>
$>
```

-- `tr` are for line in the table </br>
-- `th` are for header row (you should only have one of them) </br>
-- `td` are for content row (you should have a lot of them) </br>

```
# set('views', './views')
```

```
Tips
To run a server locally you need to use port: 8080
and if you want to access it from your browser, you need to change the binding address to: 0.0.0.0

It will have a route GET on /. This action will render the template in index.html.
```

## STEPS TO REPRODUCE

### PART I

---

```
1. cd into model/user_model
2. uncomment methods in main() in my_user_model.rb
3. run ruby my_user_model.rb
```
