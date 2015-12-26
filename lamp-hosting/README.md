##### Setup Apache / PHP in EC2 Ubuntu 

Follow steps below to configure a new website in EC2 instance.

1. Create new EC2 Ubuntu instance
2. Upload all the files in this folder
3. Run server script which will configure apache, php, your website etc.  
	./lamp-server-setup.sh example.com
	Your site home directory can be found at /var/sites/example.com

######Notes
1. You can host any number of LAMP based websites on one single EC2 instance. Just run the script with multiple domains to create multi-tenant apache configuration. Each site gets it's own home folder. 
