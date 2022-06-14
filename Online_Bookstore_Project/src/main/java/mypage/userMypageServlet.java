package mypage;

import java.io.IOException;
import java.util.List;

import bean.Page;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/mypage.do") // mypage.do가 불려지면 servlet으로서 정보를 처리할 것임.
public class userMypageServlet extends HttpServlet{
	String base = "index.jsp?inc=./user/mypage/user_mypage_"; // default 경로 지정
	RequestDispatcher rd;
	userMypageDao dao;
	
	public userMypageServlet() { // 자기 자신을 다시 한번 불러 dao객체를 계속해서 생성함.
		dao = new userMypageDao();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet serv: ");
		doPost(req, resp); // get을 받으면 무조건 post로
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost serv: ");
		String job = "";
		String url = "";
		Page page = null;
		List<userMypageVo> list = null;
		
		if(req.getParameter("job") != null) {
			job = req.getParameter("job");
		}
				
		switch(job) {
		//case "":
		case "select":
			select(req, resp); // select가 들어오든 공백이 들어오든, 아래의 job이 아닌 다른 유형이 들어올 때는 무조건 select로 고고
			System.out.println("select serv: ");
			break;
		default:
			System.out.println("default serv: ");
			select(req, resp);
			break;
		}
	}
	
	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 메뉴에서 게시물관리 클릭했을 때, 검색할 내용을 넣고 "조회"를 클릭했을 때,
		// 페이지를 이동할 때, 입력폼, 수정폼 등에서 취소 버튼을 누를 때
		// 이 4가지의 경우에 모두 select 실행
		// GO BACK TO THE ORDERED LIST
		
		String findStr = req.getParameter("findStr");
		int nowPage = 0;
		Page page = null;
		List<userMypageVo> list = null;
		String url = "";
		
		
		try {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}catch(Exception e) {
			nowPage = 1;
		}
		page = new Page();
		page.setFindStr(findStr);
		page.setNowPage(nowPage);
		
		list = dao.select(page);
		page = dao.getPage();
		
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		
		url = base + "orderList.jsp";
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
}