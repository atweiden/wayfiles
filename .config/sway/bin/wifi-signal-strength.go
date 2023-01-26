package main

import (
	"fmt"
	"os"
	"regexp"
	"strconv"
	"strings"
)

// OUT contains example output from C<iw dev station dump>. It exists for development purposes
// only.
//
// Credit: https://forum.openwrt.org/t/iw-dev-station-dump-interpretation/31890/2
const OUT = `inactive time:	4470 ms
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
	connected time:	1171 seconds`

// dbmToPercent converts a dBm value to a signal strength percent. It expects to receive a
// number ranging from -1 to -100 (inclusive).
//
// Credit: https://www.intuitibits.com/2016/03/23/dbm_to_percent-conversion/
func dbmToPercent(n int) uint {
	if n > -21 {
		return 100
	}
	switch n {
	case -21, -22, -23:
		return 99
	case -24, -25, -26:
		return 98
	case -27, -28:
		return 97
	case -29, -30:
		return 96
	case -31, -32:
		return 95
	case -33:
		return 94
	case -34, -35:
		return 93
	case -36:
		return 92
	case -37:
		return 91
	case -38, -39:
		return 90
	case -40:
		return 89
	case -41:
		return 88
	case -42:
		return 87
	case -43:
		return 86
	case -44:
		return 85
	case -45:
		return 84
	case -46:
		return 83
	case -47:
		return 82
	case -48:
		return 81
	case -49:
		return 80
	case -50:
		return 79
	case -51:
		return 78
	case -52:
		return 76
	case -53:
		return 75
	case -54:
		return 74
	case -55:
		return 73
	case -56:
		return 71
	case -57:
		return 70
	case -58:
		return 69
	case -59:
		return 67
	case -60:
		return 66
	case -61:
		return 64
	case -62:
		return 63
	case -63:
		return 61
	case -64:
		return 60
	case -65:
		return 58
	case -66:
		return 56
	case -67:
		return 55
	case -68:
		return 53
	case -69:
		return 51
	case -70:
		return 50
	case -71:
		return 48
	case -72:
		return 46
	case -73:
		return 44
	case -74:
		return 42
	case -75:
		return 40
	case -76:
		return 38
	case -77:
		return 36
	case -78:
		return 34
	case -79:
		return 32
	case -80:
		return 30
	case -81:
		return 28
	case -82:
		return 26
	case -83:
		return 24
	case -84:
		return 22
	case -85:
		return 20
	case -86:
		return 17
	case -87:
		return 15
	case -88:
		return 13
	case -89:
		return 10
	case -90:
		return 8
	case -91:
		return 6
	case -92:
		return 3
	default:
		return 1
	}
}

// signalStrength converts output from 'iw dev station dump' into a signal strength percent.
func signalStrength() (uint, error) {
	signal_line := regexp.MustCompile("^\\s+signal:")

	lines := strings.Split(OUT, "\n")
	for _, line := range lines {
		l := []byte(line)
		if signal_line.Match(l) {
			line_components := strings.Fields(line)
			if len(line_components) < 2 {
				return 0, fmt.Errorf("Found line matching 'signal:', but unexpectedly did not contain necessary dBm value")
			}
			dbm, err := strconv.Atoi(line_components[1])
			if err != nil {
				return 0, err
			}
			return dbmToPercent(dbm), nil
		}
	}

	return 0, fmt.Errorf("Unexpectedly could not find signal data")
}

func main() {
	signal_strength, err := signalStrength()
	if err != nil {
		fmt.Println(err.Error())
		os.Exit(1)
	}
	fmt.Printf("%d\n", signal_strength)
}
