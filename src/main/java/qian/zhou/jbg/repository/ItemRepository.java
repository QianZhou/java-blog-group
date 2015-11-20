package qian.zhou.jbg.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import qian.zhou.jbg.entity.Blog;
import qian.zhou.jbg.entity.Item;
import qian.zhou.jbg.entity.Role;

public interface ItemRepository extends JpaRepository<Item, Integer> {

	List<Item> findByBlog(Blog blog, Pageable pageable);

	

	
}
