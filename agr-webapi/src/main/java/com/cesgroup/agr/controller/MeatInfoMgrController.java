package com.cesgroup.agr.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.cesgroup.agr.entity.MeatApproach;
import com.cesgroup.agr.service.MeatApproachService;
import com.cesgroup.agr.utils.Result;

/** 
 * @ClassName MeatInfoMgrController.java
 * @Description 肉类信息管理接口
 * @author huorujiao
 * @date 创建时间：2019年3月3日 下午4:32:24   
 */
@RestController
public class MeatInfoMgrController extends BaseController {

	private final static Logger logger = LoggerFactory.getLogger(MeatInfoMgrController.class);

	@Autowired
	private MeatApproachService meatApproachService;
	
	
	
	/**----------------肉类进场信息----------------------*/
	
	/**
	 * @Description 列表
	 * @param meatApproach
	 * @return Result
	 */
	@GetMapping("/v1/meatApproach")
    public Result getMeatApproach(MeatApproach meatApproach) {
		return query(meatApproachService, meatApproach);
    }
	
	/**
	 * @Description 新增信息
	 * @param meatApproach
	 * @return Result
	 */
	@PostMapping("/v1/meatApproach")
	public Result insertMeatApproach(MeatApproach meatApproach) {
		Result result = genSuccessResult();
		try {
			/*String epId = getLoginInfos().getEntpInfo().getId();
			meatApproach.setEpId(epId);*/
			meatApproachService.insertMeatApproach(meatApproach);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 更新信息
	 * @param id
	 * @param meatApproach
	 * @return Result
	 */
	@PatchMapping("/v1/meatApproach/{id}")
    public Result updateMeatApproach(@PathVariable("id")String id,MeatApproach meatApproach){
        Result result = genSuccessResult();
        try {
        	meatApproachService.update(meatApproach);
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
	@DeleteMapping("/v1/meatApproach/{id}")
    public Result deleteMeatApproach(@PathVariable("id")String id){
        Result result = genSuccessResult();
        try {
        	meatApproachService.delete(id);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
	
}
