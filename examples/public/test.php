<?php

echo "Hello world from PHP container<br/>";

$dbh = new PDO('mysql:host=mysql.symfony', 'root', 'p9iijKcfgENjBWDYgSH7');
foreach($dbh->query('SHOW DATABASES') as $database) {
    echo "Database: {$database['Database']}<br/>";
}