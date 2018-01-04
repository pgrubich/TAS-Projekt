<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Rejestracja</title>
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <script src="script.js" type="text/javascript"></script>
</head>
<body>
<div id="container">
    <div id="panel">
        <div id="top">
            <input type="submit" value="Powrót" onclick="location.href = 'index.php';" id= "back" ><br>
        </div>
        <div id="mid">
            <form action="signup.php" method="post">

                Nazwa użytkownika: <br>
                <input type="username" name="username"><br>
                <?php include 'signup_err1.php'?>

                Hasło: <br>
                <input type="password" name="pass1"><br>
                <?php include 'signup_err2.php'?>

                Powtórz hasło: <br>
                <input type="password" name="pass2"><br>


                <input type="submit" value="Zarejerstruj się" ><br>

            </form>
        </div>
    </div>
</div>

</body>
</html>
