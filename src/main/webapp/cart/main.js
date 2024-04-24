

if (typeof window.IMP === "undefined") {
  console.error("window.IMP 객체가 정의되지 않았습니다.");
} else {
	console.log("ok")
  const IMP = window.IMP;
  // IMP 객체가 정의되었으므로 init() 메서드를 호출할 수 있습니다.
  IMP.init("imp58685680");

  
const button = document.querySelector("button");

const onClickPay = async () =>{
	
	IMP.request_pay({
    pg : 'kakaopay',
    pay_method : 'card',
    merchant_uid: "order_no_0005", //상점에서 생성한 고유 주문번호 //성공시 주문번호가 어딘가에저장되어 변경해줘야함
    name : '주문명:결제테스트',
    amount : 10,
    buyer_email : 'iamport@siot.o',
    buyer_name : '구매자이',
    buyer_tel : '010-1234-568',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',
    m_redirect_url : 'http://localhost:8000/NupSO_EC/cart/cart.jsp', // 예: https://www.my-service.com/payments/complete
}, function(rsp) {
    if ( !rsp.success ) {
    	//결제 시작 페이지로 리디렉션되기 전에 오류가 난 경우
        var msg = '오류로 인하여 결제가 시작되지 못하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;

        alert(msg);
    } else {
		alert("결제 성공")
  window.location.href = 'http://localhost:8000/NupSO_EC/cart/cart.jsp';
      }
});
	
	
};

button.addEventListener("click", onClickPay);


}









