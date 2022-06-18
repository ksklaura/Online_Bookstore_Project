package mypage;

import java.util.List;

import bean.Page;

public interface UserMypageInterface {
	public List<UserMypageVo> selectOrder(Page page);
	public List<UserMypageVo> searchOrder(Page page);
	public UserMypageVo selectOneInfo(String uId);
	// public List<UserMypageVo> selectOneOrder(String orderNo);
	public boolean update(UserMypageVo vo);
	public boolean delete(String uId, String pwd);
}
