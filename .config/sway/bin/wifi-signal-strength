#!/usr/bin/env raku

#| C<$OUTPUT> contains example output from C<iw dev station dump>. It
#} exists for development purposes only.
#|
#| Credit: L<https://forum.openwrt.org/t/iw-dev-station-dump-interpretation/31890/2>
#|
#| Could also be accomplished with I<wpa_supplicant> or I<iwd> (see:
#| L<wpa_cli|https://stackoverflow.com/questions/19742162/obtaining-received-signal-strength-of-neighboring-devices>, L<iwctl|https://www.reddit.com/r/archlinux/comments/gbx3sf/iwd_users_how_do_i_get_connected_channel_strength/>).
#| N.B. Unlike an I<iw>-based design (as implemented here), these
#| alternatives would be tied to I<wpa_supplicant> and I<iwd>,
#| respectively.
#|
#| C<iwlist> from L<wireless_tools|https://hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html#latest>
#| could also be made to work, however upstream hasn't shipped a new
#| version in over 10 years.
#|
#| TODO: Remove this after concluding development, e.g.
#|
#|      my $iw-dev-station-dump-output = qx{iw dev station dump}.trim;
#|
#| TODO: Port to {pac,tty,void,xorg}files, place in C<$HOME/.bin>.
constant $OUTPUT = q:to/EOF/;
inactive time:	4470 ms
	rx bytes:	26333626454
	rx packets:	18541754
	tx bytes:	438581
	tx packets:	5061
	tx retries:	0
	tx failed:	12
	rx drop misc:	19
	signal:  	-55 [-65, -56, -95, -95] dBm
	signal avg:	-55 [-65, -56, -95, -95] dBm
	tx bitrate:	400.0 MBit/s VHT-MCS 9 40MHz short GI VHT-NSS 2
	rx bitrate:	12.0 MBit/s
	rx duration:	754069640 us
	authorized:	yes
	authenticated:	yes
	associated:	yes
	preamble:	long
	WMM/WME:	yes
	MFP:		no
	TDLS peer:	no
	DTIM period:	2
	beacon interval:100
	short slot time:yes
	connected time:	1171 seconds
EOF

#| C<dbm-to-percent> converts a dBm value to a signal strength percent. It
#| expects to receive a number ranging from -1 to -100 (inclusive).
#|
#| Credit: L<https://www.intuitibits.com/2016/03/23/dbm-to-percent-conversion/>
multi sub dbm-to-percent(Int:D $ where * > -21              --> 100) {*}
multi sub dbm-to-percent(Int:D $ where { -21 >= $_ >= -23 } -->  99) {*}
multi sub dbm-to-percent(Int:D $ where { -24 >= $_ >= -26 } -->  98) {*}
multi sub dbm-to-percent(Int:D $ where { -27 >= $_ >= -28 } -->  97) {*}
multi sub dbm-to-percent(Int:D $ where { -29 >= $_ >= -30 } -->  96) {*}
multi sub dbm-to-percent(Int:D $ where { -31 >= $_ >= -32 } -->  95) {*}
multi sub dbm-to-percent(-33                                -->  94) {*}
multi sub dbm-to-percent(Int:D $ where { -34 >= $_ >= -35 } -->  93) {*}
multi sub dbm-to-percent(-36                                -->  92) {*}
multi sub dbm-to-percent(-37                                -->  91) {*}
multi sub dbm-to-percent(Int:D $ where { -38 >= $_ >= -39 } -->  90) {*}
multi sub dbm-to-percent(-40                                -->  89) {*}
multi sub dbm-to-percent(-41                                -->  88) {*}
multi sub dbm-to-percent(-42                                -->  87) {*}
multi sub dbm-to-percent(-43                                -->  86) {*}
multi sub dbm-to-percent(-44                                -->  85) {*}
multi sub dbm-to-percent(-45                                -->  84) {*}
multi sub dbm-to-percent(-46                                -->  83) {*}
multi sub dbm-to-percent(-47                                -->  82) {*}
multi sub dbm-to-percent(-48                                -->  81) {*}
multi sub dbm-to-percent(-49                                -->  80) {*}
multi sub dbm-to-percent(-50                                -->  79) {*}
multi sub dbm-to-percent(-51                                -->  78) {*}
multi sub dbm-to-percent(-52                                -->  76) {*}
multi sub dbm-to-percent(-53                                -->  75) {*}
multi sub dbm-to-percent(-54                                -->  74) {*}
multi sub dbm-to-percent(-55                                -->  73) {*}
multi sub dbm-to-percent(-56                                -->  71) {*}
multi sub dbm-to-percent(-57                                -->  70) {*}
multi sub dbm-to-percent(-58                                -->  69) {*}
multi sub dbm-to-percent(-59                                -->  67) {*}
multi sub dbm-to-percent(-60                                -->  66) {*}
multi sub dbm-to-percent(-61                                -->  64) {*}
multi sub dbm-to-percent(-62                                -->  63) {*}
multi sub dbm-to-percent(-63                                -->  61) {*}
multi sub dbm-to-percent(-64                                -->  60) {*}
multi sub dbm-to-percent(-65                                -->  58) {*}
multi sub dbm-to-percent(-66                                -->  56) {*}
multi sub dbm-to-percent(-67                                -->  55) {*}
multi sub dbm-to-percent(-68                                -->  53) {*}
multi sub dbm-to-percent(-69                                -->  51) {*}
multi sub dbm-to-percent(-70                                -->  50) {*}
multi sub dbm-to-percent(-71                                -->  48) {*}
multi sub dbm-to-percent(-72                                -->  46) {*}
multi sub dbm-to-percent(-73                                -->  44) {*}
multi sub dbm-to-percent(-74                                -->  42) {*}
multi sub dbm-to-percent(-75                                -->  40) {*}
multi sub dbm-to-percent(-76                                -->  38) {*}
multi sub dbm-to-percent(-77                                -->  36) {*}
multi sub dbm-to-percent(-78                                -->  34) {*}
multi sub dbm-to-percent(-79                                -->  32) {*}
multi sub dbm-to-percent(-80                                -->  30) {*}
multi sub dbm-to-percent(-81                                -->  28) {*}
multi sub dbm-to-percent(-82                                -->  26) {*}
multi sub dbm-to-percent(-83                                -->  24) {*}
multi sub dbm-to-percent(-84                                -->  22) {*}
multi sub dbm-to-percent(-85                                -->  20) {*}
multi sub dbm-to-percent(-86                                -->  17) {*}
multi sub dbm-to-percent(-87                                -->  15) {*}
multi sub dbm-to-percent(-88                                -->  13) {*}
multi sub dbm-to-percent(-89                                -->  10) {*}
multi sub dbm-to-percent(-90                                -->   8) {*}
multi sub dbm-to-percent(-91                                -->   6) {*}
multi sub dbm-to-percent(-92                                -->   3) {*}
multi sub dbm-to-percent(Int:D $ where * < -92              -->   1) {*}

#| C<signal-strength> converts output from C<iw dev station dump> into
#| a signal strength percent.
sub signal-strength(--> UInt:D)
{
    # As much as I'd like to put each '.' method on its own line for
    # readability, raku-2022.12 won't compile it if I do.
    my UInt:D $signal-strength =
        $OUTPUT.lines.first(/\h+'signal:'/).split(/\h+/)[2].Int.&dbm-to-percent;
}

sub MAIN(--> Nil)
{
    say(signal-strength());
}

# vim: set filetype=raku foldmethod=marker foldlevel=0 nowrap:
