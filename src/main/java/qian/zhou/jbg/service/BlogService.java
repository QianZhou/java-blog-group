package qian.zhou.jbg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qian.zhou.jbg.entity.Blog;
import qian.zhou.jbg.entity.User;
import qian.zhou.jbg.repository.BlogRepository;
import qian.zhou.jbg.repository.UserRepository;

@Service
public class BlogService {

	@Autowired
	private BlogRepository blogRepository;
	@Autowired
	private UserRepository userRepository;

	public void save(Blog blog, String name) {
		User user = userRepository.findByName(name);
		blog.setUser(user);
		blogRepository.save(blog);
	}

	public void delete(int id) {
		blogRepository.delete(id);

	}

}
