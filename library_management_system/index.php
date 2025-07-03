<?php

include 'database_connection.php';
include 'function.php';

if(is_user_login())
{
	header('location:issue_book_details.php');
}

include 'header.php';



?>

<!-- <div class="p-5 mb-4 bg-light rounded-3"> -->
<div class="p-5 mb-4" style="background-color: #622A0F; border-radius: 0.375rem;">

	<div class="container-fluid py-5">

		<h1 class="display-5 fw-bold text" style="color: #EFDECD;">Beautiful Mind Library</h1>

		<p class="fs-4 text" style="color: #EFDECD;">Welcome to our humble online renting library!! It belongs to all of your beatiful minds, with all the fascinating books waiting for some care! &nbsp;&nbsp;&nbsp; -with all love and gratitude; &nbsp; Beautiful Mind Library</p>

	</div>

</div>

<div class="row align-items-md-stretch">

	<div class="col-md-6">

		<div class="h-100 p-5 text-white bg-dark rounded-3">

			<h2>Admin Login</h2>
			<p></p>
			<a href="<?php echo base_url(); ?>admin_login.php" class="btn btn-outline-light">Admin Login</a>

		</div>

	</div>

	<div class="col-md-6">

		<div class="h-100 p-5" style="background-color: #622A0F; color: #EFDECD; border-radius: 0.375rem;">

			<h2>User Login</h2>

			<p></p>

			<a href="<?php echo base_url(); ?>user_login.php" class="btn btn-outline-secondary" style="color: #EFDECD; border-color: #EFDECD;">User Login</a>

			<a href="<?php echo base_url(); ?>user_registration.php" class="btn btn-outline-primary">User Sign Up</a>

		</div>

	</div>

</div>

<?php

include 'footer.php';

?>