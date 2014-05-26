class Category < ActiveRecord::Base

  belongs_to :storage
  has_many :items

  AllColors = ["Red", "Yellow", "Green", "Pink", "Blue", "Purple", "Orange", "Black"]
  AllCodes  = ["AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH", "AJ", "AK", "AL", "AM", "AN", "AP", "AQ", "AR", "AS", "AT", "AU", "AV", "AW", "AX", "AY", "AZ", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "BA", "BB", "BC", "BD", "BE", "BF", "BG", "BH", "BJ", "BK", "BL", "BM", "BN", "BP", "BQ", "BR", "BS", "BT", "BU", "BV", "BW", "BX", "BY", "BZ", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "CA", "CB", "CC", "CD", "CE", "CF", "CG", "CH", "CJ", "CK", "CL", "CM", "CN", "CP", "CQ", "CR", "CS", "CT", "CU", "CV", "CW", "CX", "CY", "CZ", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "DA", "DB", "DC", "DD", "DE", "DF", "DG", "DH", "DJ", "DK", "DL", "DM", "DN", "DP", "DQ", "DR", "DS", "DT", "DU", "DV", "DW", "DX", "DY", "DZ", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "EA", "EB", "EC", "ED", "EE", "EF", "EG", "EH", "EJ", "EK", "EL", "EM", "EN", "EP", "EQ", "ER", "ES", "ET", "EU", "EV", "EW", "EX", "EY", "EZ", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "FA", "FB", "FC", "FD", "FE", "FF", "FG", "FH", "FJ", "FK", "FL", "FM", "FN", "FP", "FQ", "FR", "FS", "FT", "FU", "FV", "FW", "FX", "FY", "FZ", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "GA", "GB", "GC", "GD", "GE", "GF", "GG", "GH", "GJ", "GK", "GL", "GM", "GN", "GP", "GQ", "GR", "GS", "GT", "GU", "GV", "GW", "GX", "GY", "GZ", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "HA", "HB", "HC", "HD", "HE", "HF", "HG", "HH", "HJ", "HK", "HL", "HM", "HN", "HP", "HQ", "HR", "HS", "HT", "HU", "HV", "HW", "HX", "HY", "HZ", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "JA", "JB", "JC", "JD", "JE", "JF", "JG", "JH", "JJ", "JK", "JL", "JM", "JN", "JP", "JQ", "JR", "JS", "JT", "JU", "JV", "JW", "JX", "JY", "JZ", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "KA", "KB", "KC", "KD", "KE", "KF", "KG", "KH", "KJ", "KK", "KL", "KM", "KN", "KP", "KQ", "KR", "KS", "KT", "KU", "KV", "KW", "KX", "KY", "KZ", "K2", "K3", "K4", "K5", "K6", "K7", "K8", "K9", "LA", "LB", "LC", "LD", "LE", "LF", "LG", "LH", "LJ", "LK", "LL", "LM", "LN", "LP", "LQ", "LR", "LS", "LT", "LU", "LV", "LW", "LX", "LY", "LZ", "L2", "L3", "L4", "L5", "L6", "L7", "L8", "L9", "MA", "MB", "MC", "MD", "ME", "MF", "MG", "MH", "MJ", "MK", "ML", "MM", "MN", "MP", "MQ", "MR", "MS", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9", "NA", "NB", "NC", "ND", "NE", "NF", "NG", "NH", "NJ", "NK", "NL", "NM", "NN", "NP", "NQ", "NR", "NS", "NT", "NU", "NV", "NW", "NX", "NY", "NZ", "N2", "N3", "N4", "N5", "N6", "N7", "N8", "N9", "PA", "PB", "PC", "PD", "PE", "PF", "PG", "PH", "PJ", "PK", "PL", "PM", "PN", "PP", "PQ", "PR", "PS", "PT", "PU", "PV", "PW", "PX", "PY", "PZ", "P2", "P3", "P4", "P5", "P6", "P7", "P8", "P9", "QA", "QB", "QC", "QD", "QE", "QF", "QG", "QH", "QJ", "QK", "QL", "QM", "QN", "QP", "QQ", "QR", "QS", "QT", "QU", "QV", "QW", "QX", "QY", "QZ", "Q2", "Q3", "Q4", "Q5", "Q6", "Q7", "Q8", "Q9", "RA", "RB", "RC", "RD", "RE", "RF", "RG", "RH", "RJ", "RK", "RL", "RM", "RN", "RP", "RQ", "RR", "RS", "RT", "RU", "RV", "RW", "RX", "RY", "RZ", "R2", "R3", "R4", "R5", "R6", "R7", "R8", "R9", "SA", "SB", "SC", "SD", "SE", "SF", "SG", "SH", "SJ", "SK", "SL", "SM", "SN", "SP", "SQ", "SR", "SS", "ST", "SU", "SV", "SW", "SX", "SY", "SZ", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "TA", "TB", "TC", "TD", "TE", "TF", "TG", "TH", "TJ", "TK", "TL", "TM", "TN", "TP", "TQ", "TR", "TS", "TT", "TU", "TV", "TW", "TX", "TY", "TZ", "T2", "T3", "T4", "T5", "T6", "T7", "T8", "T9", "UA", "UB", "UC", "UD", "UE", "UF", "UG", "UH", "UJ", "UK", "UL", "UM", "UN", "UP", "UQ", "UR", "US", "UT", "UU", "UV", "UW", "UX", "UY", "UZ", "U2", "U3", "U4", "U5", "U6", "U7", "U8", "U9", "VA", "VB", "VC", "VD", "VE", "VF", "VG", "VH", "VJ", "VK", "VL", "VM", "VN", "VP", "VQ", "VR", "VS", "VT", "VU", "VV", "VW", "VX", "VY", "VZ", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "WA", "WB", "WC", "WD", "WE", "WF", "WG", "WH", "WJ", "WK", "WL", "WM", "WN", "WP", "WQ", "WR", "WS", "WT", "WU", "WV", "WW", "WX", "WY", "WZ", "W2", "W3", "W4", "W5", "W6", "W7", "W8", "W9", "XA", "XB", "XC", "XD", "XE", "XF", "XG", "XH", "XJ", "XK", "XL", "XM", "XN", "XP", "XQ", "XR", "XS", "XT", "XU", "XV", "XW", "XX", "XY", "XZ", "X2", "X3", "X4", "X5", "X6", "X7", "X8", "X9", "YA", "YB", "YC", "YD", "YE", "YF", "YG", "YH", "YJ", "YK", "YL", "YM", "YN", "YP", "YQ", "YR", "YS", "YT", "YU", "YV", "YW", "YX", "YY", "YZ", "Y2", "Y3", "Y4", "Y5", "Y6", "Y7", "Y8", "Y9", "ZA", "ZB", "ZC", "ZD", "ZE", "ZF", "ZG", "ZH", "ZJ", "ZK", "ZL", "ZM", "ZN", "ZP", "ZQ", "ZR", "ZS", "ZT", "ZU", "ZV", "ZW", "ZX", "ZY", "ZZ", "Z2", "Z3", "Z4", "Z5", "Z6", "Z7", "Z8", "Z9", "2A", "2B", "2C", "2D", "2E", "2F", "2G", "2H", "2J", "2K", "2L", "2M", "2N", "2P", "2Q", "2R", "2S", "2T", "2U", "2V", "2W", "2X", "2Y", "2Z", "22", "23", "24", "25", "26", "27", "28", "29", "3A", "3B", "3C", "3D", "3E", "3F", "3G", "3H", "3J", "3K", "3L", "3M", "3N", "3P", "3Q", "3R", "3S", "3T", "3U", "3V", "3W", "3X", "3Y", "3Z", "32", "33", "34", "35", "36", "37", "38", "39", "4A", "4B", "4C", "4D", "4E", "4F", "4G", "4H", "4J", "4K", "4L", "4M", "4N", "4P", "4Q", "4R", "4S", "4T", "4U", "4V", "4W", "4X", "4Y", "4Z", "42", "43", "44", "45", "46", "47", "48", "49", "5A", "5B", "5C", "5D", "5E", "5F", "5G", "5H", "5J", "5K", "5L", "5M", "5N", "5P", "5Q", "5R", "5S", "5T", "5U", "5V", "5W", "5X", "5Y", "5Z", "52", "53", "54", "55", "56", "57", "58", "59", "6A", "6B", "6C", "6D", "6E", "6F", "6G", "6H", "6J", "6K", "6L", "6M", "6N", "6P", "6Q", "6R", "6S", "6T", "6U", "6V", "6W", "6X", "6Y", "6Z", "62", "63", "64", "65", "66", "67", "68", "69", "7A", "7B", "7C", "7D", "7E", "7F", "7G", "7H", "7J", "7K", "7L", "7M", "7N", "7P", "7Q", "7R", "7S", "7T", "7U", "7V", "7W", "7X", "7Y", "7Z", "72", "73", "74", "75", "76", "77", "78", "79", "8A", "8B", "8C", "8D", "8E", "8F", "8G", "8H", "8J", "8K", "8L", "8M", "8N", "8P", "8Q", "8R", "8S", "8T", "8U", "8V", "8W", "8X", "8Y", "8Z", "82", "83", "84", "85", "86", "87", "88", "89", "9A", "9B", "9C", "9D", "9E", "9F", "9G", "9H", "9J", "9K", "9L", "9M", "9N", "9P", "9Q", "9R", "9S", "9T", "9U", "9V", "9W", "9X", "9Y", "9Z", "92", "93", "94", "95", "96", "97", "98", "99"]

  def get_code
  	existing_codes = items.map(&:code)
  	all_codes = Category::AllCodes

  	available_codes = all_codes - existing_codes
  	new_code = available_codes.sample

  	return nil if new_code.nil?
    new_item = Item.create(code: new_code)
  	items << new_item
    new_item
  end
end
