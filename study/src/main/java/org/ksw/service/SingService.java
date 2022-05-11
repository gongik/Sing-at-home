package org.ksw.service;

import java.util.ArrayList;

import org.ksw.model.AttachFileDTO;
import org.ksw.model.Criteria;
import org.ksw.model.SingDTO;

public interface SingService {

	public void SingInsert(SingDTO ssdto);
	
	public SingDTO Login(SingDTO ssdto);
	
	public ArrayList<SingDTO> SingList(Criteria cri);
	
	public SingDTO SingDetail(int bno);
	
	public void SingDelete(int bno);
	
	public void SingWrite(SingDTO ssdto);
	
	public void SingModify(SingDTO ssdto);
	
	public int getTotalCount(Criteria cri);
	
	public int add(SingDTO ssdto);
	
	public ArrayList<SingDTO> list(int bno);
	
	public SingDTO detail(int rno);
	
	public int modify(SingDTO ssdto);
	
	public int remove(int rno);
	
	public ArrayList<AttachFileDTO> AttachList(int bno);
	
	public Integer userIdCheck(String user_id);
	
	public int playAdd(SingDTO ssdto);
	
	public ArrayList<SingDTO> playList(String id);
	
	public int playDelete(int bno);
	
	public SingDTO SingSignModify(String id);

	public void SingSignModifyOn(SingDTO ssdto);
	
	public void SignDelete(String id);
	
	public int SingLike(SingDTO ssdto);
	
	public SingDTO SingLikeList(String id, int bno);
	
	public int SingLikeDelete (SingDTO ssdto);
}
