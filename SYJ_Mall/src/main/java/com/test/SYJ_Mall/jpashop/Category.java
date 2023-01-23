package com.test.SYJ_Mall.jpashop;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

//@Entity
@Data
//@Table(name = "CATEGORY")
public class Category {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_id")
	private Long id;
	
	@Column(name = "category_name")
	private String name;
	
	
	@ManyToOne
	@JoinColumn(name = "parent_id")
	private Category parent;
	
	
	@OneToMany(mappedBy = "parent")
	private List<Category> child = new ArrayList<>();
	
	
	@ManyToMany
	@JoinTable(name="category_item", joinColumns = @JoinColumn(name="category_id"),inverseJoinColumns = @JoinColumn(name="item_id"))
	private List<Item> items = new ArrayList<>();
	
}
