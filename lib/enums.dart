/// Subtype enum
enum ConnectionSubtype {
  /// no subtype
  none,

  /// unknown subtypes
  unknown,

  /// ~ 50-100 kbps
  m1xRTT,

  /// ~ 14-64 kbps
  cdma,

  /// ~ 50-100 kbps
  edge,

  /// ~ 400-1000 kbps
  evdo_0,

  /// ~ 600-1400 kbps
  evdo_a,

  /// ~ 100 kbps
  gprs,

  /// ~ 2-14 Mbps
  hsdpa,

  /// ~ 700-1700 kbps
  hspa,

  /// ~ 1-23 Mbps
  hsupa,

  /// ~ 400-7000 kbps
  umts,

  /// ~ 1-2 Mbps
  ehrpd,

  /// ~ 5 Mbps
  evdo_b,

  /// ~ 10-20 Mbps
  hspap,

  /// ~25 kbps
  iden,

  /// ~ 10+ Mbps
  lte,
}

/// Map with the subtypes
Map<String, ConnectionSubtype> connectionTypeMap = <String, ConnectionSubtype>{
  "1xRTT": ConnectionSubtype.m1xRTT, // ~ 50-100 kbps
  "cdma": ConnectionSubtype.cdma, // ~ 14-64 kbps
  "edge": ConnectionSubtype.edge, // ~ 50-100 kbps
  "evdo_0": ConnectionSubtype.evdo_0, // ~ 400-1000 kbps
  "evdo_a": ConnectionSubtype.evdo_a, // ~ 600-1400 kbps
  "gprs": ConnectionSubtype.gprs, // ~ 100 kbps
  "hsdpa": ConnectionSubtype.hsdpa, // ~ 2-14 Mbps
  "hspa": ConnectionSubtype.hspa, // ~ 700-1700 kbps
  "hsupa": ConnectionSubtype.hsupa, // ~ 1-23 Mbps
  "umts": ConnectionSubtype.umts, // ~ 400-7000 kbps
  "ehrpd": ConnectionSubtype.ehrpd, // ~ 1-2 Mbps
  "evdo_b": ConnectionSubtype.evdo_b, // ~ 5 Mbps
  "hspap": ConnectionSubtype.hspap, // ~ 10-20 Mbps
  "iden": ConnectionSubtype.iden, // ~25 kbps
  "lte": ConnectionSubtype.lte, // ~ 10+ Mbps
  "unknown": ConnectionSubtype.unknown, // is connected but cannot tell the speed
  "none": ConnectionSubtype.none
};