package mypage;

import java.util.List;

import bean.Page;

public interface userMypageInterface {
	public boolean insert(userMypageVo vo);
	public List<userMypageVo> select(Page page); // 확신이 없는데..
	public userMypageVo selectOne(String id);
	public boolean update(userMypageVo vo);
	public boolean delete(String id, String pwd);
}
