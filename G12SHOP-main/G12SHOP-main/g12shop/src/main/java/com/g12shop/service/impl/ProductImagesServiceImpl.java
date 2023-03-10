package com.g12shop.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g12shop.entity.ProductImages;
import com.g12shop.repository.ProductImagesRepo;
import com.g12shop.service.ProductImagesService;

@Service
public class ProductImagesServiceImpl implements ProductImagesService {
	@Autowired
	ProductImagesRepo imagesRepo;

	@Override
	public Optional<ProductImages> findById(Long id) {
		return imagesRepo.findById(id);
	}
	
	
}
