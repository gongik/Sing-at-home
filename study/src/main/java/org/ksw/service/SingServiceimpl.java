package org.ksw.service;

import java.util.ArrayList;

import org.ksw.dao.SingDao;
import org.ksw.model.AttachFileDTO;
import org.ksw.model.Criteria;
import org.ksw.model.SingDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SingServiceimpl implements SingService {

	@Autowired
	SingDao ssdao;

	@Override
	public void SingInsert(SingDTO ssdto) {
		
		ssdao.SingInsert(ssdto);
	}

	@Override
	public SingDTO Login(SingDTO ssdto) {
		return ssdao.Login(ssdto);
	}
	
	public ArrayList<SingDTO> SingList(Criteria cri){
		
		return ssdao.SingList(cri);
		
	}
	
	@Transactional
	public SingDTO SingDetail(int bno) {
		ssdao.SingCountUp(bno);
		
		return ssdao.SingDetail(bno);
	}
	
	@Override
	public void SingModify(SingDTO ssdto) {
		ssdao.SingModify(ssdto);
	}
	
	@Override
	public void SingDelete(int bno) {
		ssdao.SingDelete(bno);
	}
	@Override
	public int getTotalCount(Criteria cri) {
		return ssdao.getTotalCount(cri);
	}
	
	@Override
	public void SingWrite(SingDTO ssdto){
		ssdao.SingWrite(ssdto);
		if(ssdto.getAttach()==null) {
			return;
		}
		ssdto.getAttach().forEach(attach->{
			attach.setBno(ssdto.getBno());
			ssdao.SingAttachWrite(attach);
		});
	}

	@Override
	public int add(SingDTO ssdto) {
		return ssdao.add(ssdto);
	}

	@Override
	public ArrayList<SingDTO> list(int bno) {
		return ssdao.list(bno);
	}

	@Override
	public SingDTO detail(int rno) {
		return ssdao.detail(rno);
	}

	@Override
	public int modify(SingDTO ssdto) {
		return ssdao.modify(ssdto);
	}

	@Override
	public int remove(int rno) {
		return ssdao.remove(rno);
	}

	@Override
	public ArrayList<AttachFileDTO> AttachList(int bno) {
		return ssdao.AttachList(bno);
	}

	@Override
	public Integer userIdCheck(String user_id) {
		return ssdao.userIdCheck(user_id);
	}

	@Override
	public int playAdd(SingDTO ssdto) {
		return ssdao.playAdd(ssdto);
	}

	@Override
	public ArrayList<SingDTO> playList(String id) {
		return ssdao.playList(id);
	}

	@Override
	public int playDelete(int bno) {
		return ssdao.playDelete(bno);
	}

	@Override
	//     반환하는 결괏값
	public SingDTO SingSignModify(String id) {
		return ssdao.SingSignModify(id);
	}

	@Override
	public void SingSignModifyOn(SingDTO ssdto) {
		ssdao.SingSignModifyOn(ssdto);
	}
	
	@Override
	public void SignDelete(String id) {
		ssdao.SignDelete(id);
	}

	@Transactional
	public int SingLike(SingDTO ssdto) {
		ssdao.SingLikeCountUp(ssdto);
		return ssdao.SingLike(ssdto);
	}

	@Transactional
	public int SingLikeDelete(SingDTO ssdto) {
		ssdao.SingLikeCountDown(ssdto);
		return ssdao.SingLikeDelete(ssdto);
	}
	@Override
	public SingDTO SingLikeList(String id, int bno) {
		return ssdao.SingLikeList(id, bno);
	}
}
