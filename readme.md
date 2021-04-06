

## Set up
1. Install php extension

1.1.  extension=amqp
- https://dev.to/rezehnde/how-to-install-amqp-extension-for-php-7-4-on-windows-10-108d

1.2. Redis
- https://www.phpflow.com/php/how-to-setup-redis-server-and-use-with-php/
- https://github.com/tporadowski/redis/releases
- redis does not support windows officially
- https://gist.github.com/mtvbrianking/eb7e1dc54d4b85a0a3f27c21fe4d654f

## Step 5: Trouble shooting problems
1. Fix error: An error occurred while loading the web debug toolbar
- create .htaccess in folder public
```
 <IfModule mod_rewrite.c>
       RewriteEngine On
       RewriteCond %{REQUEST_FILENAME} !-f
       RewriteRule ^(.*)$ index.php [QSA,L]
   </IfModule>
```
- https://github.com/symfony/symfony/issues/35365
- https://blog.cleiver.me/symfony-4-an-error-occurred-while-loading-the-web-debug-toolbar-ck1ckgs88001mjus1xa554jov

2. Note
- command list:
```
symfony composer req logger
symfony composer req debug --dev
symfony server:log
```
- php.ini config to link from chrome error message to vscode file
```
 session.use_strict_mode=On
 realpath_cache_ttl=3600
 zend.detect_unicode=Off
xdebug.file_link_format=vscode://file/%f:%l
```

3. Going further
- [Symfony 5.2 configuration](https://symfony.com/doc/current/configuration.html)

## Step 6: Creating a controller
1. Note:
- command list:
```
symfony composer req maker --dev
symfony console list
symfony console list make
symfony composer req annotations
```
- You might wonder how you can guess the package name you need to install for a feature? Most of the time, you don’t need to know. In many cases, Symfony contains the package to install in its error messages. Running symfony make:controller without the annotations package for instance would have ended with an exception containing a hint about installing the right package.

- Creating controller
```
symfony console make:controller ConferenceController
```
- If you can not config DocumentRoot to public folder. Static assets like images will return 404. You can walk around by .htaccess redirection in root folder
```
<IfModule mod_rewrite.c>
       RewriteEngine On
       RewriteCond %{REQUEST_URI} ^/images/
       RewriteRule ^(.*)$ /symfony_the_fast_track/public/$1 [L]
</IfModule>
```
- [router cheat sheet](https://github.com/andreia/symfony-cheat-sheets/blob/master/Symfony4/routing_en_part1.pdf)
- [symfony routing](https://symfony.com/doc/current/routing.html)
- [console cheat sheet](https://github.com/andreia/symfony-cheat-sheets/blob/master/Symfony4/console_en_42.pdf)

## Step 7: Setting up Database
1. Note:

- Create file docker-compose.yaml in the same folder with the code so symfony cli will auto detect database service.
- The following command will require psql binary installed in your computer and be added to windows PATH.
```
symfony run psql
symfony run pg_dump --data-only > dump.sql
```
- To install the required binary, You have to install PostgreSQL in windows. Then add bin folder to %PATH%

[create account and down load for free](https://www.enterprisedb.com/downloads/postgresql)

[some tut for ref](http://www.7codes.info/post/13/install-postgresql-in-xampp-on-windows-and-integrate-phppgadmin-tool)

- If you run psql command via docker-compose using the following command. You will get error: "role root does not exist"
```
docker-compose exec database psql main
```
This happen because by default you login virtual linux with user root and connect to database with user root while the database do not have user root. You will have to create a linux user with the same name with database user. Some tut on the internet say the default user is postgres but it does not work in this case. I found out the default user is main by running:
```
symfony run pg_dump --data-only > dump.sql  # If this command work, it means you successfully connect to database
symfony var:export # This command shall dump the info used to connect to database
```
So the walk aroud is to connect to docker-compose ```docker-compose exec database sh``` . Then create user main ```adduser main ```. Switch to user main ```su main```. Test that you can use psql commant ``` psql main ```

2. Going furthur
- [postgresql doc](https://www.postgresql.org/docs/current/index.html)

## Step 9: Setting up Admin Backend
### 1. Note
- The evironment variable you get from command ```symfony var:export ``` is retrived from docker service because symfony is intergrated with docker. These variable only visible if you run symfony local web server ```symfony serve -d```. If you use xampp, wampp or other server you can only see environment variable in file .env and cause faltal error when connect to docker postgres server. 

## Step 12: Listening to Events
### 1. Note
- You can excute command to find out which listeners are registered for an event and their priorities. Example
```
php bin/console debug:event-dispatcher kernel.request
```
- [Symfony built-in events](https://symfony.com/doc/current/reference/events.html)

## Step 13: Managing the lifecycle of Doctrine object

### 1. Going futhur
- [symfony service cheat sheet](https://github.com/andreia/symfony-cheat-sheets/blob/master/Symfony4/services_en_42.pdf)
- [symfony doc for Service Container](https://symfony.com/doc/current/service_container.html)