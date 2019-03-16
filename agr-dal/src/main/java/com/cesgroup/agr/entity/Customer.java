package com.cesgroup.agr.entity;

import java.util.Date;
import javax.persistence.*;

public class Customer extends BaseEntity {
    @Column(name = "ep_id")
    private String epId;

    /**
     * 客户主体码
     */
    @Column(name = "customer_code")
    private String customerCode;

    /**
     * 市场代码
     */
    @Column(name = "market_code")
    private String marketCode;

    /**
     * 客户名称
     */
    @Column(name = "customer_name")
    private String customerName;

    /**
     * 法人代表
     */
    @Column(name = "legal_person")
    private String legalPerson;

    /**
     * 身份证
     */
    private String identification;

    /**
     * 性别：0男；2女
     */
    private Byte sex;

    /**
     * 客户类型：01买方，02卖方，03买卖方
     */
    @Column(name = "customer_type")
    private String customerType;

    /**
     * 联系人
     */
    @Column(name = "contract_person")
    private String contractPerson;

    /**
     * 联系方式
     */
    @Column(name = "contract_phone")
    private String contractPhone;

    /**
     * 经营产品
     */
    private String product;

    /**
     * 流向类别
     */
    @Column(name = "direction_type")
    private String directionType;

    /**
     * 销售地点
     */
    @Column(name = "sale_address")
    private String saleAddress;

    /**
     * 开户行
     */
    private String bank;

    /**
     * 银行卡号
     */
    @Column(name = "card_number")
    private String cardNumber;

    /**
     * 秤型：1寺冈
     */
    @Column(name = "balance_type")
    private String balanceType;

    @Column(name = "balance_number")
    private String balanceNumber;

    /**
     * 摊位名称
     */
    private String seller;

    /**
     * 摊位号
     */
    @Column(name = "seller_no")
    private String sellerNo;

    /**
     * 食卫生许可证
     */
    private String licence;

    /**
     * 食卫生许可证有效期开始时间
     */
    @Column(name = "licence_begin_time")
    private Date licenceBeginTime;

    /**
     * 食卫生许可证有效期结束时间
     */
    @Column(name = "licence_end_time")
    private Date licenceEndTime;

    /**
     * 营业执照
     */
    @Column(name = "business_licence")
    private String businessLicence;

    /**
     * 营业执照发证日期
     */
    @Column(name = "business_licence_date")
    private Date businessLicenceDate;

    /**
     * 法定地址
     */
    @Column(name = "register_address")
    private String registerAddress;

    /**
     * 暂住地址
     */
    @Column(name = "temporary_address")
    private String temporaryAddress;

    /**
     * 备注
     */
    private String comments;

    /**
     * 是否启用 1是；0否
     */
    @Column(name = "is_used")
    private Byte isUsed;

    /**
     * 星级 1：一星；2：二星...
     */
    private String level;

    /**
     * 是否触摸屏显示
     */
    @Column(name = "is_touch")
    private Byte isTouch;

    /**
     * @return ep_id
     */
    public String getEpId() {
        return epId;
    }

    /**
     * @param epId
     */
    public void setEpId(String epId) {
        this.epId = epId;
    }

    /**
     * 获取客户主体码
     *
     * @return customer_code - 客户主体码
     */
    public String getCustomerCode() {
        return customerCode;
    }

    /**
     * 设置客户主体码
     *
     * @param customerCode 客户主体码
     */
    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    /**
     * 获取市场代码
     *
     * @return market_code - 市场代码
     */
    public String getMarketCode() {
        return marketCode;
    }

    /**
     * 设置市场代码
     *
     * @param marketCode 市场代码
     */
    public void setMarketCode(String marketCode) {
        this.marketCode = marketCode;
    }

    /**
     * 获取客户名称
     *
     * @return customer_name - 客户名称
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * 设置客户名称
     *
     * @param customerName 客户名称
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    /**
     * 获取法人代表
     *
     * @return legal_person - 法人代表
     */
    public String getLegalPerson() {
        return legalPerson;
    }

