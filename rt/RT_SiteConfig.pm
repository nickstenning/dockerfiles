Set( $rtname, "example.org" );
Set( $WebPort, 8080 );
Set( $WebDomain, "rt.example.org" );
Set( $DatabaseHost, $ENV{DB_PORT_5432_TCP_ADDR} );
Set( $DatabasePassword, $ENV{RT_DATABASE_PW} );
1;
