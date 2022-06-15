package mypage;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import bean.Page;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/mypage.do")
public class UserMypageServlet extends HttpServlet{
	String base = "user/mypage/user_mypage_";
	String url = "";
	String job = "";
	RequestDispatcher rd;
	SimpleDateFormat sdf;
	UserMypageDao dao;
	
	public UserMypageServlet() {
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		dao = new UserMypageDao();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		job = req.getParameter("job");
		Page page = null;
		List<UserMypageVo> list = null;
				
		switch(job) {
		case "select":
			select(req, resp);
			break;
		case "update":
			update(req, resp);
		case "memberEmailValidation" :
			memberEmailValidation(req, resp);
			break;
		case "memberPhoneValidation" :
			memberPhoneValidation(req, resp);
			break;
		default:
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
		List<UserMypageVo> list = null;
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
	
	public void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserMypageVo vo = new UserMypageVo();
		String address = req.getParameter("address1") + " " + req.getParameter("address2");
		
		vo.setuId(req.getParameter("uId")); // id랑 이름은 변경 안 되지만 넣어야겠지?
		vo.setPwd(req.getParameter("pwd"));
		vo.setuName(req.getParameter("uName"));
		vo.setBirth(req.getParameter("birth"));
		vo.setPhone(req.getParameter("phone"));
		vo.setEmail(req.getParameter("email"));
		vo.setZipCode(req.getParameter("zipCode"));
		vo.setAddress(address);
		vo.setGender(req.getParameter("gender"));
		vo.setJob("");
		
		if(dao.update(vo)) {
			req.setAttribute("msg", "회원정보가 수정되었습니다.");
		}else {
			req.setAttribute("msg", "회원정보 수정 중 오류가 발생했습니다. 다시 시도해주시기 바랍니다.");
		}
		
		url = base + "main.jsp";
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	// 이메일주소 중복여부 확인
	public void memberEmailValidation(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String email = req.getParameter("email");
		String emailValidation = dao.userMemberEmailValdation(email);
		
		req.setAttribute("emailValidation", emailValidation);
				
		url = base + "info_update_validation.jsp";
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	// 휴대폰번호 중복여부 확인
	public void memberPhoneValidation(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String phone = req.getParameter("phone");
		String phoneValidation = dao.userMemberPhoneValdation(phone);
		
		req.setAttribute("phoneValidation", phoneValidation);
				
		url = base + "info_update_validation.jsp";
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
}