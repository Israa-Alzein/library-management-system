<?php

//user_login.php

include 'database_connection.php';

include 'function.php';

if(is_user_login())
{
	header('location:issue_book_details.php');
}

$message = '';

if(isset($_POST["login_button"]))
{

	$formdata = array();

	if(empty($_POST["user_email_address"]))
	{
		$message .= '<li>Email Address is required</li>';
	}
	else
	{
		if(!filter_var($_POST["user_email_address"], FILTER_VALIDATE_EMAIL))
		{
			$message .= '<li>Invalid Email Address</li>';
		}
		else
		{
			$formdata['user_email_address'] = trim($_POST['user_email_address']);
		}
	}

	if(empty($_POST['user_password']))
	{
		$message .= '<li>Password is required</li>';
	}	
	else
	{
		$formdata['user_password'] = trim($_POST['user_password']);
	}

	if($message == '')
	{
		$data = array(
			':user_email_address'		=>	$formdata['user_email_address']
		);

		$query = "
		SELECT * FROM lms_user 
        WHERE user_email_address = :user_email_address
		";

		$statement = $connect->prepare($query);

		$statement->bindValue(':user_email_address', $formdata['user_email_address'], PDO::PARAM_STR);

		$statement->execute();


		if($statement->rowCount() > 0)
		{
			foreach($statement->fetchAll() as $row)
			{

				if($row['user_status'] == 'Enable')
				{
					if(trim($row['user_password']) == trim($formdata['user_password']))
					{
						$_SESSION['user_id'] = $row['user_unique_id'];
						header('location:issue_book_details.php');
					}
					else
					{
						$message = '<li>Wrong Password</li>';
					}
				}
				else
				{
					$message = '<li>Your Account has been disabled</li>';	
				}
			}
		}
		else
		{
			$message = '<li>Wrong Email Address</li>';
	    }
	}
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="asset/css/style.css">
	<title>Login</title>
</head>
<body>
    <div class="row">
            <a href="index.php" class="d-flex align-items-center text-decoration-none">
                <span class="fs-5" style="color:  white">Return Back</span>
            </a>
    </div> 
    <div class="container">
        <div class="box form-box">

		<?php 
		if($message != '')
		{
			echo '<div class="alert alert-danger"><ul>'.$message.'</ul></div>';
		}
		?>

		    <header> User Login </header>

            <form method="POST">

				<div class="field input">
					<label for="email">Email address</label>

					<input type="text" name="user_email_address" id="user_email_address"/>

				</div>

				<div class="field input">
					<label class="form-label">Password</label>

					<input type="password" name="user_password" id="user_password"/>

				</div>

				<div class="field">

					<input type="submit" name="login_button" class="btn" value="Login"/>

				</div>

				</form>

	    </div>

	</div>
</body>
</html>
