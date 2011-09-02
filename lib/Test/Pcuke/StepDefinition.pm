package Test::Pcuke::StepDefinition;

use warnings;
use strict;

use Carp;

use Test::Pcuke::Executor;
use Test::Pcuke::Executor::StepFailure;
use Test::Pcuke::Expectation;

use base 'Exporter';

our @EXPORT = qw{Given When Then And But expect};

our $_executor;

=head1 NAME

Test::Pcuke::StepDefinition - Provides the commands for step definitions

=head1 SYNOPSIS

Quick summary of what the module does.

    use Test::Pcuke::StepDefinition;
    # TODO
    ...

=head1 EXPORT

Given, When, Then, And, But

=head1 SUBROUTINES

=head2 Given $regexp $coderef

=cut

sub Given ($$) {
	my ($regexp, $coderef) = @_;
	add_step('GIVEN', $regexp, $coderef);
}

sub When ($$) {
	add_step('WHEN',@_);
}

sub Then ($$) {
	add_step('THEN',@_)
}

sub And ($$) {
	add_step('AND',@_)
}

sub But ($$) {
	add_step('BUT',@_)
}


sub add_step {
	my ($type, $regexp, $coderef) = @_;
	
	$_executor ||= Test::Pcuke::Executor->new();
	$_executor->add_definition(
		step_type	=> $type,
		regexp		=> $regexp,
		code		=> $coderef,
	);
}

sub expect {
	my ($object) = @_;
	return Test::Pcuke::Expectation->new($object, {throw => 'Test::Pcuke::Executor::StepFailure'});
}

1; # End of Test::Pcuke::StepDefinition
__END__
=head1 AUTHOR

Andrei V. Toutoukine, C<< <tut at isuct.ru> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-test-pcuke at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Test-Pcuke>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Test::Pcuke::StepDefinition


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Test-Pcuke>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Test-Pcuke>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Test-Pcuke>

=item * Search CPAN

L<http://search.cpan.org/dist/Test-Pcuke/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Andrei V. Toutoukine.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut


