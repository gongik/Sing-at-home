package org.ksw.model;

import java.util.ArrayList;

public class SingDTO {
//	로그인및 회원가입
	private String user_id;
	private String id;
	private String password;
	private String name;
	private String email;
	
// 게시판	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private int count;
	private int like_count;
//댓글쓰기
	private int rno;
	private String reply;
	private String replyer;
	private String replydate;

//파일 업로드
	private ArrayList<AttachFileDTO> attach;
	
	
	
	public ArrayList<AttachFileDTO> getAttach() {
		return attach;
	}

	public void setAttach(ArrayList<AttachFileDTO> attach) {
		this.attach = attach;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getReplydate() {
		return replydate;
	}

	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "SingDTO [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", bno=" + bno
				+ ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate=" + regdate
				+ ", count=" + count + "]";
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
}
