# subのみ
sub get_userdata {
    # このサブルーチンはWHERE句の条件をハッシュで受け取る
    my %args = @_;

    # そのテーブルの全カラム
    my @columns = qw/name birthday address/;

    # 実行するSQL
    my $sql = "SELECT " . join(', ', @columns0 . " FROM users WHERE";

    my @where;

    # nameプロパティに値があればそれを使ってWHERE句にする。
    if ($args{name}) {
        push @where, "name = ?";
        push @bind, $args{name};
    }

    # 上と同じ。
    if ($args{address}) {
        push @where, "address LIKE ?";
        push @bind, $args{address};
    }

    # この後もif/elseでSQLを作成していく・・・。

    # ' AND 'でさっき作ったwhere句を全部join
    $sql .= join (' AND ', @where);

    my $dbh = DBI->connect(
        "dbi:mysql:dbname=test",
        "hoge",
        "fuga",
    );

    my $sth = $dbh->prepare($sql);
    $sth->execute(@bind);

    my @ret;
    while (my $h = $sth->fetchrow_hashref() ) {
        push @ret, $h;
    }
    return @ret;
}
# end sub
