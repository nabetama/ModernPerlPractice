package MyApp::SQLLibrary;
use Moose;
use MooseX::Types::Path::Class;
use YAML ();

# predicateは値が定義済(代入済)か確認するメソッドを作ってくれる。
has 'last_modified' => (
    is => 'rw',
    isa => 'Int',
    predicate => 'has_last_modified',
);

# coerceを設定しておかないと、isaで定義されていない変換前の型を設定しようと
# するとエラーになる。
has 'file' => (
    is => 'rw',
    isa => 'Path::Class::File',
    required => 1,
    coerce => 1,
);

has 'library' => (
    is => 'rw',
    isa => 'HashRef',
);

__PACKAGE__->meta->make_immutable;

no Moose;

sub load_library {
    my $self = shift;
    my $file = $self->file;
    return YAML::LoadFile( $file->stringify );
}

sub get_sql {
    my ( $self, $name ) = @_;
    my $mtime = $self->file->stat->mtime;
    if ( ! $self->has_last_modified ||
         $mtime > $self->last_modified 
    ) {
        $self->library( $self->load_library );
        $self->last_modified( $mtime );
    }
    return $self->library->{ $name };
}

1;
