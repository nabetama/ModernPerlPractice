package main;
use strict;
use DBI;
use MyApp::SQLLibrary;

my $library = MyApp::SQLLibrary->new( file => 'sql.yaml' );
my $dbh     = DBI->connect(
    "dbi:mysql:dbname=test",
    'root',
    'root',
);

my $sth = $dbh->prepare(
    $library->get_sql( 'get_member' )
);

my $num = 0;
my ($first_name, $last_name, $mem_id);

# queryの実行
$sth->execute($num);

=pod
カラムバインド
変数は各一回ずつ作成された後、bind_columns()にそれぞれの変数の
リファレンスを渡すことにより、このステートメント実行時には
これらの変数に値を代入する設定となる。
=> DBIからCのAPIを通して, それぞれの変数に値が直接代入される。
=cut

$sth->bind_columns( \($first_name, $last_name, $mem_id) );
while ( $sth->fetchrow_arrayref() ) {
    print "First name: $first_name\n",
          "Last name:  $last_name\n",
          "Id:         $mem_id\n";
    $num++;
    $sth->execute($num);
};

$sth->finish;
$dbh->disconnect;

