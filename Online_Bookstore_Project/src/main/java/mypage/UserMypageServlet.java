package mypage;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import bean.PageMypage;
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
		PageMypage page = null;
		List<UserMypageVo> list = null;
				
		if(req.getParameter("job") != null) {
			job = req.getParameter("job");			
		}
		
		switch(job) {
		case "selectOrder":
			selectOrder(req, resp);
			break;
		case "viewOrderDetail":
			viewOrderDetail(req, resp);
			break;
		case "selectOneInfo":
			selectOneInfo(req, resp);
			break;
		case "updateInfo":
			updateInfo(req, resp);
			break;
		case "selectOnePwd":
			selectOnePwd(req, resp);
		case "updatePwd":
			updatePwd(req, resp);
			break;
		case "toAdminPage":
			String url="mgt/mgt_main.jsp";
			String uId = req.getParameter("uId");
			req.setAttribute("uId", uId);
			rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
			break;
		}
	}
	
	public void selectOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = base + "orderList.jsp";
		String uId = req.getParameter("uId");
		
		UserMypageDao dao = new UserMypageDao();
		List<UserMypageVo> list = dao.selectOrder(uId);
		
		//int listSize = list.size();
		
		//req.setAttribute("listSize", listSize);
		req.setAttribute("list", list);

		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	 public void viewOrderDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
		 String url = base + "orderDetail.jsp";
		 String orderNo = req.getParameter("orderNum"); 
		 
		 PageMypage page = new PageMypage();
			
		// 페이지 전환
		String temp = req.getParameter("nowPage");
		int nowPage = 1;
					
		try { 
			nowPage = Integer.parseInt(temp); 
		}catch(Exception ex) { 
			nowPage = 1; }
			 
		page.setNowPage(nowPage);
		page.setOrderNo(orderNo);
					
		List<UserMypageVo> list = dao.selectOrderDetail(page);
		page = dao.getPage();
					
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		req.setAttribute("orderNo", orderNo);
					
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	 
	
	public void selectOneInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		url = base + "info_update_form.jsp";
		String uId = req.getParameter("uId");
		UserMypageVo vo = dao.selectOneInfo(uId);
		req.setAttribute("vo", vo);
		rd = req.getRequestDispatcher(url);
		
		rd.forward(req, resp);
	}
	
	public void updateInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserMypageVo vo = new UserMypageVo();
		
		vo.setuId(req.getParameter("uId"));
		vo.setuName(req.getParameter("uName"));
		vo.setBirth(req.getParameter("birth"));
		vo.setPhone(req.getParameter("phone"));
		vo.setEmail(req.getParameter("email"));
		vo.setZipCode(req.getParameter("zipCode"));
		vo.setAddress1(req.getParameter("address1"));
		vo.setAddress2(req.getParameter("address2"));
		vo.setGender(req.getParameter("gender"));
		vo.setJob("");
		
		if(dao.updateInfo(vo)) {
			req.setAttribute("msg", "회원정보가 수정되었습니다.");
		}else {
			req.setAttribute("msg", "회원정보 수정 중 오류가 발생했습니다. 다시 시도해주시기 바랍니다.");
		}
		url = base + "main.jsp";
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	public void selectOnePwd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		url = base + "pwd_update.jsp";
		String uId = req.getParameter("uId");
		UserMypageVo vo = dao.selectOnePwd(uId);
		req.setAttribute("vo", vo);
		rd = req.getRequestDispatcher(url);
		
		rd.forward(req, resp);
	}
	
	public void updatePwd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserMypageVo vo = new UserMypageVo();
		
		vo.setPwd(req.getParameter("pwd"));
		
		if(dao.updatePwd(vo)) {
			req.setAttribute("msg", "비밀번호가 변경되었습니다.");
		}else {
			req.setAttribute("msg", "비밀번호 변경 중 오류가 발생했습니다. 다시 시도해주시기 바랍니다.");
		}
		url = base + "main.jsp";
		rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
}