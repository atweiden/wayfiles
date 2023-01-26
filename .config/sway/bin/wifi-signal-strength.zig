const std = @import("std");

/// `OUT` contains example output from C<iw dev station dump>. It exists for development
/// purposes only.
///
/// Credit: https://forum.openwrt.org/t/iw-dev-station-dump-interpretation/31890/2
const OUT =
    \\ inactive time:   4470 ms
    \\  rx bytes:   26333626454
    \\  rx packets: 18541754
    \\  tx bytes:   438581
    \\  tx packets: 5061
    \\  tx retries: 0
    \\  tx failed:  12
    \\  rx drop misc:   19
    \\  signal:     -55 [-65, -56, -95, -95] dBm
    \\  signal avg: -55 [-65, -56, -95, -95] dBm
    \\  tx bitrate: 400.0 MBit/s VHT-MCS 9 40MHz short GI VHT-NSS 2
    \\  rx bitrate: 12.0 MBit/s
    \\  rx duration:    754069640 us
    \\  authorized: yes
    \\  authenticated:  yes
    \\  associated: yes
    \\  preamble:   long
    \\  WMM/WME:    yes
    \\  MFP:        no
    \\  TDLS peer:  no
    \\  DTIM period:    2
    \\  beacon interval:100
    \\  short slot time:yes
    \\  connected time: 1171 seconds
;

/// `dbmToPercent` converts a dBm value to a signal strength percent. It expects to receive
/// a number ranging from -1 to -100 (inclusive).
///
/// Credit: https://www.intuitibits.com/2016/03/23/dbm-to-percent-conversion/
fn dbmToPercent(n: isize) void {
    if (n > -21) {
        return 100;
    }
    switch (n) {
        -21, -22, -23 => {
            return 99;
        },
        -24, -25, -26 => {
            return 98;
        },
        -27, -28 => {
            return 97;
        },
        -29, -30 => {
            return 96;
        },
        -31, -32 => {
            return 95;
        },
        -33 => {
            return 94;
        },
        -34, -35 => {
            return 93;
        },
        -36 => {
            return 92;
        },
        -37 => {
            return 91;
        },
        -38, -39 => {
            return 90;
        },
        -40 => {
            return 89;
        },
        -41 => {
            return 88;
        },
        -42 => {
            return 87;
        },
        -43 => {
            return 86;
        },
        -44 => {
            return 85;
        },
        -45 => {
            return 84;
        },
        -46 => {
            return 83;
        },
        -47 => {
            return 82;
        },
        -48 => {
            return 81;
        },
        -49 => {
            return 80;
        },
        -50 => {
            return 79;
        },
        -51 => {
            return 78;
        },
        -52 => {
            return 76;
        },
        -53 => {
            return 75;
        },
        -54 => {
            return 74;
        },
        -55 => {
            return 73;
        },
        -56 => {
            return 71;
        },
        -57 => {
            return 70;
        },
        -58 => {
            return 69;
        },
        -59 => {
            return 67;
        },
        -60 => {
            return 66;
        },
        -61 => {
            return 64;
        },
        -62 => {
            return 63;
        },
        -63 => {
            return 61;
        },
        -64 => {
            return 60;
        },
        -65 => {
            return 58;
        },
        -66 => {
            return 56;
        },
        -67 => {
            return 55;
        },
        -68 => {
            return 53;
        },
        -69 => {
            return 51;
        },
        -70 => {
            return 50;
        },
        -71 => {
            return 48;
        },
        -72 => {
            return 46;
        },
        -73 => {
            return 44;
        },
        -74 => {
            return 42;
        },
        -75 => {
            return 40;
        },
        -76 => {
            return 38;
        },
        -77 => {
            return 36;
        },
        -78 => {
            return 34;
        },
        -79 => {
            return 32;
        },
        -80 => {
            return 30;
        },
        -81 => {
            return 28;
        },
        -82 => {
            return 26;
        },
        -83 => {
            return 24;
        },
        -84 => {
            return 22;
        },
        -85 => {
            return 20;
        },
        -86 => {
            return 17;
        },
        -87 => {
            return 15;
        },
        -88 => {
            return 13;
        },
        -89 => {
            return 10;
        },
        -90 => {
            return 8;
        },
        -91 => {
            return 6;
        },
        -92 => {
            return 3;
        },
        else => {
            return 1;
        },
    }
}