    /**
     * 设置法人代表
     *
     * @param legalPerson 法人代表
     */
    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson;
    }

    /**
     * 获取身份证
     *
     * @return identification - 身份证
     */
    public String getIdentification() {
        return identification;
    }

    /**
     * 设置身份证
     *
     * @param identification 身份证
     */
    public void setIdentification(String identification) {
        this.identification = identification;
    }

    /**
     * 获取性别：0男；2女
     *
     * @return sex - 性别：0男；2女
     */
    public Byte getSex() {
        return sex;
    }

    /**
     * 设置性别：0男；2女
     *
     * @param sex 性别：0男；2女
     */
    public void setSex(Byte sex) {
        this.sex = sex;
    }

    /**
     * 获取客户类型：01买方，02卖方，03买卖方
     *
     * @return customer_type - 客户类型：01买方，02卖方，03买卖方
     */
    public String getCustomerType() {
        return customerType;
    }

    /**
     * 设置客户类型：01买方，02卖方，03买卖方
     *
     * @param customerType 客户类型：01买方，02卖方，03买卖方
     */
    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    /**
     * 获取联系人
     *
     * @return contract_person - 联系人
     */
    public String getContractPerson() {
        return contractPerson;
    }

    /**
     * 设置联系人
     *
     * @param contractPerson 联系人
     */
    public void setContractPerson(String contractPerson) {
        this.contractPerson = contractPerson;
    }

    /**
     * 获取联系方式
     *
     * @return contract_phone - 联系方式
     */
    public String getContractPhone() {
        return contractPhone;
    }

    /**
     * 设置联系方式
     *
     * @param contractPhone 联系方式
     */
    public void setContractPhone(String contractPhone) {
        this.contractPhone = contractPhone;
    }

    /**
     * 获取经营产品
     *
     * @return product - 经营产品
     */
    public String getProduct() {
        return product;
    }

    /**
     * 设置经营产品
     *
     * @param product 经营产品
     */
    public void setProduct(String product) {
        this.product = product;
    }

    /**
     * 获取流向类别
     *
     * @return direction_type - 流向类别
     */
    public String getDirectionType() {
        return directionType;
    }

    /**
     * 设置流向类别
     *
     * @param directionType 流向类别
     */
    public void setDirectionType(String directionType) {
        this.directionType = directionType;
    }

    /**
     * 获取销售地点
     *
     * @return sale_address - 销售地点
     */
    public String getSaleAddress() {
        return saleAddress;
    }

    /**
     * 设置销售地点
     *
     * @param saleAddress 销售地点
     */
    public void setSaleAddress(String saleAddress) {
        this.saleAddress = saleAddress;
    }

    /**
     * 获取开户行
     *
     * @return bank - 开户行
     */
    public String getBank() {
        return bank;
    }

    /**
     * 设置开户行
     *
     * @param bank 开户行
     */
    public void setBank(String bank) {
        this.bank = bank;
    }

    /**
     * 获取银行卡号
     *
     * @return card_number - 银行卡号
     */
    public String getCardNumber() {
        return cardNumber;
    }

    /**
     * 设置银行卡号
     *
     * @param cardNumber 银行卡号
     */
    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    /**
     * 获取秤型：1寺冈
     *
     * @return balance_type - 秤型：1寺冈
     */
    public String getBalanceType() {
        return balanceType;
    }

    /**
     * 设置秤型：1寺冈
     *
     * @param balanceType 秤型：1寺冈
     */
    public void setBalanceType(String balanceType) {
        this.balanceType = balanceType;
    }

    /**
     * @return balance_number
     */
    public String getBalanceNumber() {
        return balanceNumber;
    }

    /**
     * @param balanceNumber
     */
    public void setBalanceNumber(String balanceNumber) {
        this.balanceNumber = balanceNumber;
    }

    /**
     * 获取摊位名称
     *
     * @return seller - 摊位名称
     */
    public String getSeller() {
        return seller;
    }

    /**
     * 设置摊位名称
     *
     * @param seller 摊位名称
     */
    public void setSeller(String seller) {
        this.seller = seller;
    }

    /**
     * 获取摊位号
     *
     * @return seller_no - 摊位号
     */
    public String getSellerNo() {
        return sellerNo;
    }

    /**
     * 设置摊位号
     *
     * @param sellerNo 摊位号
     */
    public void setSellerNo(String sellerNo) {
        this.sellerNo = sellerNo;
    }

    /**
     * 获取食卫生许可证
     *
     * @return licence - 食卫生许可证
     */
    public String getLicence() {
        return licence;
    }

    /**
     * 设置食卫生许可证
     *
     * @param licence 食卫生许可证
     */
    public void setLicence(String licence) {
        this.licence = licence;
    }

    /**
     * 获取食卫生许可证有效期开始时间
     *
     * @return licence_begin_time - 食卫生许可证有效期开始时间
     */
    public Date getLicenceBeginTime() {
        return licenceBeginTime;
    }

    /**
     * 设置食卫生许可证有效期开始时间
     *
     * @param licenceBeginTime 食卫生许可证有效期开始时间
     */
    public void setLicenceBeginTime(Date licenceBeginTime) {
        this.licenceBeginTime = licenceBeginTime;
    }

    /**
     * 获取食卫生许可证有效期结束时间
     *
     * @return licence_end_time - 食卫生许可证有效期结束时间
     */
    public Date getLicenceEndTime() {
        return licenceEndTime;
    }

    /**
     * 设置食卫生许可证有效期结束时间
     *
     * @param licenceEndTime 食卫生许可证有效期结束时间
     */
    public void setLicenceEndTime(Date licenceEndTime) {
        this.licenceEndTime = licenceEndTime;
    }

    /**
     * 获取营业执照
     *
     * @return business_licence - 营业执照
     */
    public String getBusinessLicence() {
        return businessLicence;
    }

    /**
     * 设置营业执照
     *
     * @param businessLicence 营业执照
     */
    public void setBusinessLicence(String businessLicence) {
        this.businessLicence = businessLicence;
    }

    /**
     * 获取营业执照发证日期
     *
     * @return business_licence_date - 营业执照发证日期
     */
    public Date getBusinessLicenceDate() {
        return businessLicenceDate;
    }

    /**
     * 设置营业执照发证日期
     *
     * @param businessLicenceDate 营业执照发证日期
     */
    public void setBusinessLicenceDate(Date businessLicenceDate) {
        this.businessLicenceDate = businessLicenceDate;
    }

    /**
     * 获取法定地址
     *
     * @return register_address - 法定地址
     */
    public String getRegisterAddress() {
        return registerAddress;
    }

    /**
     * 设置法定地址
     *
     * @param registerAddress 法定地址
     */
    public void setRegisterAddress(String registerAddress) {
        this.registerAddress = registerAddress;
    }

    /**
     * 获取暂住地址
     *
     * @return temporary_address - 暂住地址
     */
    public String getTemporaryAddress() {
        return temporaryAddress;
    }

    /**
     * 设置暂住地址
     *
     * @param temporaryAddress 暂住地址
     */
    public void setTemporaryAddress(String temporaryAddress) {
        this.temporaryAddress = temporaryAddress;
    }

    /**
     * 获取备注
     *
     * @return comments - 备注
     */
    public String getComments() {
        return comments;
    }

    /**
     * 设置备注
     *
     * @param comments 备注
     */
    public void setComments(String comments) {
        this.comments = comments;
    }

    /**
     * 获取是否启用 1是；0否
     *
     * @return is_used - 是否启用 1是；0否
     */
    public Byte getIsUsed() {
        return isUsed;
    }

    /**
     * 设置是否启用 1是；0否
     *
     * @param isUsed 是否启用 1是；0否
     */
    public void setIsUsed(Byte isUsed) {
        this.isUsed = isUsed;
    }

    /**
     * 获取星级 1：一星；2：二星...
     *
     * @return level - 星级 1：一星；2：二星...
     */
    public String getLevel() {
        return level;
    }

    /**
     * 设置星级 1：一星；2：二星...
     *
     * @param level 星级 1：一星；2：二星...
     */
    public void setLevel(String level) {
        this.level = level;
    }

    /**
     * 获取是否触摸屏显示
     *
     * @return is_touch - 是否触摸屏显示
     */
    public Byte getIsTouch() {
        return isTouch;
    }

    /**
     * 设置是否触摸屏显示
     *
     * @param isTouch 是否触摸屏显示
     */
    public void setIsTouch(Byte isTouch) {
        this.isTouch = isTouch;
    }
}