package com.cesgroup.agr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cesgroup.agr.entity.LinkMeatBrand;
import com.cesgroup.agr.entity.LinkMeatProduct;
import com.cesgroup.agr.entity.LinkMeatSupplier;
import com.cesgroup.agr.entity.LinkMeatWholesale;
import com.cesgroup.agr.entity.MeatApproach;
import com.cesgroup.agr.mapper.LinkMeatBrandMapper;
import com.cesgroup.agr.mapper.LinkMeatProductMapper;
import com.cesgroup.agr.mapper.LinkMeatSupplierMapper;
import com.cesgroup.agr.mapper.LinkMeatWholesaleMapper;
import com.cesgroup.agr.mapper.MeatApproachMapper;

/** 
 * @ClassName MeatApproachService.java
 * @Description 肉类进场
 * @author huorujiao
 * @date 创建时间：2019年2月28日 下午4:50:51   
 */

@Service
public class MeatApproachService extends BaseSevice<MeatApproach, MeatApproachMapper>{
	
	@Autowired
	private LinkMeatBrandMapper linkMeatBrandMapper;
	
	@Autowired
	private LinkMeatProductMapper linkMeatProductMapper;
	
	@Autowired
	private LinkMeatSupplierMapper linkMeatSupplierMapper;
	
	@Autowired
	private LinkMeatWholesaleMapper linkMeatWholesaleMapper;
	
	
	@Autowired
	public void setMapper(MeatApproachMapper mapper) {
		super.setMapper(mapper);
	}
	
	/**
	 * @Description 新增
	 * @param meatApproach
	 * @return void
	 */
	@Transactional
    public void insertMeatApproach(MeatApproach meatApproach) {
        super.preInsert(meatApproach);
        getMapper().insert(meatApproach);
        
        //添加关联关系
        LinkMeatBrand linkMeatBrand = new LinkMeatBrand();
        linkMeatBrand.setApproachId(meatApproach.getId());
        linkMeatBrand.setBrandId(meatApproach.getLinkBrandId());
        linkMeatBrandMapper.insert(linkMeatBrand);
        
        LinkMeatProduct linkMeatProduct = new LinkMeatProduct();
        linkMeatProduct.setApproachId(meatApproach.getId());
        linkMeatProduct.setProductId(meatApproach.getLinkProductId());
        linkMeatProductMapper.insert(linkMeatProduct);
        
        LinkMeatSupplier linkMeatSupplier = new LinkMeatSupplier();
        linkMeatSupplier.setApproachId(meatApproach.getId());
        linkMeatSupplier.setSupplierId(meatApproach.getLinkSupplierId());
        linkMeatSupplierMapper.insert(linkMeatSupplier);
        
        LinkMeatWholesale linkMeatWholesale = new LinkMeatWholesale();
        linkMeatWholesale.setApproachId(meatApproach.getId());
        linkMeatWholesale.setSlaughterhouseId(meatApproach.getLinkSlaughterhouseId());
        linkMeatWholesaleMapper.insert(linkMeatWholesale);
        
    }
	
	
	
}
