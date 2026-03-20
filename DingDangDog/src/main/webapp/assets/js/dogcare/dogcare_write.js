// JavaScript로 현재 날짜를 구하여 min 속성에 적용
   document.addEventListener('DOMContentLoaded', function () {
       const today = new Date();
       const year = today.getFullYear();
       const month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
       const day = String(today.getDate()).padStart(2, '0');
       const currentDate = `${year}-${month}-${day}`; // YYYY-MM-DD 형식으로 날짜를 만듬

       // 날짜 input 요소 찾기
       const dateInput = document.querySelector('input[name="careDate"]');
       // 현재 날짜를 min 속성에 설정
       dateInput.setAttribute('min', currentDate);
   });
