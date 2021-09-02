package com.kimjinwoo.memo.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kimjinwoo.memo.post.dao.PostDAO;
import com.kimjinwoo.memo.post.model.Post;
import com.kimjinwoo.memo.user.common.FileManagerService;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String title, String content, MultipartFile file) {
		
		String filePath = null;
		if(file != null) {
			FileManagerService fileManager = new FileManagerService();
			
			filePath = fileManager.saveFile(userId, file);
			
			if(filePath == null) {
				return -1;
			}
		}
		
		return postDAO.insertPost(userId, title, content, filePath);
	}
	
	public List<Post> getMemoList(int userId) {
		return postDAO.selectMemoList(userId);
	}
	
	public Post getMemo(int id, int userId) {
		return postDAO.selectMemo(id, userId);
	}
	
	public int updateMemo(int id, String subject, String content) {
		return postDAO.updatePost(id, subject, content);
	}
	
	public int deleteMemo(int id, int userId) {
		return postDAO.deletePost(id, userId);
	}
}
