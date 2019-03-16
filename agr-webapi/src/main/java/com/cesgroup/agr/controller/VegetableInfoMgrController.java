package com.cesgroup.agr.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.cesgroup.agr.entity.VegetableApproach;
import com.cesgroup.agr.service.VegetableApproachService;
import com.cesgroup.agr.utils.Result;

/** 
 * @ClassName VegetableInfoMgrController.java
 * @Description 蔬菜信息管理接口
 * @author huorujiao
 * @date 创建时间：2019年3月4日 下午3:34:23   
 */
@RestController
public class VegetableInfoMgrController extends BaseController {

	private final static Logger logger = LoggerFactory.getLogger(VegetableInfoMgrController.class);

	@Autowired
	private VegetableApproachService vegetableApproachService;
	
	
	
	/**----------------蔬菜进场信息----------------------*/
	
	/**
	 * @Description 列表
	 * @param vegetableApproach
	 * @return Result
	 */
	@GetMapping("/v1/vegetableApproach")
    public Result getVegetableApproach(VegetableApproach vegetableApproach) {
		return query(vegetableApproachService, vegetableApproach);
    }
	
	/**
	 * @Description 新增信息
	 * @param vegetableApproach
	 * @return Result
	 */
	@PostMapping("/v1/vegetableApproach")
	public Result insertMeatApproach(VegetableApproach vegetableApproach) {
		Result result = genSuccessResult();
		try {
			/*String epId = getLoginInfos().getEntpInfo().getId();
			meatApproach.setEpId(epId);*/
			vegetableApproachService.insertVegetableApproach(vegetableApproach);
		} catch (Exception e) {
			result = exceptionHandler.handleException(e);
		}
		return result;
	}
	
	/**
	 * @Description 更新信息
	 * @param id
	 * @param vegetableApproach
	 * @return Result
	 */
	@PatchMapping("/v1/vegetableApproach/{id}")
    public Result updateMeatApproach(@PathVariable("id")String id,VegetableApproach vegetableApproach){
        Result result = genSuccessResult();
        try {
        	vegetableApproachService.update(vegetableApproach);
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
	@DeleteMapping("/v1/vegetableApproach/{id}")
    public Result deleteMeatApproach(@PathVariable("id")String id){
        Result result = genSuccessResult();
        try {
        	vegetableApproachService.delete(id);
        } catch (Exception e) {
            result = exceptionHandler.handleException(e);
        }
        return result;
    }
	
}
