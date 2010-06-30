use strict;

use vars qw($VERSION %IRSSI);

$VERSION = "20100630";

%IRSSI = (
	authors		=>	'Squeeks',
	contact		=>	'squeek@cpan.org',
	name		=>	'vuvuzela',
	description	=>	"Introduce African football culture into IRC",
	license		=>	'WTFPL',
	changed		=>	'$VERSION',
	commands	=>	'vvz vuvuzela'
);

use Irssi 20020324;

sub lepatata
{
	my $text = shift;

	if(length($text) < 4)
	{
		return "BRZzz!";
	}
	else
	{
		my $step   = int( length($text) / 4 ) + 5;
		my $output = "\x02BRZZ";

		for (1..$step) { $output .='ZZzz'; }
		return $output."!!!";
	}
}

sub vuvuzela
{
	my ($arg, $server, $witem) = @_;

	if ($witem && ($witem->{type} eq 'CHANNEL' || $witem->{type} eq 'QUERY'))
	{
		$witem->command('MSG '.$witem->{name}.' '.lepatata($arg));
	}
	else
	{
		print CLIENTCRAP "%B>>%n ".lepatata($arg);
	}

}

sub kudu
{
	my ($arg, $server, $witem) = @_;

	if($arg =~/^\d+$/)
	{
		my $output;
		for (1..$arg){ $output .= "ZZ"; }

		if ($witem && ($witem->{type} eq 'CHANNEL' || $witem->{type} eq 'QUERY'))
		{
			$witem->command('MSG '.$witem->{name}.' '.lepatata($output));
		}
		else
		{
			print CLIENTCRAP "%B>>%n ".lepatata($output);
		}

	}
}

Irssi::command_bind('vuvuzela',\&kudu);
Irssi::command_bind('vvz',\&vuvuzela);

print "%B>>%n ".$IRSSI{name}." ".$VERSION." loaded";

