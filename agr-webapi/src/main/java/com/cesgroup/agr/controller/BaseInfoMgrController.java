package com.cesgroup.agr.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.cesgroup.agr.entity.Brand;
import com.cesgroup.agr.entity.Customer;
import com.cesgroup.agr.entity.Division;
import com.cesgroup.agr.entity.Product;
import com.cesgroup.agr.entity.Quotation;
import com.cesgroup.agr.entity.Slaughterhouse;
import com.cesgroup.agr.entity.VegetableWholesale;
import com.cesgroup.agr.service.BrandService;
import com.cesgroup.agr.service.CustomerService;
import com.cesgroup.agr.service.DivisionService;
import com.cesgroup.agr.service.ProductService;
import com.cesgroup.agr.service.QuotationService;
import com.cesgroup.agr.service.SlaughterhouseService;
import com.cesgroup.agr.service.VegetableWholesaleService;
import com.cesgroup.agr.utils.Result;

/** 
 * @ClassName BaseInfoMgrController.java
 * @Description 基础信息管理
 * @author huorujiao
 * @date 创建时间：2019年3月2日 下午2:33:06   
 */
@RestController
public class BaseInfoMgrController extends BaseController {

	private final static Logger logger = LoggerFactory.getLogger(BaseInfoMgrController.class);

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private DivisionService divisionService;

	@Autowired
	private BrandService brandService;
	
	@Autowired
	private SlaughterhouseService slaughterhouseService;	

	@Autowired
	private VegetableWholesaleService vegetableWholesaleService;

	@Autowired
	private QuotationService quotationService;
	
	
	/**----------------客户(供应商)信息----------------------*/
	
	/**
	 * @Description 列表
	 * @param customer
	 * @return Result
	 */
	@GetMapping("/v1/customer")
    public Result getCustomer(Customer customer) {
		return query(customerService, customer);
    }
	
