package com.g12shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.g12shop.entity.ProductImages;

@Repository
public interface ProductImagesRepo extends JpaRepository<ProductImages, Long> {

}
