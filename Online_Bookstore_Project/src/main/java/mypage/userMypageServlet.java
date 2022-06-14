package mypage;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/board.do") // board.do가 불려지면 servlet으로서 정보를 처리할 것임.
public class userMypageServlet extends HttpServlet{
	String base = "index.jsp?inc=./user/mypage/user_mypage_"; // default 경로 지정
	RequestDispatcher rd;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp); // get을 받으면 무조건 post로
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String job = "";
		String url = "";
		if(req.getParameter("job") != null) {
			job = req.getParameter("job");
		}
				
		switch(job) {
		case "":
		case "select":
			select(req, resp); // select가 들어오든 공백이 들어오든, 아래의 job이 아닌 다른 유형이 들어올 때는 무조건 select로 고고
			break;
		default:
			select(req, resp);
		}
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 메뉴에서 게시물관리 클릭했을 때, 검색할 내용을 넣고 "조회"를 클릭했을 때,
		// 페이지를 이동할 때, 입력폼, 수정폼 등에서 취소 버튼을 누를 때
		// 이 4가지의 경우에 모두 select 실행
		String url = base + "list.jsp";     // 매번 url 선언하기 싫다면 필드로 빼줘도 됨.
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);	            // url 정보가 forward 되어 결국 list 페이지가 실행됨.
	}
}