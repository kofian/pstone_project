<h1>Capstone Savings Bank</h1>

<p>The website that I created for my final project is a site for a banking institution. For demonstration purposes, I will be creating a functional online bank which offers checking and/or savings accounts. This site will be scalable and adaptable for use by actual financial institutions with minor modifications.</p>

<p>The general public will be able to view information about the bank, including (but not limited to):</p>
<ul>
	<li>Sales and promotional offers for new customers</li>
	<li>Descriptions of benefits enjoyed by customers</li>
	<li>Mission statement</li>
	<li>Legal information/disclaimers</li>
	<li>Contact and Location information</li>
	<li>Help Center (tips, email and phone)</li>
	<li>Register and set up a new account</li>
</ul>
<p>Accountholders and Administrators will access the site in the same manner.<br />
Accountholders will be able to view the following material:</p>
<ul>
	<li>An overview of all their accounts</li>
	<li>Detailed transaction listings for their account(s)</li>
	<li>Basic (manual) deposit and withdrawal functionality</li>
	<li>Ability to search transactions within an account</li>
	<li>Add a new account</li>
</ul>

<p>Once logged in, and having entered their employee criteria, administrators will have the ability to view and search (by account number or by name) from the entire list of accountholders. They will be able to select a user’s account, view contact and identity information, security question answers, and see their transaction list just as the user does. Furthermore, administrators will be able to open or close customer accounts and send messages or alerts to customers. Although they will be able to view a customer’s online user id and (upon customer’s request) change it, they will be blocked from viewing their password.</p>

<p>Of course, there is much room for this website to be more complicated. The site and its database will be constructed in such a manner as to easily incorporate the future addition of more features. User sessions are "swept" after 10 minutes of inactivity based on settings in the configuration of the Devise authentication module. Cross-Site Forgery - using hidden_method fields and protect_from_forgery method. Lastly, the app features responsive design for use with smartphones and tablets.</p>
