# my-users-app

## Description

1. Implement MVC architecture.
2. Create a database using `sqlite3`.
3. Users can be created, updated, deleted.
4. Web server with Sinatra that handles requests on different routes.
5. Displays users list on browser

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

For the signed in method, we will be using [session & cookies](https://webapps-for-beginners.rubymonstas.org/sessions/sinatra_sessions.html)
In order to perform a request with `curl` and [save cookies](https://stackoverflow.com/questions/15995919/how-to-use-curl-to-send-cookies/23039038#23039038)
(Be aware it's not the same flags to save & load)

```
$>curl -X POST -i http://web-XXXXXXXXX.docode.qwasar.io/users -d "firstname=value1" -d "lastname=value2"
...
$>
```

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

## STEPS TO REPRODUCE

### PART I

---

```
1. cd into model/user_model
2. uncomment methods in main() in my_user_model.rb
3. run ruby my_user_model.rb
```

### PART II

---

```
1. make sure to uncomment main in my_user_model.rb
2. cd into dir and 'run app.rb'
3. use another terminal to run curl commands
```

`CREATE A USER (POST /users)`</br>

```
curl -X POST -d firstname=test -d lastname=test -d age=1 -d email=example@example.com -d password=test http://localhost:8080/users
```

`GET USERS (GET /users)`</br>

```
curl localhost:8080/users
```

`SIGN IN WITH A COOKIE (POST /sign_in)`</br>

```
curl -X POST -d email=example@example.com -d password=test http://localhost:8080/sign_in -c cookies/cookies.txt
```

`UPDATE PASSWORD (PUT /users)`

```
LOGIN WITHOUT COOKIE => curl -X PUT -d email=example@example.com -d password=test http://localhost:8080/users

LOGIN AND CHANGE PASSWORD => curl -b cookies/cookies.txt -X PUT localhost:8080/users -d email=example@example.com -d password=test -d new_password=hello
```

`DELETE A USER (DELETE /users)`

```
curl -X DELETE localhost:8080/users -d id=4
```

`SIGN OUT USER (DELETE /sign_out)`

```
SIGN OUT => curl -X DELETE localhost:8080/sign_out -d email=example@example.com

TEST => curl -b cookies/cookies.txt -X PUT localhost:8080/users -d email=example@example.com -d password=test

```

### PART II

---

`SEE LIST OF USERS FROM BROWSER`

```

```
