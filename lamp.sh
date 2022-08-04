#!/Bin/bassh
			echo 'será solicitado a senha do root do sistema para fazer as instalações'
			sudo apt update
 			sudo apt upgrade
			sudo apt install apache2	
			sudo apt install mariadb-server
			sudo apt install php libapache2-mod-php php-mysql php-cli php-curl
			echo 'Agora será configurado o mysql/mariadb
	----------------------------TUTORIAL DE CONFIGURAÇÂO---------------------------------------------------	
				Set root password? [Y/n] -> [N]
 				Remove anonymous users? [Y/n] ->[Y]
 				Disallow root login remotely? [Y/n] ->[Y]
 				Remove test database and access to it? [Y/n] ->[Y]
 				Reload privilege tables now? [Y/n]  ->[Y]
--------------------------------------FIM TUTORIAL----------------------------------------------------------------'	
			sudo mysql_secure_installation
  				read -p 'digite o usuario: ' user
               			read -p 'digite a senha: ' senha
				read -p 'digite o nome da bd: ' bd 
			sudo mysql -e\
				"create database $bd;"
               		sudo mysql -e\
                                "GRANT ALL ON $bd.* TO '$user'@'localhost' IDENTIFIED BY '$senha' WITH GRANT OPTION;"
		echo 'lembre de digitar apenas os 2 primeiros numeros da versão php e isto inclui o "."'
			php -v
			read -p 'digite a versão do php: ' verso
			sudo sed -i 's/file_uploads = Off/file_uploads = On/' /etc/php/$verso/apache2/php.ini
			sudo sed -i 's/allow_url_fopen = Off/allow_url_fopen = On/' -e 's/\#upload_tmp_dir/upload_tmp_dir = \/tmp/'  -e 's/memory_limit = 128M/memory_limit = 256M/'  -e 's/post_max_size = 8M/post_max_size = 50M/' -e 's/upload_max_filesize = 2M/upload_max_filesize = 100M/' -e 's/max_execution_time = 30/max_execution = 360/' -e 's/date.timezone/date.timezone = America\/Sao_Paulo/' /etc/php/$verso/apache2/php.ini

	
			sudo apt install phpmyadmin		

 		

echo 'obrigado'
 

