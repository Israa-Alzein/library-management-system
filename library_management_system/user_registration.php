<?php

include 'database_connection.php';

include 'function.php';

if(is_user_login())
{
	header('location:issue_book_details.php');
}

$message = '';

$success = false;

if(isset($_POST["register_button"]))
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

	if(empty($_POST["user_password"]))
	{
		$message .= '<li>Password is required</li>';
	}
	else
	{
		$formdata['user_password'] = trim($_POST['user_password']);
	}

	if(empty($_POST['user_name']))
	{
		$message .= '<li>User Name is required</li>';
	}
	else
	{
		$formdata['user_name'] = trim($_POST['user_name']);
	}

	if(empty($_POST['user_address']))
	{
		$message .= '<li>User Address Detail is required</li>';
	}
	else
	{
		$formdata['user_address'] = trim($_POST['user_address']);
	}

	if(empty($_POST['user_contact_no']))
	{
		$message .= '<li>User Contact Number Detail is required</li>';
	}
	else
	{
		$formdata['user_contact_no'] = trim($_POST['user_contact_no']);
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

		$statement->execute($data);

		if($statement->rowCount() > 0)
		{
			$message = '<li>Email Already Register</li>';
		}
		else
		{

			$success = true;

			$user_unique_id = 'U' . rand(10000000,99999999);

			$data = array(
				':user_name'			=>	$formdata['user_name'],
				':user_address'			=>	$formdata['user_address'],
				':user_contact_no'		=>	$formdata['user_contact_no'],
				':user_email_address'	=>	$formdata['user_email_address'],
				':user_password'		=>	$formdata['user_password'],
				':user_unique_id'		=>	$user_unique_id,
				':user_status'			=>	'Enable',
				':user_created_on'		=>	get_date_time($connect)
			);

			$query = "
			INSERT INTO lms_user 
            (user_name, user_address, user_contact_no, user_email_address, user_password, user_unique_id, user_status, user_created_on) 
            VALUES (:user_name, :user_address, :user_contact_no, :user_email_address, :user_password, :user_unique_id, :user_status, :user_created_on)
			";

			$statement = $connect->prepare($query);

			$statement->execute($data);


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
	<title>register</title>
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
		if($success == true){
			echo '<div class="Cmessage">'. "Regestrated Successfully!" .'<br><a href="user_login.php"><button class="Sbtn">' . "Login Now" . '</button></div>';
		}

		?>

		    <header> New User Registration </header>

            <form method="POST">

				<div class="field input">
					<label for="email">Email address</label>

					<input type="text" name="user_email_address" id="user_email_address"/>

				</div>

				<div class="field input">
					<label class="form-label">Password</label>

					<input type="password" name="user_password" id="user_password"/>

				</div>

				<div class="field input">
					<label class="form-label">Username</label>

					<input type="text" name="user_name" id="user_name"/>

				</div>

				<div class="field input">
					<label class="form-label">User Contact No.</label>

					<input type="text" name="user_contact_no" id="user_contact_no"/>

				</div>

				<div class="field input">
					<label class="form-label">User Address</label>

					<input type="text" name="user_address" id="user_address"/>

				</div>

				<div class="field">

					<input type="submit" name="register_button" class="btn" value="Register"/>

				</div>

				</form>

	    </div>

	</div>
</body>
</html>
