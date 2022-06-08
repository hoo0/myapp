class Srcar {
  final String srcarNo;
  final int seatCnt;
  final int restSeatCnt;
  final String psrmClCd;
  final String psrmClNm;

  Srcar({
    required this.srcarNo,
    required this.seatCnt,
    required this.restSeatCnt,
    required this.psrmClCd,
    required this.psrmClNm,
  });

  static Srcar createBySrcarInfo(Map<String, dynamic> srcarInfo) {
    return Srcar(
      srcarNo: srcarInfo['h_srcar_no'],
      seatCnt: int.parse(srcarInfo['h_seat_cnt']),
      restSeatCnt: int.parse(srcarInfo['h_rest_seat_cnt']),
      psrmClCd: srcarInfo['h_psrm_cl_cd'],
      psrmClNm: srcarInfo['h_psrm_cl_nm'],
    );
  }
}
/*
srcar_infos	srcar_info
    h_srcar_no
		h_seat_cnt
		h_rest_seat_cnt
		h_psrm_cl_cd
		h_psrm_cl_nm
*/
