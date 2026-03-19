<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>멍! 매칭</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dogmatching/dogmatching.css" />
  <script defer src="/assets/js/dogmatching/dogmatching.js"></script>
</head>

<body>
  <!-- header -->
  <div id="header-container"></div>

  <main>
    <div class="dogmatching-main-container">
      <div class="main-header">
        <div class="main-header-title">멍! 매칭</div>
        <div class="page-notification">
          설문 종료를 누르지 않으면 내용이 저장되지 않습니다
        </div>
      </div>
      <div class="main-content">
        <form action="dogmatching_result.html" id="dogmatching-form">
          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q01.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q02.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q03.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q04.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q05.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q06.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q07.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q08.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q09.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q10.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q11.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q12.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q13.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q14.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q15.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q16.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q17.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q18.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q19.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="survey-items">
            <div class="survey-items-header">
              <span>Q20.
                질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트질문항목텍스트</span>
            </div>
            <div class="survey-items-response">
              <div><span class="survey-text">그렇다</span></div>
              <div class="circles-container">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
              </div>
              <div><span class="survey-text">그렇지 않다</span></div>
            </div>
            <div class="radio-container">
              test
              <input type="radio" class="survey-radio" value="5" />
              <input type="radio" class="survey-radio" value="4" />
              <input type="radio" class="survey-radio" value="3" />
              <input type="radio" class="survey-radio" value="2" />
              <input type="radio" class="survey-radio" value="1" />
            </div>
          </div>

          <div class="submit-btn-container">
            <button id="dogmatching-submit" type="submit" class="dogmatching-submit-btn">
              멍! 매칭 완료
            </button>
          </div>
        </form>
      </div>
    </div>
  </main>
  <!-- footer -->
  <div id="footer-container"></div>
  <!-- js -->
  <script src="/assets/js/header-footer.js"></script>

</body>

</html>