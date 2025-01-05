package com.mmk.service;

import java.util.List;

import com.mmk.dto.PostsDTO;

public interface PostsService {

    void save(PostsDTO postsData);

    List<PostsDTO> getAllPosts();

    PostsDTO findById(String id);

    PostsDTO updatePost(int no, PostsDTO postsData);

    void deletePostById(String id);


}
