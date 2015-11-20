package qian.zhou.jbg.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import qian.zhou.jbg.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByName(String name);

}
