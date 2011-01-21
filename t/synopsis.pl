use Test::File::Content;
use Test::More;

content_like( qr/\.pm/, qr/^#\s*ABSTRACT/, 'lib' );

content_like( pm => '__PACKAGE__->meta->make_immutable', 'lib/MooseClasses' );

content_unlike({
    js => {
        'console.log debug statement' => 'console.log',
        'never use alert' => qr/[^\.]alert\(/,
    },
    tt => [
       qr/\[% DUMP/,
    ],
    pl => '\$foo',
}, qw(t/code));

done_testing;