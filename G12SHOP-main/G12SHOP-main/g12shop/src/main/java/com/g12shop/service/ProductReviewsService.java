package com.g12shop.service;

import java.util.List;
import java.util.Optional;

import com.g12shop.entity.ProductReviews;

public interface ProductReviewsService {

	List<ProductReviews> findAll();

	Optional<ProductReviews> findById(Long id);

	List<ProductReviews> findAllById(Long id);

	List<ProductReviews> findAllByProductId(Long id);


}
