package mypage;

import java.util.List;

public interface userMypageInterface {
	public boolean insert(userMypageVo vo);
	public List<userMypageVo> select(String findStr, int nowPage); // 확신이 없는데..
	public userMypageVo selectOne(String id);
	public boolean update(userMypageVo vo);
	public boolean delete(String id, String pwd);
}
