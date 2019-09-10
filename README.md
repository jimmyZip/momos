# momos
부산 명물 모모스커피의 웹어플리케이션 프로젝트입니다. (clone프로젝트)
<hr/>

<h2>프로젝트명 cafe MOMOS</h2>
<img src="https://postfiles.pstatic.net/MjAxOTA5MTBfNDEg/MDAxNTY4MTAwNTgzMTgw.Zvz6myh2vDd7Lj4Cc--vBKWbEdY8-4Gjf74zJ2wws9sg.ST7vnS90wmTuMnqrWoyTrYQD9GCQxk0JjJHUP_L3a_Ig.JPEG.wlsghd1028/슬라이드10.JPG?type=w580"/>
<img src="https://postfiles.pstatic.net/MjAxOTA5MTBfMTcz/MDAxNTY4MTAwNTgyOTk0.BuV79NZ0SGv0u9WF6sfsldbnqzEdk50a_lBXN56yaLEg.JwAv0c28q-0pkwE0GTlZEakBB6FeDDPUXOqL34z61Isg.JPEG.wlsghd1028/슬라이드1.JPG?type=w580"/>

<ul>
  <li>
    개발환경 : STS3,4, JavaEE, MariaDB, HTML5, ECMAScript, CSS3, PuTTy, FileZilla, SourceTree
  </li>
  <li>
    개발목표<br>
    - PHP기반으로 작성된 웹 어플리케이션의 frontend단을 제공받아 서버기능 구현하고 JAVA EE 스펙으로 프로젝트를 변경
    - html, css, js의 일부를 이태규님으로부터 제공받고 나머지는 1인 프로젝트로 진행했습니다.
  </li>
  
  <li>
    적용기술<br>
    - SpringMVC패턴을 이용한 웹 어플리케이션 설계
    - JNDI를 통한 데이터베이스 드라이버 및 URL연동
    - REST API와 AJAX를 통한 비동기 호출
    - Mybatis를 이용한 Database 설계 및 쿼리 작성
    - ECMAScript 및 jQuery를 통한 기능구현
    - SHA-256방식의 암호화
    - AOP를 이용한 보안기능
    - Naver MAP, Google MAP, ODsayLab 반경 내 대중교통정보 API연동
    -TOMCAT 호스팅
  </li>
</ul>
<section>
  <h2>첨부이미지 및 설명</h2>
  <article>
    <h3>ERD</h3>
    <hr/>
    <div>
      <p>
        <img src="https://postfiles.pstatic.net/MjAxOTA5MTBfMjA0/MDAxNTY4MTAwNTgzMTgx.0c6IaI0utZoCnMcY9jX2kyk43ONDLjKHkOa-EpxUm-Ag.1ognGknsUMlUlUWx9bOZ2GUk9IyzbWWQ8tiUcyJT9-Mg.JPEG.wlsghd1028/슬라이드9.JPG?type=w580"/>
      </p>
      <p>
        user의 권한, 회원, 지점, 제품카테고리, 제품, 자유게시판 테이블        
      </p>
    </div>
    <div>
      <p>
        <img src="https://postfiles.pstatic.net/MjAxOTA5MTBfMTI3/MDAxNTY4MTAwNTgzMjA4.NseawUsSPPmcc89ElfFaAvVUN62bk6yRmiwSdNmhnbUg.mOJirVByglFQkuokJkJ59Z8J4zQsz69od-bukOMn7qAg.JPEG.wlsghd1028/슬라이드12.JPG?type=w580"/>
      </p>
      <p>
        <img srcf="https://postfiles.pstatic.net/MjAxOTA5MTBfMzgg/MDAxNTY4MTAwNTgzMzU2.GJRqicnbtMJ0lkQ8_WWCu_OLHZh5b390k3XWB0rsonMg.NjgH1Zw_1eGQoxvHPR3m5A-h9vuHWG9g3aCYidoGcqYg.JPEG.wlsghd1028/슬라이드13.JPG?type=w580"/>
      </p>
      <p>
        관리자페이지 예시
      </p>
    </div>
    <div>
      <p>
        <img src="https://postfiles.pstatic.net/MjAxOTA5MTBfMjI5/MDAxNTY4MTAwNTgzMzY0.HR52g2s7GVch5JuaWX-ZHkEHGjoXAD5macLAXEPgEU8g.mmTbZMEfsG0_KnVwodcBvNQhBuV1aedceSn6W7pK0bkg.JPEG.wlsghd1028/슬라이드14.JPG?type=w580"/>
        <img src="https://postfiles.pstatic.net/MjAxOTA5MTBfMTEx/MDAxNTY4MTAwNTgzNTY5.N7KIttcnf0dJ0SCt3lN7XIrcRhqEha8qQDy5LqbZXd4g.WsvmU8Fr_QSbDkC3AtM_QSG9ol9159gd2__iykXMinYg.JPEG.wlsghd1028/슬라이드15.JPG?type=w580"/>
      </p>
      <p>
        클라이언트 페이지 예시_지점 관련
      </p>
    </div>
    <div>
      <p>
        <img src="https://postfiles.pstatic.net/MjAxOTA5MTBfMTg1/MDAxNTY4MTAwNTgzNTk2.301Xcy1OM2X3-N3NDtlPy2eKosw3XUxL2IQvohMxfQkg.yoblAMq4fwwQ_n6dJ9RYVfGOTd2AqvRvC9cxsiqi22Qg.JPEG.wlsghd1028/슬라이드16.JPG?type=w580"/>
      </P>
      <p>
        아이디 찾기 / 비밀번호 재설정
      </p>
    </div>
  </article>
  <article>
    <h3>주요 코드</h3>
    <hr/>
    <ul>
      <li>
        <h4>JavaMail을 활용한 password재설정</h4>
        <p>
          <img src="https://postfiles.pstatic.net/MjAxOTA5MTBfMjgg/MDAxNTY4MTAwNTgzNTg5.Oukb3Z88iIVQYYf3lvbWJ9cWU0CK2_eAspzMRL_VNX0g.S2weiGStLHVU0oNwfQO4KUzRNUt03cVQPOUVwKB_J2Mg.JPEG.wlsghd1028/슬라이드17.JPG?type=w580"/>
        </p>
      </li>
      <li>
        <h4>관리자 페이지에서 목록 excel다운로드</h4>
        <p>
          <img src="https://postfiles.pstatic.net/MjAxOTA5MTBfMTQy/MDAxNTY4MTAwNTgzMzgw.03OzVUoqqSHCgbtK6iLIdBgzXe29Vb_lLx7vh9G_hVQg.5zfyvzt0DblgFp3uviQkpsANi675FmE0M00XZISUoOsg.JPEG.wlsghd1028/슬라이드18.JPG?type=w580"/>
        </p>
        <p>
          <img src="https://postfiles.pstatic.net/MjAxOTA5MTBfMTky/MDAxNTY4MTAwNTgzNTU3.5fxLZRLb3FVP0YVCF8KtrGL92IrTWIq69J6io1lcHSQg.TDfi3mAP9qgvpldv3a2v9cjgNptm7e62fkvzulRGhtMg.JPEG.wlsghd1028/슬라이드19.JPG?type=w580"/>
        </p>
      </li>
    </ul>
  </article>
  <article>
    <h3>간단한 시연영상 링크</h3>
    <a href="https://blog.naver.com/wlsghd1028/221644681467">https://blog.naver.com/wlsghd1028/221644681467</a>
  </article>
</section>
