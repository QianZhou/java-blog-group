package qian.zhou.jbg.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import qian.zhou.jbg.entity.Blog;
import qian.zhou.jbg.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer> {
	List<Blog> findByUser(User user);
}
