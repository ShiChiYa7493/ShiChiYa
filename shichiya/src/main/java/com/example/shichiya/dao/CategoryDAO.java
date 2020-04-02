package com.example.shichiya.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.shichiya.pojo.Category;

public interface  CategoryDAO extends JpaRepository<Category, Integer> {

}
