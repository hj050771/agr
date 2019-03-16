package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cesgroup.agr.entity.LinkVegetableBrand;
import com.cesgroup.agr.entity.LinkVegetableProduct;
import com.cesgroup.agr.entity.LinkVegetableSupplier;
import com.cesgroup.agr.entity.LinkVegetableWholesale;
import com.cesgroup.agr.entity.VegetableApproach;
import com.cesgroup.agr.mapper.LinkVegetableBrandMapper;
import com.cesgroup.agr.mapper.LinkVegetableProductMapper;
import com.cesgroup.agr.mapper.LinkVegetableSupplierMapper;
import com.cesgroup.agr.mapper.LinkVegetableWholesaleMapper;
import com.cesgroup.agr.mapper.VegetableApproachMapper;

/** 
 * @ClassName VegetableApproachService.java
 * @Description 蔬菜进场
 * @author huorujiao
 * @date 创建时间：2019年3月2日 下午1:22:12   
 */

@Service
public class VegetableApproachService extends BaseSevice<VegetableApproach, VegetableApproachMapper>{
	
	@Autowired
	private LinkVegetableBrandMapper linkVegetableBrandMapper;
	
	@Autowired
	private LinkVegetableProductMapper linkVegetableProductMapper;
	
	@Autowired
	private LinkVegetableSupplierMapper linkVegetableSupplierMapper;
	
	@Autowired
	private LinkVegetableWholesaleMapper linkVegetableWholesaleMapper;
	
	@Autowired
	public void setMapper(VegetableApproachMapper mapper) {
		super.setMapper(mapper);
	}
	
	/**
	 * @Description 蔬菜进场
	 * @param vegetableApproach
	 * @return void
	 */
	@Transactional
    public void insertVegetableApproach(VegetableApproach vegetableApproach) {
		
		super.preInsert(vegetableApproach);
        getMapper().insert(vegetableApproach);
		
		//添加关联关系
        LinkVegetableBrand linkVegetableBrand = new LinkVegetableBrand();
        linkVegetableBrand.setApproachId(vegetableApproach.getId());
        linkVegetableBrand.setBrandId(vegetableApproach.getLinkBrandId());
        linkVegetableBrandMapper.insert(linkVegetableBrand);
        
        LinkVegetableProduct linkVegetableProduct = new LinkVegetableProduct();
        linkVegetableProduct.setApproachId(vegetableApproach.getId());
        linkVegetableProduct.setProductId(vegetableApproach.getLinkProductId());
        linkVegetableProductMapper.insert(linkVegetableProduct);
        
        LinkVegetableSupplier linkVegetableSupplier = new LinkVegetableSupplier();
        linkVegetableSupplier.setApproachId(vegetableApproach.getId());
        linkVegetableSupplier.setSupplierId(vegetableApproach.getLinkSupplierId());
        linkVegetableSupplierMapper.insert(linkVegetableSupplier);
        
        LinkVegetableWholesale linkVegetableWholesale = new LinkVegetableWholesale();
        linkVegetableWholesale.setApproachId(vegetableApproach.getId());
        linkVegetableWholesale.setSlaughterhouseId(vegetableApproach.getLinkSlaughterhouseId());
        linkVegetableWholesaleMapper.insert(linkVegetableWholesale);
	}
	
}
