<h1>Capstone Savings Bank</h1>

The website that I will create for my final project is a site for a banking institution. For demonstration purposes, I will be creating a functional online bank which offers checking and/or savings accounts. This site will be scalable and adaptable for use by actual financial institutions with minor modifications. 
The general public will be able to view information about the bank, including (but not limited to):
Sales and promotional offers for new customers
Descriptions of benefits enjoyed by customers
Ability to register a new account and fund that account with a debit card
Mission statement
Legal information/disclaimers
Financial tips and tools (calculators, etc.)
Contact and Location information
Help Center (email and phone)
Accountholders and Administrators will access the site in the same manner. However, once logged in, administrators will be prompted to enter their employee passcode. 
Accountholders will be able to view this material:
An overview of all their accounts
Detailed transaction listings for their account(s)
The ability to add funds to their account using a debit card
Ability to transfer funds between accounts
Interest / tax information
Download transaction data as .CSV or .XLS file
Ability to search transactions within an account or filter and sort by date range
Once logged in, and having entered their employee criteria, administrators will have the ability to view and search (by account number or by name) from the entire list of accountholders. They will be able to select a user’s account, view contact and identity information, security question answers, and see their transaction list just as the user does. Administrators will also have the ability to manually edit certain transactions for the purpose of reversing fees. Furthermore, administrators will be able to open or close customer accounts and send messages or alerts to customers. Administrators will also be able to transfer funds between accounts at the customer’s request. Although they will be able to view a customer’s online user id and (upon customer’s request) change it, they will be blocked from viewing their password.
Of course, there is much room for this website to be more complicated. The site and its database will be constructed in such a manner as to easily incorporate the future addition of more features. 

Among the features that would be “nice to have” are:
Additional options for depositing funds (PayPal, etc.)
A trigger that opens the Admin dashboard in an integrated Java applet that is launched in a VNC session on their local machine with access to the site’s database.
Ability for customer to add hashtags to their transactions and search by those tags (i.e. “lunch”, “gift”, “fuel”. Maybe upload picture to associate with transactions.
Security:
Secure Socket Layer (SSL) security
Passwords wrapped using the OpenBSD B-Crypt hashing algorithm
Captcha required on registration form
Prevent session fixation by issuing a new session identifier and declaring the old one invalid after a successful login. (reset_session)
“Sweep” the session after 3 (+/-)  minutes of inactivity
	class Session < ActiveRecord::Base
  	  def self.sweep(time = 3.minute)
    	    if time.is_a?(String)
      	time = time.split.inject { |count, unit| count.to_i.send(unit) }
    	    end
 
    	    delete_all "updated_at < '#{time.ago.to_s(:db)}'"
  	  end
end

Cross-Site Forgery - Prevent URL paths and RESTful verbs from being shown in browser’s status bar using hidden_method fields and protect_from_forgery method
If user tries to access legacy action, it will send them back to site’s home page.
Variety of methods to deal with XSS and JavaScript (CSS) injections.
Additional features:
Responsive design for use with smartphones, tablets
Entire development documented on GitHub
