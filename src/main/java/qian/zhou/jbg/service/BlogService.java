package qian.zhou.jbg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import qian.zhou.jbg.entity.Blog;
import qian.zhou.jbg.entity.Item;
import qian.zhou.jbg.entity.User;
import qian.zhou.jbg.exception.RssException;
import qian.zhou.jbg.repository.BlogRepository;
import qian.zhou.jbg.repository.ItemRepository;
import qian.zhou.jbg.repository.UserRepository;

@Service
public class BlogService {

	@Autowired
	private BlogRepository blogRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RssService rssService;

	@Autowired
	private ItemRepository itemRepository;

	public void saveItems(Blog blog) {
		try {
			List<Item> items = rssService.getItems(blog.getUrl());
			for (Item item : items) {
				Item savedItem = itemRepository.findByBlogAndLink(blog,
						item.getLink());

				if (savedItem == null) {
					item.setBlog(blog);
					itemRepository.save(item);
				}
			}
		} catch (RssException e) {
			e.printStackTrace();
		}
	}
	
	@Scheduled(fixedDelay=3600000)
	public void reloadBlogs(){
		List<Blog> blogs=blogRepository.findAll();
		for(Blog blog :blogs){
			saveItems(blog);
		}
	}
	
	@Transactional
	public void save(Blog blog, String name) {
		User user = userRepository.findByName(name);
		blog.setUser(user);
		blogRepository.save(blog);
		saveItems(blog);
	}

	@PreAuthorize("#blog.user.name==authentication.name or hasRole('ROLE_ADMIN')")
	public void delete(Blog blog) {
		blogRepository.delete(blog);

	}

	public Blog findOne(int id) {
		return blogRepository.findOne(id);
	}

}
