package qian.zhou.jbg.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

@Entity
public class User {
	@Id
	@GeneratedValue
	private Integer id;
	
	@Size(min=3,message="Name must be at least 3 characters!")
	private String name;
	
	@Size(min=1,message="Invalid email address!")
	@Email
	private String email;
	
	@Size(min=5,message="Password must be at least 5 characters!")
	private String password;
	
	private Boolean enabled;
	
	@ManyToMany
	@JoinTable
	private List<Role> roles;

	@OneToMany(mappedBy = "user", cascade=CascadeType.REMOVE)
	private List<Blog> blogs;

	public List<Blog> getBlogs() {
		return blogs;
	}

	public String getEmail() {
		return email;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public Integer getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}


}
