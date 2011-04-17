use strict;
use DBI;

# 1) データベースハンドラーの作成
my $dbh = DBI->connect(
    'dbi:mysql:dbname=test',
    'root',
    'root'
);

# 2) ステートメントハンドラーの作成
my $sth = $dbh->prepare(
    "select a, b, c from P79 where x = 5"
);

# 3) ステートメントハンドラーの実行
$sth->execute();

while ( my ($a, $b, $c) = $sth->fetchrow_array() ) {
    print "a = $a, b = $b, c = $c\n";
}

# 4) ステートメントハンドラーの解放
$sth->finish;

# 5) データベースハンドラーの解放
$dbh->disconnect;