	/**
	 * @Description 新增信息
	 * @param customers
	 * @return Result
	 */
	@PostMapping("/v1/customer")
	public Result insertCustomer(Customer customer) {
		Result result = genSuccessResult();
		try {
			/*String epId = getLoginInfos().getEntpInfo().getId();
			customer.setEpId(epId);*/
			customerService.insert(customer);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 更新信息
	 * @param id
	 * @param customers
	 * @return Result
	 */
	@PatchMapping("/v1/customer/{id}")
    public Result updateCustomer(@PathVariable("id")String id,Customer customer){
        Result result = genSuccessResult();
        try {
        	customerService.update(customer);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
	
	/**
	 * @Description 删除信息
	 * @param id
	 * @return Result
	 */
	@DeleteMapping("/v1/customer/{id}")
    public Result deleteCustomer(@PathVariable("id")String id){
        Result result = genSuccessResult();
        try {
        	customerService.delete(id);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
	
	/**----------------产地信息----------------------*/
	
	/**
	 * @Description 列表
	 * @param division
	 * @return Result
	 */
	@GetMapping("/v1/division")
	public Result getDivision(Division division) {
		return query(divisionService, division);
	}
	
	/**
	 * @Description 新增信息
	 * @param division
	 * @return Result
	 */
	@PostMapping("/v1/division")
	public Result insertDivision(Division division) {
		Result result = genSuccessResult();
		try {
			/*String epId = getLoginInfos().getEntpInfo().getId();
			division.setEpId(epId);*/
			divisionService.insert(division);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 更新信息
	 * @param id
	 * @param division
	 * @return Result
	 */
	@PatchMapping("/v1/division/{id}")
	public Result updateDivision(@PathVariable("id")String id,Division division){
		Result result = genSuccessResult();
		try {
			divisionService.update(division);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 删除信息
	 * @param id
	 * @return Result
	 */
	@DeleteMapping("/v1/division/{id}")
	public Result deleteDivision(@PathVariable("id")String id){
		Result result = genSuccessResult();
		try {
			divisionService.delete(id);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**----------------商品信息----------------------*/
	
	/**
	 * @Description 列表
	 * @param product
	 * @return Result
	 */
	@GetMapping("/v1/product")
    public Result getProduct(Product product) {
		return query(productService, product);
    }
	
	/**
	 * @Description 新增
	 * @param product
	 * @return Result
	 */
	@PostMapping("/v1/product")
    public Result insertProduct(Product product) {
        Result result = genSuccessResult();
        try {
        	/*String epId = getLoginInfos().getEntpInfo().getId();
        	product.setEpId(epId);*/
        	productService.insert(product);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
	
	/**
	 * @Description 更新
	 * @param id
	 * @param product
	 * @return Result
	 */
	@PatchMapping("/v1/product/{id}")
    public Result updateProduct(@PathVariable("id")String id,Product product){
        Result result = genSuccessResult();
        try {
        	productService.update(product);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
	
	/**
	 * @Description 删除
	 * @param id
	 * @return Result
	 */
	@DeleteMapping("/v1/product/{id}")
    public Result deleteProduct(@PathVariable("id")String id){
        Result result = genSuccessResult();
        try {
        	productService.delete(id);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
	
	/**----------------品牌信息----------------------*/
	
	/**
	 * @Description 列表
	 * @param customer
	 * @return Result
	 */
	@GetMapping("/v1/brand")
    public Result getBrand(Brand brand) {
		return query(brandService, brand);
    }
	
	/**
	 * @Description 新增信息
	 * @param brand
	 * @return Result
	 */
	@PostMapping("/v1/brand")
	public Result insertBrand(Brand brand) {
		Result result = genSuccessResult();
		try {
			/*String epId = getLoginInfos().getEntpInfo().getId();
			brand.setEpId(epId);*/
			brandService.insert(brand);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 更新信息
	 * @param id
	 * @param brand
	 * @return Result
	 */
	@PatchMapping("/v1/brand/{id}")
    public Result updateBrand(@PathVariable("id")String id,Brand brand){
        Result result = genSuccessResult();
        try {
        	brandService.update(brand);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
	
	/**
	 * @Description 删除信息
	 * @param id
	 * @return Result
	 */
	@DeleteMapping("/v1/brand/{id}")
    public Result deleteBrand(@PathVariable("id")String id){
        Result result = genSuccessResult();
        try {
        	brandService.delete(id);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
	/**----------------屠宰场信息----------------------*/
	
	/**
	 * @Description 列表
	 * @param slaughterhouse
	 * @return Result
	 */
	@GetMapping("/v1/slaughterhouse")
	public Result getSlaughterhouse(Slaughterhouse slaughterhouse) {
		return query(slaughterhouseService, slaughterhouse);
	}
	
	/**
	 * @Description 新增信息
	 * @param slaughterhouse
	 * @return Result
	 */
	@PostMapping("/v1/slaughterhouse")
	public Result insertSlaughterhouse(Slaughterhouse slaughterhouse) {
		Result result = genSuccessResult();
		try {
			/*String epId = getLoginInfos().getEntpInfo().getId();
			slaughterhouse.setEpId(epId);*/
			slaughterhouseService.insert(slaughterhouse);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 更新信息
	 * @param id
	 * @param slaughterhouse
	 * @return Result
	 */
	@PatchMapping("/v1/slaughterhouse/{id}")
	public Result updateSlaughterhouse(@PathVariable("id")String id,Slaughterhouse slaughterhouse){
		Result result = genSuccessResult();
		try {
			slaughterhouseService.update(slaughterhouse);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 删除信息
	 * @param id
	 * @return Result
	 */
	@DeleteMapping("/v1/slaughterhouse/{id}")
	public Result deleteSlaughterhouse(@PathVariable("id")String id){
		Result result = genSuccessResult();
		try {
			slaughterhouseService.delete(id);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**----------------蔬菜批发市场信息----------------------*/
	
	/**
	 * @Description 列表
	 * @param vegetableWholesale
	 * @return Result
	 */
	@GetMapping("/v1/vegetableWholesale")
	public Result getVegetableWholesale(VegetableWholesale vegetableWholesale) {
		return query(vegetableWholesaleService, vegetableWholesale);
	}
	
	/**
	 * @Description 新增信息
	 * @param vegetableWholesale
	 * @return Result
	 */
	@PostMapping("/v1/vegetableWholesale")
	public Result insertVegetableWholesale(VegetableWholesale vegetableWholesale) {
		Result result = genSuccessResult();
		try {
			/*String epId = getLoginInfos().getEntpInfo().getId();
			vegetableWholesale.setEpId(epId);*/
			vegetableWholesaleService.insert(vegetableWholesale);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 更新信息
	 * @param id
	 * @param vegetableWholesale
	 * @return Result
	 */
	@PatchMapping("/v1/vegetableWholesale/{id}")
	public Result updateVegetableWholesale(@PathVariable("id")String id,VegetableWholesale vegetableWholesale){
		Result result = genSuccessResult();
		try {
			vegetableWholesaleService.update(vegetableWholesale);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 删除信息
	 * @param id
	 * @return Result
	 */
	@DeleteMapping("/v1/vegetableWholesale/{id}")
	public Result deleteVegetableWholesale(@PathVariable("id")String id){
		Result result = genSuccessResult();
		try {
			vegetableWholesaleService.delete(id);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**----------------价格行情信息----------------------*/
	
	/**
	 * @Description 列表
	 * @param quotation
	 * @return Result
	 */
	@GetMapping("/v1/quotation")
	public Result getQuotation(Quotation quotation) {
		return query(quotationService, quotation);
	}
	
	/**
	 * @Description 新增信息
	 * @param quotation
	 * @return Result
	 */
	@PostMapping("/v1/quotation")
	public Result insertQuotation(Quotation quotation) {
		Result result = genSuccessResult();
		try {
			/*String epId = getLoginInfos().getEntpInfo().getId();
			quotation.setEpId(epId);*/
			quotationService.insert(quotation);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 更新信息
	 * @param id
	 * @param quotation
	 * @return Result
	 */
	@PatchMapping("/v1/quotation/{id}")
	public Result updateQuotation(@PathVariable("id")String id,Quotation quotation){
		Result result = genSuccessResult();
		try {
			quotationService.update(quotation);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 删除信息
	 * @param id
	 * @return Result
	 */
	@DeleteMapping("/v1/quotation/{id}")
	public Result deleteQuotation(@PathVariable("id")String id){
		Result result = genSuccessResult();
		try {
			quotationService.delete(id);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
}
