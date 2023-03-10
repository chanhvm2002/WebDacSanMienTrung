package com.g12shop.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g12shop.entity.ProductReviews;
import com.g12shop.repository.ProductReviewsRepo;
import com.g12shop.service.ProductReviewsService;

@Service
public class ProductReviewsServiceImpl implements ProductReviewsService {
	@Autowired
	ProductReviewsRepo productReviewsRepo;

	@Override
	public List<ProductReviews> findAll() {
		return productReviewsRepo.findAll();
	}

	@Override
	public Optional<ProductReviews> findById(Long id) {
		return productReviewsRepo.findById(id);
	}

	@Override
	public List<ProductReviews> findAllById(Long id) {
		// TODO Auto-generated method stub
		return productReviewsRepo.findAllById(id);
	}

	@Override
	public List<ProductReviews> findAllByProductId(Long id) {
		// TODO Auto-generated method stub
		return productReviewsRepo.findAllByProductId(id);
	}
	
	
}
