package org.ksw.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.ksw.model.AttachFileDTO;
import org.ksw.model.Criteria;
import org.ksw.model.SingDTO;

public interface SingDao {

	public void SingInsert(SingDTO ssdto);
	
	public SingDTO Login(SingDTO ssdto);
	
	public ArrayList<SingDTO> SingList(Criteria cri);
	
	public SingDTO SingDetail(int bno);
	
	public void SingDelete(int bno);
	
	public void SingCountUp(int bno);
	
	public void SingWrite(SingDTO ssdto);
	
	public void SingModify(SingDTO ssdto);
	
	public int getTotalCount(Criteria cri);
	
	//댓글
	public int add(SingDTO sddto);
	
	public ArrayList<SingDTO> list(int bno);
	
	public SingDTO detail(int rno);
	
	public int modify(SingDTO ssdto);
	
	public int remove(int rno);
	
	//파일업로드
	public void SingAttachWrite(AttachFileDTO adto);
	
	public ArrayList<AttachFileDTO> AttachList(int bno);
	
	//중복확인체크
	public Integer userIdCheck(String user_id);
	//플레이리스트추가 
	public int playAdd(SingDTO sddto);
	
	public ArrayList<SingDTO> playList(String id);
	
	public int playDelete(int bno);
	
	//회원관리
	public SingDTO SingSignModify(String id);
	
	public void SingSignModifyOn(SingDTO ssdto);
	
	public void SignDelete(String id);
	
	//좋아요 
	public int SingLike(SingDTO ssdto);
	// 컨트롤러에서 매개변수 두개이상을 보내서 Service-ServiceImpl->DAO로 보낼때  @Param을 써서 받아야함
	public SingDTO SingLikeList(@Param("id") String id, @Param("bno") int bno);
	
	public int SingLikeDelete (SingDTO ssdto);
	
	public int SingLikeCountUp (SingDTO ssdto);
	
	public int SingLikeCountDown(SingDTO ssdto);
}
