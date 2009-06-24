rm -rfv lib/Chado/Schema/;
maint/bin/update_dbic_dump.pl -d 'dbi:Pg:dbname=foo;host=localhost;user=web_usr;password=sol@ley!' -c ~/gmod/cvs/schema/chado;
find lib;
