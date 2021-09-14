package com.kimjinwoo.memo.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kimjinwoo.memo.post.model.Post;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId
			, @Param("subject") String subject
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectMemoList(@Param("userId") int userId);
	
	public List<Post> selectMemoListByNextId(
			@Param("userId") int userId
			, @Param("nextId") int nextId);

	public List<Post> selectMemoListByPrevId(
			@Param("userId") int userId
			, @Param("prevId") int prevId);
	
	// id가 가장 작은 행
	public Post lastPost(@Param("userId") int userId);
	
	// id가 가장 큰 행
	public Post firstPost(@Param("userId") int userId);
	
	public Post selectMemo(@Param("id") int id
			, @Param("userId") int userId);
	
	public int updatePost(@Param("id") int id
			, @Param("subject") String subject
			, @Param("content") String content);
	
	public int deletePost(@Param("id") int id
			, @Param("userId") int userId);
}
