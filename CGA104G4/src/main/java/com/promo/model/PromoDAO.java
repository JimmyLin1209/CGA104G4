package com.promo.model;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class PromoDAO implements PromoDAO_interface {

	@PersistenceContext
	private Session session;

	@Override
	public void insert(PromoVO promoVO) {

	}

	@Override
	public void update(PromoVO promoVO) {

	}

	@Override
	public void delete(Integer promoId) {

	}

	@Override
	public PromoVO findByPrimaryKey(Integer promoId) {
		return null;

	}

	@Override
	public List<PromoVO> getAll() {

		return null;
	}

}
