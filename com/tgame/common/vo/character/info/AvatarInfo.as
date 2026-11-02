package com.tgame.common.vo.character.info
{
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpeciaAvatarPartID;
   import com.tgame.manager.AvatarManager;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   
   public class AvatarInfo
   {
      
      public var gengXin:Boolean = true;
      
      public var isShowLongWenKeHua:Boolean = false;
      
      public var longWenKeHuaYanse:int = 0;
      
      public var avatarCount:int = 0;
      
      public var longwenid:int = 0;
      
      public var avatarGoodsIDArr:Array = [];
      
      public var usingFashion:int = 0;
      
      public var wangzhezhibang:int = 0;
      
      public var useAvatarType:int = 0;
      
      public var lastMountId:int = 0;
      
      public var isCiKe:Boolean = false;
      
      public var isRongYuHuanZhong:Boolean = false;
      
      public var isQiCaiChuanQi:Boolean = false;
      
      public var isCiKeTaoZhuang:Boolean = false;
      
      public var isHuangChengShouWeiTaoZhuang:Boolean = false;
      
      public var isZiJinYuPao:Boolean = false;
      
      public var isXinShouHuanZhuang:Boolean = false;
      
      public var isChangE:Boolean = false;
      
      public var isHuangJinLongLinJia:Boolean = false;
      
      public var isHuXiaoShanLin:Boolean = false;
      
      public var isDagoubang:Boolean = false;
      
      public var isLingHu:Boolean = false;
      
      public var isLvHaMa:Boolean = false;
      
      public var isFanTongXianJue:Boolean = false;
      
      public var isZhenggu:Boolean = false;
      
      public var isBailongjiang:Boolean = false;
      
      public var isYangguo:Boolean = false;
      
      public var isXiaolongnv:Boolean = false;
      
      public var isGuoXiang:Boolean = false;
      
      public var isLiMoChou:Boolean = false;
      
      public var isYinZhiPing:Boolean = false;
      
      public var isLinghuchong:Boolean = false;
      
      public var isRenyingying:Boolean = false;
      
      public var isYuebuqun:Boolean = false;
      
      public var isRenWoXing:Boolean = false;
      
      public var isDuanYu:Boolean = false;
      
      public var isWangYuYan:Boolean = false;
      
      public var isXuZhu:Boolean = false;
      
      public var isQiaoFeng:Boolean = false;
      
      public var isAZi:Boolean = false;
      
      public var isLanfenghuang:Boolean = false;
      
      public var isLangRen:int = 0;
      
      public var isQiLinAvatar:Boolean = false;
      
      public var isYouyong:Boolean = false;
      
      public var isBiWuZhaoQinXiuQiu:Boolean = false;
      
      public var isBingJingHu:Boolean = false;
      
      public var isHuangZheZhiYi:Boolean = false;
      
      public var zhenYingHuanZhuang:int = 0;
      
      public var isBiWuZhaoQinFeiDaDiao:Boolean = false;
      
      public var biWuZhaoQinFeiDaDiao_id:int = -1;
      
      public var biWuZhaoQinFeiDaDiao_qicheng_zhuangtai:Boolean;
      
      public var biWuZhaoQinFeiDaDiao_zuoqi:AvatarParamData;
      
      public var isFuQiJingJiFeiDaDiao:Boolean = false;
      
      public var isFenshenHuanzhuang:Boolean = false;
      
      public var FuQiJingJiFeiDaDiao_id:int = -1;
      
      public var FuQiJingJiFeiDaDiao_qicheng_zhuangtai:Boolean;
      
      public var FuQiJingJiFeiDaDiao_zuoqi:AvatarParamData;
      
      public var FuQiJingJiFeiDaDiao_body:AvatarParamData;
      
      public var isFeixing:Boolean;
      
      public var isFeixing_huanzhuang_Id:int;
      
      public var isFeixing_wuhun_Id:int;
      
      public var isZhumozhang:Boolean = false;
      
      public var isShenjiangji:Boolean = false;
      
      public var isWuLinMengZhu:Boolean = false;
      
      public var isTianwang:Boolean = false;
      
      public var isYingxiong:Boolean = false;
      
      public var isYingxiong1:Boolean = false;
      
      public var isWANSHI:Boolean = false;
      
      public var isZunrongWanbaoge:Boolean = false;
      
      public var isZijinHuanzhuang:Boolean = false;
      
      public var isQiXiHuanZhuang:Boolean = false;
      
      public var isJiGuanGuai:Boolean = false;
      
      public var isMingJieZhanShen:Boolean = false;
      
      public var isZhaoYun:Boolean = false;
      
      public var isHeiAnMoJun:Boolean = false;
      
      public var isHuGuoShenJiang:Boolean = false;
      
      public var isHuangJinYinZhe:Boolean = false;
      
      public var isZiLingShou:Boolean = false;
      
      public var isJiGong:Boolean = false;
      
      public var isLuoHan:Boolean = false;
      
      public var isXiangYangDaJiang:Boolean = false;
      
      public var isBaoMeiRen:Boolean = false;
      
      public var isJiaLouLuo:Boolean = false;
      
      public var isShiHua:Boolean = false;
      
      public var isYinYangDaoRen:Boolean = false;
      
      public var isYuXueZhiGuang:Boolean = false;
      
      public var isZhaoYun_Jin:Boolean = false;
      
      public var isZhaoMin:Boolean = false;
      
      public var isXiongBa:Boolean = false;
      
      public var isSanShengMu:Boolean = false;
      
      public var isShaMoFeiYing:Boolean = false;
      
      public var isTianShiEMo:Boolean = false;
      
      public var isBaiMianShuSheng:Boolean = false;
      
      public var isHongLianXianZi:Boolean = false;
      
      public var isChiYou:Boolean = false;
      
      public var isTieShanGongZhu:Boolean = false;
      
      public var isYuFeng:Boolean = false;
      
      public var isTianZhao:Boolean = false;
      
      public var isNiYan:Boolean = false;
      
      public var isYingXiongShouWei:Boolean = false;
      
      public var isShuShanShenQi:Boolean = false;
      
      public var isZiYinDao:Boolean = false;
      
      public var isRiYueShenJian:Boolean = false;
      
      public var isXuanYuanShenJian:Boolean = false;
      
      public var isMoJian:Boolean = false;
      
      public var isMoDao:Boolean = false;
      
      public var isBaJiaoShan:Boolean = false;
      
      public var isXiaLvTuMo:Boolean = false;
      
      public var isFengLei:Boolean = false;
      
      public var isLiuXingLuo:Boolean = false;
      
      public var isXieLongMoJian:Boolean = false;
      
      public var isXueWu:Boolean = false;
      
      public var isJuLongZhiJi:Boolean = false;
      
      public var isSuiHunYinXue:Boolean = false;
      
      public var isSuiHunZhiShang:Boolean = false;
      
      public var isHanGuang:Boolean = false;
      
      public var isPoTian:Boolean = false;
      
      public var isShanZei:Boolean = false;
      
      public var isQiuQianCHi:Boolean = false;
      
      public var isMoLingZhiYuan:Boolean = false;
      
      public var isKunShou:Boolean = false;
      
      public var isYanMoNuPu:Boolean = false;
      
      public var isJinJiaZhanChe:Boolean = false;
      
      public var isJianTiFengYin:Boolean = false;
      
      public var isDiLu:Boolean = false;
      
      public var isMeiRenJi:Boolean = false;
      
      public var isBuSiJinShen:Boolean = false;
      
      public var isWanZhongZhuMu:Boolean = false;
      
      public var isRuLaiShenZhang:Boolean = false;
      
      public var isHuanYingXiaDao:Boolean = false;
      
      public var isWangZheXueSha:Boolean = false;
      
      public var isShuangRenFengXing_ZhongQiu:Boolean = false;
      
      public var isYueTuHuanZhuang:Boolean = false;
      
      public var isTianmajian:Boolean = false;
      
      public var isXiongjijian:Boolean = false;
      
      public var isXuanbingjian:Boolean = false;
      
      public var isTuLongDao_1:Boolean = false;
      
      public var isTuLongDao_2:Boolean = false;
      
      public var isTuLongDao_3:Boolean = false;
      
      public var isTuLongDao_4:Boolean = false;
      
      public var isTuLongDao_5:Boolean = false;
      
      public var isJingLeiQiang:int = 0;
      
      public var isDaHuanZhuang:Boolean = false;
      
      public var isXiaoHuanZhuang:Boolean = false;
      
      public var isWuQiHuanZhuang:Boolean = false;
      
      public var isGongJianHuanZhuang:Boolean = false;
      
      public var isZuoQiHuanZhuang:Boolean = false;
      
      public var isDaHuanZhuang_WUMA:Boolean = false;
      
      public var isDaHuanZhuang_QUANPINGBI:Boolean = false;
      
      public var is255:Boolean = false;
      
      public var is256:Boolean = false;
      
      public var is257:Boolean = false;
      
      private var _apd_body:AvatarParamData;
      
      private var _apd_weapon:AvatarParamData;
      
      private var _useIng_Weapon_id:int;
      
      private var _apd_ylzr:AvatarParamData;
      
      private var _apd_xyj:AvatarParamData;
      
      private var _apd_aojian:AvatarParamData;
      
      private var _apd_pj:AvatarParamData;
      
      private var _apd_xtzj:AvatarParamData;
      
      private var _apd_xingtian:AvatarParamData;
      
      private var _apd_zilinghuanyueji:AvatarParamData;
      
      private var _apd_wuyingjian:AvatarParamData;
      
      private var _apd_huoyun:AvatarParamData;
      
      private var _apd_guxing:AvatarParamData;
      
      private var _apd_jixiang:AvatarParamData;
      
      private var _apd_jinwumingguangtang:AvatarParamData;
      
      private var _apd_lietianbawangji:AvatarParamData;
      
      private var _apd_dgb:AvatarParamData;
      
      private var _apd_xydj:AvatarParamData;
      
      private var _apd_xytj:AvatarParamData;
      
      private var _apd_xyrj:AvatarParamData;
      
      private var _apd_gjmy:AvatarParamData;
      
      private var _apd_shenqi:AvatarParamData;
      
      private var _apd_longyin:AvatarParamData;
      
      private var _apd_longya:AvatarParamData;
      
      private var _apd_longya1:AvatarParamData;
      
      private var _apd_potianren:AvatarParamData;
      
      private var _apd_tianshang:AvatarParamData;
      
      private var _apd_liekong:AvatarParamData;
      
      private var _apd_quanshen:AvatarParamData;
      
      private var _apd_pangu:AvatarParamData;
      
      private var _apd_xueyindao:AvatarParamData;
      
      private var _apd_yanyuedao:AvatarParamData;
      
      private var _apd_huimie:AvatarParamData;
      
      private var _apd_zhumozhang:AvatarParamData;
      
      private var _apd_chiyan:AvatarParamData;
      
      private var _apd_fengtianji:AvatarParamData;
      
      private var _apd_tianjing:AvatarParamData;
      
      private var _apd_huolongdao:AvatarParamData;
      
      private var _apd_tianzhu:AvatarParamData;
      
      private var _apd_pangukaitianfu:AvatarParamData;
      
      private var _apd_tiandijian:AvatarParamData;
      
      private var _apd_hanqibingpo:AvatarParamData;
      
      private var _apd_jianzunlongquanjian:AvatarParamData;
      
      private var _apd_chuangshi:AvatarParamData;
      
      private var _apd_suilieshifu:AvatarParamData;
      
      private var _apd_moyuan:AvatarParamData;
      
      private var _apd_fengbaodao:AvatarParamData;
      
      private var _apd_fengyun:AvatarParamData;
      
      private var _apd_shengdan2015:AvatarParamData;
      
      private var _apd_fengsha:AvatarParamData;
      
      private var _apd_fengyijian:AvatarParamData;
      
      private var _apd_lexinji:AvatarParamData;
      
      private var _apd_fengyingjian:AvatarParamData;
      
      private var _apd_zhenfengjian:AvatarParamData;
      
      private var _apd_fengyunjian:AvatarParamData;
      
      private var _apd_bingfengjian:AvatarParamData;
      
      private var _apd_hongleizhangu:AvatarParamData;
      
      private var _apd_sandenggufo:AvatarParamData;
      
      private var _apd_fonuji:AvatarParamData;
      
      private var _apd_fengyinjian:AvatarParamData;
      
      private var _apd_tianmajian:AvatarParamData;
      
      private var _apd_wuhunjian:AvatarParamData;
      
      private var _apd_zhentianjian:AvatarParamData;
      
      private var _apd_tianxue:AvatarParamData;
      
      private var _apd_xiongjijian:AvatarParamData;
      
      private var _apd_wujinjian:AvatarParamData;
      
      private var _apd_shuntianjian:AvatarParamData;
      
      private var _apd_wangzheqicang:AvatarParamData;
      
      private var _apd_bixuejian:AvatarParamData;
      
      private var _apd_wuyijian:AvatarParamData;
      
      private var _apd_shijianshenqi:AvatarParamData;
      
      private var _apd_qingfengjian:AvatarParamData;
      
      private var _apd_huolinjian:AvatarParamData;
      
      private var _apd_zhuihunji:AvatarParamData;
      
      private var _apd_biyudao:AvatarParamData;
      
      private var _apd_wuwozhang:AvatarParamData;
      
      private var _apd_yehuohonglian:AvatarParamData;
      
      private var _apd_mingyuedao:AvatarParamData;
      
      private var _apd_qingfengjian2:AvatarParamData;
      
      private var _apd_zhizunjian:AvatarParamData;
      
      private var _apd_baoleiji:AvatarParamData;
      
      private var _apd_mingshengzhang:AvatarParamData;
      
      private var _apd_zunshijian:AvatarParamData;
      
      private var _apd_renzhezhang:AvatarParamData;
      
      private var _apd_zhizhejian:AvatarParamData;
      
      private var _apd_yangmingjian:AvatarParamData;
      
      private var _apd_xiwangjian:AvatarParamData;
      
      private var _apd_xuejingjian:AvatarParamData;
      
      private var _apd_xuanbingjian:AvatarParamData;
      
      private var _apd_pinganjian:AvatarParamData;
      
      private var _apd_qinghuajian:AvatarParamData;
      
      private var _apd_yuxujian:AvatarParamData;
      
      private var _apd_yuqingshan:AvatarParamData;
      
      private var _apd_huomodao:AvatarParamData;
      
      private var _apd_yiheji:AvatarParamData;
      
      private var _apd_erhejian:AvatarParamData;
      
      private var _apd_sanhedao:AvatarParamData;
      
      private var _apd_miehushan:AvatarParamData;
      
      private var _apd_qingmingdao:AvatarParamData;
      
      private var _apd_huoxingfu:AvatarParamData;
      
      private var _apd_shenzao:AvatarParamData;
      
      private var _apd_kaitiangong:AvatarParamData;
      
      private var _apd_yanwenfenmo:AvatarParamData;
      
      private var _apd_linglongzi:AvatarParamData;
      
      private var _apd_shashenjian:AvatarParamData;
      
      private var _apd_duanqingji:AvatarParamData;
      
      private var _apd_nulong:AvatarParamData;
      
      private var _apd_qinian:AvatarParamData;
      
      private var _apd_zhuxian:AvatarParamData;
      
      private var _apd_hanbing:AvatarParamData;
      
      private var _apd_poshan:AvatarParamData;
      
      private var _apd_haiyu:AvatarParamData;
      
      private var _apd_tianmingdao:AvatarParamData;
      
      private var _apd_jingtianyiji:AvatarParamData;
      
      private var _apd_jingleijuedao:AvatarParamData;
      
      private var _apd_yingxiongjian:AvatarParamData;
      
      private var _apd_changshengjian:AvatarParamData;
      
      private var _apd_guiyinggong:AvatarParamData;
      
      private var _apd_jingleizhang:AvatarParamData;
      
      private var _apd_hundun:AvatarParamData;
      
      private var _apd_dinghun:AvatarParamData;
      
      private var _apd_tiandiwuji:AvatarParamData;
      
      private var _apd_huoxingjian:AvatarParamData;
      
      private var _apd_wangzhefu:AvatarParamData;
      
      private var _apd_duomingdao:AvatarParamData;
      
      private var _apd_xiaoshen:AvatarParamData;
      
      private var _apd_wanshi:AvatarParamData;
      
      private var _apd_zhongqiu:AvatarParamData;
      
      private var _apd_shenjian:AvatarParamData;
      
      private var _apd_yuhuazhang:AvatarParamData;
      
      private var _apd_baniangong:AvatarParamData;
      
      private var _apd_banianjian:AvatarParamData;
      
      private var _apd_banianji:AvatarParamData;
      
      private var _apd_2019shendan:AvatarParamData;
      
      private var _apd_2019gengzi:AvatarParamData;
      
      private var _apd_2019feihua:AvatarParamData;
      
      private var _apd_2019xiongwang:AvatarParamData;
      
      private var _apd_2020xuehuan:AvatarParamData;
      
      private var _apd_2020badao:AvatarParamData;
      
      private var _apd_2020baojian01:AvatarParamData;
      
      private var _apd_2020baojian02:AvatarParamData;
      
      private var _apd_2020baojian03:AvatarParamData;
      
      private var _apd_2020baojian04:AvatarParamData;
      
      private var _apd_2020baojian05:AvatarParamData;
      
      private var _apd_2020baojian06:AvatarParamData;
      
      private var _apd_2020baojian07:AvatarParamData;
      
      private var _apd_2020baojian08:AvatarParamData;
      
      private var _apd_2020baojian09:AvatarParamData;
      
      private var _apd_2020baojian10:AvatarParamData;
      
      private var _apd_2020baojian11:AvatarParamData;
      
      private var _apd_2020baojian12:AvatarParamData;
      
      private var _apd_2020baojian13:AvatarParamData;
      
      private var _apd_2020baojian14:AvatarParamData;
      
      private var _apd_2020baojian15:AvatarParamData;
      
      private var _apd_2020baojian16:AvatarParamData;
      
      private var _apd_2020baojian17:AvatarParamData;
      
      private var _apd_2020baojian18:AvatarParamData;
      
      private var _apd_2020baojian19:AvatarParamData;
      
      private var _apd_2020baojian20:AvatarParamData;
      
      private var _apd_2020baojian21:AvatarParamData;
      
      private var _apd_2020baojian22:AvatarParamData;
      
      private var _apd_2020baojian23:AvatarParamData;
      
      private var _apd_2020baojian24:AvatarParamData;
      
      private var _apd_2020baojian25:AvatarParamData;
      
      private var _apd_2020baojian26:AvatarParamData;
      
      private var _apd_2020baojian27:AvatarParamData;
      
      private var _apd_2020baojian28:AvatarParamData;
      
      private var _apd_2020baojian29:AvatarParamData;
      
      private var _apd_2020baojian30:AvatarParamData;
      
      private var _apd_2020baojian31:AvatarParamData;
      
      private var _apd_2020baojian32:AvatarParamData;
      
      private var _apd_2020baojian33:AvatarParamData;
      
      private var _apd_2020baojian34:AvatarParamData;
      
      private var _apd_2020baojian35:AvatarParamData;
      
      private var _apd_2020baojian36:AvatarParamData;
      
      private var _apd_2020baojian37:AvatarParamData;
      
      private var _apd_2020baojian38:AvatarParamData;
      
      private var _apd_2020baojian39:AvatarParamData;
      
      private var _apd_2020baojian40:AvatarParamData;
      
      private var _apd_2020baojian41:AvatarParamData;
      
      private var _apd_2020baojian42:AvatarParamData;
      
      private var _apd_2020baojian43:AvatarParamData;
      
      private var _apd_2020baojian44:AvatarParamData;
      
      private var _apd_2020baojian45:AvatarParamData;
      
      private var _apd_2020baojian46:AvatarParamData;
      
      private var _apd_2020baojian47:AvatarParamData;
      
      private var _apd_2020baojian48:AvatarParamData;
      
      private var _apd_2020baojian49:AvatarParamData;
      
      private var _apd_2020baojian50:AvatarParamData;
      
      private var _apd_2020baojian51:AvatarParamData;
      
      private var _apd_2020baojian52:AvatarParamData;
      
      private var _apd_2020baojian53:AvatarParamData;
      
      private var _apd_2020baojian54:AvatarParamData;
      
      private var _apd_2020baojian55:AvatarParamData;
      
      private var _apd_2020baojian56:AvatarParamData;
      
      private var _apd_2020baojian57:AvatarParamData;
      
      private var _apd_2020baojian58:AvatarParamData;
      
      private var _apd_2020baojian59:AvatarParamData;
      
      private var _apd_2020baojian60:AvatarParamData;
      
      private var _apd_2020baojian61:AvatarParamData;
      
      private var _apd_2020baojian62:AvatarParamData;
      
      private var _apd_2020baojian63:AvatarParamData;
      
      private var _apd_2020baojian64:AvatarParamData;
      
      private var _apd_2020baojian65:AvatarParamData;
      
      private var _apd_2020baojian66:AvatarParamData;
      
      private var _apd_2020baojian67:AvatarParamData;
      
      private var _apd_2020baojian68:AvatarParamData;
      
      private var _apd_2020baojian69:AvatarParamData;
      
      private var _apd_chengjiechangji:AvatarParamData;
      
      private var _apd_tianxiejian:AvatarParamData;
      
      private var _apd_junzijian:AvatarParamData;
      
      private var _apd_wangzhejian:AvatarParamData;
      
      private var _apd_xuantiezhongjian:AvatarParamData;
      
      private var _apd_guangmingzhang:AvatarParamData;
      
      private var _apd_bow:AvatarParamData;
      
      private var _apd_zhenhun:AvatarParamData;
      
      private var _apd_mount_body:AvatarParamData;
      
      private var _apd_mount_weapon:AvatarParamData;
      
      private var _apd_mount_ylzr:AvatarParamData;
      
      private var _apd_mount_xyj:AvatarParamData;
      
      private var _apd_mount_pj:AvatarParamData;
      
      private var _apd_mount_xtzj:AvatarParamData;
      
      private var _apd_mount_xingtian:AvatarParamData;
      
      private var _apd_mount_jinwumingguangtang:AvatarParamData;
      
      private var _apd_mount_lietianbawangji:AvatarParamData;
      
      private var _apd_mount_guxing:AvatarParamData;
      
      private var _apd_mount_jixiang:AvatarParamData;
      
      private var _apd_mount_dgb:AvatarParamData;
      
      private var _apd_mount_xydj:AvatarParamData;
      
      private var _apd_mount_xytj:AvatarParamData;
      
      private var _apd_mount_xyrj:AvatarParamData;
      
      private var _apd_mount_aojian:AvatarParamData;
      
      private var _apd_mount_shenqi:AvatarParamData;
      
      private var _apd_mount_longyin:AvatarParamData;
      
      private var _apd_mount_longya:AvatarParamData;
      
      private var _apd_mount_longya1:AvatarParamData;
      
      private var _apd_mount_tianshang:AvatarParamData;
      
      private var _apd_mount_potianren:AvatarParamData;
      
      private var _apd_mount_liekong:AvatarParamData;
      
      private var _apd_mount_quanshen:AvatarParamData;
      
      private var _apd_mount_pangu:AvatarParamData;
      
      private var _apd_mount_zilinghuanyueji:AvatarParamData;
      
      private var _apd_mount_wuyingjian:AvatarParamData;
      
      private var _apd_mount_huoyun:AvatarParamData;
      
      private var _apd_mount_xueyindao:AvatarParamData;
      
      private var _apd_mount_gjmy:AvatarParamData;
      
      private var _apd_mount_yanyuedao:AvatarParamData;
      
      private var _apd_mount_xuantiezhongjian:AvatarParamData;
      
      private var _apd_mount_guangmingzhang:AvatarParamData;
      
      private var _apd_mount_huimie:AvatarParamData;
      
      private var _apd_mount_zhumozhang:AvatarParamData;
      
      private var _apd_mount_chiyan:AvatarParamData;
      
      private var _apd_mount_fengtianji:AvatarParamData;
      
      private var _apd_mount_huolongdao:AvatarParamData;
      
      private var _apd_mount_tianzhu:AvatarParamData;
      
      private var _apd_mount_pangukaitianfu:AvatarParamData;
      
      private var _apd_mount_tiandijian:AvatarParamData;
      
      private var _apd_mount_hanqibingpo:AvatarParamData;
      
      private var _apd_mount_jianzunlongquanjian:AvatarParamData;
      
      private var _apd_mount_chuangshi:AvatarParamData;
      
      private var _apd_mount_suilieshifu:AvatarParamData;
      
      private var _apd_mount_moyuan:AvatarParamData;
      
      private var _apd_mount_fengbaodao:AvatarParamData;
      
      private var _apd_mount_fengyun:AvatarParamData;
      
      private var _apd_mount_shengdan2015:AvatarParamData;
      
      private var _apd_mount_fengsha:AvatarParamData;
      
      private var _apd_mount_fengyijian:AvatarParamData;
      
      private var _apd_mount_lexinji:AvatarParamData;
      
      private var _apd_mount_fengyingjian:AvatarParamData;
      
      private var _apd_mount_zhenfengjian:AvatarParamData;
      
      private var _apd_mount_fengyunjian:AvatarParamData;
      
      private var _apd_mount_bingfengjian:AvatarParamData;
      
      private var _apd_mount_hongleizhangu:AvatarParamData;
      
      private var _apd_mount_sandenggufo:AvatarParamData;
      
      private var _apd_mount_fonuji:AvatarParamData;
      
      private var _apd_mount_fengyinjian:AvatarParamData;
      
      private var _apd_mount_tianmajian:AvatarParamData;
      
      private var _apd_mount_wuhunjian:AvatarParamData;
      
      private var _apd_mount_zhentianjian:AvatarParamData;
      
      private var _apd_mount_tianxue:AvatarParamData;
      
      private var _apd_mount_xiongjijian:AvatarParamData;
      
      private var _apd_mount_wujinjian:AvatarParamData;
      
      private var _apd_mount_shuntianjian:AvatarParamData;
      
      private var _apd_mount_wangzheqicang:AvatarParamData;
      
      private var _apd_mount_bixuejian:AvatarParamData;
      
      private var _apd_mount_wuyijian:AvatarParamData;
      
      private var _apd_mount_shijianshenqi:AvatarParamData;
      
      private var _apd_mount_qingfengjian:AvatarParamData;
      
      private var _apd_mount_huolinjian:AvatarParamData;
      
      private var _apd_mount_zhuihunji:AvatarParamData;
      
      private var _apd_mount_biyudao:AvatarParamData;
      
      private var _apd_mount_wuwozhang:AvatarParamData;
      
      private var _apd_mount_yehuohonglian:AvatarParamData;
      
      private var _apd_mount_mingyuedao:AvatarParamData;
      
      private var _apd_mount_qingfengjian2:AvatarParamData;
      
      private var _apd_mount_zhizunjian:AvatarParamData;
      
      private var _apd_mount_baoleiji:AvatarParamData;
      
      private var _apd_mount_mingshengzhang:AvatarParamData;
      
      private var _apd_mount_zunshijian:AvatarParamData;
      
      private var _apd_mount_renzhezhang:AvatarParamData;
      
      private var _apd_mount_zhizhejian:AvatarParamData;
      
      private var _apd_mount_yangmingjian:AvatarParamData;
      
      private var _apd_mount_xiwangjian:AvatarParamData;
      
      private var _apd_mount_xuejingjian:AvatarParamData;
      
      private var _apd_mount_xuanbingjian:AvatarParamData;
      
      private var _apd_mount_pinganjian:AvatarParamData;
      
      private var _apd_mount_qinghuajian:AvatarParamData;
      
      private var _apd_mount_yuxujian:AvatarParamData;
      
      private var _apd_mount_yuqingshan:AvatarParamData;
      
      private var _apd_mount_huomodao:AvatarParamData;
      
      private var _apd_mount_yiheji:AvatarParamData;
      
      private var _apd_mount_erhejian:AvatarParamData;
      
      private var _apd_mount_sanhedao:AvatarParamData;
      
      private var _apd_mount_miehushan:AvatarParamData;
      
      private var _apd_mount_qingmingdao:AvatarParamData;
      
      private var _apd_mount_huoxingfu:AvatarParamData;
      
      private var _apd_mount_shenzao:AvatarParamData;
      
      private var _apd_mount_kaitiangong:AvatarParamData;
      
      private var _apd_mount_yanwenfenmo:AvatarParamData;
      
      private var _apd_mount_linglongzi:AvatarParamData;
      
      private var _apd_mount_shashenjian:AvatarParamData;
      
      private var _apd_mount_duanqingji:AvatarParamData;
      
      private var _apd_mount_nulong:AvatarParamData;
      
      private var _apd_mount_qinian:AvatarParamData;
      
      private var _apd_mount_zhuxian:AvatarParamData;
      
      private var _apd_mount_hanbing:AvatarParamData;
      
      private var _apd_mount_poshan:AvatarParamData;
      
      private var _apd_mount_haiyu:AvatarParamData;
      
      private var _apd_mount_tianmingdao:AvatarParamData;
      
      private var _apd_mount_jingtianyiji:AvatarParamData;
      
      private var _apd_mount_jingleijuedao:AvatarParamData;
      
      private var _apd_mount_yingxiongjian:AvatarParamData;
      
      private var _apd_mount_changshengjian:AvatarParamData;
      
      private var _apd_mount_guiyinggong:AvatarParamData;
      
      private var _apd_mount_jingleizhang:AvatarParamData;
      
      private var _apd_mount_hundun:AvatarParamData;
      
      private var _apd_mount_dinghun:AvatarParamData;
      
      private var _apd_mount_tiandiwuji:AvatarParamData;
      
      private var _apd_mount_huoxingjian:AvatarParamData;
      
      private var _apd_mount_wangzhefu:AvatarParamData;
      
      private var _apd_mount_duomingdao:AvatarParamData;
      
      private var _apd_mount_xiaoshen:AvatarParamData;
      
      private var _apd_mount_wanshi:AvatarParamData;
      
      private var _apd_mount_zhongqiu:AvatarParamData;
      
      private var _apd_mount_shenjian:AvatarParamData;
      
      private var _apd_mount_yuhuazhang:AvatarParamData;
      
      private var _apd_mount_baniangong:AvatarParamData;
      
      private var _apd_mount_banianjian:AvatarParamData;
      
      private var _apd_mount_banianji:AvatarParamData;
      
      private var _apd_mount_2019shendan:AvatarParamData;
      
      private var _apd_mount_2019gengzi:AvatarParamData;
      
      private var _apd_mount_2019feihua:AvatarParamData;
      
      private var _apd_mount_2019xiongwang:AvatarParamData;
      
      private var _apd_mount_2020xuehuan:AvatarParamData;
      
      private var _apd_mount_2020badao:AvatarParamData;
      
      private var _apd_mount_2020baojian01:AvatarParamData;
      
      private var _apd_mount_2020baojian02:AvatarParamData;
      
      private var _apd_mount_2020baojian03:AvatarParamData;
      
      private var _apd_mount_2020baojian04:AvatarParamData;
      
      private var _apd_mount_2020baojian05:AvatarParamData;
      
      private var _apd_mount_2020baojian06:AvatarParamData;
      
      private var _apd_mount_2020baojian07:AvatarParamData;
      
      private var _apd_mount_2020baojian08:AvatarParamData;
      
      private var _apd_mount_2020baojian09:AvatarParamData;
      
      private var _apd_mount_2020baojian10:AvatarParamData;
      
      private var _apd_mount_2020baojian11:AvatarParamData;
      
      private var _apd_mount_2020baojian12:AvatarParamData;
      
      private var _apd_mount_2020baojian13:AvatarParamData;
      
      private var _apd_mount_2020baojian14:AvatarParamData;
      
      private var _apd_mount_2020baojian15:AvatarParamData;
      
      private var _apd_mount_2020baojian16:AvatarParamData;
      
      private var _apd_mount_2020baojian17:AvatarParamData;
      
      private var _apd_mount_2020baojian18:AvatarParamData;
      
      private var _apd_mount_2020baojian19:AvatarParamData;
      
      private var _apd_mount_2020baojian20:AvatarParamData;
      
      private var _apd_mount_2020baojian21:AvatarParamData;
      
      private var _apd_mount_2020baojian22:AvatarParamData;
      
      private var _apd_mount_2020baojian23:AvatarParamData;
      
      private var _apd_mount_2020baojian24:AvatarParamData;
      
      private var _apd_mount_2020baojian25:AvatarParamData;
      
      private var _apd_mount_2020baojian26:AvatarParamData;
      
      private var _apd_mount_2020baojian27:AvatarParamData;
      
      private var _apd_mount_2020baojian28:AvatarParamData;
      
      private var _apd_mount_2020baojian29:AvatarParamData;
      
      private var _apd_mount_2020baojian30:AvatarParamData;
      
      private var _apd_mount_2020baojian31:AvatarParamData;
      
      private var _apd_mount_2020baojian32:AvatarParamData;
      
      private var _apd_mount_2020baojian33:AvatarParamData;
      
      private var _apd_mount_2020baojian34:AvatarParamData;
      
      private var _apd_mount_2020baojian35:AvatarParamData;
      
      private var _apd_mount_2020baojian36:AvatarParamData;
      
      private var _apd_mount_2020baojian37:AvatarParamData;
      
      private var _apd_mount_2020baojian38:AvatarParamData;
      
      private var _apd_mount_2020baojian39:AvatarParamData;
      
      private var _apd_mount_2020baojian40:AvatarParamData;
      
      private var _apd_mount_2020baojian41:AvatarParamData;
      
      private var _apd_mount_2020baojian42:AvatarParamData;
      
      private var _apd_mount_2020baojian43:AvatarParamData;
      
      private var _apd_mount_2020baojian44:AvatarParamData;
      
      private var _apd_mount_2020baojian45:AvatarParamData;
      
      private var _apd_mount_2020baojian46:AvatarParamData;
      
      private var _apd_mount_2020baojian47:AvatarParamData;
      
      private var _apd_mount_2020baojian48:AvatarParamData;
      
      private var _apd_mount_2020baojian49:AvatarParamData;
      
      private var _apd_mount_2020baojian50:AvatarParamData;
      
      private var _apd_mount_2020baojian51:AvatarParamData;
      
      private var _apd_mount_2020baojian52:AvatarParamData;
      
      private var _apd_mount_2020baojian53:AvatarParamData;
      
      private var _apd_mount_2020baojian54:AvatarParamData;
      
      private var _apd_mount_2020baojian55:AvatarParamData;
      
      private var _apd_mount_2020baojian56:AvatarParamData;
      
      private var _apd_mount_2020baojian57:AvatarParamData;
      
      private var _apd_mount_2020baojian58:AvatarParamData;
      
      private var _apd_mount_2020baojian59:AvatarParamData;
      
      private var _apd_mount_2020baojian60:AvatarParamData;
      
      private var _apd_mount_2020baojian61:AvatarParamData;
      
      private var _apd_mount_2020baojian62:AvatarParamData;
      
      private var _apd_mount_2020baojian63:AvatarParamData;
      
      private var _apd_mount_2020baojian64:AvatarParamData;
      
      private var _apd_mount_2020baojian65:AvatarParamData;
      
      private var _apd_mount_2020baojian66:AvatarParamData;
      
      private var _apd_mount_2020baojian67:AvatarParamData;
      
      private var _apd_mount_2020baojian68:AvatarParamData;
      
      private var _apd_mount_2020baojian69:AvatarParamData;
      
      private var _apd_mount_chengjiechangji:AvatarParamData;
      
      private var _apd_mount_tianxiejian:AvatarParamData;
      
      private var _apd_mount_junzijian:AvatarParamData;
      
      private var _apd_mount_wangzhejian:AvatarParamData;
      
      private var _apd_mount_tianjing:AvatarParamData;
      
      private var _apd_mount_bow:AvatarParamData;
      
      private var _apd_mount_zhenhun:AvatarParamData;
      
      private var _apd_mount:AvatarParamData;
      
      public var needChangeAvatarXY:Boolean = false;
      
      public function AvatarInfo()
      {
         super();
      }
      
      public function get apd_body() : AvatarParamData
      {
         return this._apd_body;
      }
      
      public function set apd_body(param1:AvatarParamData) : void
      {
         this._apd_body = param1;
         if(this._apd_body != null)
         {
            this._apd_body.id = SpeciaAvatarPartID.BODY;
            this._apd_body.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.BODY);
            this._apd_body.useType = 1;
            this._apd_body.clearSameType = true;
         }
      }
      
      public function get apd_weapon() : AvatarParamData
      {
         return this._apd_weapon;
      }
      
      public function set apd_weapon(param1:AvatarParamData) : void
      {
         this._apd_weapon = param1;
         if(this._apd_weapon != null)
         {
            this._apd_weapon.id = SpeciaAvatarPartID.WEAPON;
            this._apd_weapon.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_weapon.useType = 1;
            this._apd_weapon.clearSameType = true;
         }
      }
      
      public function set useIng_Weapon_id(param1:int) : void
      {
         this._useIng_Weapon_id = param1;
      }
      
      public function get useIng_Weapon_id() : int
      {
         return this._useIng_Weapon_id;
      }
      
      public function get apd_ylzr() : AvatarParamData
      {
         return this._apd_ylzr;
      }
      
      public function set apd_ylzr(param1:AvatarParamData) : void
      {
         this._apd_ylzr = param1;
         if(this._apd_ylzr != null)
         {
            this._apd_ylzr.id = SpeciaAvatarPartID.WEAPON;
            this._apd_ylzr.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_ylzr.useType = 1;
            this._apd_ylzr.clearSameType = true;
         }
      }
      
      public function get apd_xyj() : AvatarParamData
      {
         return this._apd_xyj;
      }
      
      public function set apd_xyj(param1:AvatarParamData) : void
      {
         this._apd_xyj = param1;
         if(this._apd_xyj != null)
         {
            this._apd_xyj.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xyj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xyj.useType = 1;
            this._apd_xyj.clearSameType = true;
         }
      }
      
      public function get apd_aojian() : AvatarParamData
      {
         return this._apd_aojian;
      }
      
      public function set apd_aojian(param1:AvatarParamData) : void
      {
         this._apd_aojian = param1;
         if(this._apd_aojian != null)
         {
            this._apd_aojian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_aojian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_aojian.useType = 1;
            this._apd_aojian.clearSameType = true;
         }
      }
      
      public function get apd_pj() : AvatarParamData
      {
         return this._apd_pj;
      }
      
      public function set apd_pj(param1:AvatarParamData) : void
      {
         this._apd_pj = param1;
         if(this._apd_pj != null)
         {
            this._apd_pj.id = SpeciaAvatarPartID.WEAPON;
            this._apd_pj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_pj.useType = 1;
            this._apd_pj.clearSameType = true;
         }
      }
      
      public function get apd_xtzj() : AvatarParamData
      {
         return this._apd_xtzj;
      }
      
      public function set apd_xtzj(param1:AvatarParamData) : void
      {
         this._apd_xtzj = param1;
         if(this._apd_xtzj != null)
         {
            this._apd_xtzj.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xtzj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xtzj.useType = 1;
            this._apd_xtzj.clearSameType = true;
         }
      }
      
      public function get apd_xingtian() : AvatarParamData
      {
         return this._apd_xingtian;
      }
      
      public function set apd_xingtian(param1:AvatarParamData) : void
      {
         this._apd_xingtian = param1;
         if(this._apd_xingtian != null)
         {
            this._apd_xingtian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xingtian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xingtian.useType = 1;
            this._apd_xingtian.clearSameType = true;
         }
      }
      
      public function get apd_zilinghuanyueji() : AvatarParamData
      {
         return this._apd_zilinghuanyueji;
      }
      
      public function set apd_zilinghuanyueji(param1:AvatarParamData) : void
      {
         this._apd_zilinghuanyueji = param1;
         if(this._apd_zilinghuanyueji != null)
         {
            this._apd_zilinghuanyueji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_zilinghuanyueji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_zilinghuanyueji.useType = 1;
            this._apd_zilinghuanyueji.clearSameType = true;
         }
      }
      
      public function get apd_wuyingjian() : AvatarParamData
      {
         return this._apd_wuyingjian;
      }
      
      public function set apd_wuyingjian(param1:AvatarParamData) : void
      {
         this._apd_wuyingjian = param1;
         if(this._apd_wuyingjian != null)
         {
            this._apd_wuyingjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_wuyingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_wuyingjian.useType = 1;
            this._apd_wuyingjian.clearSameType = true;
         }
      }
      
      public function get apd_huoyun() : AvatarParamData
      {
         return this._apd_huoyun;
      }
      
      public function set apd_huoyun(param1:AvatarParamData) : void
      {
         this._apd_huoyun = param1;
         if(this._apd_huoyun != null)
         {
            this._apd_huoyun.id = SpeciaAvatarPartID.WEAPON;
            this._apd_huoyun.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_huoyun.useType = 1;
            this._apd_huoyun.clearSameType = true;
         }
      }
      
      public function get apd_guxing() : AvatarParamData
      {
         return this._apd_guxing;
      }
      
      public function set apd_guxing(param1:AvatarParamData) : void
      {
         this._apd_guxing = param1;
         if(this._apd_guxing != null)
         {
            this._apd_guxing.id = SpeciaAvatarPartID.WEAPON;
            this._apd_guxing.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_guxing.useType = 1;
            this._apd_guxing.clearSameType = true;
         }
      }
      
      public function get apd_jixiang() : AvatarParamData
      {
         return this._apd_jixiang;
      }
      
      public function set apd_jixiang(param1:AvatarParamData) : void
      {
         this._apd_jixiang = param1;
         if(this._apd_jixiang != null)
         {
            this._apd_jixiang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_jixiang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_jixiang.useType = 1;
            this._apd_jixiang.clearSameType = true;
         }
      }
      
      public function get apd_jinwumingguangtang() : AvatarParamData
      {
         return this._apd_jinwumingguangtang;
      }
      
      public function set apd_jinwumingguangtang(param1:AvatarParamData) : void
      {
         this._apd_jinwumingguangtang = param1;
         if(this._apd_jinwumingguangtang != null)
         {
            this._apd_jinwumingguangtang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_jinwumingguangtang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_jinwumingguangtang.useType = 1;
            this._apd_jinwumingguangtang.clearSameType = true;
         }
      }
      
      public function get apd_lietianbawangji() : AvatarParamData
      {
         return this._apd_lietianbawangji;
      }
      
      public function set apd_lietianbawangji(param1:AvatarParamData) : void
      {
         this._apd_lietianbawangji = param1;
         if(this._apd_lietianbawangji != null)
         {
            this._apd_lietianbawangji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_lietianbawangji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_lietianbawangji.useType = 1;
            this._apd_lietianbawangji.clearSameType = true;
         }
      }
      
      public function get apd_dgb() : AvatarParamData
      {
         return this._apd_dgb;
      }
      
      public function set apd_dgb(param1:AvatarParamData) : void
      {
         this._apd_dgb = param1;
         if(this._apd_dgb != null)
         {
            this._apd_dgb.id = SpeciaAvatarPartID.WEAPON;
            this._apd_dgb.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_dgb.useType = 1;
            this._apd_dgb.clearSameType = true;
         }
      }
      
      public function get apd_xydj() : AvatarParamData
      {
         return this._apd_xydj;
      }
      
      public function set apd_xydj(param1:AvatarParamData) : void
      {
         this._apd_xydj = param1;
         if(this._apd_xydj != null)
         {
            this._apd_xydj.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xydj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xydj.useType = 1;
            this._apd_xydj.clearSameType = true;
         }
      }
      
      public function get apd_xytj() : AvatarParamData
      {
         return this._apd_xytj;
      }
      
      public function set apd_xytj(param1:AvatarParamData) : void
      {
         this._apd_xytj = param1;
         if(this._apd_xytj != null)
         {
            this._apd_xytj.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xytj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xytj.useType = 1;
            this._apd_xytj.clearSameType = true;
         }
      }
      
      public function get apd_xyrj() : AvatarParamData
      {
         return this._apd_xyrj;
      }
      
      public function set apd_xyrj(param1:AvatarParamData) : void
      {
         this._apd_xyrj = param1;
         if(this._apd_xyrj != null)
         {
            this._apd_xyrj.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xyrj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xyrj.useType = 1;
            this._apd_xyrj.clearSameType = true;
         }
      }
      
      public function get apd_gjmy() : AvatarParamData
      {
         return this._apd_gjmy;
      }
      
      public function set apd_gjmy(param1:AvatarParamData) : void
      {
         this._apd_gjmy = param1;
         if(this._apd_gjmy != null)
         {
            this._apd_gjmy.id = SpeciaAvatarPartID.WEAPON;
            this._apd_gjmy.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_gjmy.useType = 1;
            this._apd_gjmy.clearSameType = true;
         }
      }
      
      public function get apd_shenqi() : AvatarParamData
      {
         return this._apd_shenqi;
      }
      
      public function set apd_shenqi(param1:AvatarParamData) : void
      {
         this._apd_shenqi = param1;
         if(this._apd_shenqi != null)
         {
            this._apd_shenqi.id = SpeciaAvatarPartID.WEAPON;
            this._apd_shenqi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_shenqi.useType = 1;
            this._apd_shenqi.clearSameType = true;
         }
      }
      
      public function get apd_longyin() : AvatarParamData
      {
         return this._apd_longyin;
      }
      
      public function set apd_longyin(param1:AvatarParamData) : void
      {
         this._apd_longyin = param1;
         if(this._apd_longyin != null)
         {
            this._apd_longyin.id = SpeciaAvatarPartID.WEAPON;
            this._apd_longyin.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_longyin.useType = 1;
            this._apd_longyin.clearSameType = true;
         }
      }
      
      public function get apd_longya() : AvatarParamData
      {
         return this._apd_longya;
      }
      
      public function set apd_longya(param1:AvatarParamData) : void
      {
         this._apd_longya = param1;
         if(this._apd_longya != null)
         {
            this._apd_longya.id = SpeciaAvatarPartID.WEAPON;
            this._apd_longya.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_longya.useType = 1;
            this._apd_longya.clearSameType = true;
         }
      }
      
      public function get apd_longya1() : AvatarParamData
      {
         return this._apd_longya1;
      }
      
      public function set apd_longya1(param1:AvatarParamData) : void
      {
         this._apd_longya1 = param1;
         if(this._apd_longya1 != null)
         {
            this._apd_longya1.id = SpeciaAvatarPartID.WEAPON;
            this._apd_longya1.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_longya1.useType = 1;
            this._apd_longya1.clearSameType = true;
         }
      }
      
      public function get apd_potianren() : AvatarParamData
      {
         return this._apd_potianren;
      }
      
      public function set apd_potianren(param1:AvatarParamData) : void
      {
         this._apd_potianren = param1;
         if(this._apd_potianren != null)
         {
            this._apd_potianren.id = SpeciaAvatarPartID.WEAPON;
            this._apd_potianren.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_potianren.useType = 1;
            this._apd_potianren.clearSameType = true;
         }
      }
      
      public function get apd_tianshang() : AvatarParamData
      {
         return this._apd_tianshang;
      }
      
      public function set apd_tianshang(param1:AvatarParamData) : void
      {
         this._apd_tianshang = param1;
         if(this._apd_tianshang != null)
         {
            this._apd_tianshang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_tianshang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_tianshang.useType = 1;
            this._apd_tianshang.clearSameType = true;
         }
      }
      
      public function get apd_liekong() : AvatarParamData
      {
         return this._apd_liekong;
      }
      
      public function set apd_liekong(param1:AvatarParamData) : void
      {
         this._apd_liekong = param1;
         if(this._apd_liekong != null)
         {
            this._apd_liekong.id = SpeciaAvatarPartID.WEAPON;
            this._apd_liekong.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_liekong.useType = 1;
            this._apd_liekong.clearSameType = true;
         }
      }
      
      public function get apd_quanshen() : AvatarParamData
      {
         return this._apd_quanshen;
      }
      
      public function set apd_quanshen(param1:AvatarParamData) : void
      {
         this._apd_quanshen = param1;
         if(this._apd_quanshen != null)
         {
            this._apd_quanshen.id = SpeciaAvatarPartID.WEAPON;
            this._apd_quanshen.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_quanshen.useType = 1;
            this._apd_quanshen.clearSameType = true;
         }
      }
      
      public function get apd_pangu() : AvatarParamData
      {
         return this._apd_pangu;
      }
      
      public function set apd_pangu(param1:AvatarParamData) : void
      {
         this._apd_pangu = param1;
         if(this._apd_pangu != null)
         {
            this._apd_pangu.id = SpeciaAvatarPartID.WEAPON;
            this._apd_pangu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_pangu.useType = 1;
            this._apd_pangu.clearSameType = true;
         }
      }
      
      public function get apd_xueyindao() : AvatarParamData
      {
         return this._apd_xueyindao;
      }
      
      public function set apd_xueyindao(param1:AvatarParamData) : void
      {
         this._apd_xueyindao = param1;
         if(this._apd_xueyindao != null)
         {
            this._apd_xueyindao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xueyindao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xueyindao.useType = 1;
            this._apd_xueyindao.clearSameType = true;
         }
      }
      
      public function get apd_yanyuedao() : AvatarParamData
      {
         return this._apd_yanyuedao;
      }
      
      public function set apd_yanyuedao(param1:AvatarParamData) : void
      {
         this._apd_yanyuedao = param1;
         if(this._apd_yanyuedao != null)
         {
            this._apd_yanyuedao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_yanyuedao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_yanyuedao.useType = 1;
            this._apd_yanyuedao.clearSameType = true;
         }
      }
      
      public function get apd_huimie() : AvatarParamData
      {
         return this._apd_huimie;
      }
      
      public function set apd_huimie(param1:AvatarParamData) : void
      {
         this._apd_huimie = param1;
         if(this._apd_huimie != null)
         {
            this._apd_huimie.id = SpeciaAvatarPartID.WEAPON;
            this._apd_huimie.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_huimie.useType = 1;
            this._apd_huimie.clearSameType = true;
         }
      }
      
      public function get apd_zhumozhang() : AvatarParamData
      {
         return this._apd_zhumozhang;
      }
      
      public function set apd_zhumozhang(param1:AvatarParamData) : void
      {
         this._apd_zhumozhang = param1;
         if(this._apd_zhumozhang != null)
         {
            this._apd_zhumozhang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_zhumozhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_zhumozhang.useType = 1;
            this._apd_zhumozhang.clearSameType = true;
         }
      }
      
      public function get apd_chiyan() : AvatarParamData
      {
         return this._apd_chiyan;
      }
      
      public function set apd_chiyan(param1:AvatarParamData) : void
      {
         this._apd_chiyan = param1;
         if(this._apd_chiyan != null)
         {
            this._apd_chiyan.id = SpeciaAvatarPartID.WEAPON;
            this._apd_chiyan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_chiyan.useType = 1;
            this._apd_chiyan.clearSameType = true;
         }
      }
      
      public function get apd_fengtianji() : AvatarParamData
      {
         return this._apd_fengtianji;
      }
      
      public function set apd_fengtianji(param1:AvatarParamData) : void
      {
         this._apd_fengtianji = param1;
         if(this._apd_fengtianji != null)
         {
            this._apd_fengtianji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_fengtianji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_fengtianji.useType = 1;
            this._apd_fengtianji.clearSameType = true;
         }
      }
      
      public function get apd_tianjing() : AvatarParamData
      {
         return this._apd_tianjing;
      }
      
      public function set apd_tianjing(param1:AvatarParamData) : void
      {
         this._apd_tianjing = param1;
         if(this._apd_tianjing != null)
         {
            this._apd_tianjing.id = SpeciaAvatarPartID.WEAPON;
            this._apd_tianjing.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_tianjing.useType = 1;
            this._apd_tianjing.clearSameType = true;
         }
      }
      
      public function get apd_huolongdao() : AvatarParamData
      {
         return this._apd_huolongdao;
      }
      
      public function set apd_huolongdao(param1:AvatarParamData) : void
      {
         this._apd_huolongdao = param1;
         if(this._apd_huolongdao != null)
         {
            this._apd_huolongdao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_huolongdao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_huolongdao.useType = 1;
            this._apd_huolongdao.clearSameType = true;
         }
      }
      
      public function get apd_tianzhu() : AvatarParamData
      {
         return this._apd_tianzhu;
      }
      
      public function set apd_tianzhu(param1:AvatarParamData) : void
      {
         this._apd_tianzhu = param1;
         if(this._apd_tianzhu != null)
         {
            this._apd_tianzhu.id = SpeciaAvatarPartID.WEAPON;
            this._apd_tianzhu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_tianzhu.useType = 1;
            this._apd_tianzhu.clearSameType = true;
         }
      }
      
      public function get apd_pangukaitianfu() : AvatarParamData
      {
         return this._apd_pangukaitianfu;
      }
      
      public function set apd_pangukaitianfu(param1:AvatarParamData) : void
      {
         this._apd_pangukaitianfu = param1;
         if(this._apd_pangukaitianfu != null)
         {
            this._apd_pangukaitianfu.id = SpeciaAvatarPartID.WEAPON;
            this._apd_pangukaitianfu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_pangukaitianfu.useType = 1;
            this._apd_pangukaitianfu.clearSameType = true;
         }
      }
      
      public function get apd_tiandijian() : AvatarParamData
      {
         return this._apd_tiandijian;
      }
      
      public function set apd_tiandijian(param1:AvatarParamData) : void
      {
         this._apd_tiandijian = param1;
         if(this._apd_tiandijian != null)
         {
            this._apd_tiandijian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_tiandijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_tiandijian.useType = 1;
            this._apd_tiandijian.clearSameType = true;
         }
      }
      
      public function get apd_hanqibingpo() : AvatarParamData
      {
         return this._apd_hanqibingpo;
      }
      
      public function set apd_hanqibingpo(param1:AvatarParamData) : void
      {
         this._apd_hanqibingpo = param1;
         if(this._apd_hanqibingpo != null)
         {
            this._apd_hanqibingpo.id = SpeciaAvatarPartID.WEAPON;
            this._apd_hanqibingpo.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_hanqibingpo.useType = 1;
            this._apd_hanqibingpo.clearSameType = true;
         }
      }
      
      public function get apd_jianzunlongquanjian() : AvatarParamData
      {
         return this._apd_jianzunlongquanjian;
      }
      
      public function set apd_jianzunlongquanjian(param1:AvatarParamData) : void
      {
         this._apd_jianzunlongquanjian = param1;
         if(this._apd_jianzunlongquanjian != null)
         {
            this._apd_jianzunlongquanjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_jianzunlongquanjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_jianzunlongquanjian.useType = 1;
            this._apd_jianzunlongquanjian.clearSameType = true;
         }
      }
      
      public function get apd_chuangshi() : AvatarParamData
      {
         return this._apd_chuangshi;
      }
      
      public function set apd_chuangshi(param1:AvatarParamData) : void
      {
         this._apd_chuangshi = param1;
         if(this._apd_chuangshi != null)
         {
            this._apd_chuangshi.id = SpeciaAvatarPartID.WEAPON;
            this._apd_chuangshi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_chuangshi.useType = 1;
            this._apd_chuangshi.clearSameType = true;
         }
      }
      
      public function get apd_suilieshifu() : AvatarParamData
      {
         return this._apd_suilieshifu;
      }
      
      public function set apd_suilieshifu(param1:AvatarParamData) : void
      {
         this._apd_suilieshifu = param1;
         if(this._apd_suilieshifu != null)
         {
            this._apd_suilieshifu.id = SpeciaAvatarPartID.WEAPON;
            this._apd_suilieshifu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_suilieshifu.useType = 1;
            this._apd_suilieshifu.clearSameType = true;
         }
      }
      
      public function get apd_moyuan() : AvatarParamData
      {
         return this._apd_moyuan;
      }
      
      public function set apd_moyuan(param1:AvatarParamData) : void
      {
         this._apd_moyuan = param1;
         if(this._apd_moyuan != null)
         {
            this._apd_moyuan.id = SpeciaAvatarPartID.WEAPON;
            this._apd_moyuan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_moyuan.useType = 1;
            this._apd_moyuan.clearSameType = true;
         }
      }
      
      public function get apd_fengbaodao() : AvatarParamData
      {
         return this._apd_fengbaodao;
      }
      
      public function set apd_fengbaodao(param1:AvatarParamData) : void
      {
         this._apd_fengbaodao = param1;
         if(this._apd_fengbaodao != null)
         {
            this._apd_fengbaodao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_fengbaodao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_fengbaodao.useType = 1;
            this._apd_fengbaodao.clearSameType = true;
         }
      }
      
      public function get apd_fengyun() : AvatarParamData
      {
         return this._apd_fengyun;
      }
      
      public function set apd_fengyun(param1:AvatarParamData) : void
      {
         this._apd_fengyun = param1;
         if(this._apd_fengyun != null)
         {
            this._apd_fengyun.id = SpeciaAvatarPartID.WEAPON;
            this._apd_fengyun.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_fengyun.useType = 1;
            this._apd_fengyun.clearSameType = true;
         }
      }
      
      public function get apd_shengdan2015() : AvatarParamData
      {
         return this._apd_shengdan2015;
      }
      
      public function set apd_shengdan2015(param1:AvatarParamData) : void
      {
         this._apd_shengdan2015 = param1;
         if(this._apd_shengdan2015 != null)
         {
            this._apd_shengdan2015.id = SpeciaAvatarPartID.WEAPON;
            this._apd_shengdan2015.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_shengdan2015.useType = 1;
            this._apd_shengdan2015.clearSameType = true;
         }
      }
      
      public function get apd_fengsha() : AvatarParamData
      {
         return this._apd_fengsha;
      }
      
      public function set apd_fengsha(param1:AvatarParamData) : void
      {
         this._apd_fengsha = param1;
         if(this._apd_fengsha != null)
         {
            this._apd_fengsha.id = SpeciaAvatarPartID.WEAPON;
            this._apd_fengsha.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_fengsha.useType = 1;
            this._apd_fengsha.clearSameType = true;
         }
      }
      
      public function get apd_fengyijian() : AvatarParamData
      {
         return this._apd_fengyijian;
      }
      
      public function set apd_fengyijian(param1:AvatarParamData) : void
      {
         this._apd_fengyijian = param1;
         if(this._apd_fengyijian != null)
         {
            this._apd_fengyijian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_fengyijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_fengyijian.useType = 1;
            this._apd_fengyijian.clearSameType = true;
         }
      }
      
      public function get apd_lexinji() : AvatarParamData
      {
         return this._apd_lexinji;
      }
      
      public function set apd_lexinji(param1:AvatarParamData) : void
      {
         this._apd_lexinji = param1;
         if(this._apd_lexinji != null)
         {
            this._apd_lexinji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_lexinji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_lexinji.useType = 1;
            this._apd_lexinji.clearSameType = true;
         }
      }
      
      public function get apd_fengyingjian() : AvatarParamData
      {
         return this._apd_fengyingjian;
      }
      
      public function set apd_fengyingjian(param1:AvatarParamData) : void
      {
         this._apd_fengyingjian = param1;
         if(this._apd_fengyingjian != null)
         {
            this._apd_fengyingjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_fengyingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_fengyingjian.useType = 1;
            this._apd_fengyingjian.clearSameType = true;
         }
      }
      
      public function get apd_zhenfengjian() : AvatarParamData
      {
         return this._apd_zhenfengjian;
      }
      
      public function set apd_zhenfengjian(param1:AvatarParamData) : void
      {
         this._apd_zhenfengjian = param1;
         if(this._apd_zhenfengjian != null)
         {
            this._apd_zhenfengjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_zhenfengjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_zhenfengjian.useType = 1;
            this._apd_zhenfengjian.clearSameType = true;
         }
      }
      
      public function get apd_fengyunjian() : AvatarParamData
      {
         return this._apd_fengyunjian;
      }
      
      public function set apd_fengyunjian(param1:AvatarParamData) : void
      {
         this._apd_fengyunjian = param1;
         if(this._apd_fengyunjian != null)
         {
            this._apd_fengyunjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_fengyunjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_fengyunjian.useType = 1;
            this._apd_fengyunjian.clearSameType = true;
         }
      }
      
      public function get apd_bingfengjian() : AvatarParamData
      {
         return this._apd_bingfengjian;
      }
      
      public function set apd_bingfengjian(param1:AvatarParamData) : void
      {
         this._apd_bingfengjian = param1;
         if(this._apd_bingfengjian != null)
         {
            this._apd_bingfengjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_bingfengjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_bingfengjian.useType = 1;
            this._apd_bingfengjian.clearSameType = true;
         }
      }
      
      public function get apd_hongleizhangu() : AvatarParamData
      {
         return this._apd_hongleizhangu;
      }
      
      public function set apd_hongleizhangu(param1:AvatarParamData) : void
      {
         this._apd_hongleizhangu = param1;
         if(this._apd_hongleizhangu != null)
         {
            this._apd_hongleizhangu.id = SpeciaAvatarPartID.WEAPON;
            this._apd_hongleizhangu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_hongleizhangu.useType = 1;
            this._apd_hongleizhangu.clearSameType = true;
         }
      }
      
      public function get apd_sandenggufo() : AvatarParamData
      {
         return this._apd_sandenggufo;
      }
      
      public function set apd_sandenggufo(param1:AvatarParamData) : void
      {
         this._apd_sandenggufo = param1;
         if(this._apd_sandenggufo != null)
         {
            this._apd_sandenggufo.id = SpeciaAvatarPartID.WEAPON;
            this._apd_sandenggufo.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_sandenggufo.useType = 1;
            this._apd_sandenggufo.clearSameType = true;
         }
      }
      
      public function get apd_fonuji() : AvatarParamData
      {
         return this._apd_fonuji;
      }
      
      public function set apd_fonuji(param1:AvatarParamData) : void
      {
         this._apd_fonuji = param1;
         if(this._apd_fonuji != null)
         {
            this._apd_fonuji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_fonuji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_fonuji.useType = 1;
            this._apd_fonuji.clearSameType = true;
         }
      }
      
      public function get apd_fengyinjian() : AvatarParamData
      {
         return this._apd_fengyinjian;
      }
      
      public function set apd_fengyinjian(param1:AvatarParamData) : void
      {
         this._apd_fengyinjian = param1;
         if(this._apd_fengyinjian != null)
         {
            this._apd_fengyinjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_fengyinjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_fengyinjian.useType = 1;
            this._apd_fengyinjian.clearSameType = true;
         }
      }
      
      public function get apd_tianmajian() : AvatarParamData
      {
         return this._apd_tianmajian;
      }
      
      public function set apd_tianmajian(param1:AvatarParamData) : void
      {
         this._apd_tianmajian = param1;
         if(this._apd_tianmajian != null)
         {
            this._apd_tianmajian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_tianmajian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_tianmajian.useType = 1;
            this._apd_tianmajian.clearSameType = true;
         }
      }
      
      public function get apd_wuhunjian() : AvatarParamData
      {
         return this._apd_wuhunjian;
      }
      
      public function set apd_wuhunjian(param1:AvatarParamData) : void
      {
         this._apd_wuhunjian = param1;
         if(this._apd_wuhunjian != null)
         {
            this._apd_wuhunjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_wuhunjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_wuhunjian.useType = 1;
            this._apd_wuhunjian.clearSameType = true;
         }
      }
      
      public function get apd_zhentianjian() : AvatarParamData
      {
         return this._apd_zhentianjian;
      }
      
      public function set apd_zhentianjian(param1:AvatarParamData) : void
      {
         this._apd_zhentianjian = param1;
         if(this._apd_zhentianjian != null)
         {
            this._apd_zhentianjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_zhentianjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_zhentianjian.useType = 1;
            this._apd_zhentianjian.clearSameType = true;
         }
      }
      
      public function get apd_tianxue() : AvatarParamData
      {
         return this._apd_tianxue;
      }
      
      public function set apd_tianxue(param1:AvatarParamData) : void
      {
         this._apd_tianxue = param1;
         if(this._apd_tianxue != null)
         {
            this._apd_tianxue.id = SpeciaAvatarPartID.WEAPON;
            this._apd_tianxue.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_tianxue.useType = 1;
            this._apd_tianxue.clearSameType = true;
         }
      }
      
      public function get apd_xiongjijian() : AvatarParamData
      {
         return this._apd_xiongjijian;
      }
      
      public function set apd_xiongjijian(param1:AvatarParamData) : void
      {
         this._apd_xiongjijian = param1;
         if(this._apd_xiongjijian != null)
         {
            this._apd_xiongjijian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xiongjijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xiongjijian.useType = 1;
            this._apd_xiongjijian.clearSameType = true;
         }
      }
      
      public function get apd_wujinjian() : AvatarParamData
      {
         return this._apd_wujinjian;
      }
      
      public function set apd_wujinjian(param1:AvatarParamData) : void
      {
         this._apd_wujinjian = param1;
         if(this._apd_wujinjian != null)
         {
            this._apd_wujinjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_wujinjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_wujinjian.useType = 1;
            this._apd_wujinjian.clearSameType = true;
         }
      }
      
      public function get apd_shuntianjian() : AvatarParamData
      {
         return this._apd_shuntianjian;
      }
      
      public function set apd_shuntianjian(param1:AvatarParamData) : void
      {
         this._apd_shuntianjian = param1;
         if(this._apd_shuntianjian != null)
         {
            this._apd_shuntianjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_shuntianjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_shuntianjian.useType = 1;
            this._apd_shuntianjian.clearSameType = true;
         }
      }
      
      public function get apd_wangzheqicang() : AvatarParamData
      {
         return this._apd_wangzheqicang;
      }
      
      public function set apd_wangzheqicang(param1:AvatarParamData) : void
      {
         this._apd_wangzheqicang = param1;
         if(this._apd_wangzheqicang != null)
         {
            this._apd_wangzheqicang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_wangzheqicang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_wangzheqicang.useType = 1;
            this._apd_wangzheqicang.clearSameType = true;
         }
      }
      
      public function get apd_bixuejian() : AvatarParamData
      {
         return this._apd_bixuejian;
      }
      
      public function set apd_bixuejian(param1:AvatarParamData) : void
      {
         this._apd_bixuejian = param1;
         if(this._apd_bixuejian != null)
         {
            this._apd_bixuejian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_bixuejian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_bixuejian.useType = 1;
            this._apd_bixuejian.clearSameType = true;
         }
      }
      
      public function get apd_wuyijian() : AvatarParamData
      {
         return this._apd_wuyijian;
      }
      
      public function set apd_wuyijian(param1:AvatarParamData) : void
      {
         this._apd_wuyijian = param1;
         if(this._apd_wuyijian != null)
         {
            this._apd_wuyijian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_wuyijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_wuyijian.useType = 1;
            this._apd_wuyijian.clearSameType = true;
         }
      }
      
      public function get apd_shijianshenqi() : AvatarParamData
      {
         return this._apd_shijianshenqi;
      }
      
      public function set apd_shijianshenqi(param1:AvatarParamData) : void
      {
         this._apd_shijianshenqi = param1;
         if(this._apd_shijianshenqi != null)
         {
            this._apd_shijianshenqi.id = SpeciaAvatarPartID.WEAPON;
            this._apd_shijianshenqi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_shijianshenqi.useType = 1;
            this._apd_shijianshenqi.clearSameType = true;
         }
      }
      
      public function get apd_qingfengjian() : AvatarParamData
      {
         return this._apd_qingfengjian;
      }
      
      public function set apd_qingfengjian(param1:AvatarParamData) : void
      {
         this._apd_qingfengjian = param1;
         if(this._apd_qingfengjian != null)
         {
            this._apd_qingfengjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_qingfengjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_qingfengjian.useType = 1;
            this._apd_qingfengjian.clearSameType = true;
         }
      }
      
      public function get apd_huolinjian() : AvatarParamData
      {
         return this._apd_huolinjian;
      }
      
      public function set apd_huolinjian(param1:AvatarParamData) : void
      {
         this._apd_huolinjian = param1;
         if(this._apd_huolinjian != null)
         {
            this._apd_huolinjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_huolinjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_huolinjian.useType = 1;
            this._apd_huolinjian.clearSameType = true;
         }
      }
      
      public function get apd_zhuihunji() : AvatarParamData
      {
         return this._apd_zhuihunji;
      }
      
      public function set apd_zhuihunji(param1:AvatarParamData) : void
      {
         this._apd_zhuihunji = param1;
         if(this._apd_zhuihunji != null)
         {
            this._apd_zhuihunji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_zhuihunji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_zhuihunji.useType = 1;
            this._apd_zhuihunji.clearSameType = true;
         }
      }
      
      public function get apd_biyudao() : AvatarParamData
      {
         return this._apd_biyudao;
      }
      
      public function set apd_biyudao(param1:AvatarParamData) : void
      {
         this._apd_biyudao = param1;
         if(this._apd_biyudao != null)
         {
            this._apd_biyudao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_biyudao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_biyudao.useType = 1;
            this._apd_biyudao.clearSameType = true;
         }
      }
      
      public function get apd_wuwozhang() : AvatarParamData
      {
         return this._apd_wuwozhang;
      }
      
      public function set apd_wuwozhang(param1:AvatarParamData) : void
      {
         this._apd_wuwozhang = param1;
         if(this._apd_wuwozhang != null)
         {
            this._apd_wuwozhang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_wuwozhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_wuwozhang.useType = 1;
            this._apd_wuwozhang.clearSameType = true;
         }
      }
      
      public function get apd_yehuohonglian() : AvatarParamData
      {
         return this._apd_yehuohonglian;
      }
      
      public function set apd_yehuohonglian(param1:AvatarParamData) : void
      {
         this._apd_yehuohonglian = param1;
         if(this._apd_yehuohonglian != null)
         {
            this._apd_yehuohonglian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_yehuohonglian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_yehuohonglian.useType = 1;
            this._apd_yehuohonglian.clearSameType = true;
         }
      }
      
      public function get apd_mingyuedao() : AvatarParamData
      {
         return this._apd_mingyuedao;
      }
      
      public function set apd_mingyuedao(param1:AvatarParamData) : void
      {
         this._apd_mingyuedao = param1;
         if(this._apd_mingyuedao != null)
         {
            this._apd_mingyuedao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_mingyuedao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mingyuedao.useType = 1;
            this._apd_mingyuedao.clearSameType = true;
         }
      }
      
      public function get apd_qingfengjian2() : AvatarParamData
      {
         return this._apd_qingfengjian2;
      }
      
      public function set apd_qingfengjian2(param1:AvatarParamData) : void
      {
         this._apd_qingfengjian2 = param1;
         if(this._apd_qingfengjian2 != null)
         {
            this._apd_qingfengjian2.id = SpeciaAvatarPartID.WEAPON;
            this._apd_qingfengjian2.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_qingfengjian2.useType = 1;
            this._apd_qingfengjian2.clearSameType = true;
         }
      }
      
      public function get apd_zhizunjian() : AvatarParamData
      {
         return this._apd_zhizunjian;
      }
      
      public function set apd_zhizunjian(param1:AvatarParamData) : void
      {
         this._apd_zhizunjian = param1;
         if(this._apd_zhizunjian != null)
         {
            this._apd_zhizunjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_zhizunjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_zhizunjian.useType = 1;
            this._apd_zhizunjian.clearSameType = true;
         }
      }
      
      public function get apd_baoleiji() : AvatarParamData
      {
         return this._apd_baoleiji;
      }
      
      public function set apd_baoleiji(param1:AvatarParamData) : void
      {
         this._apd_baoleiji = param1;
         if(this._apd_baoleiji != null)
         {
            this._apd_baoleiji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_baoleiji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_baoleiji.useType = 1;
            this._apd_baoleiji.clearSameType = true;
         }
      }
      
      public function get apd_mingshengzhang() : AvatarParamData
      {
         return this._apd_mingshengzhang;
      }
      
      public function set apd_mingshengzhang(param1:AvatarParamData) : void
      {
         this._apd_mingshengzhang = param1;
         if(this._apd_mingshengzhang != null)
         {
            this._apd_mingshengzhang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_mingshengzhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mingshengzhang.useType = 1;
            this._apd_mingshengzhang.clearSameType = true;
         }
      }
      
      public function get apd_zunshijian() : AvatarParamData
      {
         return this._apd_zunshijian;
      }
      
      public function set apd_zunshijian(param1:AvatarParamData) : void
      {
         this._apd_zunshijian = param1;
         if(this._apd_zunshijian != null)
         {
            this._apd_zunshijian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_zunshijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_zunshijian.useType = 1;
            this._apd_zunshijian.clearSameType = true;
         }
      }
      
      public function get apd_renzhezhang() : AvatarParamData
      {
         return this._apd_renzhezhang;
      }
      
      public function set apd_renzhezhang(param1:AvatarParamData) : void
      {
         this._apd_renzhezhang = param1;
         if(this._apd_renzhezhang != null)
         {
            this._apd_renzhezhang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_renzhezhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_renzhezhang.useType = 1;
            this._apd_renzhezhang.clearSameType = true;
         }
      }
      
      public function get apd_zhizhejian() : AvatarParamData
      {
         return this._apd_zhizhejian;
      }
      
      public function set apd_zhizhejian(param1:AvatarParamData) : void
      {
         this._apd_zhizhejian = param1;
         if(this._apd_zhizhejian != null)
         {
            this._apd_zhizhejian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_zhizhejian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_zhizhejian.useType = 1;
            this._apd_zhizhejian.clearSameType = true;
         }
      }
      
      public function get apd_yangmingjian() : AvatarParamData
      {
         return this._apd_yangmingjian;
      }
      
      public function set apd_yangmingjian(param1:AvatarParamData) : void
      {
         this._apd_yangmingjian = param1;
         if(this._apd_yangmingjian != null)
         {
            this._apd_yangmingjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_yangmingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_yangmingjian.useType = 1;
            this._apd_yangmingjian.clearSameType = true;
         }
      }
      
      public function get apd_xiwangjian() : AvatarParamData
      {
         return this._apd_xiwangjian;
      }
      
      public function set apd_xiwangjian(param1:AvatarParamData) : void
      {
         this._apd_xiwangjian = param1;
         if(this._apd_xiwangjian != null)
         {
            this._apd_xiwangjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xiwangjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xiwangjian.useType = 1;
            this._apd_xiwangjian.clearSameType = true;
         }
      }
      
      public function get apd_xuejingjian() : AvatarParamData
      {
         return this._apd_xuejingjian;
      }
      
      public function set apd_xuejingjian(param1:AvatarParamData) : void
      {
         this._apd_xuejingjian = param1;
         if(this._apd_xuejingjian != null)
         {
            this._apd_xuejingjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xuejingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xuejingjian.useType = 1;
            this._apd_xuejingjian.clearSameType = true;
         }
      }
      
      public function get apd_xuanbingjian() : AvatarParamData
      {
         return this._apd_xuanbingjian;
      }
      
      public function set apd_xuanbingjian(param1:AvatarParamData) : void
      {
         this._apd_xuanbingjian = param1;
         if(this._apd_xuanbingjian != null)
         {
            this._apd_xuanbingjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xuanbingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xuanbingjian.useType = 1;
            this._apd_xuanbingjian.clearSameType = true;
         }
      }
      
      public function get apd_pinganjian() : AvatarParamData
      {
         return this._apd_pinganjian;
      }
      
      public function set apd_pinganjian(param1:AvatarParamData) : void
      {
         this._apd_pinganjian = param1;
         if(this._apd_pinganjian != null)
         {
            this._apd_pinganjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_pinganjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_pinganjian.useType = 1;
            this._apd_pinganjian.clearSameType = true;
         }
      }
      
      public function get apd_qinghuajian() : AvatarParamData
      {
         return this._apd_qinghuajian;
      }
      
      public function set apd_qinghuajian(param1:AvatarParamData) : void
      {
         this._apd_qinghuajian = param1;
         if(this._apd_qinghuajian != null)
         {
            this._apd_qinghuajian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_qinghuajian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_qinghuajian.useType = 1;
            this._apd_qinghuajian.clearSameType = true;
         }
      }
      
      public function get apd_yuxujian() : AvatarParamData
      {
         return this._apd_yuxujian;
      }
      
      public function set apd_yuxujian(param1:AvatarParamData) : void
      {
         this._apd_yuxujian = param1;
         if(this._apd_yuxujian != null)
         {
            this._apd_yuxujian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_yuxujian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_yuxujian.useType = 1;
            this._apd_yuxujian.clearSameType = true;
         }
      }
      
      public function get apd_yuqingshan() : AvatarParamData
      {
         return this._apd_yuqingshan;
      }
      
      public function set apd_yuqingshan(param1:AvatarParamData) : void
      {
         this._apd_yuqingshan = param1;
         if(this._apd_yuqingshan != null)
         {
            this._apd_yuqingshan.id = SpeciaAvatarPartID.WEAPON;
            this._apd_yuqingshan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_yuqingshan.useType = 1;
            this._apd_yuqingshan.clearSameType = true;
         }
      }
      
      public function get apd_huomodao() : AvatarParamData
      {
         return this._apd_huomodao;
      }
      
      public function set apd_huomodao(param1:AvatarParamData) : void
      {
         this._apd_huomodao = param1;
         if(this._apd_huomodao != null)
         {
            this._apd_huomodao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_huomodao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_huomodao.useType = 1;
            this._apd_huomodao.clearSameType = true;
         }
      }
      
      public function get apd_yiheji() : AvatarParamData
      {
         return this._apd_yiheji;
      }
      
      public function set apd_yiheji(param1:AvatarParamData) : void
      {
         this._apd_yiheji = param1;
         if(this._apd_yiheji != null)
         {
            this._apd_yiheji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_yiheji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_yiheji.useType = 1;
            this._apd_yiheji.clearSameType = true;
         }
      }
      
      public function get apd_erhejian() : AvatarParamData
      {
         return this._apd_erhejian;
      }
      
      public function set apd_erhejian(param1:AvatarParamData) : void
      {
         this._apd_erhejian = param1;
         if(this._apd_erhejian != null)
         {
            this._apd_erhejian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_erhejian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_erhejian.useType = 1;
            this._apd_erhejian.clearSameType = true;
         }
      }
      
      public function get apd_sanhedao() : AvatarParamData
      {
         return this._apd_sanhedao;
      }
      
      public function set apd_sanhedao(param1:AvatarParamData) : void
      {
         this._apd_sanhedao = param1;
         if(this._apd_sanhedao != null)
         {
            this._apd_sanhedao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_sanhedao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_sanhedao.useType = 1;
            this._apd_sanhedao.clearSameType = true;
         }
      }
      
      public function get apd_miehushan() : AvatarParamData
      {
         return this._apd_miehushan;
      }
      
      public function set apd_miehushan(param1:AvatarParamData) : void
      {
         this._apd_miehushan = param1;
         if(this._apd_miehushan != null)
         {
            this._apd_miehushan.id = SpeciaAvatarPartID.WEAPON;
            this._apd_miehushan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_miehushan.useType = 1;
            this._apd_miehushan.clearSameType = true;
         }
      }
      
      public function get apd_qingmingdao() : AvatarParamData
      {
         return this._apd_qingmingdao;
      }
      
      public function set apd_qingmingdao(param1:AvatarParamData) : void
      {
         this._apd_qingmingdao = param1;
         if(this._apd_qingmingdao != null)
         {
            this._apd_qingmingdao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_qingmingdao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_qingmingdao.useType = 1;
            this._apd_qingmingdao.clearSameType = true;
         }
      }
      
      public function get apd_huoxingfu() : AvatarParamData
      {
         return this._apd_huoxingfu;
      }
      
      public function set apd_huoxingfu(param1:AvatarParamData) : void
      {
         this._apd_huoxingfu = param1;
         if(this._apd_huoxingfu != null)
         {
            this._apd_huoxingfu.id = SpeciaAvatarPartID.WEAPON;
            this._apd_huoxingfu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_huoxingfu.useType = 1;
            this._apd_huoxingfu.clearSameType = true;
         }
      }
      
      public function get apd_shenzao() : AvatarParamData
      {
         return this._apd_shenzao;
      }
      
      public function set apd_shenzao(param1:AvatarParamData) : void
      {
         this._apd_shenzao = param1;
         if(this._apd_shenzao != null)
         {
            this._apd_shenzao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_shenzao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_shenzao.useType = 1;
            this._apd_shenzao.clearSameType = true;
         }
      }
      
      public function get apd_kaitiangong() : AvatarParamData
      {
         return this._apd_kaitiangong;
      }
      
      public function set apd_kaitiangong(param1:AvatarParamData) : void
      {
         this._apd_kaitiangong = param1;
         if(this._apd_kaitiangong != null)
         {
            this._apd_kaitiangong.id = SpeciaAvatarPartID.WEAPON;
            this._apd_kaitiangong.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_kaitiangong.useType = 1;
            this._apd_kaitiangong.clearSameType = true;
         }
      }
      
      public function get apd_yanwenfenmo() : AvatarParamData
      {
         return this._apd_yanwenfenmo;
      }
      
      public function set apd_yanwenfenmo(param1:AvatarParamData) : void
      {
         this._apd_yanwenfenmo = param1;
         if(this._apd_yanwenfenmo != null)
         {
            this._apd_yanwenfenmo.id = SpeciaAvatarPartID.WEAPON;
            this._apd_yanwenfenmo.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_yanwenfenmo.useType = 1;
            this._apd_yanwenfenmo.clearSameType = true;
         }
      }
      
      public function get apd_linglongzi() : AvatarParamData
      {
         return this._apd_linglongzi;
      }
      
      public function set apd_linglongzi(param1:AvatarParamData) : void
      {
         this._apd_linglongzi = param1;
         if(this._apd_linglongzi != null)
         {
            this._apd_linglongzi.id = SpeciaAvatarPartID.WEAPON;
            this._apd_linglongzi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_linglongzi.useType = 1;
            this._apd_linglongzi.clearSameType = true;
         }
      }
      
      public function get apd_shashenjian() : AvatarParamData
      {
         return this._apd_shashenjian;
      }
      
      public function set apd_shashenjian(param1:AvatarParamData) : void
      {
         this._apd_shashenjian = param1;
         if(this._apd_shashenjian != null)
         {
            this._apd_shashenjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_shashenjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_shashenjian.useType = 1;
            this._apd_shashenjian.clearSameType = true;
         }
      }
      
      public function get apd_duanqingji() : AvatarParamData
      {
         return this._apd_duanqingji;
      }
      
      public function set apd_duanqingji(param1:AvatarParamData) : void
      {
         this._apd_duanqingji = param1;
         if(this._apd_duanqingji != null)
         {
            this._apd_duanqingji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_duanqingji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_duanqingji.useType = 1;
            this._apd_duanqingji.clearSameType = true;
         }
      }
      
      public function get apd_nulong() : AvatarParamData
      {
         return this._apd_nulong;
      }
      
      public function set apd_nulong(param1:AvatarParamData) : void
      {
         this._apd_nulong = param1;
         if(this._apd_nulong != null)
         {
            this._apd_nulong.id = SpeciaAvatarPartID.WEAPON;
            this._apd_nulong.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_nulong.useType = 1;
            this._apd_nulong.clearSameType = true;
         }
      }
      
      public function get apd_qinian() : AvatarParamData
      {
         return this._apd_qinian;
      }
      
      public function set apd_qinian(param1:AvatarParamData) : void
      {
         this._apd_qinian = param1;
         if(this._apd_qinian != null)
         {
            this._apd_qinian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_qinian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_qinian.useType = 1;
            this._apd_qinian.clearSameType = true;
         }
      }
      
      public function get apd_zhuxian() : AvatarParamData
      {
         return this._apd_zhuxian;
      }
      
      public function set apd_zhuxian(param1:AvatarParamData) : void
      {
         this._apd_zhuxian = param1;
         if(this._apd_zhuxian != null)
         {
            this._apd_zhuxian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_zhuxian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_zhuxian.useType = 1;
            this._apd_zhuxian.clearSameType = true;
         }
      }
      
      public function get apd_hanbing() : AvatarParamData
      {
         return this._apd_hanbing;
      }
      
      public function set apd_hanbing(param1:AvatarParamData) : void
      {
         this._apd_hanbing = param1;
         if(this._apd_hanbing != null)
         {
            this._apd_hanbing.id = SpeciaAvatarPartID.WEAPON;
            this._apd_hanbing.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_hanbing.useType = 1;
            this._apd_hanbing.clearSameType = true;
         }
      }
      
      public function get apd_poshan() : AvatarParamData
      {
         return this._apd_poshan;
      }
      
      public function set apd_poshan(param1:AvatarParamData) : void
      {
         this._apd_poshan = param1;
         if(this._apd_poshan != null)
         {
            this._apd_poshan.id = SpeciaAvatarPartID.WEAPON;
            this._apd_poshan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_poshan.useType = 1;
            this._apd_poshan.clearSameType = true;
         }
      }
      
      public function get apd_haiyu() : AvatarParamData
      {
         return this._apd_haiyu;
      }
      
      public function set apd_haiyu(param1:AvatarParamData) : void
      {
         this._apd_haiyu = param1;
         if(this._apd_haiyu != null)
         {
            this._apd_haiyu.id = SpeciaAvatarPartID.WEAPON;
            this._apd_haiyu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_haiyu.useType = 1;
            this._apd_haiyu.clearSameType = true;
         }
      }
      
      public function get apd_tianmingdao() : AvatarParamData
      {
         return this._apd_tianmingdao;
      }
      
      public function set apd_tianmingdao(param1:AvatarParamData) : void
      {
         this._apd_tianmingdao = param1;
         if(this._apd_tianmingdao != null)
         {
            this._apd_tianmingdao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_tianmingdao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_tianmingdao.useType = 1;
            this._apd_tianmingdao.clearSameType = true;
         }
      }
      
      public function get apd_jingtianyiji() : AvatarParamData
      {
         return this._apd_jingtianyiji;
      }
      
      public function set apd_jingtianyiji(param1:AvatarParamData) : void
      {
         this._apd_jingtianyiji = param1;
         if(this._apd_jingtianyiji != null)
         {
            this._apd_jingtianyiji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_jingtianyiji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_jingtianyiji.useType = 1;
            this._apd_jingtianyiji.clearSameType = true;
         }
      }
      
      public function get apd_jingleijuedao() : AvatarParamData
      {
         return this._apd_jingleijuedao;
      }
      
      public function set apd_jingleijuedao(param1:AvatarParamData) : void
      {
         this._apd_jingleijuedao = param1;
         if(this._apd_jingleijuedao != null)
         {
            this._apd_jingleijuedao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_jingleijuedao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_jingleijuedao.useType = 1;
            this._apd_jingleijuedao.clearSameType = true;
         }
      }
      
      public function get apd_yingxiongjian() : AvatarParamData
      {
         return this._apd_yingxiongjian;
      }
      
      public function set apd_yingxiongjian(param1:AvatarParamData) : void
      {
         this._apd_yingxiongjian = param1;
         if(this._apd_yingxiongjian != null)
         {
            this._apd_yingxiongjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_yingxiongjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_yingxiongjian.useType = 1;
            this._apd_yingxiongjian.clearSameType = true;
         }
      }
      
      public function get apd_changshengjian() : AvatarParamData
      {
         return this._apd_changshengjian;
      }
      
      public function set apd_changshengjian(param1:AvatarParamData) : void
      {
         this._apd_changshengjian = param1;
         if(this._apd_changshengjian != null)
         {
            this._apd_changshengjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_changshengjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_changshengjian.useType = 1;
            this._apd_changshengjian.clearSameType = true;
         }
      }
      
      public function get apd_guiyinggong() : AvatarParamData
      {
         return this._apd_guiyinggong;
      }
      
      public function set apd_guiyinggong(param1:AvatarParamData) : void
      {
         this._apd_guiyinggong = param1;
         if(this._apd_guiyinggong != null)
         {
            this._apd_guiyinggong.id = SpeciaAvatarPartID.WEAPON;
            this._apd_guiyinggong.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_guiyinggong.useType = 1;
            this._apd_guiyinggong.clearSameType = true;
         }
      }
      
      public function get apd_jingleizhang() : AvatarParamData
      {
         return this._apd_jingleizhang;
      }
      
      public function set apd_jingleizhang(param1:AvatarParamData) : void
      {
         this._apd_jingleizhang = param1;
         if(this._apd_jingleizhang != null)
         {
            this._apd_jingleizhang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_jingleizhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_jingleizhang.useType = 1;
            this._apd_jingleizhang.clearSameType = true;
         }
      }
      
      public function get apd_hundun() : AvatarParamData
      {
         return this._apd_hundun;
      }
      
      public function set apd_hundun(param1:AvatarParamData) : void
      {
         this._apd_hundun = param1;
         if(this._apd_hundun != null)
         {
            this._apd_hundun.id = SpeciaAvatarPartID.WEAPON;
            this._apd_hundun.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_hundun.useType = 1;
            this._apd_hundun.clearSameType = true;
         }
      }
      
      public function get apd_dinghun() : AvatarParamData
      {
         return this._apd_dinghun;
      }
      
      public function set apd_dinghun(param1:AvatarParamData) : void
      {
         this._apd_dinghun = param1;
         if(this._apd_dinghun != null)
         {
            this._apd_dinghun.id = SpeciaAvatarPartID.WEAPON;
            this._apd_dinghun.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_dinghun.useType = 1;
            this._apd_dinghun.clearSameType = true;
         }
      }
      
      public function get apd_tiandiwuji() : AvatarParamData
      {
         return this._apd_tiandiwuji;
      }
      
      public function set apd_tiandiwuji(param1:AvatarParamData) : void
      {
         this._apd_tiandiwuji = param1;
         if(this._apd_tiandiwuji != null)
         {
            this._apd_tiandiwuji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_tiandiwuji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_tiandiwuji.useType = 1;
            this._apd_tiandiwuji.clearSameType = true;
         }
      }
      
      public function get apd_huoxingjian() : AvatarParamData
      {
         return this._apd_huoxingjian;
      }
      
      public function set apd_huoxingjian(param1:AvatarParamData) : void
      {
         this._apd_huoxingjian = param1;
         if(this._apd_huoxingjian != null)
         {
            this._apd_huoxingjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_huoxingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_huoxingjian.useType = 1;
            this._apd_huoxingjian.clearSameType = true;
         }
      }
      
      public function get apd_wangzhefu() : AvatarParamData
      {
         return this._apd_wangzhefu;
      }
      
      public function set apd_wangzhefu(param1:AvatarParamData) : void
      {
         this._apd_wangzhefu = param1;
         if(this._apd_wangzhefu != null)
         {
            this._apd_wangzhefu.id = SpeciaAvatarPartID.WEAPON;
            this._apd_wangzhefu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_wangzhefu.useType = 1;
            this._apd_wangzhefu.clearSameType = true;
         }
      }
      
      public function get apd_duomingdao() : AvatarParamData
      {
         return this._apd_duomingdao;
      }
      
      public function set apd_duomingdao(param1:AvatarParamData) : void
      {
         this._apd_duomingdao = param1;
         if(this._apd_duomingdao != null)
         {
            this._apd_duomingdao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_duomingdao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_duomingdao.useType = 1;
            this._apd_duomingdao.clearSameType = true;
         }
      }
      
      public function get apd_xiaoshen() : AvatarParamData
      {
         return this._apd_xiaoshen;
      }
      
      public function set apd_xiaoshen(param1:AvatarParamData) : void
      {
         this._apd_xiaoshen = param1;
         if(this._apd_xiaoshen != null)
         {
            this._apd_xiaoshen.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xiaoshen.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xiaoshen.useType = 1;
            this._apd_xiaoshen.clearSameType = true;
         }
      }
      
      public function get apd_wanshi() : AvatarParamData
      {
         return this._apd_wanshi;
      }
      
      public function set apd_wanshi(param1:AvatarParamData) : void
      {
         this._apd_wanshi = param1;
         if(this._apd_wanshi != null)
         {
            this._apd_wanshi.id = SpeciaAvatarPartID.WEAPON;
            this._apd_wanshi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_wanshi.useType = 1;
            this._apd_wanshi.clearSameType = true;
         }
      }
      
      public function get apd_zhongqiu() : AvatarParamData
      {
         return this._apd_zhongqiu;
      }
      
      public function set apd_zhongqiu(param1:AvatarParamData) : void
      {
         this._apd_zhongqiu = param1;
         if(this._apd_zhongqiu != null)
         {
            this._apd_zhongqiu.id = SpeciaAvatarPartID.WEAPON;
            this._apd_zhongqiu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_zhongqiu.useType = 1;
            this._apd_zhongqiu.clearSameType = true;
         }
      }
      
      public function get apd_shenjian() : AvatarParamData
      {
         return this._apd_shenjian;
      }
      
      public function set apd_shenjian(param1:AvatarParamData) : void
      {
         this._apd_shenjian = param1;
         if(this._apd_shenjian != null)
         {
            this._apd_shenjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_shenjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_shenjian.useType = 1;
            this._apd_shenjian.clearSameType = true;
         }
      }
      
      public function get apd_yuhuazhang() : AvatarParamData
      {
         return this._apd_yuhuazhang;
      }
      
      public function set apd_yuhuazhang(param1:AvatarParamData) : void
      {
         this._apd_yuhuazhang = param1;
         if(this._apd_yuhuazhang != null)
         {
            this._apd_yuhuazhang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_yuhuazhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_yuhuazhang.useType = 1;
            this._apd_yuhuazhang.clearSameType = true;
         }
      }
      
      public function get apd_baniangong() : AvatarParamData
      {
         return this._apd_baniangong;
      }
      
      public function set apd_baniangong(param1:AvatarParamData) : void
      {
         this._apd_baniangong = param1;
         if(this._apd_baniangong != null)
         {
            this._apd_baniangong.id = SpeciaAvatarPartID.WEAPON;
            this._apd_baniangong.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_baniangong.useType = 1;
            this._apd_baniangong.clearSameType = true;
         }
      }
      
      public function get apd_banianjian() : AvatarParamData
      {
         return this._apd_banianjian;
      }
      
      public function set apd_banianjian(param1:AvatarParamData) : void
      {
         this._apd_banianjian = param1;
         if(this._apd_banianjian != null)
         {
            this._apd_banianjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_banianjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_banianjian.useType = 1;
            this._apd_banianjian.clearSameType = true;
         }
      }
      
      public function get apd_banianji() : AvatarParamData
      {
         return this._apd_banianji;
      }
      
      public function set apd_banianji(param1:AvatarParamData) : void
      {
         this._apd_banianji = param1;
         if(this._apd_banianji != null)
         {
            this._apd_banianji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_banianji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_banianji.useType = 1;
            this._apd_banianji.clearSameType = true;
         }
      }
      
      public function get apd_2019shendan() : AvatarParamData
      {
         return this._apd_2019shendan;
      }
      
      public function set apd_2019shendan(param1:AvatarParamData) : void
      {
         this._apd_2019shendan = param1;
         if(this._apd_2019shendan != null)
         {
            this._apd_2019shendan.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2019shendan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2019shendan.useType = 1;
            this._apd_2019shendan.clearSameType = true;
         }
      }
      
      public function get apd_2019gengzi() : AvatarParamData
      {
         return this._apd_2019gengzi;
      }
      
      public function set apd_2019gengzi(param1:AvatarParamData) : void
      {
         this._apd_2019gengzi = param1;
         if(this._apd_2019gengzi != null)
         {
            this._apd_2019gengzi.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2019gengzi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2019gengzi.useType = 1;
            this._apd_2019gengzi.clearSameType = true;
         }
      }
      
      public function get apd_2019feihua() : AvatarParamData
      {
         return this._apd_2019feihua;
      }
      
      public function set apd_2019feihua(param1:AvatarParamData) : void
      {
         this._apd_2019feihua = param1;
         if(this._apd_2019feihua != null)
         {
            this._apd_2019feihua.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2019feihua.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2019feihua.useType = 1;
            this._apd_2019feihua.clearSameType = true;
         }
      }
      
      public function get apd_2019xiongwang() : AvatarParamData
      {
         return this._apd_2019xiongwang;
      }
      
      public function set apd_2019xiongwang(param1:AvatarParamData) : void
      {
         this._apd_2019xiongwang = param1;
         if(this._apd_2019xiongwang != null)
         {
            this._apd_2019xiongwang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2019xiongwang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2019xiongwang.useType = 1;
            this._apd_2019xiongwang.clearSameType = true;
         }
      }
      
      public function get apd_2020xuehuan() : AvatarParamData
      {
         return this._apd_2020xuehuan;
      }
      
      public function set apd_2020xuehuan(param1:AvatarParamData) : void
      {
         this._apd_2020xuehuan = param1;
         if(this._apd_2020xuehuan != null)
         {
            this._apd_2020xuehuan.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020xuehuan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020xuehuan.useType = 1;
            this._apd_2020xuehuan.clearSameType = true;
         }
      }
      
      public function get apd_2020badao() : AvatarParamData
      {
         return this._apd_2020badao;
      }
      
      public function set apd_2020badao(param1:AvatarParamData) : void
      {
         this._apd_2020badao = param1;
         if(this._apd_2020badao != null)
         {
            this._apd_2020badao.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020badao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020badao.useType = 1;
            this._apd_2020badao.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian01() : AvatarParamData
      {
         return this._apd_2020baojian01;
      }
      
      public function set apd_2020baojian01(param1:AvatarParamData) : void
      {
         this._apd_2020baojian01 = param1;
         if(this._apd_2020baojian01 != null)
         {
            this._apd_2020baojian01.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian01.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian01.useType = 1;
            this._apd_2020baojian01.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian02() : AvatarParamData
      {
         return this._apd_2020baojian02;
      }
      
      public function set apd_2020baojian02(param1:AvatarParamData) : void
      {
         this._apd_2020baojian02 = param1;
         if(this._apd_2020baojian02 != null)
         {
            this._apd_2020baojian02.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian02.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian02.useType = 1;
            this._apd_2020baojian02.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian03() : AvatarParamData
      {
         return this._apd_2020baojian03;
      }
      
      public function set apd_2020baojian03(param1:AvatarParamData) : void
      {
         this._apd_2020baojian03 = param1;
         if(this._apd_2020baojian03 != null)
         {
            this._apd_2020baojian03.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian03.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian03.useType = 1;
            this._apd_2020baojian03.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian04() : AvatarParamData
      {
         return this._apd_2020baojian04;
      }
      
      public function set apd_2020baojian04(param1:AvatarParamData) : void
      {
         this._apd_2020baojian04 = param1;
         if(this._apd_2020baojian04 != null)
         {
            this._apd_2020baojian04.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian04.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian04.useType = 1;
            this._apd_2020baojian04.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian05() : AvatarParamData
      {
         return this._apd_2020baojian05;
      }
      
      public function set apd_2020baojian05(param1:AvatarParamData) : void
      {
         this._apd_2020baojian05 = param1;
         if(this._apd_2020baojian05 != null)
         {
            this._apd_2020baojian05.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian05.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian05.useType = 1;
            this._apd_2020baojian05.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian06() : AvatarParamData
      {
         return this._apd_2020baojian06;
      }
      
      public function set apd_2020baojian06(param1:AvatarParamData) : void
      {
         this._apd_2020baojian06 = param1;
         if(this._apd_2020baojian06 != null)
         {
            this._apd_2020baojian06.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian06.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian06.useType = 1;
            this._apd_2020baojian06.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian07() : AvatarParamData
      {
         return this._apd_2020baojian07;
      }
      
      public function set apd_2020baojian07(param1:AvatarParamData) : void
      {
         this._apd_2020baojian07 = param1;
         if(this._apd_2020baojian07 != null)
         {
            this._apd_2020baojian07.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian07.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian07.useType = 1;
            this._apd_2020baojian07.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian08() : AvatarParamData
      {
         return this._apd_2020baojian08;
      }
      
      public function set apd_2020baojian08(param1:AvatarParamData) : void
      {
         this._apd_2020baojian08 = param1;
         if(this._apd_2020baojian08 != null)
         {
            this._apd_2020baojian08.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian08.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian08.useType = 1;
            this._apd_2020baojian08.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian09() : AvatarParamData
      {
         return this._apd_2020baojian09;
      }
      
      public function set apd_2020baojian09(param1:AvatarParamData) : void
      {
         this._apd_2020baojian09 = param1;
         if(this._apd_2020baojian09 != null)
         {
            this._apd_2020baojian09.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian09.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian09.useType = 1;
            this._apd_2020baojian09.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian10() : AvatarParamData
      {
         return this._apd_2020baojian10;
      }
      
      public function set apd_2020baojian10(param1:AvatarParamData) : void
      {
         this._apd_2020baojian10 = param1;
         if(this._apd_2020baojian10 != null)
         {
            this._apd_2020baojian10.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian10.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian10.useType = 1;
            this._apd_2020baojian10.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian11() : AvatarParamData
      {
         return this._apd_2020baojian11;
      }
      
      public function set apd_2020baojian11(param1:AvatarParamData) : void
      {
         this._apd_2020baojian11 = param1;
         if(this._apd_2020baojian11 != null)
         {
            this._apd_2020baojian11.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian11.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian11.useType = 1;
            this._apd_2020baojian11.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian12() : AvatarParamData
      {
         return this._apd_2020baojian12;
      }
      
      public function set apd_2020baojian12(param1:AvatarParamData) : void
      {
         this._apd_2020baojian12 = param1;
         if(this._apd_2020baojian12 != null)
         {
            this._apd_2020baojian12.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian12.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian12.useType = 1;
            this._apd_2020baojian12.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian13() : AvatarParamData
      {
         return this._apd_2020baojian13;
      }
      
      public function set apd_2020baojian13(param1:AvatarParamData) : void
      {
         this._apd_2020baojian13 = param1;
         if(this._apd_2020baojian13 != null)
         {
            this._apd_2020baojian13.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian13.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian13.useType = 1;
            this._apd_2020baojian13.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian14() : AvatarParamData
      {
         return this._apd_2020baojian14;
      }
      
      public function set apd_2020baojian14(param1:AvatarParamData) : void
      {
         this._apd_2020baojian14 = param1;
         if(this._apd_2020baojian14 != null)
         {
            this._apd_2020baojian14.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian14.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian14.useType = 1;
            this._apd_2020baojian14.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian15() : AvatarParamData
      {
         return this._apd_2020baojian15;
      }
      
      public function set apd_2020baojian15(param1:AvatarParamData) : void
      {
         this._apd_2020baojian15 = param1;
         if(this._apd_2020baojian15 != null)
         {
            this._apd_2020baojian15.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian15.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian15.useType = 1;
            this._apd_2020baojian15.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian16() : AvatarParamData
      {
         return this._apd_2020baojian16;
      }
      
      public function set apd_2020baojian16(param1:AvatarParamData) : void
      {
         this._apd_2020baojian16 = param1;
         if(this._apd_2020baojian16 != null)
         {
            this._apd_2020baojian16.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian16.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian16.useType = 1;
            this._apd_2020baojian16.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian17() : AvatarParamData
      {
         return this._apd_2020baojian17;
      }
      
      public function set apd_2020baojian17(param1:AvatarParamData) : void
      {
         this._apd_2020baojian17 = param1;
         if(this._apd_2020baojian17 != null)
         {
            this._apd_2020baojian17.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian17.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian17.useType = 1;
            this._apd_2020baojian17.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian18() : AvatarParamData
      {
         return this._apd_2020baojian18;
      }
      
      public function set apd_2020baojian18(param1:AvatarParamData) : void
      {
         this._apd_2020baojian18 = param1;
         if(this._apd_2020baojian18 != null)
         {
            this._apd_2020baojian18.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian18.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian18.useType = 1;
            this._apd_2020baojian18.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian19() : AvatarParamData
      {
         return this._apd_2020baojian19;
      }
      
      public function set apd_2020baojian19(param1:AvatarParamData) : void
      {
         this._apd_2020baojian19 = param1;
         if(this._apd_2020baojian19 != null)
         {
            this._apd_2020baojian19.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian19.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian19.useType = 1;
            this._apd_2020baojian19.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian20() : AvatarParamData
      {
         return this._apd_2020baojian20;
      }
      
      public function set apd_2020baojian20(param1:AvatarParamData) : void
      {
         this._apd_2020baojian20 = param1;
         if(this._apd_2020baojian20 != null)
         {
            this._apd_2020baojian20.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian20.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian20.useType = 1;
            this._apd_2020baojian20.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian21() : AvatarParamData
      {
         return this._apd_2020baojian21;
      }
      
      public function set apd_2020baojian21(param1:AvatarParamData) : void
      {
         this._apd_2020baojian21 = param1;
         if(this._apd_2020baojian21 != null)
         {
            this._apd_2020baojian21.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian21.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian21.useType = 1;
            this._apd_2020baojian21.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian22() : AvatarParamData
      {
         return this._apd_2020baojian22;
      }
      
      public function set apd_2020baojian22(param1:AvatarParamData) : void
      {
         this._apd_2020baojian22 = param1;
         if(this._apd_2020baojian22 != null)
         {
            this._apd_2020baojian22.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian22.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian22.useType = 1;
            this._apd_2020baojian22.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian23() : AvatarParamData
      {
         return this._apd_2020baojian23;
      }
      
      public function set apd_2020baojian23(param1:AvatarParamData) : void
      {
         this._apd_2020baojian23 = param1;
         if(this._apd_2020baojian23 != null)
         {
            this._apd_2020baojian23.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian23.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian23.useType = 1;
            this._apd_2020baojian23.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian24() : AvatarParamData
      {
         return this._apd_2020baojian24;
      }
      
      public function set apd_2020baojian24(param1:AvatarParamData) : void
      {
         this._apd_2020baojian24 = param1;
         if(this._apd_2020baojian24 != null)
         {
            this._apd_2020baojian24.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian24.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian24.useType = 1;
            this._apd_2020baojian24.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian25() : AvatarParamData
      {
         return this._apd_2020baojian25;
      }
      
      public function set apd_2020baojian25(param1:AvatarParamData) : void
      {
         this._apd_2020baojian25 = param1;
         if(this._apd_2020baojian25 != null)
         {
            this._apd_2020baojian25.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian25.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian25.useType = 1;
            this._apd_2020baojian25.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian26() : AvatarParamData
      {
         return this._apd_2020baojian26;
      }
      
      public function set apd_2020baojian26(param1:AvatarParamData) : void
      {
         this._apd_2020baojian26 = param1;
         if(this._apd_2020baojian26 != null)
         {
            this._apd_2020baojian26.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian26.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian26.useType = 1;
            this._apd_2020baojian26.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian27() : AvatarParamData
      {
         return this._apd_2020baojian27;
      }
      
      public function set apd_2020baojian27(param1:AvatarParamData) : void
      {
         this._apd_2020baojian27 = param1;
         if(this._apd_2020baojian27 != null)
         {
            this._apd_2020baojian27.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian27.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian27.useType = 1;
            this._apd_2020baojian27.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian28() : AvatarParamData
      {
         return this._apd_2020baojian28;
      }
      
      public function set apd_2020baojian28(param1:AvatarParamData) : void
      {
         this._apd_2020baojian28 = param1;
         if(this._apd_2020baojian28 != null)
         {
            this._apd_2020baojian28.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian28.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian28.useType = 1;
            this._apd_2020baojian28.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian29() : AvatarParamData
      {
         return this._apd_2020baojian29;
      }
      
      public function set apd_2020baojian29(param1:AvatarParamData) : void
      {
         this._apd_2020baojian29 = param1;
         if(this._apd_2020baojian29 != null)
         {
            this._apd_2020baojian29.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian29.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian29.useType = 1;
            this._apd_2020baojian29.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian30() : AvatarParamData
      {
         return this._apd_2020baojian30;
      }
      
      public function set apd_2020baojian30(param1:AvatarParamData) : void
      {
         this._apd_2020baojian30 = param1;
         if(this._apd_2020baojian30 != null)
         {
            this._apd_2020baojian30.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian30.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian30.useType = 1;
            this._apd_2020baojian30.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian31() : AvatarParamData
      {
         return this._apd_2020baojian31;
      }
      
      public function set apd_2020baojian31(param1:AvatarParamData) : void
      {
         this._apd_2020baojian31 = param1;
         if(this._apd_2020baojian31 != null)
         {
            this._apd_2020baojian31.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian31.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian31.useType = 1;
            this._apd_2020baojian31.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian32() : AvatarParamData
      {
         return this._apd_2020baojian32;
      }
      
      public function set apd_2020baojian32(param1:AvatarParamData) : void
      {
         this._apd_2020baojian32 = param1;
         if(this._apd_2020baojian32 != null)
         {
            this._apd_2020baojian32.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian32.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian32.useType = 1;
            this._apd_2020baojian32.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian33() : AvatarParamData
      {
         return this._apd_2020baojian33;
      }
      
      public function set apd_2020baojian33(param1:AvatarParamData) : void
      {
         this._apd_2020baojian33 = param1;
         if(this._apd_2020baojian33 != null)
         {
            this._apd_2020baojian33.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian33.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian33.useType = 1;
            this._apd_2020baojian33.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian34() : AvatarParamData
      {
         return this._apd_2020baojian34;
      }
      
      public function set apd_2020baojian34(param1:AvatarParamData) : void
      {
         this._apd_2020baojian34 = param1;
         if(this._apd_2020baojian34 != null)
         {
            this._apd_2020baojian34.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian34.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian34.useType = 1;
            this._apd_2020baojian34.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian35() : AvatarParamData
      {
         return this._apd_2020baojian35;
      }
      
      public function set apd_2020baojian35(param1:AvatarParamData) : void
      {
         this._apd_2020baojian35 = param1;
         if(this._apd_2020baojian35 != null)
         {
            this._apd_2020baojian35.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian35.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian35.useType = 1;
            this._apd_2020baojian35.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian36() : AvatarParamData
      {
         return this._apd_2020baojian36;
      }
      
      public function set apd_2020baojian36(param1:AvatarParamData) : void
      {
         this._apd_2020baojian36 = param1;
         if(this._apd_2020baojian36 != null)
         {
            this._apd_2020baojian36.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian36.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian36.useType = 1;
            this._apd_2020baojian36.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian37() : AvatarParamData
      {
         return this._apd_2020baojian37;
      }
      
      public function set apd_2020baojian37(param1:AvatarParamData) : void
      {
         this._apd_2020baojian37 = param1;
         if(this._apd_2020baojian37 != null)
         {
            this._apd_2020baojian37.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian37.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian37.useType = 1;
            this._apd_2020baojian37.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian38() : AvatarParamData
      {
         return this._apd_2020baojian38;
      }
      
      public function set apd_2020baojian38(param1:AvatarParamData) : void
      {
         this._apd_2020baojian38 = param1;
         if(this._apd_2020baojian38 != null)
         {
            this._apd_2020baojian38.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian38.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian38.useType = 1;
            this._apd_2020baojian38.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian39() : AvatarParamData
      {
         return this._apd_2020baojian39;
      }
      
      public function set apd_2020baojian39(param1:AvatarParamData) : void
      {
         this._apd_2020baojian39 = param1;
         if(this._apd_2020baojian39 != null)
         {
            this._apd_2020baojian39.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian39.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian39.useType = 1;
            this._apd_2020baojian39.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian40() : AvatarParamData
      {
         return this._apd_2020baojian40;
      }
      
      public function set apd_2020baojian40(param1:AvatarParamData) : void
      {
         this._apd_2020baojian40 = param1;
         if(this._apd_2020baojian40 != null)
         {
            this._apd_2020baojian40.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian40.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian40.useType = 1;
            this._apd_2020baojian40.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian41() : AvatarParamData
      {
         return this._apd_2020baojian41;
      }
      
      public function set apd_2020baojian41(param1:AvatarParamData) : void
      {
         this._apd_2020baojian41 = param1;
         if(this._apd_2020baojian41 != null)
         {
            this._apd_2020baojian41.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian41.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian41.useType = 1;
            this._apd_2020baojian41.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian42() : AvatarParamData
      {
         return this._apd_2020baojian42;
      }
      
      public function set apd_2020baojian42(param1:AvatarParamData) : void
      {
         this._apd_2020baojian42 = param1;
         if(this._apd_2020baojian42 != null)
         {
            this._apd_2020baojian42.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian42.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian42.useType = 1;
            this._apd_2020baojian42.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian43() : AvatarParamData
      {
         return this._apd_2020baojian43;
      }
      
      public function set apd_2020baojian43(param1:AvatarParamData) : void
      {
         this._apd_2020baojian43 = param1;
         if(this._apd_2020baojian43 != null)
         {
            this._apd_2020baojian43.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian43.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian43.useType = 1;
            this._apd_2020baojian43.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian44() : AvatarParamData
      {
         return this._apd_2020baojian44;
      }
      
      public function set apd_2020baojian44(param1:AvatarParamData) : void
      {
         this._apd_2020baojian44 = param1;
         if(this._apd_2020baojian44 != null)
         {
            this._apd_2020baojian44.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian44.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian44.useType = 1;
            this._apd_2020baojian44.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian45() : AvatarParamData
      {
         return this._apd_2020baojian45;
      }
      
      public function set apd_2020baojian45(param1:AvatarParamData) : void
      {
         this._apd_2020baojian45 = param1;
         if(this._apd_2020baojian45 != null)
         {
            this._apd_2020baojian45.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian45.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian45.useType = 1;
            this._apd_2020baojian45.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian46() : AvatarParamData
      {
         return this._apd_2020baojian46;
      }
      
      public function set apd_2020baojian46(param1:AvatarParamData) : void
      {
         this._apd_2020baojian46 = param1;
         if(this._apd_2020baojian46 != null)
         {
            this._apd_2020baojian46.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian46.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian46.useType = 1;
            this._apd_2020baojian46.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian47() : AvatarParamData
      {
         return this._apd_2020baojian47;
      }
      
      public function set apd_2020baojian47(param1:AvatarParamData) : void
      {
         this._apd_2020baojian47 = param1;
         if(this._apd_2020baojian47 != null)
         {
            this._apd_2020baojian47.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian47.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian47.useType = 1;
            this._apd_2020baojian47.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian48() : AvatarParamData
      {
         return this._apd_2020baojian48;
      }
      
      public function set apd_2020baojian48(param1:AvatarParamData) : void
      {
         this._apd_2020baojian48 = param1;
         if(this._apd_2020baojian48 != null)
         {
            this._apd_2020baojian48.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian48.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian48.useType = 1;
            this._apd_2020baojian48.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian49() : AvatarParamData
      {
         return this._apd_2020baojian49;
      }
      
      public function set apd_2020baojian49(param1:AvatarParamData) : void
      {
         this._apd_2020baojian49 = param1;
         if(this._apd_2020baojian49 != null)
         {
            this._apd_2020baojian49.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian49.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian49.useType = 1;
            this._apd_2020baojian49.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian50() : AvatarParamData
      {
         return this._apd_2020baojian50;
      }
      
      public function set apd_2020baojian50(param1:AvatarParamData) : void
      {
         this._apd_2020baojian50 = param1;
         if(this._apd_2020baojian50 != null)
         {
            this._apd_2020baojian50.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian50.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian50.useType = 1;
            this._apd_2020baojian50.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian51() : AvatarParamData
      {
         return this._apd_2020baojian51;
      }
      
      public function set apd_2020baojian51(param1:AvatarParamData) : void
      {
         this._apd_2020baojian51 = param1;
         if(this._apd_2020baojian51 != null)
         {
            this._apd_2020baojian51.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian51.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian51.useType = 1;
            this._apd_2020baojian51.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian52() : AvatarParamData
      {
         return this._apd_2020baojian52;
      }
      
      public function set apd_2020baojian52(param1:AvatarParamData) : void
      {
         this._apd_2020baojian52 = param1;
         if(this._apd_2020baojian52 != null)
         {
            this._apd_2020baojian52.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian52.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian52.useType = 1;
            this._apd_2020baojian52.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian53() : AvatarParamData
      {
         return this._apd_2020baojian53;
      }
      
      public function set apd_2020baojian53(param1:AvatarParamData) : void
      {
         this._apd_2020baojian53 = param1;
         if(this._apd_2020baojian53 != null)
         {
            this._apd_2020baojian53.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian53.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian53.useType = 1;
            this._apd_2020baojian53.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian54() : AvatarParamData
      {
         return this._apd_2020baojian54;
      }
      
      public function set apd_2020baojian54(param1:AvatarParamData) : void
      {
         this._apd_2020baojian54 = param1;
         if(this._apd_2020baojian54 != null)
         {
            this._apd_2020baojian54.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian54.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian54.useType = 1;
            this._apd_2020baojian54.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian55() : AvatarParamData
      {
         return this._apd_2020baojian55;
      }
      
      public function set apd_2020baojian55(param1:AvatarParamData) : void
      {
         this._apd_2020baojian55 = param1;
         if(this._apd_2020baojian55 != null)
         {
            this._apd_2020baojian55.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian55.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian55.useType = 1;
            this._apd_2020baojian55.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian56() : AvatarParamData
      {
         return this._apd_2020baojian56;
      }
      
      public function set apd_2020baojian56(param1:AvatarParamData) : void
      {
         this._apd_2020baojian56 = param1;
         if(this._apd_2020baojian56 != null)
         {
            this._apd_2020baojian56.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian56.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian56.useType = 1;
            this._apd_2020baojian56.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian57() : AvatarParamData
      {
         return this._apd_2020baojian57;
      }
      
      public function set apd_2020baojian57(param1:AvatarParamData) : void
      {
         this._apd_2020baojian57 = param1;
         if(this._apd_2020baojian57 != null)
         {
            this._apd_2020baojian57.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian57.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian57.useType = 1;
            this._apd_2020baojian57.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian58() : AvatarParamData
      {
         return this._apd_2020baojian58;
      }
      
      public function set apd_2020baojian58(param1:AvatarParamData) : void
      {
         this._apd_2020baojian58 = param1;
         if(this._apd_2020baojian58 != null)
         {
            this._apd_2020baojian58.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian58.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian58.useType = 1;
            this._apd_2020baojian58.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian59() : AvatarParamData
      {
         return this._apd_2020baojian59;
      }
      
      public function set apd_2020baojian59(param1:AvatarParamData) : void
      {
         this._apd_2020baojian59 = param1;
         if(this._apd_2020baojian59 != null)
         {
            this._apd_2020baojian59.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian59.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian59.useType = 1;
            this._apd_2020baojian59.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian60() : AvatarParamData
      {
         return this._apd_2020baojian60;
      }
      
      public function set apd_2020baojian60(param1:AvatarParamData) : void
      {
         this._apd_2020baojian60 = param1;
         if(this._apd_2020baojian60 != null)
         {
            this._apd_2020baojian60.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian60.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian60.useType = 1;
            this._apd_2020baojian60.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian61() : AvatarParamData
      {
         return this._apd_2020baojian61;
      }
      
      public function set apd_2020baojian61(param1:AvatarParamData) : void
      {
         this._apd_2020baojian61 = param1;
         if(this._apd_2020baojian61 != null)
         {
            this._apd_2020baojian61.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian61.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian61.useType = 1;
            this._apd_2020baojian61.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian62() : AvatarParamData
      {
         return this._apd_2020baojian62;
      }
      
      public function set apd_2020baojian62(param1:AvatarParamData) : void
      {
         this._apd_2020baojian62 = param1;
         if(this._apd_2020baojian62 != null)
         {
            this._apd_2020baojian62.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian62.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian62.useType = 1;
            this._apd_2020baojian62.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian63() : AvatarParamData
      {
         return this._apd_2020baojian63;
      }
      
      public function set apd_2020baojian63(param1:AvatarParamData) : void
      {
         this._apd_2020baojian63 = param1;
         if(this._apd_2020baojian63 != null)
         {
            this._apd_2020baojian63.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian63.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian63.useType = 1;
            this._apd_2020baojian63.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian64() : AvatarParamData
      {
         return this._apd_2020baojian64;
      }
      
      public function set apd_2020baojian64(param1:AvatarParamData) : void
      {
         this._apd_2020baojian64 = param1;
         if(this._apd_2020baojian64 != null)
         {
            this._apd_2020baojian64.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian64.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian64.useType = 1;
            this._apd_2020baojian64.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian65() : AvatarParamData
      {
         return this._apd_2020baojian65;
      }
      
      public function set apd_2020baojian65(param1:AvatarParamData) : void
      {
         this._apd_2020baojian65 = param1;
         if(this._apd_2020baojian65 != null)
         {
            this._apd_2020baojian65.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian65.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian65.useType = 1;
            this._apd_2020baojian65.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian66() : AvatarParamData
      {
         return this._apd_2020baojian66;
      }
      
      public function set apd_2020baojian66(param1:AvatarParamData) : void
      {
         this._apd_2020baojian66 = param1;
         if(this._apd_2020baojian66 != null)
         {
            this._apd_2020baojian66.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian66.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian66.useType = 1;
            this._apd_2020baojian66.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian67() : AvatarParamData
      {
         return this._apd_2020baojian67;
      }
      
      public function set apd_2020baojian67(param1:AvatarParamData) : void
      {
         this._apd_2020baojian67 = param1;
         if(this._apd_2020baojian67 != null)
         {
            this._apd_2020baojian67.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian67.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian67.useType = 1;
            this._apd_2020baojian67.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian68() : AvatarParamData
      {
         return this._apd_2020baojian68;
      }
      
      public function set apd_2020baojian68(param1:AvatarParamData) : void
      {
         this._apd_2020baojian68 = param1;
         if(this._apd_2020baojian68 != null)
         {
            this._apd_2020baojian68.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian68.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian68.useType = 1;
            this._apd_2020baojian68.clearSameType = true;
         }
      }
      
      public function get apd_2020baojian69() : AvatarParamData
      {
         return this._apd_2020baojian69;
      }
      
      public function set apd_2020baojian69(param1:AvatarParamData) : void
      {
         this._apd_2020baojian69 = param1;
         if(this._apd_2020baojian69 != null)
         {
            this._apd_2020baojian69.id = SpeciaAvatarPartID.WEAPON;
            this._apd_2020baojian69.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_2020baojian69.useType = 1;
            this._apd_2020baojian69.clearSameType = true;
         }
      }
      
      public function get apd_chengjiechangji() : AvatarParamData
      {
         return this._apd_chengjiechangji;
      }
      
      public function set apd_chengjiechangji(param1:AvatarParamData) : void
      {
         this._apd_chengjiechangji = param1;
         if(this._apd_chengjiechangji != null)
         {
            this._apd_chengjiechangji.id = SpeciaAvatarPartID.WEAPON;
            this._apd_chengjiechangji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_chengjiechangji.useType = 1;
            this._apd_chengjiechangji.clearSameType = true;
         }
      }
      
      public function get apd_tianxiejian() : AvatarParamData
      {
         return this._apd_tianxiejian;
      }
      
      public function set apd_tianxiejian(param1:AvatarParamData) : void
      {
         this._apd_tianxiejian = param1;
         if(this._apd_tianxiejian != null)
         {
            this._apd_tianxiejian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_tianxiejian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_tianxiejian.useType = 1;
            this._apd_tianxiejian.clearSameType = true;
         }
      }
      
      public function get apd_junzijian() : AvatarParamData
      {
         return this._apd_junzijian;
      }
      
      public function set apd_junzijian(param1:AvatarParamData) : void
      {
         this._apd_junzijian = param1;
         if(this._apd_junzijian != null)
         {
            this._apd_junzijian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_junzijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_junzijian.useType = 1;
            this._apd_junzijian.clearSameType = true;
         }
      }
      
      public function get apd_wangzhejian() : AvatarParamData
      {
         return this._apd_wangzhejian;
      }
      
      public function set apd_wangzhejian(param1:AvatarParamData) : void
      {
         this._apd_wangzhejian = param1;
         if(this._apd_wangzhejian != null)
         {
            this._apd_wangzhejian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_wangzhejian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_wangzhejian.useType = 1;
            this._apd_wangzhejian.clearSameType = true;
         }
      }
      
      public function get apd_xuantiezhongjian() : AvatarParamData
      {
         return this._apd_xuantiezhongjian;
      }
      
      public function set apd_xuantiezhongjian(param1:AvatarParamData) : void
      {
         this._apd_xuantiezhongjian = param1;
         if(this._apd_xuantiezhongjian != null)
         {
            this._apd_xuantiezhongjian.id = SpeciaAvatarPartID.WEAPON;
            this._apd_xuantiezhongjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_xuantiezhongjian.useType = 1;
            this._apd_xuantiezhongjian.clearSameType = true;
         }
      }
      
      public function get apd_guangmingzhang() : AvatarParamData
      {
         return this._apd_guangmingzhang;
      }
      
      public function set apd_guangmingzhang(param1:AvatarParamData) : void
      {
         this._apd_guangmingzhang = param1;
         if(this._apd_guangmingzhang != null)
         {
            this._apd_guangmingzhang.id = SpeciaAvatarPartID.WEAPON;
            this._apd_guangmingzhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_guangmingzhang.useType = 1;
            this._apd_guangmingzhang.clearSameType = true;
         }
      }
      
      public function get apd_bow() : AvatarParamData
      {
         return this._apd_bow;
      }
      
      public function set apd_bow(param1:AvatarParamData) : void
      {
         this._apd_bow = param1;
         if(this._apd_bow != null)
         {
            this._apd_bow.id = SpeciaAvatarPartID.BOW;
            this._apd_bow.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.BOW);
            this._apd_bow.useType = 1;
            this._apd_bow.clearSameType = true;
         }
      }
      
      public function get apd_zhenhun() : AvatarParamData
      {
         return this._apd_zhenhun;
      }
      
      public function set apd_zhenhun(param1:AvatarParamData) : void
      {
         this._apd_zhenhun = param1;
         if(this._apd_zhenhun != null)
         {
            this._apd_zhenhun.id = SpeciaAvatarPartID.ZHENHUN;
            this._apd_zhenhun.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.ZHENHUN);
            this._apd_zhenhun.useType = 1;
            this._apd_zhenhun.clearSameType = true;
         }
      }
      
      public function get apd_mount_body() : AvatarParamData
      {
         return this._apd_mount_body;
      }
      
      public function set apd_mount_body(param1:AvatarParamData) : void
      {
         this._apd_mount_body = param1;
         if(this._apd_mount_body != null)
         {
            this._apd_mount_body.id = SpeciaAvatarPartID.MOUNT_BODY;
            this._apd_mount_body.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.BODY);
            this._apd_mount_body.useType = 2;
            this._apd_mount_body.clearSameType = true;
         }
      }
      
      public function get apd_mount_weapon() : AvatarParamData
      {
         return this._apd_mount_weapon;
      }
      
      public function set apd_mount_weapon(param1:AvatarParamData) : void
      {
         this._apd_mount_weapon = param1;
         if(this._apd_mount_weapon != null)
         {
            this._apd_mount_weapon.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_weapon.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_weapon.useType = 2;
            this._apd_mount_weapon.clearSameType = true;
         }
      }
      
      public function get apd_mount_ylzr() : AvatarParamData
      {
         return this._apd_mount_ylzr;
      }
      
      public function set apd_mount_ylzr(param1:AvatarParamData) : void
      {
         this._apd_mount_ylzr = param1;
         if(this._apd_mount_ylzr != null)
         {
            this._apd_mount_ylzr.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_ylzr.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_ylzr.useType = 2;
            this._apd_mount_ylzr.clearSameType = true;
         }
      }
      
      public function get apd_mount_xyj() : AvatarParamData
      {
         return this._apd_mount_xyj;
      }
      
      public function set apd_mount_xyj(param1:AvatarParamData) : void
      {
         this._apd_mount_xyj = param1;
         if(this._apd_mount_xyj != null)
         {
            this._apd_mount_xyj.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xyj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xyj.useType = 2;
            this._apd_mount_xyj.clearSameType = true;
         }
      }
      
      public function get apd_mount_pj() : AvatarParamData
      {
         return this._apd_mount_pj;
      }
      
      public function set apd_mount_pj(param1:AvatarParamData) : void
      {
         this._apd_mount_pj = param1;
         if(this._apd_mount_pj != null)
         {
            this._apd_mount_pj.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_pj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_pj.useType = 2;
            this._apd_mount_pj.clearSameType = true;
         }
      }
      
      public function get apd_mount_xtzj() : AvatarParamData
      {
         return this._apd_mount_xtzj;
      }
      
      public function set apd_mount_xtzj(param1:AvatarParamData) : void
      {
         this._apd_mount_xtzj = param1;
         if(this._apd_mount_xtzj != null)
         {
            this._apd_mount_xtzj.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xtzj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xtzj.useType = 2;
            this._apd_mount_xtzj.clearSameType = true;
         }
      }
      
      public function get apd_mount_xingtian() : AvatarParamData
      {
         return this._apd_mount_xingtian;
      }
      
      public function set apd_mount_xingtian(param1:AvatarParamData) : void
      {
         this._apd_mount_xingtian = param1;
         if(this._apd_mount_xingtian != null)
         {
            this._apd_mount_xingtian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xingtian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xingtian.useType = 2;
            this._apd_mount_xingtian.clearSameType = true;
         }
      }
      
      public function get apd_mount_jinwumingguangtang() : AvatarParamData
      {
         return this._apd_mount_jinwumingguangtang;
      }
      
      public function set apd_mount_jinwumingguangtang(param1:AvatarParamData) : void
      {
         this._apd_mount_jinwumingguangtang = param1;
         if(this._apd_mount_jinwumingguangtang != null)
         {
            this._apd_mount_jinwumingguangtang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_jinwumingguangtang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_jinwumingguangtang.useType = 2;
            this._apd_mount_jinwumingguangtang.clearSameType = true;
         }
      }
      
      public function get apd_mount_lietianbawangji() : AvatarParamData
      {
         return this._apd_mount_lietianbawangji;
      }
      
      public function set apd_mount_lietianbawangji(param1:AvatarParamData) : void
      {
         this._apd_mount_lietianbawangji = param1;
         if(this._apd_mount_lietianbawangji != null)
         {
            this._apd_mount_lietianbawangji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_lietianbawangji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_lietianbawangji.useType = 2;
            this._apd_mount_lietianbawangji.clearSameType = true;
         }
      }
      
      public function get apd_mount_guxing() : AvatarParamData
      {
         return this._apd_mount_guxing;
      }
      
      public function set apd_mount_guxing(param1:AvatarParamData) : void
      {
         this._apd_mount_guxing = param1;
         if(this._apd_mount_guxing != null)
         {
            this._apd_mount_guxing.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_guxing.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_guxing.useType = 2;
            this._apd_mount_guxing.clearSameType = true;
         }
      }
      
      public function get apd_mount_jixiang() : AvatarParamData
      {
         return this._apd_mount_jixiang;
      }
      
      public function set apd_mount_jixiang(param1:AvatarParamData) : void
      {
         this._apd_mount_jixiang = param1;
         if(this._apd_mount_jixiang != null)
         {
            this._apd_mount_jixiang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_jixiang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_jixiang.useType = 2;
            this._apd_mount_jixiang.clearSameType = true;
         }
      }
      
      public function get apd_mount_dgb() : AvatarParamData
      {
         return this._apd_mount_dgb;
      }
      
      public function set apd_mount_dgb(param1:AvatarParamData) : void
      {
         this._apd_mount_dgb = param1;
         if(this._apd_mount_dgb != null)
         {
            this._apd_mount_dgb.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_dgb.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_dgb.useType = 2;
            this._apd_mount_dgb.clearSameType = true;
         }
      }
      
      public function get apd_mount_xydj() : AvatarParamData
      {
         return this._apd_mount_xydj;
      }
      
      public function set apd_mount_xydj(param1:AvatarParamData) : void
      {
         this._apd_mount_xydj = param1;
         if(this._apd_mount_xydj != null)
         {
            this._apd_mount_xydj.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xydj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xydj.useType = 2;
            this._apd_mount_xydj.clearSameType = true;
         }
      }
      
      public function get apd_mount_xytj() : AvatarParamData
      {
         return this._apd_mount_xytj;
      }
      
      public function set apd_mount_xytj(param1:AvatarParamData) : void
      {
         this._apd_mount_xytj = param1;
         if(this._apd_mount_xytj != null)
         {
            this._apd_mount_xytj.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xytj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xytj.useType = 2;
            this._apd_mount_xytj.clearSameType = true;
         }
      }
      
      public function get apd_mount_xyrj() : AvatarParamData
      {
         return this._apd_mount_xyrj;
      }
      
      public function set apd_mount_xyrj(param1:AvatarParamData) : void
      {
         this._apd_mount_xyrj = param1;
         if(this._apd_mount_xyrj != null)
         {
            this._apd_mount_xyrj.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xyrj.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xyrj.useType = 2;
            this._apd_mount_xyrj.clearSameType = true;
         }
      }
      
      public function get apd_mount_aojian() : AvatarParamData
      {
         return this._apd_mount_aojian;
      }
      
      public function set apd_mount_aojian(param1:AvatarParamData) : void
      {
         this._apd_mount_aojian = param1;
         if(this._apd_mount_aojian != null)
         {
            this._apd_mount_aojian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_aojian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_aojian.useType = 2;
            this._apd_mount_aojian.clearSameType = true;
         }
      }
      
      public function get apd_mount_shenqi() : AvatarParamData
      {
         return this._apd_mount_shenqi;
      }
      
      public function set apd_mount_shenqi(param1:AvatarParamData) : void
      {
         this._apd_mount_shenqi = param1;
         if(this._apd_mount_shenqi != null)
         {
            this._apd_mount_shenqi.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_shenqi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_shenqi.useType = 2;
            this._apd_mount_shenqi.clearSameType = true;
         }
      }
      
      public function get apd_mount_longyin() : AvatarParamData
      {
         return this._apd_mount_longyin;
      }
      
      public function set apd_mount_longyin(param1:AvatarParamData) : void
      {
         this._apd_mount_longyin = param1;
         if(this._apd_mount_longyin != null)
         {
            this._apd_mount_longyin.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_longyin.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_longyin.useType = 2;
            this._apd_mount_longyin.clearSameType = true;
         }
      }
      
      public function get apd_mount_longya() : AvatarParamData
      {
         return this._apd_mount_longya;
      }
      
      public function set apd_mount_longya(param1:AvatarParamData) : void
      {
         this._apd_mount_longya = param1;
         if(this._apd_mount_longya != null)
         {
            this._apd_mount_longya.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_longya.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_longya.useType = 2;
            this._apd_mount_longya.clearSameType = true;
         }
      }
      
      public function get apd_mount_longya1() : AvatarParamData
      {
         return this._apd_mount_longya1;
      }
      
      public function set apd_mount_longya1(param1:AvatarParamData) : void
      {
         this._apd_mount_longya1 = param1;
         if(this._apd_mount_longya1 != null)
         {
            this._apd_mount_longya1.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_longya1.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_longya1.useType = 2;
            this._apd_mount_longya1.clearSameType = true;
         }
      }
      
      public function get apd_mount_tianshang() : AvatarParamData
      {
         return this._apd_mount_tianshang;
      }
      
      public function set apd_mount_tianshang(param1:AvatarParamData) : void
      {
         this._apd_mount_tianshang = param1;
         if(this._apd_mount_tianshang != null)
         {
            this._apd_mount_tianshang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_tianshang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_tianshang.useType = 2;
            this._apd_mount_tianshang.clearSameType = true;
         }
      }
      
      public function get apd_mount_potianren() : AvatarParamData
      {
         return this._apd_mount_potianren;
      }
      
      public function set apd_mount_potianren(param1:AvatarParamData) : void
      {
         this._apd_mount_potianren = param1;
         if(this._apd_mount_potianren != null)
         {
            this._apd_mount_potianren.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_potianren.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_potianren.useType = 2;
            this._apd_mount_potianren.clearSameType = true;
         }
      }
      
      public function get apd_mount_liekong() : AvatarParamData
      {
         return this._apd_mount_liekong;
      }
      
      public function set apd_mount_liekong(param1:AvatarParamData) : void
      {
         this._apd_mount_liekong = param1;
         if(this._apd_mount_liekong != null)
         {
            this._apd_mount_liekong.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_liekong.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_liekong.useType = 2;
            this._apd_mount_liekong.clearSameType = true;
         }
      }
      
      public function get apd_mount_quanshen() : AvatarParamData
      {
         return this._apd_mount_quanshen;
      }
      
      public function set apd_mount_quanshen(param1:AvatarParamData) : void
      {
         this._apd_mount_quanshen = param1;
         if(this._apd_mount_quanshen != null)
         {
            this._apd_mount_quanshen.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_quanshen.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_quanshen.useType = 2;
            this._apd_mount_quanshen.clearSameType = true;
         }
      }
      
      public function get apd_mount_pangu() : AvatarParamData
      {
         return this._apd_mount_pangu;
      }
      
      public function set apd_mount_pangu(param1:AvatarParamData) : void
      {
         this._apd_mount_pangu = param1;
         if(this._apd_mount_pangu != null)
         {
            this._apd_mount_pangu.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_pangu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_pangu.useType = 2;
            this._apd_mount_pangu.clearSameType = true;
         }
      }
      
      public function get apd_mount_zilinghuanyueji() : AvatarParamData
      {
         return this._apd_mount_zilinghuanyueji;
      }
      
      public function set apd_mount_zilinghuanyueji(param1:AvatarParamData) : void
      {
         this._apd_mount_zilinghuanyueji = param1;
         if(this._apd_mount_zilinghuanyueji != null)
         {
            this._apd_mount_zilinghuanyueji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_zilinghuanyueji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_zilinghuanyueji.useType = 2;
            this._apd_mount_zilinghuanyueji.clearSameType = true;
         }
      }
      
      public function get apd_mount_wuyingjian() : AvatarParamData
      {
         return this._apd_mount_wuyingjian;
      }
      
      public function set apd_mount_wuyingjian(param1:AvatarParamData) : void
      {
         this._apd_mount_wuyingjian = param1;
         if(this._apd_mount_wuyingjian != null)
         {
            this._apd_mount_wuyingjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_wuyingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_wuyingjian.useType = 2;
            this._apd_mount_wuyingjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_huoyun() : AvatarParamData
      {
         return this._apd_mount_huoyun;
      }
      
      public function set apd_mount_huoyun(param1:AvatarParamData) : void
      {
         this._apd_mount_huoyun = param1;
         if(this._apd_mount_huoyun != null)
         {
            this._apd_mount_huoyun.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_huoyun.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_huoyun.useType = 2;
            this._apd_mount_huoyun.clearSameType = true;
         }
      }
      
      public function get apd_mount_xueyindao() : AvatarParamData
      {
         return this._apd_mount_xueyindao;
      }
      
      public function set apd_mount_xueyindao(param1:AvatarParamData) : void
      {
         this._apd_mount_xueyindao = param1;
         if(this._apd_mount_xueyindao != null)
         {
            this._apd_mount_xueyindao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xueyindao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xueyindao.useType = 2;
            this._apd_mount_xueyindao.clearSameType = true;
         }
      }
      
      public function get apd_mount_gjmy() : AvatarParamData
      {
         return this._apd_mount_gjmy;
      }
      
      public function set apd_mount_gjmy(param1:AvatarParamData) : void
      {
         this._apd_mount_gjmy = param1;
         if(this._apd_mount_gjmy != null)
         {
            this._apd_mount_gjmy.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_gjmy.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_gjmy.useType = 2;
            this._apd_mount_gjmy.clearSameType = true;
         }
      }
      
      public function get apd_mount_yanyuedao() : AvatarParamData
      {
         return this._apd_mount_yanyuedao;
      }
      
      public function set apd_mount_yanyuedao(param1:AvatarParamData) : void
      {
         this._apd_mount_yanyuedao = param1;
         if(this._apd_mount_yanyuedao != null)
         {
            this._apd_mount_yanyuedao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_yanyuedao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_yanyuedao.useType = 2;
            this._apd_mount_yanyuedao.clearSameType = true;
         }
      }
      
      public function get apd_mount_xuantiezhongjian() : AvatarParamData
      {
         return this._apd_mount_xuantiezhongjian;
      }
      
      public function set apd_mount_xuantiezhongjian(param1:AvatarParamData) : void
      {
         this._apd_mount_xuantiezhongjian = param1;
         if(this._apd_mount_xuantiezhongjian != null)
         {
            this._apd_mount_xuantiezhongjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xuantiezhongjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xuantiezhongjian.useType = 2;
            this._apd_mount_xuantiezhongjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_guangmingzhang() : AvatarParamData
      {
         return this._apd_mount_guangmingzhang;
      }
      
      public function set apd_mount_guangmingzhang(param1:AvatarParamData) : void
      {
         this._apd_mount_guangmingzhang = param1;
         if(this._apd_mount_guangmingzhang != null)
         {
            this._apd_mount_guangmingzhang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_guangmingzhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_guangmingzhang.useType = 2;
            this._apd_mount_guangmingzhang.clearSameType = true;
         }
      }
      
      public function get apd_mount_huimie() : AvatarParamData
      {
         return this._apd_mount_huimie;
      }
      
      public function set apd_mount_huimie(param1:AvatarParamData) : void
      {
         this._apd_mount_huimie = param1;
         if(this._apd_mount_huimie != null)
         {
            this._apd_mount_huimie.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_huimie.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_huimie.useType = 2;
            this._apd_mount_huimie.clearSameType = true;
         }
      }
      
      public function get apd_mount_zhumozhang() : AvatarParamData
      {
         return this._apd_mount_zhumozhang;
      }
      
      public function set apd_mount_zhumozhang(param1:AvatarParamData) : void
      {
         this._apd_mount_zhumozhang = param1;
         if(this._apd_mount_zhumozhang != null)
         {
            this._apd_mount_zhumozhang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_zhumozhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_zhumozhang.useType = 2;
            this._apd_mount_zhumozhang.clearSameType = true;
         }
      }
      
      public function get apd_mount_chiyan() : AvatarParamData
      {
         return this._apd_mount_chiyan;
      }
      
      public function set apd_mount_chiyan(param1:AvatarParamData) : void
      {
         this._apd_mount_chiyan = param1;
         if(this._apd_mount_chiyan != null)
         {
            this._apd_mount_chiyan.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_chiyan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_chiyan.useType = 2;
            this._apd_mount_chiyan.clearSameType = true;
         }
      }
      
      public function get apd_mount_fengtianji() : AvatarParamData
      {
         return this._apd_mount_fengtianji;
      }
      
      public function set apd_mount_fengtianji(param1:AvatarParamData) : void
      {
         this._apd_mount_fengtianji = param1;
         if(this._apd_mount_fengtianji != null)
         {
            this._apd_mount_fengtianji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_fengtianji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_fengtianji.useType = 2;
            this._apd_mount_fengtianji.clearSameType = true;
         }
      }
      
      public function get apd_mount_huolongdao() : AvatarParamData
      {
         return this._apd_mount_huolongdao;
      }
      
      public function set apd_mount_huolongdao(param1:AvatarParamData) : void
      {
         this._apd_mount_huolongdao = param1;
         if(this._apd_mount_huolongdao != null)
         {
            this._apd_mount_huolongdao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_huolongdao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_huolongdao.useType = 2;
            this._apd_mount_huolongdao.clearSameType = true;
         }
      }
      
      public function get apd_mount_tianzhu() : AvatarParamData
      {
         return this._apd_mount_tianzhu;
      }
      
      public function set apd_mount_tianzhu(param1:AvatarParamData) : void
      {
         this._apd_mount_tianzhu = param1;
         if(this._apd_mount_tianzhu != null)
         {
            this._apd_mount_tianzhu.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_tianzhu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_tianzhu.useType = 2;
            this._apd_mount_tianzhu.clearSameType = true;
         }
      }
      
      public function get apd_mount_pangukaitianfu() : AvatarParamData
      {
         return this._apd_mount_pangukaitianfu;
      }
      
      public function set apd_mount_pangukaitianfu(param1:AvatarParamData) : void
      {
         this._apd_mount_pangukaitianfu = param1;
         if(this._apd_mount_pangukaitianfu != null)
         {
            this._apd_mount_pangukaitianfu.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_pangukaitianfu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_pangukaitianfu.useType = 2;
            this._apd_mount_pangukaitianfu.clearSameType = true;
         }
      }
      
      public function get apd_mount_tiandijian() : AvatarParamData
      {
         return this._apd_mount_tiandijian;
      }
      
      public function set apd_mount_tiandijian(param1:AvatarParamData) : void
      {
         this._apd_mount_tiandijian = param1;
         if(this._apd_mount_tiandijian != null)
         {
            this._apd_mount_tiandijian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_tiandijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_tiandijian.useType = 2;
            this._apd_mount_tiandijian.clearSameType = true;
         }
      }
      
      public function get apd_mount_hanqibingpo() : AvatarParamData
      {
         return this._apd_mount_hanqibingpo;
      }
      
      public function set apd_mount_hanqibingpo(param1:AvatarParamData) : void
      {
         this._apd_mount_hanqibingpo = param1;
         if(this._apd_mount_hanqibingpo != null)
         {
            this._apd_mount_hanqibingpo.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_hanqibingpo.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_hanqibingpo.useType = 2;
            this._apd_mount_hanqibingpo.clearSameType = true;
         }
      }
      
      public function get apd_mount_jianzunlongquanjian() : AvatarParamData
      {
         return this._apd_mount_jianzunlongquanjian;
      }
      
      public function set apd_mount_jianzunlongquanjian(param1:AvatarParamData) : void
      {
         this._apd_mount_jianzunlongquanjian = param1;
         if(this._apd_mount_jianzunlongquanjian != null)
         {
            this._apd_mount_jianzunlongquanjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_jianzunlongquanjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_jianzunlongquanjian.useType = 2;
            this._apd_mount_jianzunlongquanjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_chuangshi() : AvatarParamData
      {
         return this._apd_mount_chuangshi;
      }
      
      public function set apd_mount_chuangshi(param1:AvatarParamData) : void
      {
         this._apd_mount_chuangshi = param1;
         if(this._apd_mount_chuangshi != null)
         {
            this._apd_mount_chuangshi.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_chuangshi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_chuangshi.useType = 2;
            this._apd_mount_chuangshi.clearSameType = true;
         }
      }
      
      public function get apd_mount_suilieshifu() : AvatarParamData
      {
         return this._apd_mount_suilieshifu;
      }
      
      public function set apd_mount_suilieshifu(param1:AvatarParamData) : void
      {
         this._apd_mount_suilieshifu = param1;
         if(this._apd_mount_suilieshifu != null)
         {
            this._apd_mount_suilieshifu.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_suilieshifu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_suilieshifu.useType = 2;
            this._apd_mount_suilieshifu.clearSameType = true;
         }
      }
      
      public function get apd_mount_moyuan() : AvatarParamData
      {
         return this._apd_mount_moyuan;
      }
      
      public function set apd_mount_moyuan(param1:AvatarParamData) : void
      {
         this._apd_mount_moyuan = param1;
         if(this._apd_mount_moyuan != null)
         {
            this._apd_mount_moyuan.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_moyuan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_moyuan.useType = 2;
            this._apd_mount_moyuan.clearSameType = true;
         }
      }
      
      public function get apd_mount_fengbaodao() : AvatarParamData
      {
         return this._apd_mount_fengbaodao;
      }
      
      public function set apd_mount_fengbaodao(param1:AvatarParamData) : void
      {
         this._apd_mount_fengbaodao = param1;
         if(this._apd_mount_fengbaodao != null)
         {
            this._apd_mount_fengbaodao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_fengbaodao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_fengbaodao.useType = 2;
            this._apd_mount_fengbaodao.clearSameType = true;
         }
      }
      
      public function get apd_mount_fengyun() : AvatarParamData
      {
         return this._apd_mount_fengyun;
      }
      
      public function set apd_mount_fengyun(param1:AvatarParamData) : void
      {
         this._apd_mount_fengyun = param1;
         if(this._apd_mount_fengyun != null)
         {
            this._apd_mount_fengyun.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_fengyun.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_fengyun.useType = 2;
            this._apd_mount_fengyun.clearSameType = true;
         }
      }
      
      public function get apd_mount_shengdan2015() : AvatarParamData
      {
         return this._apd_mount_shengdan2015;
      }
      
      public function set apd_mount_shengdan2015(param1:AvatarParamData) : void
      {
         this._apd_mount_shengdan2015 = param1;
         if(this._apd_mount_shengdan2015 != null)
         {
            this._apd_mount_shengdan2015.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_shengdan2015.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_shengdan2015.useType = 2;
            this._apd_mount_shengdan2015.clearSameType = true;
         }
      }
      
      public function get apd_mount_fengsha() : AvatarParamData
      {
         return this._apd_mount_fengsha;
      }
      
      public function set apd_mount_fengsha(param1:AvatarParamData) : void
      {
         this._apd_mount_fengsha = param1;
         if(this._apd_mount_fengsha != null)
         {
            this._apd_mount_fengsha.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_fengsha.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_fengsha.useType = 2;
            this._apd_mount_fengsha.clearSameType = true;
         }
      }
      
      public function get apd_mount_fengyijian() : AvatarParamData
      {
         return this._apd_mount_fengyijian;
      }
      
      public function set apd_mount_fengyijian(param1:AvatarParamData) : void
      {
         this._apd_mount_fengyijian = param1;
         if(this._apd_mount_fengyijian != null)
         {
            this._apd_mount_fengyijian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_fengyijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_fengyijian.useType = 2;
            this._apd_mount_fengyijian.clearSameType = true;
         }
      }
      
      public function get apd_mount_lexinji() : AvatarParamData
      {
         return this._apd_mount_lexinji;
      }
      
      public function set apd_mount_lexinji(param1:AvatarParamData) : void
      {
         this._apd_mount_lexinji = param1;
         if(this._apd_mount_lexinji != null)
         {
            this._apd_mount_lexinji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_lexinji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_lexinji.useType = 2;
            this._apd_mount_lexinji.clearSameType = true;
         }
      }
      
      public function get apd_mount_fengyingjian() : AvatarParamData
      {
         return this._apd_mount_fengyingjian;
      }
      
      public function set apd_mount_fengyingjian(param1:AvatarParamData) : void
      {
         this._apd_mount_fengyingjian = param1;
         if(this._apd_mount_fengyingjian != null)
         {
            this._apd_mount_fengyingjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_fengyingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_fengyingjian.useType = 2;
            this._apd_mount_fengyingjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_zhenfengjian() : AvatarParamData
      {
         return this._apd_mount_zhenfengjian;
      }
      
      public function set apd_mount_zhenfengjian(param1:AvatarParamData) : void
      {
         this._apd_mount_zhenfengjian = param1;
         if(this._apd_mount_zhenfengjian != null)
         {
            this._apd_mount_zhenfengjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_zhenfengjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_zhenfengjian.useType = 2;
            this._apd_mount_zhenfengjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_fengyunjian() : AvatarParamData
      {
         return this._apd_mount_fengyunjian;
      }
      
      public function set apd_mount_fengyunjian(param1:AvatarParamData) : void
      {
         this._apd_mount_fengyunjian = param1;
         if(this._apd_mount_fengyunjian != null)
         {
            this._apd_mount_fengyunjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_fengyunjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_fengyunjian.useType = 2;
            this._apd_mount_fengyunjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_bingfengjian() : AvatarParamData
      {
         return this._apd_mount_bingfengjian;
      }
      
      public function set apd_mount_bingfengjian(param1:AvatarParamData) : void
      {
         this._apd_mount_bingfengjian = param1;
         if(this._apd_mount_bingfengjian != null)
         {
            this._apd_mount_bingfengjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_bingfengjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_bingfengjian.useType = 2;
            this._apd_mount_bingfengjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_hongleizhangu() : AvatarParamData
      {
         return this._apd_mount_hongleizhangu;
      }
      
      public function set apd_mount_hongleizhangu(param1:AvatarParamData) : void
      {
         this._apd_mount_hongleizhangu = param1;
         if(this._apd_mount_hongleizhangu != null)
         {
            this._apd_mount_hongleizhangu.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_hongleizhangu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_hongleizhangu.useType = 2;
            this._apd_mount_hongleizhangu.clearSameType = true;
         }
      }
      
      public function get apd_mount_sandenggufo() : AvatarParamData
      {
         return this._apd_mount_sandenggufo;
      }
      
      public function set apd_mount_sandenggufo(param1:AvatarParamData) : void
      {
         this._apd_mount_sandenggufo = param1;
         if(this._apd_mount_sandenggufo != null)
         {
            this._apd_mount_sandenggufo.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_sandenggufo.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_sandenggufo.useType = 2;
            this._apd_mount_sandenggufo.clearSameType = true;
         }
      }
      
      public function get apd_mount_fonuji() : AvatarParamData
      {
         return this._apd_mount_fonuji;
      }
      
      public function set apd_mount_fonuji(param1:AvatarParamData) : void
      {
         this._apd_mount_fonuji = param1;
         if(this._apd_mount_fonuji != null)
         {
            this._apd_mount_fonuji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_fonuji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_fonuji.useType = 2;
            this._apd_mount_fonuji.clearSameType = true;
         }
      }
      
      public function get apd_mount_fengyinjian() : AvatarParamData
      {
         return this._apd_mount_fengyinjian;
      }
      
      public function set apd_mount_fengyinjian(param1:AvatarParamData) : void
      {
         this._apd_mount_fengyinjian = param1;
         if(this._apd_mount_fengyinjian != null)
         {
            this._apd_mount_fengyinjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_fengyinjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_fengyinjian.useType = 2;
            this._apd_mount_fengyinjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_tianmajian() : AvatarParamData
      {
         return this._apd_mount_tianmajian;
      }
      
      public function set apd_mount_tianmajian(param1:AvatarParamData) : void
      {
         this._apd_mount_tianmajian = param1;
         if(this._apd_mount_tianmajian != null)
         {
            this._apd_mount_tianmajian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_tianmajian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_tianmajian.useType = 2;
            this._apd_mount_tianmajian.clearSameType = true;
         }
      }
      
      public function get apd_mount_wuhunjian() : AvatarParamData
      {
         return this._apd_mount_wuhunjian;
      }
      
      public function set apd_mount_wuhunjian(param1:AvatarParamData) : void
      {
         this._apd_mount_wuhunjian = param1;
         if(this._apd_mount_wuhunjian != null)
         {
            this._apd_mount_wuhunjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_wuhunjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_wuhunjian.useType = 2;
            this._apd_mount_wuhunjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_zhentianjian() : AvatarParamData
      {
         return this._apd_mount_zhentianjian;
      }
      
      public function set apd_mount_zhentianjian(param1:AvatarParamData) : void
      {
         this._apd_mount_zhentianjian = param1;
         if(this._apd_mount_zhentianjian != null)
         {
            this._apd_mount_zhentianjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_zhentianjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_zhentianjian.useType = 2;
            this._apd_mount_zhentianjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_tianxue() : AvatarParamData
      {
         return this._apd_mount_tianxue;
      }
      
      public function set apd_mount_tianxue(param1:AvatarParamData) : void
      {
         this._apd_mount_tianxue = param1;
         if(this._apd_mount_tianxue != null)
         {
            this._apd_mount_tianxue.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_tianxue.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_tianxue.useType = 2;
            this._apd_mount_tianxue.clearSameType = true;
         }
      }
      
      public function get apd_mount_xiongjijian() : AvatarParamData
      {
         return this._apd_mount_xiongjijian;
      }
      
      public function set apd_mount_xiongjijian(param1:AvatarParamData) : void
      {
         this._apd_mount_xiongjijian = param1;
         if(this._apd_mount_xiongjijian != null)
         {
            this._apd_mount_xiongjijian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xiongjijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xiongjijian.useType = 2;
            this._apd_mount_xiongjijian.clearSameType = true;
         }
      }
      
      public function get apd_mount_wujinjian() : AvatarParamData
      {
         return this._apd_mount_wujinjian;
      }
      
      public function set apd_mount_wujinjian(param1:AvatarParamData) : void
      {
         this._apd_mount_wujinjian = param1;
         if(this._apd_mount_wujinjian != null)
         {
            this._apd_mount_wujinjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_wujinjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_wujinjian.useType = 2;
            this._apd_mount_wujinjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_shuntianjian() : AvatarParamData
      {
         return this._apd_mount_shuntianjian;
      }
      
      public function set apd_mount_shuntianjian(param1:AvatarParamData) : void
      {
         this._apd_mount_shuntianjian = param1;
         if(this._apd_mount_shuntianjian != null)
         {
            this._apd_mount_shuntianjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_shuntianjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_shuntianjian.useType = 2;
            this._apd_mount_shuntianjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_wangzheqicang() : AvatarParamData
      {
         return this._apd_mount_wangzheqicang;
      }
      
      public function set apd_mount_wangzheqicang(param1:AvatarParamData) : void
      {
         this._apd_mount_wangzheqicang = param1;
         if(this._apd_mount_wangzheqicang != null)
         {
            this._apd_mount_wangzheqicang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_wangzheqicang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_wangzheqicang.useType = 2;
            this._apd_mount_wangzheqicang.clearSameType = true;
         }
      }
      
      public function get apd_mount_bixuejian() : AvatarParamData
      {
         return this._apd_mount_bixuejian;
      }
      
      public function set apd_mount_bixuejian(param1:AvatarParamData) : void
      {
         this._apd_mount_bixuejian = param1;
         if(this._apd_mount_bixuejian != null)
         {
            this._apd_mount_bixuejian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_bixuejian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_bixuejian.useType = 2;
            this._apd_mount_bixuejian.clearSameType = true;
         }
      }
      
      public function get apd_mount_wuyijian() : AvatarParamData
      {
         return this._apd_mount_wuyijian;
      }
      
      public function set apd_mount_wuyijian(param1:AvatarParamData) : void
      {
         this._apd_mount_wuyijian = param1;
         if(this._apd_mount_wuyijian != null)
         {
            this._apd_mount_wuyijian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_wuyijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_wuyijian.useType = 2;
            this._apd_mount_wuyijian.clearSameType = true;
         }
      }
      
      public function get apd_mount_shijianshenqi() : AvatarParamData
      {
         return this._apd_mount_shijianshenqi;
      }
      
      public function set apd_mount_shijianshenqi(param1:AvatarParamData) : void
      {
         this._apd_mount_shijianshenqi = param1;
         if(this._apd_mount_shijianshenqi != null)
         {
            this._apd_mount_shijianshenqi.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_shijianshenqi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_shijianshenqi.useType = 2;
            this._apd_mount_shijianshenqi.clearSameType = true;
         }
      }
      
      public function get apd_mount_qingfengjian() : AvatarParamData
      {
         return this._apd_mount_qingfengjian;
      }
      
      public function set apd_mount_qingfengjian(param1:AvatarParamData) : void
      {
         this._apd_mount_qingfengjian = param1;
         if(this._apd_mount_qingfengjian != null)
         {
            this._apd_mount_qingfengjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_qingfengjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_qingfengjian.useType = 2;
            this._apd_mount_qingfengjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_huolinjian() : AvatarParamData
      {
         return this._apd_mount_huolinjian;
      }
      
      public function set apd_mount_huolinjian(param1:AvatarParamData) : void
      {
         this._apd_mount_huolinjian = param1;
         if(this._apd_mount_huolinjian != null)
         {
            this._apd_mount_huolinjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_huolinjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_huolinjian.useType = 2;
            this._apd_mount_huolinjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_zhuihunji() : AvatarParamData
      {
         return this._apd_mount_zhuihunji;
      }
      
      public function set apd_mount_zhuihunji(param1:AvatarParamData) : void
      {
         this._apd_mount_zhuihunji = param1;
         if(this._apd_mount_zhuihunji != null)
         {
            this._apd_mount_zhuihunji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_zhuihunji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_zhuihunji.useType = 2;
            this._apd_mount_zhuihunji.clearSameType = true;
         }
      }
      
      public function get apd_mount_biyudao() : AvatarParamData
      {
         return this._apd_mount_biyudao;
      }
      
      public function set apd_mount_biyudao(param1:AvatarParamData) : void
      {
         this._apd_mount_biyudao = param1;
         if(this._apd_mount_biyudao != null)
         {
            this._apd_mount_biyudao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_biyudao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_biyudao.useType = 2;
            this._apd_mount_biyudao.clearSameType = true;
         }
      }
      
      public function get apd_mount_wuwozhang() : AvatarParamData
      {
         return this._apd_mount_wuwozhang;
      }
      
      public function set apd_mount_wuwozhang(param1:AvatarParamData) : void
      {
         this._apd_mount_wuwozhang = param1;
         if(this._apd_mount_wuwozhang != null)
         {
            this._apd_mount_wuwozhang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_wuwozhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_wuwozhang.useType = 2;
            this._apd_mount_wuwozhang.clearSameType = true;
         }
      }
      
      public function get apd_mount_yehuohonglian() : AvatarParamData
      {
         return this._apd_mount_yehuohonglian;
      }
      
      public function set apd_mount_yehuohonglian(param1:AvatarParamData) : void
      {
         this._apd_mount_yehuohonglian = param1;
         if(this._apd_mount_yehuohonglian != null)
         {
            this._apd_mount_yehuohonglian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_yehuohonglian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_yehuohonglian.useType = 2;
            this._apd_mount_yehuohonglian.clearSameType = true;
         }
      }
      
      public function get apd_mount_mingyuedao() : AvatarParamData
      {
         return this._apd_mount_mingyuedao;
      }
      
      public function set apd_mount_mingyuedao(param1:AvatarParamData) : void
      {
         this._apd_mount_mingyuedao = param1;
         if(this._apd_mount_mingyuedao != null)
         {
            this._apd_mount_mingyuedao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_mingyuedao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_mingyuedao.useType = 2;
            this._apd_mount_mingyuedao.clearSameType = true;
         }
      }
      
      public function get apd_mount_qingfengjian2() : AvatarParamData
      {
         return this._apd_mount_qingfengjian2;
      }
      
      public function set apd_mount_qingfengjian2(param1:AvatarParamData) : void
      {
         this._apd_mount_qingfengjian2 = param1;
         if(this._apd_mount_qingfengjian2 != null)
         {
            this._apd_mount_qingfengjian2.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_qingfengjian2.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_qingfengjian2.useType = 2;
            this._apd_mount_qingfengjian2.clearSameType = true;
         }
      }
      
      public function get apd_mount_zhizunjian() : AvatarParamData
      {
         return this._apd_mount_zhizunjian;
      }
      
      public function set apd_mount_zhizunjian(param1:AvatarParamData) : void
      {
         this._apd_mount_zhizunjian = param1;
         if(this._apd_mount_zhizunjian != null)
         {
            this._apd_mount_zhizunjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_zhizunjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_zhizunjian.useType = 2;
            this._apd_mount_zhizunjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_baoleiji() : AvatarParamData
      {
         return this._apd_mount_baoleiji;
      }
      
      public function set apd_mount_baoleiji(param1:AvatarParamData) : void
      {
         this._apd_mount_baoleiji = param1;
         if(this._apd_mount_baoleiji != null)
         {
            this._apd_mount_baoleiji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_baoleiji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_baoleiji.useType = 2;
            this._apd_mount_baoleiji.clearSameType = true;
         }
      }
      
      public function get apd_mount_mingshengzhang() : AvatarParamData
      {
         return this._apd_mount_mingshengzhang;
      }
      
      public function set apd_mount_mingshengzhang(param1:AvatarParamData) : void
      {
         this._apd_mount_mingshengzhang = param1;
         if(this._apd_mount_mingshengzhang != null)
         {
            this._apd_mount_mingshengzhang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_mingshengzhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_mingshengzhang.useType = 2;
            this._apd_mount_mingshengzhang.clearSameType = true;
         }
      }
      
      public function get apd_mount_zunshijian() : AvatarParamData
      {
         return this._apd_mount_zunshijian;
      }
      
      public function set apd_mount_zunshijian(param1:AvatarParamData) : void
      {
         this._apd_mount_zunshijian = param1;
         if(this._apd_mount_zunshijian != null)
         {
            this._apd_mount_zunshijian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_zunshijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_zunshijian.useType = 2;
            this._apd_mount_zunshijian.clearSameType = true;
         }
      }
      
      public function get apd_mount_renzhezhang() : AvatarParamData
      {
         return this._apd_mount_renzhezhang;
      }
      
      public function set apd_mount_renzhezhang(param1:AvatarParamData) : void
      {
         this._apd_mount_renzhezhang = param1;
         if(this._apd_mount_renzhezhang != null)
         {
            this._apd_mount_renzhezhang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_renzhezhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_renzhezhang.useType = 2;
            this._apd_mount_renzhezhang.clearSameType = true;
         }
      }
      
      public function get apd_mount_zhizhejian() : AvatarParamData
      {
         return this._apd_mount_zhizhejian;
      }
      
      public function set apd_mount_zhizhejian(param1:AvatarParamData) : void
      {
         this._apd_mount_zhizhejian = param1;
         if(this._apd_mount_zhizhejian != null)
         {
            this._apd_mount_zhizhejian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_zhizhejian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_zhizhejian.useType = 2;
            this._apd_mount_zhizhejian.clearSameType = true;
         }
      }
      
      public function get apd_mount_yangmingjian() : AvatarParamData
      {
         return this._apd_mount_yangmingjian;
      }
      
      public function set apd_mount_yangmingjian(param1:AvatarParamData) : void
      {
         this._apd_mount_yangmingjian = param1;
         if(this._apd_mount_yangmingjian != null)
         {
            this._apd_mount_yangmingjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_yangmingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_yangmingjian.useType = 2;
            this._apd_mount_yangmingjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_xiwangjian() : AvatarParamData
      {
         return this._apd_mount_xiwangjian;
      }
      
      public function set apd_mount_xiwangjian(param1:AvatarParamData) : void
      {
         this._apd_mount_xiwangjian = param1;
         if(this._apd_mount_xiwangjian != null)
         {
            this._apd_mount_xiwangjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xiwangjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xiwangjian.useType = 2;
            this._apd_mount_xiwangjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_xuejingjian() : AvatarParamData
      {
         return this._apd_mount_xuejingjian;
      }
      
      public function set apd_mount_xuejingjian(param1:AvatarParamData) : void
      {
         this._apd_mount_xuejingjian = param1;
         if(this._apd_mount_xuejingjian != null)
         {
            this._apd_mount_xuejingjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xuejingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xuejingjian.useType = 2;
            this._apd_mount_xuejingjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_xuanbingjian() : AvatarParamData
      {
         return this._apd_mount_xuanbingjian;
      }
      
      public function set apd_mount_xuanbingjian(param1:AvatarParamData) : void
      {
         this._apd_mount_xuanbingjian = param1;
         if(this._apd_mount_xuanbingjian != null)
         {
            this._apd_mount_xuanbingjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xuanbingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xuanbingjian.useType = 2;
            this._apd_mount_xuanbingjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_pinganjian() : AvatarParamData
      {
         return this._apd_mount_pinganjian;
      }
      
      public function set apd_mount_pinganjian(param1:AvatarParamData) : void
      {
         this._apd_mount_pinganjian = param1;
         if(this._apd_mount_pinganjian != null)
         {
            this._apd_mount_pinganjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_pinganjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_pinganjian.useType = 2;
            this._apd_mount_pinganjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_qinghuajian() : AvatarParamData
      {
         return this._apd_mount_qinghuajian;
      }
      
      public function set apd_mount_qinghuajian(param1:AvatarParamData) : void
      {
         this._apd_mount_qinghuajian = param1;
         if(this._apd_mount_qinghuajian != null)
         {
            this._apd_mount_qinghuajian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_qinghuajian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_qinghuajian.useType = 2;
            this._apd_mount_qinghuajian.clearSameType = true;
         }
      }
      
      public function get apd_mount_yuxujian() : AvatarParamData
      {
         return this._apd_mount_yuxujian;
      }
      
      public function set apd_mount_yuxujian(param1:AvatarParamData) : void
      {
         this._apd_mount_yuxujian = param1;
         if(this._apd_mount_yuxujian != null)
         {
            this._apd_mount_yuxujian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_yuxujian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_yuxujian.useType = 2;
            this._apd_mount_yuxujian.clearSameType = true;
         }
      }
      
      public function get apd_mount_yuqingshan() : AvatarParamData
      {
         return this._apd_mount_yuqingshan;
      }
      
      public function set apd_mount_yuqingshan(param1:AvatarParamData) : void
      {
         this._apd_mount_yuqingshan = param1;
         if(this._apd_mount_yuqingshan != null)
         {
            this._apd_mount_yuqingshan.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_yuqingshan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_yuqingshan.useType = 2;
            this._apd_mount_yuqingshan.clearSameType = true;
         }
      }
      
      public function get apd_mount_huomodao() : AvatarParamData
      {
         return this._apd_mount_huomodao;
      }
      
      public function set apd_mount_huomodao(param1:AvatarParamData) : void
      {
         this._apd_mount_huomodao = param1;
         if(this._apd_mount_huomodao != null)
         {
            this._apd_mount_huomodao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_huomodao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_huomodao.useType = 2;
            this._apd_mount_huomodao.clearSameType = true;
         }
      }
      
      public function get apd_mount_yiheji() : AvatarParamData
      {
         return this._apd_mount_yiheji;
      }
      
      public function set apd_mount_yiheji(param1:AvatarParamData) : void
      {
         this._apd_mount_yiheji = param1;
         if(this._apd_mount_yiheji != null)
         {
            this._apd_mount_yiheji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_yiheji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_yiheji.useType = 2;
            this._apd_mount_yiheji.clearSameType = true;
         }
      }
      
      public function get apd_mount_erhejian() : AvatarParamData
      {
         return this._apd_mount_erhejian;
      }
      
      public function set apd_mount_erhejian(param1:AvatarParamData) : void
      {
         this._apd_mount_erhejian = param1;
         if(this._apd_mount_erhejian != null)
         {
            this._apd_mount_erhejian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_erhejian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_erhejian.useType = 2;
            this._apd_mount_erhejian.clearSameType = true;
         }
      }
      
      public function get apd_mount_sanhedao() : AvatarParamData
      {
         return this._apd_mount_sanhedao;
      }
      
      public function set apd_mount_sanhedao(param1:AvatarParamData) : void
      {
         this._apd_mount_sanhedao = param1;
         if(this._apd_mount_sanhedao != null)
         {
            this._apd_mount_sanhedao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_sanhedao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_sanhedao.useType = 2;
            this._apd_mount_sanhedao.clearSameType = true;
         }
      }
      
      public function get apd_mount_miehushan() : AvatarParamData
      {
         return this._apd_mount_miehushan;
      }
      
      public function set apd_mount_miehushan(param1:AvatarParamData) : void
      {
         this._apd_mount_miehushan = param1;
         if(this._apd_mount_miehushan != null)
         {
            this._apd_mount_miehushan.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_miehushan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_miehushan.useType = 2;
            this._apd_mount_miehushan.clearSameType = true;
         }
      }
      
      public function get apd_mount_qingmingdao() : AvatarParamData
      {
         return this._apd_mount_qingmingdao;
      }
      
      public function set apd_mount_qingmingdao(param1:AvatarParamData) : void
      {
         this._apd_mount_qingmingdao = param1;
         if(this._apd_mount_qingmingdao != null)
         {
            this._apd_mount_qingmingdao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_qingmingdao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_qingmingdao.useType = 2;
            this._apd_mount_qingmingdao.clearSameType = true;
         }
      }
      
      public function get apd_mount_huoxingfu() : AvatarParamData
      {
         return this._apd_mount_huoxingfu;
      }
      
      public function set apd_mount_huoxingfu(param1:AvatarParamData) : void
      {
         this._apd_mount_huoxingfu = param1;
         if(this._apd_mount_huoxingfu != null)
         {
            this._apd_mount_huoxingfu.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_huoxingfu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_huoxingfu.useType = 2;
            this._apd_mount_huoxingfu.clearSameType = true;
         }
      }
      
      public function get apd_mount_shenzao() : AvatarParamData
      {
         return this._apd_mount_shenzao;
      }
      
      public function set apd_mount_shenzao(param1:AvatarParamData) : void
      {
         this._apd_mount_shenzao = param1;
         if(this._apd_mount_shenzao != null)
         {
            this._apd_mount_shenzao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_shenzao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_shenzao.useType = 2;
            this._apd_mount_shenzao.clearSameType = true;
         }
      }
      
      public function get apd_mount_kaitiangong() : AvatarParamData
      {
         return this._apd_mount_kaitiangong;
      }
      
      public function set apd_mount_kaitiangong(param1:AvatarParamData) : void
      {
         this._apd_mount_kaitiangong = param1;
         if(this._apd_mount_kaitiangong != null)
         {
            this._apd_mount_kaitiangong.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_kaitiangong.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_kaitiangong.useType = 2;
            this._apd_mount_kaitiangong.clearSameType = true;
         }
      }
      
      public function get apd_mount_yanwenfenmo() : AvatarParamData
      {
         return this._apd_mount_yanwenfenmo;
      }
      
      public function set apd_mount_yanwenfenmo(param1:AvatarParamData) : void
      {
         this._apd_mount_yanwenfenmo = param1;
         if(this._apd_mount_yanwenfenmo != null)
         {
            this._apd_mount_yanwenfenmo.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_yanwenfenmo.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_yanwenfenmo.useType = 2;
            this._apd_mount_yanwenfenmo.clearSameType = true;
         }
      }
      
      public function get apd_mount_linglongzi() : AvatarParamData
      {
         return this._apd_mount_linglongzi;
      }
      
      public function set apd_mount_linglongzi(param1:AvatarParamData) : void
      {
         this._apd_mount_linglongzi = param1;
         if(this._apd_mount_linglongzi != null)
         {
            this._apd_mount_linglongzi.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_linglongzi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_linglongzi.useType = 2;
            this._apd_mount_linglongzi.clearSameType = true;
         }
      }
      
      public function get apd_mount_shashenjian() : AvatarParamData
      {
         return this._apd_mount_shashenjian;
      }
      
      public function set apd_mount_shashenjian(param1:AvatarParamData) : void
      {
         this._apd_mount_shashenjian = param1;
         if(this._apd_mount_shashenjian != null)
         {
            this._apd_mount_shashenjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_shashenjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_shashenjian.useType = 2;
            this._apd_mount_shashenjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_duanqingji() : AvatarParamData
      {
         return this._apd_mount_duanqingji;
      }
      
      public function set apd_mount_duanqingji(param1:AvatarParamData) : void
      {
         this._apd_mount_duanqingji = param1;
         if(this._apd_mount_duanqingji != null)
         {
            this._apd_mount_duanqingji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_duanqingji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_duanqingji.useType = 2;
            this._apd_mount_duanqingji.clearSameType = true;
         }
      }
      
      public function get apd_mount_nulong() : AvatarParamData
      {
         return this._apd_mount_nulong;
      }
      
      public function set apd_mount_nulong(param1:AvatarParamData) : void
      {
         this._apd_mount_nulong = param1;
         if(this._apd_mount_nulong != null)
         {
            this._apd_mount_nulong.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_nulong.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_nulong.useType = 2;
            this._apd_mount_nulong.clearSameType = true;
         }
      }
      
      public function get apd_mount_qinian() : AvatarParamData
      {
         return this._apd_mount_qinian;
      }
      
      public function set apd_mount_qinian(param1:AvatarParamData) : void
      {
         this._apd_mount_qinian = param1;
         if(this._apd_mount_qinian != null)
         {
            this._apd_mount_qinian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_qinian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_qinian.useType = 2;
            this._apd_mount_qinian.clearSameType = true;
         }
      }
      
      public function get apd_mount_zhuxian() : AvatarParamData
      {
         return this._apd_mount_zhuxian;
      }
      
      public function set apd_mount_zhuxian(param1:AvatarParamData) : void
      {
         this._apd_mount_zhuxian = param1;
         if(this._apd_mount_zhuxian != null)
         {
            this._apd_mount_zhuxian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_zhuxian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_zhuxian.useType = 2;
            this._apd_mount_zhuxian.clearSameType = true;
         }
      }
      
      public function get apd_mount_hanbing() : AvatarParamData
      {
         return this._apd_mount_hanbing;
      }
      
      public function set apd_mount_hanbing(param1:AvatarParamData) : void
      {
         this._apd_mount_hanbing = param1;
         if(this._apd_mount_hanbing != null)
         {
            this._apd_mount_hanbing.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_hanbing.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_hanbing.useType = 2;
            this._apd_mount_hanbing.clearSameType = true;
         }
      }
      
      public function get apd_mount_poshan() : AvatarParamData
      {
         return this._apd_mount_poshan;
      }
      
      public function set apd_mount_poshan(param1:AvatarParamData) : void
      {
         this._apd_mount_poshan = param1;
         if(this._apd_mount_poshan != null)
         {
            this._apd_mount_poshan.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_poshan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_poshan.useType = 2;
            this._apd_mount_poshan.clearSameType = true;
         }
      }
      
      public function get apd_mount_haiyu() : AvatarParamData
      {
         return this._apd_mount_haiyu;
      }
      
      public function set apd_mount_haiyu(param1:AvatarParamData) : void
      {
         this._apd_mount_haiyu = param1;
         if(this._apd_mount_haiyu != null)
         {
            this._apd_mount_haiyu.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_haiyu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_haiyu.useType = 2;
            this._apd_mount_haiyu.clearSameType = true;
         }
      }
      
      public function get apd_mount_tianmingdao() : AvatarParamData
      {
         return this._apd_mount_tianmingdao;
      }
      
      public function set apd_mount_tianmingdao(param1:AvatarParamData) : void
      {
         this._apd_mount_tianmingdao = param1;
         if(this._apd_mount_tianmingdao != null)
         {
            this._apd_mount_tianmingdao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_tianmingdao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_tianmingdao.useType = 2;
            this._apd_mount_tianmingdao.clearSameType = true;
         }
      }
      
      public function get apd_mount_jingtianyiji() : AvatarParamData
      {
         return this._apd_mount_jingtianyiji;
      }
      
      public function set apd_mount_jingtianyiji(param1:AvatarParamData) : void
      {
         this._apd_mount_jingtianyiji = param1;
         if(this._apd_mount_jingtianyiji != null)
         {
            this._apd_mount_jingtianyiji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_jingtianyiji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_jingtianyiji.useType = 2;
            this._apd_mount_jingtianyiji.clearSameType = true;
         }
      }
      
      public function get apd_mount_jingleijuedao() : AvatarParamData
      {
         return this._apd_mount_jingleijuedao;
      }
      
      public function set apd_mount_jingleijuedao(param1:AvatarParamData) : void
      {
         this._apd_mount_jingleijuedao = param1;
         if(this._apd_mount_jingleijuedao != null)
         {
            this._apd_mount_jingleijuedao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_jingleijuedao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_jingleijuedao.useType = 2;
            this._apd_mount_jingleijuedao.clearSameType = true;
         }
      }
      
      public function get apd_mount_yingxiongjian() : AvatarParamData
      {
         return this._apd_mount_yingxiongjian;
      }
      
      public function set apd_mount_yingxiongjian(param1:AvatarParamData) : void
      {
         this._apd_mount_yingxiongjian = param1;
         if(this._apd_mount_yingxiongjian != null)
         {
            this._apd_mount_yingxiongjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_yingxiongjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_yingxiongjian.useType = 2;
            this._apd_mount_yingxiongjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_changshengjian() : AvatarParamData
      {
         return this._apd_mount_changshengjian;
      }
      
      public function set apd_mount_changshengjian(param1:AvatarParamData) : void
      {
         this._apd_mount_changshengjian = param1;
         if(this._apd_mount_changshengjian != null)
         {
            this._apd_mount_changshengjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_changshengjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_changshengjian.useType = 2;
            this._apd_mount_changshengjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_guiyinggong() : AvatarParamData
      {
         return this._apd_mount_guiyinggong;
      }
      
      public function set apd_mount_guiyinggong(param1:AvatarParamData) : void
      {
         this._apd_mount_guiyinggong = param1;
         if(this._apd_mount_guiyinggong != null)
         {
            this._apd_mount_guiyinggong.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_guiyinggong.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_guiyinggong.useType = 2;
            this._apd_mount_guiyinggong.clearSameType = true;
         }
      }
      
      public function get apd_mount_jingleizhang() : AvatarParamData
      {
         return this._apd_mount_jingleizhang;
      }
      
      public function set apd_mount_jingleizhang(param1:AvatarParamData) : void
      {
         this._apd_mount_jingleizhang = param1;
         if(this._apd_mount_jingleizhang != null)
         {
            this._apd_mount_jingleizhang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_jingleizhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_jingleizhang.useType = 2;
            this._apd_mount_jingleizhang.clearSameType = true;
         }
      }
      
      public function get apd_mount_hundun() : AvatarParamData
      {
         return this._apd_mount_hundun;
      }
      
      public function set apd_mount_hundun(param1:AvatarParamData) : void
      {
         this._apd_mount_hundun = param1;
         if(this._apd_mount_hundun != null)
         {
            this._apd_mount_hundun.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_hundun.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_hundun.useType = 2;
            this._apd_mount_hundun.clearSameType = true;
         }
      }
      
      public function get apd_mount_dinghun() : AvatarParamData
      {
         return this._apd_mount_dinghun;
      }
      
      public function set apd_mount_dinghun(param1:AvatarParamData) : void
      {
         this._apd_mount_dinghun = param1;
         if(this._apd_mount_dinghun != null)
         {
            this._apd_mount_dinghun.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_dinghun.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_dinghun.useType = 2;
            this._apd_mount_dinghun.clearSameType = true;
         }
      }
      
      public function get apd_mount_tiandiwuji() : AvatarParamData
      {
         return this._apd_mount_tiandiwuji;
      }
      
      public function set apd_mount_tiandiwuji(param1:AvatarParamData) : void
      {
         this._apd_mount_tiandiwuji = param1;
         if(this._apd_mount_tiandiwuji != null)
         {
            this._apd_mount_tiandiwuji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_tiandiwuji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_tiandiwuji.useType = 2;
            this._apd_mount_tiandiwuji.clearSameType = true;
         }
      }
      
      public function get apd_mount_huoxingjian() : AvatarParamData
      {
         return this._apd_mount_huoxingjian;
      }
      
      public function set apd_mount_huoxingjian(param1:AvatarParamData) : void
      {
         this._apd_mount_huoxingjian = param1;
         if(this._apd_mount_huoxingjian != null)
         {
            this._apd_mount_huoxingjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_huoxingjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_huoxingjian.useType = 2;
            this._apd_mount_huoxingjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_wangzhefu() : AvatarParamData
      {
         return this._apd_mount_wangzhefu;
      }
      
      public function set apd_mount_wangzhefu(param1:AvatarParamData) : void
      {
         this._apd_mount_wangzhefu = param1;
         if(this._apd_mount_wangzhefu != null)
         {
            this._apd_mount_wangzhefu.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_wangzhefu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_wangzhefu.useType = 2;
            this._apd_mount_wangzhefu.clearSameType = true;
         }
      }
      
      public function get apd_mount_duomingdao() : AvatarParamData
      {
         return this._apd_mount_duomingdao;
      }
      
      public function set apd_mount_duomingdao(param1:AvatarParamData) : void
      {
         this._apd_mount_duomingdao = param1;
         if(this._apd_mount_duomingdao != null)
         {
            this._apd_mount_duomingdao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_duomingdao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_duomingdao.useType = 2;
            this._apd_mount_duomingdao.clearSameType = true;
         }
      }
      
      public function get apd_mount_xiaoshen() : AvatarParamData
      {
         return this._apd_mount_xiaoshen;
      }
      
      public function set apd_mount_xiaoshen(param1:AvatarParamData) : void
      {
         this._apd_mount_xiaoshen = param1;
         if(this._apd_mount_xiaoshen != null)
         {
            this._apd_mount_xiaoshen.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_xiaoshen.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_xiaoshen.useType = 2;
            this._apd_mount_xiaoshen.clearSameType = true;
         }
      }
      
      public function get apd_mount_wanshi() : AvatarParamData
      {
         return this._apd_mount_wanshi;
      }
      
      public function set apd_mount_wanshi(param1:AvatarParamData) : void
      {
         this._apd_mount_wanshi = param1;
         if(this._apd_mount_wanshi != null)
         {
            this._apd_mount_wanshi.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_wanshi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_wanshi.useType = 2;
            this._apd_mount_wanshi.clearSameType = true;
         }
      }
      
      public function get apd_mount_zhongqiu() : AvatarParamData
      {
         return this._apd_mount_zhongqiu;
      }
      
      public function set apd_mount_zhongqiu(param1:AvatarParamData) : void
      {
         this._apd_mount_zhongqiu = param1;
         if(this._apd_mount_zhongqiu != null)
         {
            this._apd_mount_zhongqiu.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_zhongqiu.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_zhongqiu.useType = 2;
            this._apd_mount_zhongqiu.clearSameType = true;
         }
      }
      
      public function get apd_mount_shenjian() : AvatarParamData
      {
         return this._apd_mount_shenjian;
      }
      
      public function set apd_mount_shenjian(param1:AvatarParamData) : void
      {
         this._apd_mount_shenjian = param1;
         if(this._apd_mount_shenjian != null)
         {
            this._apd_mount_shenjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_shenjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_shenjian.useType = 2;
            this._apd_mount_shenjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_yuhuazhang() : AvatarParamData
      {
         return this._apd_mount_yuhuazhang;
      }
      
      public function set apd_mount_yuhuazhang(param1:AvatarParamData) : void
      {
         this._apd_mount_yuhuazhang = param1;
         if(this._apd_mount_yuhuazhang != null)
         {
            this._apd_mount_yuhuazhang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_yuhuazhang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_yuhuazhang.useType = 2;
            this._apd_mount_yuhuazhang.clearSameType = true;
         }
      }
      
      public function get apd_mount_baniangong() : AvatarParamData
      {
         return this._apd_mount_baniangong;
      }
      
      public function set apd_mount_baniangong(param1:AvatarParamData) : void
      {
         this._apd_mount_baniangong = param1;
         if(this._apd_mount_baniangong != null)
         {
            this._apd_mount_baniangong.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_baniangong.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_baniangong.useType = 2;
            this._apd_mount_baniangong.clearSameType = true;
         }
      }
      
      public function get apd_mount_banianjian() : AvatarParamData
      {
         return this._apd_mount_banianjian;
      }
      
      public function set apd_mount_banianjian(param1:AvatarParamData) : void
      {
         this._apd_mount_banianjian = param1;
         if(this._apd_mount_banianjian != null)
         {
            this._apd_mount_banianjian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_banianjian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_banianjian.useType = 2;
            this._apd_mount_banianjian.clearSameType = true;
         }
      }
      
      public function get apd_mount_banianji() : AvatarParamData
      {
         return this._apd_mount_banianji;
      }
      
      public function set apd_mount_banianji(param1:AvatarParamData) : void
      {
         this._apd_mount_banianji = param1;
         if(this._apd_mount_banianji != null)
         {
            this._apd_mount_banianji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_banianji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_banianji.useType = 2;
            this._apd_mount_banianji.clearSameType = true;
         }
      }
      
      public function get apd_mount_2019shendan() : AvatarParamData
      {
         return this._apd_mount_2019shendan;
      }
      
      public function set apd_mount_2019shendan(param1:AvatarParamData) : void
      {
         this._apd_mount_2019shendan = param1;
         if(this._apd_mount_2019shendan != null)
         {
            this._apd_mount_2019shendan.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2019shendan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2019shendan.useType = 2;
            this._apd_mount_2019shendan.clearSameType = true;
         }
      }
      
      public function get apd_mount_2019gengzi() : AvatarParamData
      {
         return this._apd_mount_2019gengzi;
      }
      
      public function set apd_mount_2019gengzi(param1:AvatarParamData) : void
      {
         this._apd_mount_2019gengzi = param1;
         if(this._apd_mount_2019gengzi != null)
         {
            this._apd_mount_2019gengzi.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2019gengzi.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2019gengzi.useType = 2;
            this._apd_mount_2019gengzi.clearSameType = true;
         }
      }
      
      public function get apd_mount_2019feihua() : AvatarParamData
      {
         return this._apd_mount_2019feihua;
      }
      
      public function set apd_mount_2019feihua(param1:AvatarParamData) : void
      {
         this._apd_mount_2019feihua = param1;
         if(this._apd_mount_2019feihua != null)
         {
            this._apd_mount_2019feihua.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2019feihua.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2019feihua.useType = 2;
            this._apd_mount_2019feihua.clearSameType = true;
         }
      }
      
      public function get apd_mount_2019xiongwang() : AvatarParamData
      {
         return this._apd_mount_2019xiongwang;
      }
      
      public function set apd_mount_2019xiongwang(param1:AvatarParamData) : void
      {
         this._apd_mount_2019xiongwang = param1;
         if(this._apd_mount_2019xiongwang != null)
         {
            this._apd_mount_2019xiongwang.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2019xiongwang.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2019xiongwang.useType = 2;
            this._apd_mount_2019xiongwang.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020xuehuan() : AvatarParamData
      {
         return this._apd_mount_2020xuehuan;
      }
      
      public function set apd_mount_2020xuehuan(param1:AvatarParamData) : void
      {
         this._apd_mount_2020xuehuan = param1;
         if(this._apd_mount_2020xuehuan != null)
         {
            this._apd_mount_2020xuehuan.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020xuehuan.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020xuehuan.useType = 2;
            this._apd_mount_2020xuehuan.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020badao() : AvatarParamData
      {
         return this._apd_mount_2020badao;
      }
      
      public function set apd_mount_2020badao(param1:AvatarParamData) : void
      {
         this._apd_mount_2020badao = param1;
         if(this._apd_mount_2020badao != null)
         {
            this._apd_mount_2020badao.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020badao.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020badao.useType = 2;
            this._apd_mount_2020badao.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian01() : AvatarParamData
      {
         return this._apd_mount_2020baojian01;
      }
      
      public function set apd_mount_2020baojian01(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian01 = param1;
         if(this._apd_mount_2020baojian01 != null)
         {
            this._apd_mount_2020baojian01.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian01.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian01.useType = 2;
            this._apd_mount_2020baojian01.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian02() : AvatarParamData
      {
         return this._apd_mount_2020baojian02;
      }
      
      public function set apd_mount_2020baojian02(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian02 = param1;
         if(this._apd_mount_2020baojian02 != null)
         {
            this._apd_mount_2020baojian02.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian02.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian02.useType = 2;
            this._apd_mount_2020baojian02.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian03() : AvatarParamData
      {
         return this._apd_mount_2020baojian03;
      }
      
      public function set apd_mount_2020baojian03(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian03 = param1;
         if(this._apd_mount_2020baojian03 != null)
         {
            this._apd_mount_2020baojian03.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian03.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian03.useType = 2;
            this._apd_mount_2020baojian03.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian04() : AvatarParamData
      {
         return this._apd_mount_2020baojian04;
      }
      
      public function set apd_mount_2020baojian04(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian04 = param1;
         if(this._apd_mount_2020baojian04 != null)
         {
            this._apd_mount_2020baojian04.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian04.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian04.useType = 2;
            this._apd_mount_2020baojian04.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian05() : AvatarParamData
      {
         return this._apd_mount_2020baojian05;
      }
      
      public function set apd_mount_2020baojian05(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian05 = param1;
         if(this._apd_mount_2020baojian05 != null)
         {
            this._apd_mount_2020baojian05.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian05.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian05.useType = 2;
            this._apd_mount_2020baojian05.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian06() : AvatarParamData
      {
         return this._apd_mount_2020baojian06;
      }
      
      public function set apd_mount_2020baojian06(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian06 = param1;
         if(this._apd_mount_2020baojian06 != null)
         {
            this._apd_mount_2020baojian06.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian06.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian06.useType = 2;
            this._apd_mount_2020baojian06.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian07() : AvatarParamData
      {
         return this._apd_mount_2020baojian07;
      }
      
      public function set apd_mount_2020baojian07(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian07 = param1;
         if(this._apd_mount_2020baojian07 != null)
         {
            this._apd_mount_2020baojian07.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian07.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian07.useType = 2;
            this._apd_mount_2020baojian07.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian08() : AvatarParamData
      {
         return this._apd_mount_2020baojian08;
      }
      
      public function set apd_mount_2020baojian08(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian08 = param1;
         if(this._apd_mount_2020baojian08 != null)
         {
            this._apd_mount_2020baojian08.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian08.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian08.useType = 2;
            this._apd_mount_2020baojian08.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian09() : AvatarParamData
      {
         return this._apd_mount_2020baojian09;
      }
      
      public function set apd_mount_2020baojian09(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian09 = param1;
         if(this._apd_mount_2020baojian09 != null)
         {
            this._apd_mount_2020baojian09.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian09.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian09.useType = 2;
            this._apd_mount_2020baojian09.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian10() : AvatarParamData
      {
         return this._apd_mount_2020baojian10;
      }
      
      public function set apd_mount_2020baojian10(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian10 = param1;
         if(this._apd_mount_2020baojian10 != null)
         {
            this._apd_mount_2020baojian10.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian10.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian10.useType = 2;
            this._apd_mount_2020baojian10.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian11() : AvatarParamData
      {
         return this._apd_mount_2020baojian11;
      }
      
      public function set apd_mount_2020baojian11(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian11 = param1;
         if(this._apd_mount_2020baojian11 != null)
         {
            this._apd_mount_2020baojian11.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian11.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian11.useType = 2;
            this._apd_mount_2020baojian11.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian12() : AvatarParamData
      {
         return this._apd_mount_2020baojian12;
      }
      
      public function set apd_mount_2020baojian12(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian12 = param1;
         if(this._apd_mount_2020baojian12 != null)
         {
            this._apd_mount_2020baojian12.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian12.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian12.useType = 2;
            this._apd_mount_2020baojian12.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian13() : AvatarParamData
      {
         return this._apd_mount_2020baojian13;
      }
      
      public function set apd_mount_2020baojian13(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian13 = param1;
         if(this._apd_mount_2020baojian13 != null)
         {
            this._apd_mount_2020baojian13.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian13.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian13.useType = 2;
            this._apd_mount_2020baojian13.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian14() : AvatarParamData
      {
         return this._apd_mount_2020baojian14;
      }
      
      public function set apd_mount_2020baojian14(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian14 = param1;
         if(this._apd_mount_2020baojian14 != null)
         {
            this._apd_mount_2020baojian14.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian14.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian14.useType = 2;
            this._apd_mount_2020baojian14.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian15() : AvatarParamData
      {
         return this._apd_mount_2020baojian15;
      }
      
      public function set apd_mount_2020baojian15(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian15 = param1;
         if(this._apd_mount_2020baojian15 != null)
         {
            this._apd_mount_2020baojian15.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian15.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian15.useType = 2;
            this._apd_mount_2020baojian15.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian16() : AvatarParamData
      {
         return this._apd_mount_2020baojian16;
      }
      
      public function set apd_mount_2020baojian16(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian16 = param1;
         if(this._apd_mount_2020baojian16 != null)
         {
            this._apd_mount_2020baojian16.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian16.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian16.useType = 2;
            this._apd_mount_2020baojian16.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian17() : AvatarParamData
      {
         return this._apd_mount_2020baojian17;
      }
      
      public function set apd_mount_2020baojian17(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian17 = param1;
         if(this._apd_mount_2020baojian17 != null)
         {
            this._apd_mount_2020baojian17.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian17.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian17.useType = 2;
            this._apd_mount_2020baojian17.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian18() : AvatarParamData
      {
         return this._apd_mount_2020baojian18;
      }
      
      public function set apd_mount_2020baojian18(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian18 = param1;
         if(this._apd_mount_2020baojian18 != null)
         {
            this._apd_mount_2020baojian18.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian18.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian18.useType = 2;
            this._apd_mount_2020baojian18.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian19() : AvatarParamData
      {
         return this._apd_mount_2020baojian19;
      }
      
      public function set apd_mount_2020baojian19(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian19 = param1;
         if(this._apd_mount_2020baojian19 != null)
         {
            this._apd_mount_2020baojian19.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian19.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian19.useType = 2;
            this._apd_mount_2020baojian19.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian20() : AvatarParamData
      {
         return this._apd_mount_2020baojian20;
      }
      
      public function set apd_mount_2020baojian20(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian20 = param1;
         if(this._apd_mount_2020baojian20 != null)
         {
            this._apd_mount_2020baojian20.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian20.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian20.useType = 2;
            this._apd_mount_2020baojian20.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian21() : AvatarParamData
      {
         return this._apd_mount_2020baojian21;
      }
      
      public function set apd_mount_2020baojian21(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian21 = param1;
         if(this._apd_mount_2020baojian21 != null)
         {
            this._apd_mount_2020baojian21.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian21.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian21.useType = 2;
            this._apd_mount_2020baojian21.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian22() : AvatarParamData
      {
         return this._apd_mount_2020baojian22;
      }
      
      public function set apd_mount_2020baojian22(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian22 = param1;
         if(this._apd_mount_2020baojian22 != null)
         {
            this._apd_mount_2020baojian22.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian22.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian22.useType = 2;
            this._apd_mount_2020baojian22.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian23() : AvatarParamData
      {
         return this._apd_mount_2020baojian23;
      }
      
      public function set apd_mount_2020baojian23(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian23 = param1;
         if(this._apd_mount_2020baojian23 != null)
         {
            this._apd_mount_2020baojian23.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian23.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian23.useType = 2;
            this._apd_mount_2020baojian23.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian24() : AvatarParamData
      {
         return this._apd_mount_2020baojian24;
      }
      
      public function set apd_mount_2020baojian24(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian24 = param1;
         if(this._apd_mount_2020baojian24 != null)
         {
            this._apd_mount_2020baojian24.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian24.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian24.useType = 2;
            this._apd_mount_2020baojian24.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian25() : AvatarParamData
      {
         return this._apd_mount_2020baojian25;
      }
      
      public function set apd_mount_2020baojian25(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian25 = param1;
         if(this._apd_mount_2020baojian25 != null)
         {
            this._apd_mount_2020baojian25.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian25.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian25.useType = 2;
            this._apd_mount_2020baojian25.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian26() : AvatarParamData
      {
         return this._apd_mount_2020baojian26;
      }
      
      public function set apd_mount_2020baojian26(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian26 = param1;
         if(this._apd_mount_2020baojian26 != null)
         {
            this._apd_mount_2020baojian26.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian26.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian26.useType = 2;
            this._apd_mount_2020baojian26.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian27() : AvatarParamData
      {
         return this._apd_mount_2020baojian27;
      }
      
      public function set apd_mount_2020baojian27(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian27 = param1;
         if(this._apd_mount_2020baojian27 != null)
         {
            this._apd_mount_2020baojian27.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian27.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian27.useType = 2;
            this._apd_mount_2020baojian27.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian28() : AvatarParamData
      {
         return this._apd_mount_2020baojian28;
      }
      
      public function set apd_mount_2020baojian28(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian28 = param1;
         if(this._apd_mount_2020baojian28 != null)
         {
            this._apd_mount_2020baojian28.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian28.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian28.useType = 2;
            this._apd_mount_2020baojian28.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian29() : AvatarParamData
      {
         return this._apd_mount_2020baojian29;
      }
      
      public function set apd_mount_2020baojian29(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian29 = param1;
         if(this._apd_mount_2020baojian29 != null)
         {
            this._apd_mount_2020baojian29.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian29.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian29.useType = 2;
            this._apd_mount_2020baojian29.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian30() : AvatarParamData
      {
         return this._apd_mount_2020baojian30;
      }
      
      public function set apd_mount_2020baojian30(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian30 = param1;
         if(this._apd_mount_2020baojian30 != null)
         {
            this._apd_mount_2020baojian30.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian30.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian30.useType = 2;
            this._apd_mount_2020baojian30.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian31() : AvatarParamData
      {
         return this._apd_mount_2020baojian31;
      }
      
      public function set apd_mount_2020baojian31(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian31 = param1;
         if(this._apd_mount_2020baojian31 != null)
         {
            this._apd_mount_2020baojian31.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian31.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian31.useType = 2;
            this._apd_mount_2020baojian31.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian32() : AvatarParamData
      {
         return this._apd_mount_2020baojian32;
      }
      
      public function set apd_mount_2020baojian32(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian32 = param1;
         if(this._apd_mount_2020baojian32 != null)
         {
            this._apd_mount_2020baojian32.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian32.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian32.useType = 2;
            this._apd_mount_2020baojian32.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian33() : AvatarParamData
      {
         return this._apd_mount_2020baojian33;
      }
      
      public function set apd_mount_2020baojian33(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian33 = param1;
         if(this._apd_mount_2020baojian33 != null)
         {
            this._apd_mount_2020baojian33.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian33.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian33.useType = 2;
            this._apd_mount_2020baojian33.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian34() : AvatarParamData
      {
         return this._apd_mount_2020baojian34;
      }
      
      public function set apd_mount_2020baojian34(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian34 = param1;
         if(this._apd_mount_2020baojian34 != null)
         {
            this._apd_mount_2020baojian34.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian34.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian34.useType = 2;
            this._apd_mount_2020baojian34.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian35() : AvatarParamData
      {
         return this._apd_mount_2020baojian35;
      }
      
      public function set apd_mount_2020baojian35(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian35 = param1;
         if(this._apd_mount_2020baojian35 != null)
         {
            this._apd_mount_2020baojian35.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian35.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian35.useType = 2;
            this._apd_mount_2020baojian35.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian36() : AvatarParamData
      {
         return this._apd_mount_2020baojian36;
      }
      
      public function set apd_mount_2020baojian36(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian36 = param1;
         if(this._apd_mount_2020baojian36 != null)
         {
            this._apd_mount_2020baojian36.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian36.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian36.useType = 2;
            this._apd_mount_2020baojian36.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian37() : AvatarParamData
      {
         return this._apd_mount_2020baojian37;
      }
      
      public function set apd_mount_2020baojian37(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian37 = param1;
         if(this._apd_mount_2020baojian37 != null)
         {
            this._apd_mount_2020baojian37.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian37.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian37.useType = 2;
            this._apd_mount_2020baojian37.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian38() : AvatarParamData
      {
         return this._apd_mount_2020baojian38;
      }
      
      public function set apd_mount_2020baojian38(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian38 = param1;
         if(this._apd_mount_2020baojian38 != null)
         {
            this._apd_mount_2020baojian38.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian38.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian38.useType = 2;
            this._apd_mount_2020baojian38.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian39() : AvatarParamData
      {
         return this._apd_mount_2020baojian39;
      }
      
      public function set apd_mount_2020baojian39(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian39 = param1;
         if(this._apd_mount_2020baojian39 != null)
         {
            this._apd_mount_2020baojian39.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian39.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian39.useType = 2;
            this._apd_mount_2020baojian39.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian40() : AvatarParamData
      {
         return this._apd_mount_2020baojian40;
      }
      
      public function set apd_mount_2020baojian40(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian40 = param1;
         if(this._apd_mount_2020baojian40 != null)
         {
            this._apd_mount_2020baojian40.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian40.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian40.useType = 2;
            this._apd_mount_2020baojian40.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian41() : AvatarParamData
      {
         return this._apd_mount_2020baojian41;
      }
      
      public function set apd_mount_2020baojian41(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian41 = param1;
         if(this._apd_mount_2020baojian41 != null)
         {
            this._apd_mount_2020baojian41.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian41.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian41.useType = 2;
            this._apd_mount_2020baojian41.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian42() : AvatarParamData
      {
         return this._apd_mount_2020baojian42;
      }
      
      public function set apd_mount_2020baojian42(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian42 = param1;
         if(this._apd_mount_2020baojian42 != null)
         {
            this._apd_mount_2020baojian42.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian42.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian42.useType = 2;
            this._apd_mount_2020baojian42.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian43() : AvatarParamData
      {
         return this._apd_mount_2020baojian43;
      }
      
      public function set apd_mount_2020baojian43(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian43 = param1;
         if(this._apd_mount_2020baojian43 != null)
         {
            this._apd_mount_2020baojian43.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian43.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian43.useType = 2;
            this._apd_mount_2020baojian43.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian44() : AvatarParamData
      {
         return this._apd_mount_2020baojian44;
      }
      
      public function set apd_mount_2020baojian44(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian44 = param1;
         if(this._apd_mount_2020baojian44 != null)
         {
            this._apd_mount_2020baojian44.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian44.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian44.useType = 2;
            this._apd_mount_2020baojian44.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian45() : AvatarParamData
      {
         return this._apd_mount_2020baojian45;
      }
      
      public function set apd_mount_2020baojian45(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian45 = param1;
         if(this._apd_mount_2020baojian45 != null)
         {
            this._apd_mount_2020baojian45.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian45.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian45.useType = 2;
            this._apd_mount_2020baojian45.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian46() : AvatarParamData
      {
         return this._apd_mount_2020baojian46;
      }
      
      public function set apd_mount_2020baojian46(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian46 = param1;
         if(this._apd_mount_2020baojian46 != null)
         {
            this._apd_mount_2020baojian46.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian46.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian46.useType = 2;
            this._apd_mount_2020baojian46.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian47() : AvatarParamData
      {
         return this._apd_mount_2020baojian47;
      }
      
      public function set apd_mount_2020baojian47(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian47 = param1;
         if(this._apd_mount_2020baojian47 != null)
         {
            this._apd_mount_2020baojian47.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian47.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian47.useType = 2;
            this._apd_mount_2020baojian47.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian48() : AvatarParamData
      {
         return this._apd_mount_2020baojian48;
      }
      
      public function set apd_mount_2020baojian48(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian48 = param1;
         if(this._apd_mount_2020baojian48 != null)
         {
            this._apd_mount_2020baojian48.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian48.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian48.useType = 2;
            this._apd_mount_2020baojian48.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian49() : AvatarParamData
      {
         return this._apd_mount_2020baojian49;
      }
      
      public function set apd_mount_2020baojian49(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian49 = param1;
         if(this._apd_mount_2020baojian49 != null)
         {
            this._apd_mount_2020baojian49.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian49.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian49.useType = 2;
            this._apd_mount_2020baojian49.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian50() : AvatarParamData
      {
         return this._apd_mount_2020baojian50;
      }
      
      public function set apd_mount_2020baojian50(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian50 = param1;
         if(this._apd_mount_2020baojian50 != null)
         {
            this._apd_mount_2020baojian50.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian50.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian50.useType = 2;
            this._apd_mount_2020baojian50.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian51() : AvatarParamData
      {
         return this._apd_mount_2020baojian51;
      }
      
      public function set apd_mount_2020baojian51(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian51 = param1;
         if(this._apd_mount_2020baojian51 != null)
         {
            this._apd_mount_2020baojian51.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian51.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian51.useType = 2;
            this._apd_mount_2020baojian51.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian52() : AvatarParamData
      {
         return this._apd_mount_2020baojian52;
      }
      
      public function set apd_mount_2020baojian52(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian52 = param1;
         if(this._apd_mount_2020baojian52 != null)
         {
            this._apd_mount_2020baojian52.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian52.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian52.useType = 2;
            this._apd_mount_2020baojian52.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian53() : AvatarParamData
      {
         return this._apd_mount_2020baojian53;
      }
      
      public function set apd_mount_2020baojian53(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian53 = param1;
         if(this._apd_mount_2020baojian53 != null)
         {
            this._apd_mount_2020baojian53.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian53.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian53.useType = 2;
            this._apd_mount_2020baojian53.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian54() : AvatarParamData
      {
         return this._apd_mount_2020baojian54;
      }
      
      public function set apd_mount_2020baojian54(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian54 = param1;
         if(this._apd_mount_2020baojian54 != null)
         {
            this._apd_mount_2020baojian54.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian54.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian54.useType = 2;
            this._apd_mount_2020baojian54.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian55() : AvatarParamData
      {
         return this._apd_mount_2020baojian55;
      }
      
      public function set apd_mount_2020baojian55(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian55 = param1;
         if(this._apd_mount_2020baojian55 != null)
         {
            this._apd_mount_2020baojian55.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian55.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian55.useType = 2;
            this._apd_mount_2020baojian55.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian56() : AvatarParamData
      {
         return this._apd_mount_2020baojian56;
      }
      
      public function set apd_mount_2020baojian56(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian56 = param1;
         if(this._apd_mount_2020baojian56 != null)
         {
            this._apd_mount_2020baojian56.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian56.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian56.useType = 2;
            this._apd_mount_2020baojian56.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian57() : AvatarParamData
      {
         return this._apd_mount_2020baojian57;
      }
      
      public function set apd_mount_2020baojian57(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian57 = param1;
         if(this._apd_mount_2020baojian57 != null)
         {
            this._apd_mount_2020baojian57.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian57.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian57.useType = 2;
            this._apd_mount_2020baojian57.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian58() : AvatarParamData
      {
         return this._apd_mount_2020baojian58;
      }
      
      public function set apd_mount_2020baojian58(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian58 = param1;
         if(this._apd_mount_2020baojian58 != null)
         {
            this._apd_mount_2020baojian58.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian58.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian58.useType = 2;
            this._apd_mount_2020baojian58.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian59() : AvatarParamData
      {
         return this._apd_mount_2020baojian59;
      }
      
      public function set apd_mount_2020baojian59(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian59 = param1;
         if(this._apd_mount_2020baojian59 != null)
         {
            this._apd_mount_2020baojian59.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian59.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian59.useType = 2;
            this._apd_mount_2020baojian59.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian60() : AvatarParamData
      {
         return this._apd_mount_2020baojian60;
      }
      
      public function set apd_mount_2020baojian60(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian60 = param1;
         if(this._apd_mount_2020baojian60 != null)
         {
            this._apd_mount_2020baojian60.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian60.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian60.useType = 2;
            this._apd_mount_2020baojian60.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian61() : AvatarParamData
      {
         return this._apd_mount_2020baojian61;
      }
      
      public function set apd_mount_2020baojian61(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian61 = param1;
         if(this._apd_mount_2020baojian61 != null)
         {
            this._apd_mount_2020baojian61.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian61.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian61.useType = 2;
            this._apd_mount_2020baojian61.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian62() : AvatarParamData
      {
         return this._apd_mount_2020baojian62;
      }
      
      public function set apd_mount_2020baojian62(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian62 = param1;
         if(this._apd_mount_2020baojian62 != null)
         {
            this._apd_mount_2020baojian62.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian62.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian62.useType = 2;
            this._apd_mount_2020baojian62.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian63() : AvatarParamData
      {
         return this._apd_mount_2020baojian63;
      }
      
      public function set apd_mount_2020baojian63(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian63 = param1;
         if(this._apd_mount_2020baojian63 != null)
         {
            this._apd_mount_2020baojian63.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian63.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian63.useType = 2;
            this._apd_mount_2020baojian63.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian64() : AvatarParamData
      {
         return this._apd_mount_2020baojian64;
      }
      
      public function set apd_mount_2020baojian64(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian64 = param1;
         if(this._apd_mount_2020baojian64 != null)
         {
            this._apd_mount_2020baojian64.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian64.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian64.useType = 2;
            this._apd_mount_2020baojian64.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian65() : AvatarParamData
      {
         return this._apd_mount_2020baojian65;
      }
      
      public function set apd_mount_2020baojian65(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian65 = param1;
         if(this._apd_mount_2020baojian65 != null)
         {
            this._apd_mount_2020baojian65.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian65.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian65.useType = 2;
            this._apd_mount_2020baojian65.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian66() : AvatarParamData
      {
         return this._apd_mount_2020baojian66;
      }
      
      public function set apd_mount_2020baojian66(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian66 = param1;
         if(this._apd_mount_2020baojian66 != null)
         {
            this._apd_mount_2020baojian66.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian66.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian66.useType = 2;
            this._apd_mount_2020baojian66.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian67() : AvatarParamData
      {
         return this._apd_mount_2020baojian67;
      }
      
      public function set apd_mount_2020baojian67(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian67 = param1;
         if(this._apd_mount_2020baojian67 != null)
         {
            this._apd_mount_2020baojian67.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian67.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian67.useType = 2;
            this._apd_mount_2020baojian67.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian68() : AvatarParamData
      {
         return this._apd_mount_2020baojian68;
      }
      
      public function set apd_mount_2020baojian68(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian68 = param1;
         if(this._apd_mount_2020baojian68 != null)
         {
            this._apd_mount_2020baojian68.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian68.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian68.useType = 2;
            this._apd_mount_2020baojian68.clearSameType = true;
         }
      }
      
      public function get apd_mount_2020baojian69() : AvatarParamData
      {
         return this._apd_mount_2020baojian69;
      }
      
      public function set apd_mount_2020baojian69(param1:AvatarParamData) : void
      {
         this._apd_mount_2020baojian69 = param1;
         if(this._apd_mount_2020baojian69 != null)
         {
            this._apd_mount_2020baojian69.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_2020baojian69.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_2020baojian69.useType = 2;
            this._apd_mount_2020baojian69.clearSameType = true;
         }
      }
      
      public function get apd_mount_chengjiechangji() : AvatarParamData
      {
         return this._apd_mount_chengjiechangji;
      }
      
      public function set apd_mount_chengjiechangji(param1:AvatarParamData) : void
      {
         this._apd_mount_chengjiechangji = param1;
         if(this._apd_mount_chengjiechangji != null)
         {
            this._apd_mount_chengjiechangji.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_chengjiechangji.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_chengjiechangji.useType = 2;
            this._apd_mount_chengjiechangji.clearSameType = true;
         }
      }
      
      public function get apd_mount_tianxiejian() : AvatarParamData
      {
         return this._apd_mount_tianxiejian;
      }
      
      public function set apd_mount_tianxiejian(param1:AvatarParamData) : void
      {
         this._apd_mount_tianxiejian = param1;
         if(this._apd_mount_tianxiejian != null)
         {
            this._apd_mount_tianxiejian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_tianxiejian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_tianxiejian.useType = 2;
            this._apd_mount_tianxiejian.clearSameType = true;
         }
      }
      
      public function get apd_mount_junzijian() : AvatarParamData
      {
         return this._apd_mount_junzijian;
      }
      
      public function set apd_mount_junzijian(param1:AvatarParamData) : void
      {
         this._apd_mount_junzijian = param1;
         if(this._apd_mount_junzijian != null)
         {
            this._apd_mount_junzijian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_junzijian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_junzijian.useType = 2;
            this._apd_mount_junzijian.clearSameType = true;
         }
      }
      
      public function get apd_mount_wangzhejian() : AvatarParamData
      {
         return this._apd_mount_wangzhejian;
      }
      
      public function set apd_mount_wangzhejian(param1:AvatarParamData) : void
      {
         this._apd_mount_wangzhejian = param1;
         if(this._apd_mount_wangzhejian != null)
         {
            this._apd_mount_wangzhejian.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_wangzhejian.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_wangzhejian.useType = 2;
            this._apd_mount_wangzhejian.clearSameType = true;
         }
      }
      
      public function get apd_mount_tianjing() : AvatarParamData
      {
         return this._apd_mount_tianjing;
      }
      
      public function set apd_mount_tianjing(param1:AvatarParamData) : void
      {
         this._apd_mount_tianjing = param1;
         if(this._apd_mount_tianjing != null)
         {
            this._apd_mount_tianjing.id = SpeciaAvatarPartID.MOUNT_WEAPON;
            this._apd_mount_tianjing.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.WEAPON);
            this._apd_mount_tianjing.useType = 2;
            this._apd_mount_tianjing.clearSameType = true;
         }
      }
      
      public function get apd_mount_bow() : AvatarParamData
      {
         return this._apd_mount_bow;
      }
      
      public function set apd_mount_bow(param1:AvatarParamData) : void
      {
         this._apd_mount_bow = param1;
         if(this._apd_mount_bow != null)
         {
            this._apd_mount_bow.id = SpeciaAvatarPartID.MOUNT_BOW;
            this._apd_mount_bow.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.BOW);
            this._apd_mount_bow.useType = 2;
            this._apd_mount_bow.clearSameType = true;
         }
      }
      
      public function get apd_mount_zhenhun() : AvatarParamData
      {
         return this._apd_mount_zhenhun;
      }
      
      public function set apd_mount_zhenhun(param1:AvatarParamData) : void
      {
         this._apd_mount_zhenhun = param1;
         if(this._apd_mount_zhenhun != null)
         {
            this._apd_mount_zhenhun.id = SpeciaAvatarPartID.MOUNT_ZHENHUN;
            this._apd_mount_zhenhun.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.ZHENHUN);
            this._apd_mount_zhenhun.useType = 2;
            this._apd_mount_zhenhun.clearSameType = true;
         }
      }
      
      public function get apd_mount() : AvatarParamData
      {
         return this._apd_mount;
      }
      
      public function set apd_mount(param1:AvatarParamData) : void
      {
         this._apd_mount = param1;
         if(this._apd_mount != null)
         {
            this._apd_mount.id = SpeciaAvatarPartID.MOUNT;
            this._apd_mount.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.MOUNT);
            this._apd_mount.useType = 2;
            this._apd_mount.clearSameType = true;
            this._apd_mount.useSpecilizeXY = false;
         }
      }
      
      public function teshuWuqiArr() : Array
      {
         var _loc1_:Array = null;
         return new Array([this.apd_ylzr,this.apd_mount_ylzr,ItemPositionRange.POSTION_YLZR],[this.apd_xyj,this.apd_mount_xyj,ItemPositionRange.POSTION_STDRJ],[this.apd_longyin,this.apd_mount_longyin,ItemPositionRange.POSITION_NB_WEAPON_ARR[0]],[this.apd_shenqi,this.apd_mount_shenqi,ItemPositionRange.POSTION_SHENQI],[this.apd_quanshen,this.apd_mount_quanshen,ItemPositionRange.POSITION_NB_WEAPON_ARR[1]],[this.apd_longya,this.apd_mount_longya,ItemPositionRange.POSITION_NB_WEAPON_ARR[2]],[this.apd_aojian,this.apd_mount_aojian,ItemPositionRange.POSTION_AOJIAN],[this.apd_potianren,this.apd_mount_potianren,ItemPositionRange.POSITION_NB_WEAPON_ARR[9]],[this.apd_tianshang,this.apd_mount_tianshang,ItemPositionRange.POSITION_NB_WEAPON_ARR[3]],[this.apd_liekong,this.apd_mount_liekong,ItemPositionRange.POSITION_NB_WEAPON_ARR[4]],[this.apd_pangu,this.apd_mount_pangu,ItemPositionRange.POSITION_NB_WEAPON_ARR[5]],[this.apd_xueyindao,this.apd_mount_xueyindao,ItemPositionRange.POSITION_NB_WEAPON_ARR[8]],[this.apd_gjmy
         ,this.apd_mount_gjmy,ItemPositionRange.POSTION_GJMY],[this.apd_longya1,this.apd_mount_longya1,ItemPositionRange.POSITION_LONGYA],[this.apd_yanyuedao,this.apd_mount_yanyuedao,ItemPositionRange.POSITION_YAYUEDAO],[this.apd_xuantiezhongjian,this.apd_mount_xuantiezhongjian,ItemPositionRange.POSITION_XUANTIEZHONGJIAN],[this.apd_guangmingzhang,this.apd_mount_guangmingzhang,ItemPositionRange.POSITION_GUANGMINGZHANG],[this.apd_huimie,this.apd_mount_huimie,ItemPositionRange.POSITION_HUIMIE],[this.apd_zhumozhang,this.apd_mount_zhumozhang,ItemPositionRange.POSITION_ZHUMOZHANG],[this.apd_chiyan,this.apd_mount_chiyan,ItemPositionRange.POSITION_CHIYAN],[this.apd_tianjing,this.apd_mount_tianjing,ItemPositionRange.POSITION_TIANJING],[this.apd_fengtianji,this.apd_mount_fengtianji,ItemPositionRange.POSITION_FENGTIANJI],[this.apd_huolongdao,this.apd_mount_huolongdao,ItemPositionRange.POSITION_HUOLONGDAO],[this.apd_tianzhu,this.apd_mount_tianzhu,ItemPositionRange.POSITION_TIANZHU],[this.apd_pangukaitianfu,this
         .apd_mount_pangukaitianfu,ItemPositionRange.POSITION_PANGUKAITIANFU],[this.apd_tiandijian,this.apd_mount_tiandijian,ItemPositionRange.POSITION_TIANDI],[this.apd_hanqibingpo,this.apd_mount_hanqibingpo,ItemPositionRange.POSITION_HANQIBINGPO],[this.apd_jianzunlongquanjian,this.apd_mount_jianzunlongquanjian,ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN],[this.apd_chuangshi,this.apd_mount_chuangshi,ItemPositionRange.POSITION_CHUANGSHI],[this.apd_suilieshifu,this.apd_mount_suilieshifu,ItemPositionRange.POSITION_SUILIESHIFU],[this.apd_moyuan,this.apd_mount_moyuan,ItemPositionRange.POSITION_MOYUAN],[this.apd_chengjiechangji,this.apd_mount_chengjiechangji,ItemPositionRange.POSITION_CHENGJIECHANGJI],[this.apd_tianxiejian,this.apd_mount_tianxiejian,ItemPositionRange.POSITION_TIANXIEJIAN],[this.apd_junzijian,this.apd_mount_junzijian,ItemPositionRange.POSITION_JUNZIJIAN],[this.apd_wangzhejian,this.apd_mount_wangzhejian,ItemPositionRange.POSITION_WANGZHEJIAN],[this.apd_fengbaodao,this.apd_mount_fengbaodao
         ,ItemPositionRange.POSITION_FENGBAODAO],[this.apd_fengyun,this.apd_mount_fengyun,ItemPositionRange.POSITION_FENGYUN],[this.apd_shengdan2015,this.apd_mount_shengdan2015,ItemPositionRange.POSITION_SHENGDAN2015],[this.apd_fengsha,this.apd_mount_fengsha,ItemPositionRange.POSITION_FENGSHA],[this.apd_fengyijian,this.apd_mount_fengyijian,ItemPositionRange.POSITION_FENGYIJIAN],[this.apd_lexinji,this.apd_mount_lexinji,ItemPositionRange.POSITION_LEXINJI],[this.apd_fengyingjian,this.apd_mount_fengyingjian,ItemPositionRange.POSITION_FENGYINGJIAN],[this.apd_zhenfengjian,this.apd_mount_zhenfengjian,ItemPositionRange.POSITION_ZHENFENGJIAN],[this.apd_fengyunjian,this.apd_mount_fengyunjian,ItemPositionRange.POSITION_FENGYUNJIAN],[this.apd_bingfengjian,this.apd_mount_bingfengjian,ItemPositionRange.POSITION_BINGFENGJIAN],[this.apd_hongleizhangu,this.apd_mount_hongleizhangu,ItemPositionRange.POSITION_HONGLEIZHANGU],[this.apd_sandenggufo,this.apd_mount_sandenggufo,ItemPositionRange.POSITION_SANDENGGUFO],[this
         .apd_fonuji,this.apd_mount_fonuji,ItemPositionRange.POSITION_FONUJI],[this.apd_fengyinjian,this.apd_mount_fengyinjian,ItemPositionRange.POSITION_FENGYINJIAN],[this.apd_tianmajian,this.apd_mount_tianmajian,ItemPositionRange.POSITION_TIANMAJIAN],[this.apd_wuhunjian,this.apd_mount_wuhunjian,ItemPositionRange.POSITION_WUHUNJIAN],[this.apd_zhentianjian,this.apd_mount_zhentianjian,ItemPositionRange.POSITION_ZHENTIANJIAN],[this.apd_tianxue,this.apd_mount_tianxue,ItemPositionRange.POSITION_TIANXUE],[this.apd_xiongjijian,this.apd_mount_xiongjijian,ItemPositionRange.POSITION_XIONGJIJIAN],[this.apd_wujinjian,this.apd_mount_wujinjian,ItemPositionRange.POSITION_WUJINJIAN],[this.apd_shuntianjian,this.apd_mount_shuntianjian,ItemPositionRange.POSITION_SHUNTIANJIAN],[this.apd_wangzheqicang,this.apd_mount_wangzheqicang,ItemPositionRange.POSITION_WANGZHEQICANG],[this.apd_bixuejian,this.apd_mount_bixuejian,ItemPositionRange.POSITION_BIXUEJIAN],[this.apd_wuyijian,this.apd_mount_wuyijian,ItemPositionRange.POSITION_WUYIJIAN]
         ,[this.apd_shijianshenqi,this.apd_mount_shijianshenqi,ItemPositionRange.POSITION_SHIJIANSHENQI],[this.apd_qingfengjian,this.apd_mount_qingfengjian,ItemPositionRange.POSITION_QINGFENGJIAN],[this.apd_huolinjian,this.apd_mount_huolinjian,ItemPositionRange.POSITION_HUOLINJIAN],[this.apd_zhuihunji,this.apd_mount_zhuihunji,ItemPositionRange.POSITION_ZHUIHUNJI],[this.apd_biyudao,this.apd_mount_biyudao,ItemPositionRange.POSITION_BIYUDAO],[this.apd_wuwozhang,this.apd_mount_wuwozhang,ItemPositionRange.POSITION_WUWOZHANG],[this.apd_yehuohonglian,this.apd_mount_yehuohonglian,ItemPositionRange.POSITION_YEHUOHONGLIAN],[this.apd_mingyuedao,this.apd_mount_mingyuedao,ItemPositionRange.POSITION_MINGYUEDAO],[this.apd_qingfengjian2,this.apd_mount_qingfengjian2,ItemPositionRange.POSITION_QINGFENGJIAN2],[this.apd_zhizunjian,this.apd_mount_zhizunjian,ItemPositionRange.POSITION_ZHIZUNJIAN],[this.apd_baoleiji,this.apd_mount_baoleiji,ItemPositionRange.POSITION_BAOLEIJI],[this.apd_mingshengzhang,this.apd_mount_mingshengzhang
         ,ItemPositionRange.POSITION_MINGSHENGZHANG],[this.apd_zunshijian,this.apd_mount_zunshijian,ItemPositionRange.POSITION_ZUNSHIJIAN],[this.apd_renzhezhang,this.apd_mount_renzhezhang,ItemPositionRange.POSITION_RENZHEZHANG],[this.apd_zhizhejian,this.apd_mount_zhizhejian,ItemPositionRange.POSITION_ZHIZHEJIAN],[this.apd_yangmingjian,this.apd_mount_yangmingjian,ItemPositionRange.POSITION_YANGMINGJIAN],[this.apd_xiwangjian,this.apd_mount_xiwangjian,ItemPositionRange.POSITION_XIWANGJIAN],[this.apd_xuejingjian,this.apd_mount_xuejingjian,ItemPositionRange.POSITION_XUEJINGJIAN],[this.apd_xuanbingjian,this.apd_mount_xuanbingjian,ItemPositionRange.POSITION_XUANBINGJIAN],[this.apd_pinganjian,this.apd_mount_pinganjian,ItemPositionRange.POSITION_PINGANJIAN],[this.apd_qinghuajian,this.apd_mount_qinghuajian,ItemPositionRange.POSITION_QINGHUAJIAN],[this.apd_yuxujian,this.apd_mount_yuxujian,ItemPositionRange.POSITION_YUXUJIAN],[this.apd_yuqingshan,this.apd_mount_yuqingshan,ItemPositionRange.POSITION_YUQINGSHAN]
         ,[this.apd_huomodao,this.apd_mount_huomodao,ItemPositionRange.POSITION_HUOMODAO],[this.apd_yiheji,this.apd_mount_yiheji,ItemPositionRange.POSITION_YIHEJI],[this.apd_erhejian,this.apd_mount_erhejian,ItemPositionRange.POSITION_ERHEJIAN],[this.apd_sanhedao,this.apd_mount_sanhedao,ItemPositionRange.POSITION_SANHEDAO],[this.apd_miehushan,this.apd_mount_miehushan,ItemPositionRange.POSITION_MIEHUSHAN],[this.apd_qingmingdao,this.apd_mount_qingmingdao,ItemPositionRange.POSITION_QINGMINGDAO],[this.apd_huoxingfu,this.apd_mount_huoxingfu,ItemPositionRange.POSITION_HUOXINGFU],[this.apd_shenzao,this.apd_mount_shenzao,ItemPositionRange.POSITION_SHENZAO],[this.apd_kaitiangong,this.apd_mount_kaitiangong,ItemPositionRange.POSITION_KAITIANGONG],[this.apd_yanwenfenmo,this.apd_mount_yanwenfenmo,ItemPositionRange.POSITION_YANWENFENGMO],[this.apd_linglongzi,this.apd_mount_linglongzi,ItemPositionRange.POSITION_LINGLONGZI],[this.apd_shashenjian,this.apd_mount_shashenjian,ItemPositionRange.POSITION_SHASHENJIAN],[this
         .apd_duanqingji,this.apd_mount_duanqingji,ItemPositionRange.POSITION_DUANQINGJI],[this.apd_nulong,this.apd_mount_nulong,ItemPositionRange.POSITION_NULONG],[this.apd_qinian,this.apd_mount_qinian,ItemPositionRange.POSITION_QINIAN],[this.apd_zhuxian,this.apd_mount_zhuxian,ItemPositionRange.POSITION_ZHUXIAN],[this.apd_hanbing,this.apd_mount_hanbing,ItemPositionRange.POSITION_HANBING],[this.apd_poshan,this.apd_mount_poshan,ItemPositionRange.POSITION_POSHAN],[this.apd_haiyu,this.apd_mount_haiyu,ItemPositionRange.POSITION_HAIYU],[this.apd_tianmingdao,this.apd_mount_tianmingdao,ItemPositionRange.POSITION_TIANMINGDAO],[this.apd_jingtianyiji,this.apd_mount_jingtianyiji,ItemPositionRange.POSITION_JINGTIANYIJI],[this.apd_jingleijuedao,this.apd_mount_jingleijuedao,ItemPositionRange.POSITION_JINGLEIJUEDAO],[this.apd_yingxiongjian,this.apd_mount_yingxiongjian,ItemPositionRange.POSITION_YINGXIONGJIAN],[this.apd_changshengjian,this.apd_mount_changshengjian,ItemPositionRange.POSITION_CHANGSHENGJIAN],[this
         .apd_guiyinggong,this.apd_mount_guiyinggong,ItemPositionRange.POSITION_GUIYINGGONG],[this.apd_jingleizhang,this.apd_mount_jingleizhang,ItemPositionRange.POSITION_JINGLEIZHANG],[this.apd_hundun,this.apd_mount_hundun,ItemPositionRange.POSITION_HUNDUN],[this.apd_dinghun,this.apd_mount_dinghun,ItemPositionRange.POSITION_DINGHUN],[this.apd_tiandiwuji,this.apd_mount_tiandiwuji,ItemPositionRange.POSITION_WUJI],[this.apd_huoxingjian,this.apd_mount_huoxingjian,ItemPositionRange.POSITION_HUOXINGJIAN],[this.apd_wangzhefu,this.apd_mount_wangzhefu,ItemPositionRange.POSITION_WANGZHEFU],[this.apd_duomingdao,this.apd_mount_duomingdao,ItemPositionRange.POSITION_DUOMINGDAO],[this.apd_xiaoshen,this.apd_mount_xiaoshen,ItemPositionRange.POSITION_XIAOSHEN],[this.apd_wanshi,this.apd_mount_wanshi,ItemPositionRange.POSITION_WANSHI],[this.apd_zhongqiu,this.apd_mount_zhongqiu,ItemPositionRange.POSITION_ZHONGQIU],[this.apd_shenjian,this.apd_mount_shenjian,ItemPositionRange.POSITION_SHENJIAN],[this.apd_yuhuazhang,this
         .apd_mount_yuhuazhang,ItemPositionRange.POSITION_YUHUAZHANG],[this.apd_baniangong,this.apd_mount_baniangong,ItemPositionRange.POSITION_BANIANGONG],[this.apd_banianjian,this.apd_mount_banianjian,ItemPositionRange.POSITION_BANIANJIAN],[this.apd_banianji,this.apd_mount_banianji,ItemPositionRange.POSITION_BANIANJI],[this.apd_2019shendan,this.apd_mount_2019shendan,ItemPositionRange.POSITION_2019SHENDAN],[this.apd_2019gengzi,this.apd_mount_2019gengzi,ItemPositionRange.POSITION_2019GENGZI],[this.apd_2019feihua,this.apd_mount_2019feihua,ItemPositionRange.POSITION_2019FEIHUA],[this.apd_2019xiongwang,this.apd_mount_2019xiongwang,ItemPositionRange.POSITION_2019XIONGWANG],[this.apd_2020xuehuan,this.apd_mount_2020xuehuan,ItemPositionRange.POSITION_2020XUEHUAN],[this.apd_2020badao,this.apd_mount_2020badao,ItemPositionRange.POSITION_2020BADAO],[this.apd_2020baojian01,this.apd_mount_2020baojian01,ItemPositionRange.POSITION_2020BAOJIAN01],[this.apd_2020baojian02,this.apd_mount_2020baojian02,ItemPositionRange
         .POSITION_2020BAOJIAN02],[this.apd_2020baojian03,this.apd_mount_2020baojian03,ItemPositionRange.POSITION_2020BAOJIAN03],[this.apd_2020baojian04,this.apd_mount_2020baojian04,ItemPositionRange.POSITION_2020BAOJIAN04],[this.apd_2020baojian05,this.apd_mount_2020baojian05,ItemPositionRange.POSITION_2020BAOJIAN05],[this.apd_2020baojian06,this.apd_mount_2020baojian06,ItemPositionRange.POSITION_2020BAOJIAN06],[this.apd_2020baojian07,this.apd_mount_2020baojian07,ItemPositionRange.POSITION_2020BAOJIAN07],[this.apd_2020baojian08,this.apd_mount_2020baojian08,ItemPositionRange.POSITION_2020BAOJIAN08],[this.apd_2020baojian09,this.apd_mount_2020baojian09,ItemPositionRange.POSITION_2020BAOJIAN09],[this.apd_2020baojian10,this.apd_mount_2020baojian10,ItemPositionRange.POSITION_2020BAOJIAN10],[this.apd_2020baojian11,this.apd_mount_2020baojian11,ItemPositionRange.POSITION_2020BAOJIAN11],[this.apd_2020baojian12,this.apd_mount_2020baojian12,ItemPositionRange.POSITION_2020BAOJIAN12],[this.apd_2020baojian13,this
         .apd_mount_2020baojian13,ItemPositionRange.POSITION_2020BAOJIAN13],[this.apd_2020baojian14,this.apd_mount_2020baojian14,ItemPositionRange.POSITION_2020BAOJIAN14],[this.apd_2020baojian15,this.apd_mount_2020baojian15,ItemPositionRange.POSITION_2020BAOJIAN15],[this.apd_2020baojian16,this.apd_mount_2020baojian16,ItemPositionRange.POSITION_2020BAOJIAN16],[this.apd_2020baojian17,this.apd_mount_2020baojian17,ItemPositionRange.POSITION_2020BAOJIAN17],[this.apd_2020baojian18,this.apd_mount_2020baojian18,ItemPositionRange.POSITION_2020BAOJIAN18],[this.apd_2020baojian19,this.apd_mount_2020baojian19,ItemPositionRange.POSITION_2020BAOJIAN19],[this.apd_2020baojian20,this.apd_mount_2020baojian20,ItemPositionRange.POSITION_2020BAOJIAN20],[this.apd_2020baojian21,this.apd_mount_2020baojian21,ItemPositionRange.POSITION_2020BAOJIAN21],[this.apd_2020baojian22,this.apd_mount_2020baojian22,ItemPositionRange.POSITION_2020BAOJIAN22],[this.apd_2020baojian23,this.apd_mount_2020baojian23,ItemPositionRange.POSITION_2020BAOJIAN23]
         ,[this.apd_2020baojian24,this.apd_mount_2020baojian24,ItemPositionRange.POSITION_2020BAOJIAN24],[this.apd_2020baojian25,this.apd_mount_2020baojian25,ItemPositionRange.POSITION_2020BAOJIAN25],[this.apd_2020baojian26,this.apd_mount_2020baojian26,ItemPositionRange.POSITION_2020BAOJIAN26],[this.apd_2020baojian27,this.apd_mount_2020baojian27,ItemPositionRange.POSITION_2020BAOJIAN27],[this.apd_2020baojian28,this.apd_mount_2020baojian28,ItemPositionRange.POSITION_2020BAOJIAN28],[this.apd_2020baojian29,this.apd_mount_2020baojian29,ItemPositionRange.POSITION_2020BAOJIAN29],[this.apd_2020baojian30,this.apd_mount_2020baojian30,ItemPositionRange.POSITION_2020BAOJIAN30],[this.apd_2020baojian31,this.apd_mount_2020baojian31,ItemPositionRange.POSITION_2020BAOJIAN31],[this.apd_2020baojian32,this.apd_mount_2020baojian32,ItemPositionRange.POSITION_2020BAOJIAN32],[this.apd_2020baojian33,this.apd_mount_2020baojian33,ItemPositionRange.POSITION_2020BAOJIAN33],[this.apd_2020baojian34,this.apd_mount_2020baojian34
         ,ItemPositionRange.POSITION_2020BAOJIAN34],[this.apd_2020baojian35,this.apd_mount_2020baojian35,ItemPositionRange.POSITION_2020BAOJIAN35],[this.apd_2020baojian36,this.apd_mount_2020baojian36,ItemPositionRange.POSITION_2020BAOJIAN36],[this.apd_2020baojian37,this.apd_mount_2020baojian37,ItemPositionRange.POSITION_2020BAOJIAN37],[this.apd_2020baojian38,this.apd_mount_2020baojian38,ItemPositionRange.POSITION_2020BAOJIAN38],[this.apd_2020baojian39,this.apd_mount_2020baojian39,ItemPositionRange.POSITION_2020BAOJIAN39],[this.apd_2020baojian40,this.apd_mount_2020baojian40,ItemPositionRange.POSITION_2020BAOJIAN40],[this.apd_2020baojian41,this.apd_mount_2020baojian41,ItemPositionRange.POSITION_2020BAOJIAN41],[this.apd_2020baojian42,this.apd_mount_2020baojian42,ItemPositionRange.POSITION_2020BAOJIAN42],[this.apd_2020baojian43,this.apd_mount_2020baojian43,ItemPositionRange.POSITION_2020BAOJIAN43],[this.apd_2020baojian44,this.apd_mount_2020baojian44,ItemPositionRange.POSITION_2020BAOJIAN44],[this.apd_2020baojian45
         ,this.apd_mount_2020baojian45,ItemPositionRange.POSITION_2020BAOJIAN45],[this.apd_2020baojian46,this.apd_mount_2020baojian46,ItemPositionRange.POSITION_2020BAOJIAN46],[this.apd_2020baojian47,this.apd_mount_2020baojian47,ItemPositionRange.POSITION_2020BAOJIAN47],[this.apd_2020baojian48,this.apd_mount_2020baojian48,ItemPositionRange.POSITION_2020BAOJIAN48],[this.apd_2020baojian49,this.apd_mount_2020baojian49,ItemPositionRange.POSITION_2020BAOJIAN49],[this.apd_2020baojian50,this.apd_mount_2020baojian50,ItemPositionRange.POSITION_2020BAOJIAN50],[this.apd_2020baojian51,this.apd_mount_2020baojian51,ItemPositionRange.POSITION_2020BAOJIAN51],[this.apd_2020baojian52,this.apd_mount_2020baojian52,ItemPositionRange.POSITION_2020BAOJIAN52],[this.apd_2020baojian53,this.apd_mount_2020baojian53,ItemPositionRange.POSITION_2020BAOJIAN53],[this.apd_2020baojian54,this.apd_mount_2020baojian54,ItemPositionRange.POSITION_2020BAOJIAN54],[this.apd_2020baojian55,this.apd_mount_2020baojian55,ItemPositionRange.POSITION_2020BAOJIAN55]
         ,[this.apd_2020baojian56,this.apd_mount_2020baojian56,ItemPositionRange.POSITION_2020BAOJIAN56],[this.apd_2020baojian57,this.apd_mount_2020baojian57,ItemPositionRange.POSITION_2020BAOJIAN57],[this.apd_2020baojian58,this.apd_mount_2020baojian58,ItemPositionRange.POSITION_2020BAOJIAN58],[this.apd_2020baojian59,this.apd_mount_2020baojian59,ItemPositionRange.POSITION_2020BAOJIAN59],[this.apd_2020baojian60,this.apd_mount_2020baojian60,ItemPositionRange.POSITION_2020BAOJIAN60],[this.apd_2020baojian61,this.apd_mount_2020baojian61,ItemPositionRange.POSITION_2020BAOJIAN61],[this.apd_2020baojian62,this.apd_mount_2020baojian62,ItemPositionRange.POSITION_2020BAOJIAN62],[this.apd_2020baojian63,this.apd_mount_2020baojian63,ItemPositionRange.POSITION_2020BAOJIAN63],[this.apd_2020baojian64,this.apd_mount_2020baojian64,ItemPositionRange.POSITION_2020BAOJIAN64],[this.apd_2020baojian65,this.apd_mount_2020baojian65,ItemPositionRange.POSITION_2020BAOJIAN65],[this.apd_2020baojian66,this.apd_mount_2020baojian66
         ,ItemPositionRange.POSITION_2020BAOJIAN66],[this.apd_2020baojian67,this.apd_mount_2020baojian67,ItemPositionRange.POSITION_2020BAOJIAN67],[this.apd_2020baojian68,this.apd_mount_2020baojian68,ItemPositionRange.POSITION_2020BAOJIAN68],[this.apd_2020baojian69,this.apd_mount_2020baojian69,ItemPositionRange.POSITION_2020BAOJIAN69]);
      }
      
      public function getSimpleAPDList(param1:Boolean = false, param2:int = -1, param3:Boolean = true, param4:Boolean = false, param5:int = 0) : Array
      {
         var get_mount_body_apd:Function;
         var get_body_apd:Function;
         var apdArr:Array = null;
         var temp_apd_mount_body:AvatarParamData = null;
         var feixing_wuqiIdNum:int = 0;
         var itemRes:GoodsRes = null;
         var temp_apd_mount_weapon:AvatarParamData = null;
         var temp_apd_mount_bow:AvatarParamData = null;
         var temp_apd_mount:AvatarParamData = null;
         var tempApdYifu:AvatarParamData = null;
         var temp_apd_body:AvatarParamData = null;
         var temp_apd_weapon:AvatarParamData = null;
         var temp_apd_bow:AvatarParamData = null;
         var $onMount:Boolean = param1;
         var $sex:int = param2;
         var $isWeapon:Boolean = param3;
         var feixing:Boolean = param4;
         var $aa:int = param5;
         apdArr = [];
         this.needChangeAvatarXY = false;
         if($onMount)
         {
            temp_apd_mount_body = this.apd_mount_body;
            feixing_wuqiIdNum = 1;
            itemRes = this.useIng_Weapon_id > 0 ? GoodsResManager.getGoodsRes(this.useIng_Weapon_id) : null;
            if(!itemRes)
            {
               temp_apd_mount_weapon = this.apd_mount_aojian || this.apd_mount_xyj || this.apd_mount_ylzr || this.apd_mount_longyin || this.apd_mount_shenqi || this.apd_mount_quanshen || this.apd_mount_longya || this.apd_mount_potianren || this.apd_mount_tianshang || this.apd_mount_liekong || this.apd_mount_pangu || this.apd_mount_xueyindao || this.apd_mount_gjmy || this.apd_mount_yanyuedao || this.apd_mount_huimie || this.apd_mount_zhumozhang || this.apd_mount_chiyan || this.apd_mount_tianjing || this.apd_mount_fengtianji || this.apd_mount_tianzhu || this.apd_mount_pangukaitianfu || this.apd_mount_tiandijian || this.apd_mount_hanqibingpo || this.apd_mount_jianzunlongquanjian || this.apd_mount_chuangshi || this.apd_mount_suilieshifu || this.apd_mount_moyuan || this.apd_mount_chengjiechangji || this.apd_mount_tianxiejian || this.apd_mount_junzijian || this.apd_mount_wangzhejian || this.apd_mount_fengbaodao || this.apd_mount_fengyun || this.apd_mount_shengdan2015 || this.apd_mount_fengsha || this.apd_mount_fengyijian || this
               .apd_mount_fengyingjian || this.apd_mount_lexinji || this.apd_mount_fengyunjian || this.apd_mount_weapon;
               if(OtherConst.texiaoBoolean == false)
               {
                  if(temp_apd_mount_weapon == this.apd_mount_weapon)
                  {
                     if(OtherConst.texiaoBoolean == false)
                     {
                        if(this.isFeixing)
                        {
                           temp_apd_mount_weapon = this.apd_weapon;
                           feixing_wuqiIdNum = 0;
                        }
                     }
                  }
               }
            }
            else if(Boolean(this.apd_mount_aojian) && itemRes.position == ItemPositionRange.POSTION_AOJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_aojian;
            }
            else if(Boolean(this.apd_mount_xyj) && itemRes.position == ItemPositionRange.POSTION_STDRJ)
            {
               temp_apd_mount_weapon = this.apd_mount_xyj;
            }
            else if(Boolean(this.apd_mount_ylzr) && itemRes.position == ItemPositionRange.POSTION_YLZR)
            {
               temp_apd_mount_weapon = this.apd_mount_ylzr;
            }
            else if(Boolean(this.apd_mount_longyin) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[0])
            {
               temp_apd_mount_weapon = this.apd_mount_longyin;
            }
            else if(Boolean(this.apd_mount_shenqi) && itemRes.position == ItemPositionRange.POSTION_SHENQI)
            {
               temp_apd_mount_weapon = this.apd_mount_shenqi;
            }
            else if(Boolean(this.apd_mount_quanshen) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[1])
            {
               temp_apd_mount_weapon = this.apd_mount_quanshen;
            }
            else if(Boolean(this.apd_mount_longya) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[2])
            {
               temp_apd_mount_weapon = this.apd_mount_longya;
            }
            else if(Boolean(this.apd_mount_potianren) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[9])
            {
               temp_apd_mount_weapon = this.apd_mount_potianren;
            }
            else if(Boolean(this.apd_mount_tianshang) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[3])
            {
               temp_apd_mount_weapon = this.apd_mount_tianshang;
            }
            else if(Boolean(this.apd_mount_liekong) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[4])
            {
               temp_apd_mount_weapon = this.apd_mount_liekong;
            }
            else if(Boolean(this.apd_mount_pangu) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[7])
            {
               temp_apd_mount_weapon = this.apd_mount_pangu;
            }
            else if(Boolean(this.apd_mount_xueyindao) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[8])
            {
               temp_apd_mount_weapon = this.apd_mount_xueyindao;
            }
            else if(Boolean(this.apd_mount_gjmy) && itemRes.position == ItemPositionRange.POSTION_GJMY)
            {
               temp_apd_mount_weapon = this.apd_mount_gjmy;
            }
            else if(Boolean(this.apd_mount_longya1) && itemRes.position == ItemPositionRange.POSITION_LONGYA)
            {
               temp_apd_mount_weapon = this.apd_mount_longya1;
            }
            else if(Boolean(this.apd_mount_yanyuedao) && itemRes.position == ItemPositionRange.POSITION_YAYUEDAO)
            {
               temp_apd_mount_weapon = this.apd_mount_yanyuedao;
            }
            else if(Boolean(this.apd_mount_xuantiezhongjian) && itemRes.position == ItemPositionRange.POSITION_XUANTIEZHONGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_xuantiezhongjian;
            }
            else if(Boolean(this.apd_mount_guangmingzhang) && itemRes.position == ItemPositionRange.POSITION_GUANGMINGZHANG)
            {
               temp_apd_mount_weapon = this.apd_mount_guangmingzhang;
            }
            else if(Boolean(this.apd_mount_huimie) && itemRes.position == ItemPositionRange.POSITION_HUIMIE)
            {
               temp_apd_mount_weapon = this.apd_mount_huimie;
            }
            else if(Boolean(this.apd_mount_zhumozhang) && itemRes.position == ItemPositionRange.POSITION_ZHUMOZHANG)
            {
               temp_apd_mount_weapon = this.apd_mount_zhumozhang;
            }
            else if(Boolean(this.apd_mount_chiyan) && itemRes.position == ItemPositionRange.POSITION_CHIYAN)
            {
               temp_apd_mount_weapon = this.apd_mount_chiyan;
            }
            else if(Boolean(this.apd_mount_tianjing) && itemRes.position == ItemPositionRange.POSITION_TIANJING)
            {
               temp_apd_mount_weapon = this.apd_mount_tianjing;
            }
            else if(Boolean(this.apd_mount_fengtianji) && itemRes.position == ItemPositionRange.POSITION_FENGTIANJI)
            {
               temp_apd_mount_weapon = this.apd_mount_fengtianji;
            }
            else if(Boolean(this.apd_mount_huolongdao) && itemRes.position == ItemPositionRange.POSITION_HUOLONGDAO)
            {
               temp_apd_mount_weapon = this.apd_mount_huolongdao;
            }
            else if(Boolean(this.apd_mount_tianzhu) && itemRes.position == ItemPositionRange.POSITION_TIANZHU)
            {
               temp_apd_mount_weapon = this.apd_mount_tianzhu;
            }
            else if(Boolean(this.apd_mount_pangukaitianfu) && itemRes.position == ItemPositionRange.POSITION_PANGUKAITIANFU)
            {
               temp_apd_mount_weapon = this.apd_mount_pangukaitianfu;
            }
            else if(Boolean(this.apd_mount_tiandijian) && itemRes.position == ItemPositionRange.POSITION_TIANDI)
            {
               temp_apd_mount_weapon = this.apd_mount_tiandijian;
            }
            else if(Boolean(this.apd_mount_hanqibingpo) && itemRes.position == ItemPositionRange.POSITION_HANQIBINGPO)
            {
               temp_apd_mount_weapon = this.apd_mount_hanqibingpo;
            }
            else if(Boolean(this.apd_mount_jianzunlongquanjian) && itemRes.position == ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_jianzunlongquanjian;
            }
            else if(Boolean(this.apd_mount_chuangshi) && itemRes.position == ItemPositionRange.POSITION_CHUANGSHI)
            {
               temp_apd_mount_weapon = this.apd_mount_chuangshi;
            }
            else if(Boolean(this.apd_mount_suilieshifu) && itemRes.position == ItemPositionRange.POSITION_SUILIESHIFU)
            {
               temp_apd_mount_weapon = this.apd_mount_suilieshifu;
            }
            else if(Boolean(this.apd_mount_moyuan) && itemRes.position == ItemPositionRange.POSITION_MOYUAN)
            {
               temp_apd_mount_weapon = this.apd_mount_moyuan;
            }
            else if(Boolean(this.apd_mount_fengbaodao) && itemRes.position == ItemPositionRange.POSITION_FENGBAODAO)
            {
               temp_apd_mount_weapon = this.apd_mount_fengbaodao;
            }
            else if(Boolean(this.apd_mount_chengjiechangji) && itemRes.position == ItemPositionRange.POSITION_CHENGJIECHANGJI)
            {
               temp_apd_mount_weapon = this.apd_mount_chengjiechangji;
            }
            else if(Boolean(this.apd_mount_tianxiejian) && itemRes.position == ItemPositionRange.POSITION_TIANXIEJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_tianxiejian;
            }
            else if(Boolean(this.apd_mount_junzijian) && itemRes.position == ItemPositionRange.POSITION_JUNZIJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_junzijian;
            }
            else if(Boolean(this.apd_mount_wangzhejian) && itemRes.position == ItemPositionRange.POSITION_WANGZHEJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_wangzhejian;
            }
            else if(Boolean(this.apd_mount_fengyun) && itemRes.position == ItemPositionRange.POSITION_FENGYUN)
            {
               temp_apd_mount_weapon = this.apd_mount_fengyun;
            }
            else if(Boolean(this.apd_mount_shengdan2015) && itemRes.position == ItemPositionRange.POSITION_SHENGDAN2015)
            {
               temp_apd_mount_weapon = this.apd_mount_shengdan2015;
            }
            else if(Boolean(this.apd_mount_fengsha) && itemRes.position == ItemPositionRange.POSITION_FENGSHA)
            {
               temp_apd_mount_weapon = this.apd_mount_fengsha;
            }
            else if(Boolean(this.apd_mount_fengyijian) && itemRes.position == ItemPositionRange.POSITION_FENGYIJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_fengyijian;
            }
            else if(Boolean(this.apd_mount_lexinji) && itemRes.position == ItemPositionRange.POSITION_LEXINJI)
            {
               temp_apd_mount_weapon = this.apd_mount_lexinji;
            }
            else if(Boolean(this.apd_mount_fengyingjian) && itemRes.position == ItemPositionRange.POSITION_FENGYINGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_fengyingjian;
            }
            else if(Boolean(this.apd_mount_zhenfengjian) && itemRes.position == ItemPositionRange.POSITION_ZHENFENGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_zhenfengjian;
            }
            else if(Boolean(this.apd_mount_fengyunjian) && itemRes.position == ItemPositionRange.POSITION_FENGYUNJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_fengyunjian;
            }
            else if(Boolean(this.apd_mount_bingfengjian) && itemRes.position == ItemPositionRange.POSITION_BINGFENGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_bingfengjian;
            }
            else if(Boolean(this.apd_mount_hongleizhangu) && itemRes.position == ItemPositionRange.POSITION_HONGLEIZHANGU)
            {
               temp_apd_mount_weapon = this.apd_mount_hongleizhangu;
            }
            else if(Boolean(this.apd_mount_sandenggufo) && itemRes.position == ItemPositionRange.POSITION_SANDENGGUFO)
            {
               temp_apd_mount_weapon = this.apd_mount_sandenggufo;
            }
            else if(Boolean(this.apd_mount_fonuji) && itemRes.position == ItemPositionRange.POSITION_FONUJI)
            {
               temp_apd_mount_weapon = this.apd_mount_fonuji;
            }
            else if(Boolean(this.apd_mount_fengyinjian) && itemRes.position == ItemPositionRange.POSITION_FENGYINJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_fengyinjian;
            }
            else if(Boolean(this.apd_mount_tianmajian) && itemRes.position == ItemPositionRange.POSITION_TIANMAJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_tianmajian;
            }
            else if(Boolean(this.apd_mount_wuhunjian) && itemRes.position == ItemPositionRange.POSITION_WUHUNJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_wuhunjian;
            }
            else if(Boolean(this.apd_mount_zhentianjian) && itemRes.position == ItemPositionRange.POSITION_ZHENTIANJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_zhentianjian;
            }
            else if(Boolean(this.apd_mount_tianxue) && itemRes.position == ItemPositionRange.POSITION_TIANXUE)
            {
               temp_apd_mount_weapon = this.apd_mount_tianxue;
            }
            else if(Boolean(this.apd_mount_xiongjijian) && itemRes.position == ItemPositionRange.POSITION_XIONGJIJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_xiongjijian;
            }
            else if(Boolean(this.apd_mount_wujinjian) && itemRes.position == ItemPositionRange.POSITION_WUJINJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_wujinjian;
            }
            else if(Boolean(this.apd_mount_shuntianjian) && itemRes.position == ItemPositionRange.POSITION_SHUNTIANJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_shuntianjian;
            }
            else if(Boolean(this.apd_mount_wangzheqicang) && itemRes.position == ItemPositionRange.POSITION_WANGZHEQICANG)
            {
               temp_apd_mount_weapon = this.apd_mount_wangzheqicang;
            }
            else if(Boolean(this.apd_mount_bixuejian) && itemRes.position == ItemPositionRange.POSITION_BIXUEJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_bixuejian;
            }
            else if(Boolean(this.apd_mount_wuyijian) && itemRes.position == ItemPositionRange.POSITION_WUYIJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_wuyijian;
            }
            else if(Boolean(this.apd_mount_shijianshenqi) && itemRes.position == ItemPositionRange.POSITION_SHIJIANSHENQI)
            {
               temp_apd_mount_weapon = this.apd_mount_shijianshenqi;
            }
            else if(Boolean(this.apd_mount_qingfengjian) && itemRes.position == ItemPositionRange.POSITION_QINGFENGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_qingfengjian;
            }
            else if(Boolean(this.apd_mount_huolinjian) && itemRes.position == ItemPositionRange.POSITION_HUOLINJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_huolinjian;
            }
            else if(Boolean(this.apd_mount_zhuihunji) && itemRes.position == ItemPositionRange.POSITION_ZHUIHUNJI)
            {
               temp_apd_mount_weapon = this.apd_mount_zhuihunji;
            }
            else if(Boolean(this.apd_mount_biyudao) && itemRes.position == ItemPositionRange.POSITION_BIYUDAO)
            {
               temp_apd_mount_weapon = this.apd_mount_biyudao;
            }
            else if(Boolean(this.apd_mount_wuwozhang) && itemRes.position == ItemPositionRange.POSITION_WUWOZHANG)
            {
               temp_apd_mount_weapon = this.apd_mount_wuwozhang;
            }
            else if(Boolean(this.apd_mount_yehuohonglian) && itemRes.position == ItemPositionRange.POSITION_YEHUOHONGLIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_yehuohonglian;
            }
            else if(Boolean(this.apd_mount_mingyuedao) && itemRes.position == ItemPositionRange.POSITION_MINGYUEDAO)
            {
               temp_apd_mount_weapon = this.apd_mount_mingyuedao;
            }
            else if(Boolean(this.apd_mount_qingfengjian2) && itemRes.position == ItemPositionRange.POSITION_QINGFENGJIAN2)
            {
               temp_apd_mount_weapon = this.apd_mount_qingfengjian2;
            }
            else if(Boolean(this.apd_mount_zhizunjian) && itemRes.position == ItemPositionRange.POSITION_ZHIZUNJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_zhizunjian;
            }
            else if(Boolean(this.apd_mount_baoleiji) && itemRes.position == ItemPositionRange.POSITION_BAOLEIJI)
            {
               temp_apd_mount_weapon = this.apd_mount_baoleiji;
            }
            else if(Boolean(this.apd_mount_mingshengzhang) && itemRes.position == ItemPositionRange.POSITION_MINGSHENGZHANG)
            {
               temp_apd_mount_weapon = this.apd_mount_mingshengzhang;
            }
            else if(Boolean(this.apd_mount_zunshijian) && itemRes.position == ItemPositionRange.POSITION_ZUNSHIJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_zunshijian;
            }
            else if(Boolean(this.apd_mount_renzhezhang) && itemRes.position == ItemPositionRange.POSITION_RENZHEZHANG)
            {
               temp_apd_mount_weapon = this.apd_mount_renzhezhang;
            }
            else if(Boolean(this.apd_mount_zhizhejian) && itemRes.position == ItemPositionRange.POSITION_ZHIZHEJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_zhizhejian;
            }
            else if(Boolean(this.apd_mount_yangmingjian) && itemRes.position == ItemPositionRange.POSITION_YANGMINGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_yangmingjian;
            }
            else if(Boolean(this.apd_mount_xiwangjian) && itemRes.position == ItemPositionRange.POSITION_XIWANGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_xiwangjian;
            }
            else if(Boolean(this.apd_mount_xuejingjian) && itemRes.position == ItemPositionRange.POSITION_XUEJINGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_xuejingjian;
            }
            else if(Boolean(this.apd_mount_xuanbingjian) && itemRes.position == ItemPositionRange.POSITION_XUANBINGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_xuanbingjian;
            }
            else if(Boolean(this.apd_mount_pinganjian) && itemRes.position == ItemPositionRange.POSITION_PINGANJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_pinganjian;
            }
            else if(Boolean(this.apd_mount_qinghuajian) && itemRes.position == ItemPositionRange.POSITION_QINGHUAJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_qinghuajian;
            }
            else if(Boolean(this.apd_mount_yuxujian) && itemRes.position == ItemPositionRange.POSITION_YUXUJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_yuxujian;
            }
            else if(Boolean(this.apd_mount_yuqingshan) && itemRes.position == ItemPositionRange.POSITION_YUQINGSHAN)
            {
               temp_apd_mount_weapon = this.apd_mount_yuqingshan;
            }
            else if(Boolean(this.apd_mount_huomodao) && itemRes.position == ItemPositionRange.POSITION_HUOMODAO)
            {
               temp_apd_mount_weapon = this.apd_mount_huomodao;
            }
            else if(Boolean(this.apd_mount_yiheji) && itemRes.position == ItemPositionRange.POSITION_YIHEJI)
            {
               temp_apd_mount_weapon = this.apd_mount_yiheji;
            }
            else if(Boolean(this.apd_mount_erhejian) && itemRes.position == ItemPositionRange.POSITION_ERHEJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_erhejian;
            }
            else if(Boolean(this.apd_mount_sanhedao) && itemRes.position == ItemPositionRange.POSITION_SANHEDAO)
            {
               temp_apd_mount_weapon = this.apd_mount_sanhedao;
            }
            else if(Boolean(this.apd_mount_miehushan) && itemRes.position == ItemPositionRange.POSITION_MIEHUSHAN)
            {
               temp_apd_mount_weapon = this.apd_mount_miehushan;
            }
            else if(Boolean(this.apd_mount_qingmingdao) && itemRes.position == ItemPositionRange.POSITION_QINGMINGDAO)
            {
               temp_apd_mount_weapon = this.apd_mount_qingmingdao;
            }
            else if(Boolean(this.apd_mount_huoxingfu) && itemRes.position == ItemPositionRange.POSITION_HUOXINGFU)
            {
               temp_apd_mount_weapon = this.apd_mount_huoxingfu;
            }
            else if(Boolean(this.apd_mount_shenzao) && itemRes.position == ItemPositionRange.POSITION_SHENZAO)
            {
               temp_apd_mount_weapon = this.apd_mount_shenzao;
            }
            else if(Boolean(this.apd_mount_kaitiangong) && itemRes.position == ItemPositionRange.POSITION_KAITIANGONG)
            {
               temp_apd_mount_weapon = this.apd_mount_kaitiangong;
            }
            else if(Boolean(this.apd_mount_yanwenfenmo) && itemRes.position == ItemPositionRange.POSITION_YANWENFENGMO)
            {
               temp_apd_mount_weapon = this.apd_mount_yanwenfenmo;
            }
            else if(Boolean(this.apd_mount_linglongzi) && itemRes.position == ItemPositionRange.POSITION_LINGLONGZI)
            {
               temp_apd_mount_weapon = this.apd_mount_linglongzi;
            }
            else if(Boolean(this.apd_mount_shashenjian) && itemRes.position == ItemPositionRange.POSITION_SHASHENJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_shashenjian;
            }
            else if(Boolean(this.apd_mount_duanqingji) && itemRes.position == ItemPositionRange.POSITION_DUANQINGJI)
            {
               temp_apd_mount_weapon = this.apd_mount_duanqingji;
            }
            else if(Boolean(this.apd_mount_nulong) && itemRes.position == ItemPositionRange.POSITION_NULONG)
            {
               temp_apd_mount_weapon = this.apd_mount_nulong;
            }
            else if(Boolean(this.apd_mount_qinian) && itemRes.position == ItemPositionRange.POSITION_QINIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_qinian;
            }
            else if(Boolean(this.apd_mount_zhuxian) && itemRes.position == ItemPositionRange.POSITION_ZHUXIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_zhuxian;
            }
            else if(Boolean(this.apd_mount_hanbing) && itemRes.position == ItemPositionRange.POSITION_HANBING)
            {
               temp_apd_mount_weapon = this.apd_mount_hanbing;
            }
            else if(Boolean(this.apd_mount_poshan) && itemRes.position == ItemPositionRange.POSITION_POSHAN)
            {
               temp_apd_mount_weapon = this.apd_mount_poshan;
            }
            else if(Boolean(this.apd_mount_haiyu) && itemRes.position == ItemPositionRange.POSITION_HAIYU)
            {
               temp_apd_mount_weapon = this.apd_mount_haiyu;
            }
            else if(Boolean(this.apd_mount_tianmingdao) && itemRes.position == ItemPositionRange.POSITION_TIANMINGDAO)
            {
               temp_apd_mount_weapon = this.apd_mount_tianmingdao;
            }
            else if(Boolean(this.apd_mount_jingtianyiji) && itemRes.position == ItemPositionRange.POSITION_JINGTIANYIJI)
            {
               temp_apd_mount_weapon = this.apd_mount_jingtianyiji;
            }
            else if(Boolean(this.apd_mount_jingleijuedao) && itemRes.position == ItemPositionRange.POSITION_JINGLEIJUEDAO)
            {
               temp_apd_mount_weapon = this.apd_mount_jingleijuedao;
            }
            else if(Boolean(this.apd_mount_yingxiongjian) && itemRes.position == ItemPositionRange.POSITION_YINGXIONGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_yingxiongjian;
            }
            else if(Boolean(this.apd_mount_changshengjian) && itemRes.position == ItemPositionRange.POSITION_CHANGSHENGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_changshengjian;
            }
            else if(Boolean(this.apd_mount_guiyinggong) && itemRes.position == ItemPositionRange.POSITION_GUIYINGGONG)
            {
               temp_apd_mount_weapon = this.apd_mount_guiyinggong;
            }
            else if(Boolean(this.apd_mount_jingleizhang) && itemRes.position == ItemPositionRange.POSITION_JINGLEIZHANG)
            {
               temp_apd_mount_weapon = this.apd_mount_jingleizhang;
            }
            else if(Boolean(this.apd_mount_hundun) && itemRes.position == ItemPositionRange.POSITION_HUNDUN)
            {
               temp_apd_mount_weapon = this.apd_mount_hundun;
            }
            else if(Boolean(this.apd_mount_dinghun) && itemRes.position == ItemPositionRange.POSITION_DINGHUN)
            {
               temp_apd_mount_weapon = this.apd_mount_dinghun;
            }
            else if(Boolean(this.apd_mount_tiandiwuji) && itemRes.position == ItemPositionRange.POSITION_WUJI)
            {
               temp_apd_mount_weapon = this.apd_mount_tiandiwuji;
            }
            else if(Boolean(this.apd_mount_huoxingjian) && itemRes.position == ItemPositionRange.POSITION_HUOXINGJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_huoxingjian;
            }
            else if(Boolean(this.apd_mount_wangzhefu) && itemRes.position == ItemPositionRange.POSITION_WANGZHEFU)
            {
               temp_apd_mount_weapon = this.apd_mount_wangzhefu;
            }
            else if(Boolean(this.apd_mount_duomingdao) && itemRes.position == ItemPositionRange.POSITION_DUOMINGDAO)
            {
               temp_apd_mount_weapon = this.apd_mount_duomingdao;
            }
            else if(Boolean(this.apd_mount_xiaoshen) && itemRes.position == ItemPositionRange.POSITION_XIAOSHEN)
            {
               temp_apd_mount_weapon = this.apd_mount_xiaoshen;
            }
            else if(Boolean(this.apd_mount_wanshi) && itemRes.position == ItemPositionRange.POSITION_WANSHI)
            {
               temp_apd_mount_weapon = this.apd_mount_wanshi;
            }
            else if(Boolean(this.apd_mount_zhongqiu) && itemRes.position == ItemPositionRange.POSITION_ZHONGQIU)
            {
               temp_apd_mount_weapon = this.apd_mount_zhongqiu;
            }
            else if(Boolean(this.apd_mount_shenjian) && itemRes.position == ItemPositionRange.POSITION_SHENJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_shenjian;
            }
            else if(Boolean(this.apd_mount_shenjian) && itemRes.position == ItemPositionRange.POSITION_YUHUAZHANG)
            {
               temp_apd_mount_weapon = this.apd_mount_yuhuazhang;
            }
            else if(Boolean(this.apd_mount_baniangong) && itemRes.position == ItemPositionRange.POSITION_BANIANGONG)
            {
               temp_apd_mount_weapon = this.apd_mount_baniangong;
            }
            else if(Boolean(this.apd_mount_banianjian) && itemRes.position == ItemPositionRange.POSITION_BANIANJIAN)
            {
               temp_apd_mount_weapon = this.apd_mount_banianjian;
            }
            else if(Boolean(this.apd_mount_banianji) && itemRes.position == ItemPositionRange.POSITION_BANIANJI)
            {
               temp_apd_mount_weapon = this.apd_mount_banianji;
            }
            else if(Boolean(this.apd_mount_2019shendan) && itemRes.position == ItemPositionRange.POSITION_2019SHENDAN)
            {
               temp_apd_mount_weapon = this.apd_mount_2019shendan;
            }
            else if(Boolean(this.apd_mount_2019gengzi) && itemRes.position == ItemPositionRange.POSITION_2019GENGZI)
            {
               temp_apd_mount_weapon = this.apd_mount_2019gengzi;
            }
            else if(Boolean(this.apd_mount_2019feihua) && itemRes.position == ItemPositionRange.POSITION_2019FEIHUA)
            {
               temp_apd_mount_weapon = this.apd_mount_2019feihua;
            }
            else if(Boolean(this.apd_mount_2019xiongwang) && itemRes.position == ItemPositionRange.POSITION_2019XIONGWANG)
            {
               temp_apd_mount_weapon = this.apd_mount_2019xiongwang;
            }
            else if(Boolean(this.apd_mount_2020xuehuan) && itemRes.position == ItemPositionRange.POSITION_2020XUEHUAN)
            {
               temp_apd_mount_weapon = this.apd_mount_2020xuehuan;
            }
            else if(Boolean(this.apd_mount_2020badao) && itemRes.position == ItemPositionRange.POSITION_2020BADAO)
            {
               temp_apd_mount_weapon = this.apd_mount_2020badao;
            }
            else if(Boolean(this.apd_mount_2020baojian01) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN01)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian01;
            }
            else if(Boolean(this.apd_mount_2020baojian02) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN02)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian02;
            }
            else if(Boolean(this.apd_mount_2020baojian03) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN03)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian03;
            }
            else if(Boolean(this.apd_mount_2020baojian04) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN04)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian04;
            }
            else if(Boolean(this.apd_mount_2020baojian05) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN05)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian05;
            }
            else if(Boolean(this.apd_mount_2020baojian06) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN06)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian06;
            }
            else if(Boolean(this.apd_mount_2020baojian07) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN07)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian07;
            }
            else if(Boolean(this.apd_mount_2020baojian08) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN08)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian08;
            }
            else if(Boolean(this.apd_mount_2020baojian09) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN09)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian09;
            }
            else if(Boolean(this.apd_mount_2020baojian10) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN10)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian10;
            }
            else if(Boolean(this.apd_mount_2020baojian11) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN11)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian11;
            }
            else if(Boolean(this.apd_mount_2020baojian12) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN12)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian12;
            }
            else if(Boolean(this.apd_mount_2020baojian13) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN13)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian13;
            }
            else if(Boolean(this.apd_mount_2020baojian14) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN14)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian14;
            }
            else if(Boolean(this.apd_mount_2020baojian15) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN15)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian15;
            }
            else if(Boolean(this.apd_mount_2020baojian16) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN16)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian16;
            }
            else if(Boolean(this.apd_mount_2020baojian17) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN17)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian17;
            }
            else if(Boolean(this.apd_mount_2020baojian18) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN18)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian18;
            }
            else if(Boolean(this.apd_mount_2020baojian19) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN19)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian19;
            }
            else if(Boolean(this.apd_mount_2020baojian20) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN20)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian20;
            }
            else if(Boolean(this.apd_mount_2020baojian21) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN21)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian21;
            }
            else if(Boolean(this.apd_mount_2020baojian22) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN22)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian22;
            }
            else if(Boolean(this.apd_mount_2020baojian23) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN23)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian23;
            }
            else if(Boolean(this.apd_mount_2020baojian24) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN24)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian24;
            }
            else if(Boolean(this.apd_mount_2020baojian25) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN25)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian25;
            }
            else if(Boolean(this.apd_mount_2020baojian26) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN26)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian26;
            }
            else if(Boolean(this.apd_mount_2020baojian27) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN27)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian27;
            }
            else if(Boolean(this.apd_mount_2020baojian28) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN28)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian28;
            }
            else if(Boolean(this.apd_mount_2020baojian29) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN29)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian29;
            }
            else if(Boolean(this.apd_mount_2020baojian30) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN30)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian30;
            }
            else if(Boolean(this.apd_mount_2020baojian31) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN31)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian31;
            }
            else if(Boolean(this.apd_mount_2020baojian32) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN32)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian32;
            }
            else if(Boolean(this.apd_mount_2020baojian33) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN33)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian33;
            }
            else if(Boolean(this.apd_mount_2020baojian34) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN34)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian34;
            }
            else if(Boolean(this.apd_mount_2020baojian35) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN35)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian35;
            }
            else if(Boolean(this.apd_mount_2020baojian36) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN36)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian36;
            }
            else if(Boolean(this.apd_mount_2020baojian37) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN37)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian37;
            }
            else if(Boolean(this.apd_mount_2020baojian38) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN38)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian38;
            }
            else if(Boolean(this.apd_mount_2020baojian39) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN39)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian39;
            }
            else if(Boolean(this.apd_mount_2020baojian40) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN40)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian40;
            }
            else if(Boolean(this.apd_mount_2020baojian41) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN41)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian41;
            }
            else if(Boolean(this.apd_mount_2020baojian42) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN42)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian42;
            }
            else if(Boolean(this.apd_mount_2020baojian43) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN43)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian43;
            }
            else if(Boolean(this.apd_mount_2020baojian44) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN44)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian44;
            }
            else if(Boolean(this.apd_mount_2020baojian45) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN45)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian45;
            }
            else if(Boolean(this.apd_mount_2020baojian46) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN46)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian46;
            }
            else if(Boolean(this.apd_mount_2020baojian47) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN47)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian47;
            }
            else if(Boolean(this.apd_mount_2020baojian48) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN48)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian48;
            }
            else if(Boolean(this.apd_mount_2020baojian49) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN49)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian49;
            }
            else if(Boolean(this.apd_mount_2020baojian50) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN50)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian50;
            }
            else if(Boolean(this.apd_mount_2020baojian51) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN51)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian51;
            }
            else if(Boolean(this.apd_mount_2020baojian52) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN52)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian52;
            }
            else if(Boolean(this.apd_mount_2020baojian53) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN53)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian53;
            }
            else if(Boolean(this.apd_mount_2020baojian54) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN54)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian54;
            }
            else if(Boolean(this.apd_mount_2020baojian55) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN55)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian55;
            }
            else if(Boolean(this.apd_mount_2020baojian56) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN56)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian56;
            }
            else if(Boolean(this.apd_mount_2020baojian57) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN57)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian57;
            }
            else if(Boolean(this.apd_mount_2020baojian58) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN58)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian58;
            }
            else if(Boolean(this.apd_mount_2020baojian59) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN59)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian59;
            }
            else if(Boolean(this.apd_mount_2020baojian60) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN60)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian60;
            }
            else if(Boolean(this.apd_mount_2020baojian61) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN61)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian61;
            }
            else if(Boolean(this.apd_mount_2020baojian62) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN62)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian62;
            }
            else if(Boolean(this.apd_mount_2020baojian63) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN63)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian63;
            }
            else if(Boolean(this.apd_mount_2020baojian64) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN64)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian64;
            }
            else if(Boolean(this.apd_mount_2020baojian65) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN65)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian65;
            }
            else if(Boolean(this.apd_mount_2020baojian66) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN66)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian66;
            }
            else if(Boolean(this.apd_mount_2020baojian67) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN67)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian67;
            }
            else if(Boolean(this.apd_mount_2020baojian68) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN68)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian68;
            }
            else if(Boolean(this.apd_mount_2020baojian69) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN69)
            {
               temp_apd_mount_weapon = this.apd_mount_2020baojian69;
            }
            else if(this.isFeixing)
            {
               temp_apd_mount_weapon = this.apd_weapon;
               feixing_wuqiIdNum = 0;
            }
            else
            {
               temp_apd_mount_weapon = this.apd_mount_weapon;
            }
            temp_apd_mount_bow = this.apd_mount_bow;
            temp_apd_mount = this.apd_mount;
            if(temp_apd_mount_body != null)
            {
               apdArr.push(temp_apd_mount_body);
            }
            else
            {
               get_mount_body_apd = function(param1:AvatarParamData):AvatarParamData
               {
                  if(param1 != null)
                  {
                     param1.id = SpeciaAvatarPartID.MOUNT_BODY;
                     param1.useType = 2;
                     param1.clearSameType = true;
                  }
                  return param1;
               };
               if($sex == 1)
               {
                  temp_apd_mount_body = get_mount_body_apd(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_ONMOUNT_1)));
                  apdArr.push(temp_apd_mount_body);
               }
               else if($sex == 0)
               {
                  temp_apd_mount_body = get_mount_body_apd(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_ONMOUNT_0)));
                  apdArr.push(temp_apd_mount_body);
               }
            }
            if(this.isFeixing)
            {
               apdArr = [];
               if(temp_apd_mount_body != null)
               {
                  tempApdYifu = AvatarManager.getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BODY,int(temp_apd_mount_body.className.toLowerCase().replace(/^[a-z]+/,"")),$sex,this.isFeixing);
                  if(tempApdYifu != null)
                  {
                     apdArr.push(tempApdYifu);
                  }
               }
               if(this.usingFashion == 2)
               {
                  tempApdYifu = AvatarManager.getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,AvatarManager.getHuangZhuAvatarId(SpeciaAvatarPartID.WEAPON,$sex),$sex,this.isFeixing);
                  if(tempApdYifu != null)
                  {
                     apdArr.push(tempApdYifu);
                  }
               }
               else if(temp_apd_mount_weapon != null)
               {
                  if($isWeapon)
                  {
                     tempApdYifu = AvatarManager.getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_WEAPON,feixing_wuqiIdNum + int(temp_apd_mount_weapon.className.toLowerCase().replace(/^[a-z]+/,"")),$sex,this.isFeixing);
                     if(tempApdYifu != null)
                     {
                        apdArr.push(tempApdYifu);
                     }
                  }
               }
               tempApdYifu = AvatarManager.getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_BOW,AvatarManager.getChiBangAvatarIdByType(this.isFeixing_huanzhuang_Id,$sex),$sex,this.isFeixing);
               if(tempApdYifu != null)
               {
                  apdArr.push(tempApdYifu);
               }
               tempApdYifu = AvatarManager.getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.MOUNT_ZHENHUN,this.isFeixing_wuhun_Id,$sex,this.isFeixing);
               if(tempApdYifu != null)
               {
                  apdArr.push(tempApdYifu);
               }
            }
            else
            {
               if($isWeapon)
               {
                  if(temp_apd_mount_weapon != null)
                  {
                     apdArr.push(temp_apd_mount_weapon);
                  }
               }
               if(temp_apd_mount_bow != null)
               {
                  apdArr.push(temp_apd_mount_bow);
               }
               if(temp_apd_mount != null)
               {
                  apdArr.push(temp_apd_mount);
               }
            }
         }
         else
         {
            temp_apd_body = this.apd_body;
            itemRes = this.useIng_Weapon_id > 0 ? GoodsResManager.getGoodsRes(this.useIng_Weapon_id) : null;
            if(!itemRes)
            {
               temp_apd_weapon = this.apd_aojian || this.apd_xyj || this.apd_ylzr || this.apd_longyin || this.apd_shenqi || this.apd_quanshen || this.apd_longya || this.apd_potianren || this.apd_tianshang || this.apd_liekong || this.apd_pangu || this.apd_xueyindao || this.apd_gjmy || this.apd_longya1 || this.apd_yanyuedao || this.apd_xuantiezhongjian || this.apd_guangmingzhang || this.apd_huimie || this.apd_zhumozhang || this.apd_chiyan || this.apd_tianjing || this.apd_tianzhu || this.apd_pangukaitianfu || this.apd_tiandijian || this.apd_hanqibingpo || this.apd_jianzunlongquanjian || this.apd_chuangshi || this.apd_suilieshifu || this.apd_moyuan || this.apd_chengjiechangji || this.apd_fengtianji || this.apd_tianxiejian || this.apd_junzijian || this.apd_wangzhejian || this.apd_fengbaodao || this.apd_fengyun || this.apd_shengdan2015 || this.apd_fengsha || this.apd_fengyijian || this.apd_lexinji || this.apd_fengyingjian || this.apd_zhenfengjian || this.apd_fengyunjian || this.apd_weapon;
               if(OtherConst.texiaoBoolean == false)
               {
                  if(temp_apd_weapon == this.apd_weapon)
                  {
                     this.needChangeAvatarXY = true;
                  }
               }
            }
            else if(Boolean(this.apd_aojian) && itemRes.position == ItemPositionRange.POSTION_AOJIAN)
            {
               temp_apd_weapon = this.apd_aojian;
            }
            else if(Boolean(this.apd_xyj) && itemRes.position == ItemPositionRange.POSTION_STDRJ)
            {
               temp_apd_weapon = this.apd_xyj;
            }
            else if(Boolean(this.apd_ylzr) && itemRes.position == ItemPositionRange.POSTION_YLZR)
            {
               temp_apd_weapon = this.apd_ylzr;
            }
            else if(Boolean(this.apd_longyin) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[0])
            {
               temp_apd_weapon = this.apd_longyin;
            }
            else if(Boolean(this.apd_shenqi) && itemRes.position == ItemPositionRange.POSTION_SHENQI)
            {
               temp_apd_weapon = this.apd_shenqi;
            }
            else if(Boolean(this.apd_quanshen) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[1])
            {
               temp_apd_weapon = this.apd_quanshen;
            }
            else if(Boolean(this.apd_longya) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[2])
            {
               temp_apd_weapon = this.apd_longya;
            }
            else if(Boolean(this.apd_potianren) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[9])
            {
               temp_apd_weapon = this.apd_potianren;
            }
            else if(Boolean(this.apd_tianshang) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[3])
            {
               temp_apd_weapon = this.apd_tianshang;
            }
            else if(Boolean(this.apd_liekong) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[4])
            {
               temp_apd_weapon = this.apd_liekong;
            }
            else if(Boolean(this.apd_pangu) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[7])
            {
               temp_apd_weapon = this.apd_pangu;
            }
            else if(Boolean(this.apd_xueyindao) && itemRes.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[8])
            {
               temp_apd_weapon = this.apd_xueyindao;
            }
            else if(Boolean(this.apd_gjmy) && itemRes.position == ItemPositionRange.POSTION_GJMY)
            {
               temp_apd_weapon = this.apd_gjmy;
            }
            else if(Boolean(this.apd_longya1) && itemRes.position == ItemPositionRange.POSITION_LONGYA)
            {
               temp_apd_weapon = this.apd_longya1;
            }
            else if(Boolean(this.apd_yanyuedao) && itemRes.position == ItemPositionRange.POSITION_YAYUEDAO)
            {
               temp_apd_weapon = this.apd_yanyuedao;
            }
            else if(Boolean(this.apd_xuantiezhongjian) && itemRes.position == ItemPositionRange.POSITION_XUANTIEZHONGJIAN)
            {
               temp_apd_weapon = this.apd_xuantiezhongjian;
            }
            else if(Boolean(this.apd_guangmingzhang) && itemRes.position == ItemPositionRange.POSITION_GUANGMINGZHANG)
            {
               temp_apd_weapon = this.apd_guangmingzhang;
            }
            else if(Boolean(this.apd_huimie) && itemRes.position == ItemPositionRange.POSITION_HUIMIE)
            {
               temp_apd_weapon = this.apd_huimie;
            }
            else if(Boolean(this.apd_zhumozhang) && itemRes.position == ItemPositionRange.POSITION_ZHUMOZHANG)
            {
               temp_apd_weapon = this.apd_zhumozhang;
            }
            else if(Boolean(this.apd_chiyan) && itemRes.position == ItemPositionRange.POSITION_CHIYAN)
            {
               temp_apd_weapon = this.apd_chiyan;
            }
            else if(Boolean(this.apd_tianjing) && itemRes.position == ItemPositionRange.POSITION_TIANJING)
            {
               temp_apd_weapon = this.apd_tianjing;
            }
            else if(Boolean(this.apd_fengtianji) && itemRes.position == ItemPositionRange.POSITION_FENGTIANJI)
            {
               temp_apd_weapon = this.apd_fengtianji;
            }
            else if(Boolean(this.apd_huolongdao) && itemRes.position == ItemPositionRange.POSITION_HUOLONGDAO)
            {
               temp_apd_weapon = this.apd_huolongdao;
            }
            else if(Boolean(this.apd_tianzhu) && itemRes.position == ItemPositionRange.POSITION_TIANZHU)
            {
               temp_apd_weapon = this.apd_tianzhu;
            }
            else if(Boolean(this.apd_pangukaitianfu) && itemRes.position == ItemPositionRange.POSITION_PANGUKAITIANFU)
            {
               temp_apd_weapon = this.apd_pangukaitianfu;
            }
            else if(Boolean(this.apd_tiandijian) && itemRes.position == ItemPositionRange.POSITION_TIANDI)
            {
               temp_apd_weapon = this.apd_tiandijian;
            }
            else if(Boolean(this.apd_hanqibingpo) && itemRes.position == ItemPositionRange.POSITION_HANQIBINGPO)
            {
               temp_apd_weapon = this.apd_hanqibingpo;
            }
            else if(Boolean(this.apd_jianzunlongquanjian) && itemRes.position == ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN)
            {
               temp_apd_weapon = this.apd_jianzunlongquanjian;
            }
            else if(Boolean(this.apd_chuangshi) && itemRes.position == ItemPositionRange.POSITION_CHUANGSHI)
            {
               temp_apd_weapon = this.apd_chuangshi;
            }
            else if(Boolean(this.apd_suilieshifu) && itemRes.position == ItemPositionRange.POSITION_SUILIESHIFU)
            {
               temp_apd_weapon = this.apd_suilieshifu;
            }
            else if(Boolean(this.apd_moyuan) && itemRes.position == ItemPositionRange.POSITION_MOYUAN)
            {
               temp_apd_weapon = this.apd_moyuan;
            }
            else if(Boolean(this.apd_chengjiechangji) && itemRes.position == ItemPositionRange.POSITION_CHENGJIECHANGJI)
            {
               temp_apd_weapon = this.apd_chengjiechangji;
            }
            else if(Boolean(this.apd_tianxiejian) && itemRes.position == ItemPositionRange.POSITION_TIANXIEJIAN)
            {
               temp_apd_weapon = this.apd_tianxiejian;
            }
            else if(Boolean(this.apd_junzijian) && itemRes.position == ItemPositionRange.POSITION_JUNZIJIAN)
            {
               temp_apd_weapon = this.apd_junzijian;
            }
            else if(Boolean(this.apd_wangzhejian) && itemRes.position == ItemPositionRange.POSITION_WANGZHEJIAN)
            {
               temp_apd_weapon = this.apd_wangzhejian;
            }
            else if(Boolean(this.apd_fengbaodao) && itemRes.position == ItemPositionRange.POSITION_FENGBAODAO)
            {
               temp_apd_weapon = this.apd_fengbaodao;
            }
            else if(Boolean(this.apd_fengyun) && itemRes.position == ItemPositionRange.POSITION_FENGYUN)
            {
               temp_apd_weapon = this.apd_fengyun;
            }
            else if(Boolean(this.apd_shengdan2015) && itemRes.position == ItemPositionRange.POSITION_SHENGDAN2015)
            {
               temp_apd_weapon = this.apd_shengdan2015;
            }
            else if(Boolean(this.apd_fengsha) && itemRes.position == ItemPositionRange.POSITION_FENGSHA)
            {
               temp_apd_weapon = this.apd_fengsha;
            }
            else if(Boolean(this.apd_fengyijian) && itemRes.position == ItemPositionRange.POSITION_FENGYIJIAN)
            {
               temp_apd_weapon = this.apd_fengyijian;
            }
            else if(Boolean(this.apd_lexinji) && itemRes.position == ItemPositionRange.POSITION_LEXINJI)
            {
               temp_apd_weapon = this.apd_lexinji;
            }
            else if(Boolean(this.apd_fengyingjian) && itemRes.position == ItemPositionRange.POSITION_FENGYINGJIAN)
            {
               temp_apd_weapon = this.apd_fengyingjian;
            }
            else if(Boolean(this.apd_zhenfengjian) && itemRes.position == ItemPositionRange.POSITION_ZHENFENGJIAN)
            {
               temp_apd_weapon = this.apd_zhenfengjian;
            }
            else if(Boolean(this.apd_fengyunjian) && itemRes.position == ItemPositionRange.POSITION_FENGYUNJIAN)
            {
               temp_apd_weapon = this.apd_fengyunjian;
            }
            else if(Boolean(this.apd_bingfengjian) && itemRes.position == ItemPositionRange.POSITION_BINGFENGJIAN)
            {
               temp_apd_weapon = this.apd_bingfengjian;
            }
            else if(Boolean(this.apd_hongleizhangu) && itemRes.position == ItemPositionRange.POSITION_HONGLEIZHANGU)
            {
               temp_apd_weapon = this.apd_hongleizhangu;
            }
            else if(Boolean(this.apd_sandenggufo) && itemRes.position == ItemPositionRange.POSITION_SANDENGGUFO)
            {
               temp_apd_weapon = this.apd_sandenggufo;
            }
            else if(Boolean(this.apd_fonuji) && itemRes.position == ItemPositionRange.POSITION_FONUJI)
            {
               temp_apd_weapon = this.apd_fonuji;
            }
            else if(Boolean(this.apd_fengyinjian) && itemRes.position == ItemPositionRange.POSITION_FENGYINJIAN)
            {
               temp_apd_weapon = this.apd_fengyinjian;
            }
            else if(Boolean(this.apd_tianmajian) && itemRes.position == ItemPositionRange.POSITION_TIANMAJIAN)
            {
               temp_apd_weapon = this.apd_tianmajian;
            }
            else if(Boolean(this.apd_wuhunjian) && itemRes.position == ItemPositionRange.POSITION_WUHUNJIAN)
            {
               temp_apd_weapon = this.apd_wuhunjian;
            }
            else if(Boolean(this.apd_zhentianjian) && itemRes.position == ItemPositionRange.POSITION_ZHENTIANJIAN)
            {
               temp_apd_weapon = this.apd_zhentianjian;
            }
            else if(Boolean(this.apd_tianxue) && itemRes.position == ItemPositionRange.POSITION_TIANXUE)
            {
               temp_apd_weapon = this.apd_tianxue;
            }
            else if(Boolean(this.apd_xiongjijian) && itemRes.position == ItemPositionRange.POSITION_XIONGJIJIAN)
            {
               temp_apd_weapon = this.apd_xiongjijian;
            }
            else if(Boolean(this.apd_wujinjian) && itemRes.position == ItemPositionRange.POSITION_WUJINJIAN)
            {
               temp_apd_weapon = this.apd_wujinjian;
            }
            else if(Boolean(this.apd_shuntianjian) && itemRes.position == ItemPositionRange.POSITION_SHUNTIANJIAN)
            {
               temp_apd_weapon = this.apd_shuntianjian;
            }
            else if(Boolean(this.apd_wangzheqicang) && itemRes.position == ItemPositionRange.POSITION_WANGZHEQICANG)
            {
               temp_apd_weapon = this.apd_wangzheqicang;
            }
            else if(Boolean(this.apd_bixuejian) && itemRes.position == ItemPositionRange.POSITION_BIXUEJIAN)
            {
               temp_apd_weapon = this.apd_bixuejian;
            }
            else if(Boolean(this.apd_wuyijian) && itemRes.position == ItemPositionRange.POSITION_WUYIJIAN)
            {
               temp_apd_weapon = this.apd_wuyijian;
            }
            else if(Boolean(this.apd_shijianshenqi) && itemRes.position == ItemPositionRange.POSITION_SHIJIANSHENQI)
            {
               temp_apd_weapon = this.apd_shijianshenqi;
            }
            else if(Boolean(this.apd_qingfengjian) && itemRes.position == ItemPositionRange.POSITION_QINGFENGJIAN)
            {
               temp_apd_weapon = this.apd_qingfengjian;
            }
            else if(Boolean(this.apd_huolinjian) && itemRes.position == ItemPositionRange.POSITION_HUOLINJIAN)
            {
               temp_apd_weapon = this.apd_huolinjian;
            }
            else if(Boolean(this.apd_zhuihunji) && itemRes.position == ItemPositionRange.POSITION_ZHUIHUNJI)
            {
               temp_apd_weapon = this.apd_zhuihunji;
            }
            else if(Boolean(this.apd_biyudao) && itemRes.position == ItemPositionRange.POSITION_BIYUDAO)
            {
               temp_apd_weapon = this.apd_biyudao;
            }
            else if(Boolean(this.apd_wuwozhang) && itemRes.position == ItemPositionRange.POSITION_WUWOZHANG)
            {
               temp_apd_weapon = this.apd_wuwozhang;
            }
            else if(Boolean(this.apd_yehuohonglian) && itemRes.position == ItemPositionRange.POSITION_YEHUOHONGLIAN)
            {
               temp_apd_weapon = this.apd_yehuohonglian;
            }
            else if(Boolean(this.apd_mingyuedao) && itemRes.position == ItemPositionRange.POSITION_MINGYUEDAO)
            {
               temp_apd_weapon = this.apd_mingyuedao;
            }
            else if(Boolean(this.apd_qingfengjian2) && itemRes.position == ItemPositionRange.POSITION_QINGFENGJIAN2)
            {
               temp_apd_weapon = this.apd_qingfengjian2;
            }
            else if(Boolean(this.apd_zhizunjian) && itemRes.position == ItemPositionRange.POSITION_ZHIZUNJIAN)
            {
               temp_apd_weapon = this.apd_zhizunjian;
            }
            else if(Boolean(this.apd_baoleiji) && itemRes.position == ItemPositionRange.POSITION_BAOLEIJI)
            {
               temp_apd_weapon = this.apd_baoleiji;
            }
            else if(Boolean(this.apd_mingshengzhang) && itemRes.position == ItemPositionRange.POSITION_MINGSHENGZHANG)
            {
               temp_apd_weapon = this.apd_mingshengzhang;
            }
            else if(Boolean(this.apd_zunshijian) && itemRes.position == ItemPositionRange.POSITION_ZUNSHIJIAN)
            {
               temp_apd_weapon = this.apd_zunshijian;
            }
            else if(Boolean(this.apd_renzhezhang) && itemRes.position == ItemPositionRange.POSITION_RENZHEZHANG)
            {
               temp_apd_weapon = this.apd_renzhezhang;
            }
            else if(Boolean(this.apd_zhizhejian) && itemRes.position == ItemPositionRange.POSITION_ZHIZHEJIAN)
            {
               temp_apd_weapon = this.apd_zhizhejian;
            }
            else if(Boolean(this.apd_yangmingjian) && itemRes.position == ItemPositionRange.POSITION_YANGMINGJIAN)
            {
               temp_apd_weapon = this.apd_yangmingjian;
            }
            else if(Boolean(this.apd_xiwangjian) && itemRes.position == ItemPositionRange.POSITION_XIWANGJIAN)
            {
               temp_apd_weapon = this.apd_xiwangjian;
            }
            else if(Boolean(this.apd_xuejingjian) && itemRes.position == ItemPositionRange.POSITION_XUEJINGJIAN)
            {
               temp_apd_weapon = this.apd_xuejingjian;
            }
            else if(Boolean(this.apd_xuanbingjian) && itemRes.position == ItemPositionRange.POSITION_XUANBINGJIAN)
            {
               temp_apd_weapon = this.apd_xuanbingjian;
            }
            else if(Boolean(this.apd_pinganjian) && itemRes.position == ItemPositionRange.POSITION_PINGANJIAN)
            {
               temp_apd_weapon = this.apd_pinganjian;
            }
            else if(Boolean(this.apd_qinghuajian) && itemRes.position == ItemPositionRange.POSITION_QINGHUAJIAN)
            {
               temp_apd_weapon = this.apd_qinghuajian;
            }
            else if(Boolean(this.apd_yuxujian) && itemRes.position == ItemPositionRange.POSITION_YUXUJIAN)
            {
               temp_apd_weapon = this.apd_yuxujian;
            }
            else if(Boolean(this.apd_yuqingshan) && itemRes.position == ItemPositionRange.POSITION_YUQINGSHAN)
            {
               temp_apd_weapon = this.apd_yuqingshan;
            }
            else if(Boolean(this.apd_huomodao) && itemRes.position == ItemPositionRange.POSITION_HUOMODAO)
            {
               temp_apd_weapon = this.apd_huomodao;
            }
            else if(Boolean(this.apd_yiheji) && itemRes.position == ItemPositionRange.POSITION_YIHEJI)
            {
               temp_apd_weapon = this.apd_yiheji;
            }
            else if(Boolean(this.apd_erhejian) && itemRes.position == ItemPositionRange.POSITION_ERHEJIAN)
            {
               temp_apd_weapon = this.apd_erhejian;
            }
            else if(Boolean(this.apd_sanhedao) && itemRes.position == ItemPositionRange.POSITION_SANHEDAO)
            {
               temp_apd_weapon = this.apd_sanhedao;
            }
            else if(Boolean(this.apd_sanhedao) && itemRes.position == ItemPositionRange.POSITION_MIEHUSHAN)
            {
               temp_apd_weapon = this.apd_miehushan;
            }
            else if(Boolean(this.apd_qingmingdao) && itemRes.position == ItemPositionRange.POSITION_QINGMINGDAO)
            {
               temp_apd_weapon = this.apd_qingmingdao;
            }
            else if(Boolean(this.apd_huoxingfu) && itemRes.position == ItemPositionRange.POSITION_HUOXINGFU)
            {
               temp_apd_weapon = this.apd_huoxingfu;
            }
            else if(Boolean(this.apd_shenzao) && itemRes.position == ItemPositionRange.POSITION_SHENZAO)
            {
               temp_apd_weapon = this.apd_shenzao;
            }
            else if(Boolean(this.apd_kaitiangong) && itemRes.position == ItemPositionRange.POSITION_KAITIANGONG)
            {
               temp_apd_weapon = this.apd_kaitiangong;
            }
            else if(Boolean(this.apd_yanwenfenmo) && itemRes.position == ItemPositionRange.POSITION_YANWENFENGMO)
            {
               temp_apd_weapon = this.apd_yanwenfenmo;
            }
            else if(Boolean(this.apd_linglongzi) && itemRes.position == ItemPositionRange.POSITION_LINGLONGZI)
            {
               temp_apd_weapon = this.apd_linglongzi;
            }
            else if(Boolean(this.apd_shashenjian) && itemRes.position == ItemPositionRange.POSITION_SHASHENJIAN)
            {
               temp_apd_weapon = this.apd_shashenjian;
            }
            else if(Boolean(this.apd_duanqingji) && itemRes.position == ItemPositionRange.POSITION_DUANQINGJI)
            {
               temp_apd_weapon = this.apd_duanqingji;
            }
            else if(Boolean(this.apd_nulong) && itemRes.position == ItemPositionRange.POSITION_NULONG)
            {
               temp_apd_weapon = this.apd_nulong;
            }
            else if(Boolean(this.apd_qinian) && itemRes.position == ItemPositionRange.POSITION_QINIAN)
            {
               temp_apd_weapon = this.apd_qinian;
            }
            else if(Boolean(this.apd_zhuxian) && itemRes.position == ItemPositionRange.POSITION_ZHUXIAN)
            {
               temp_apd_weapon = this.apd_zhuxian;
            }
            else if(Boolean(this.apd_hanbing) && itemRes.position == ItemPositionRange.POSITION_HANBING)
            {
               temp_apd_weapon = this.apd_hanbing;
            }
            else if(Boolean(this.apd_poshan) && itemRes.position == ItemPositionRange.POSITION_POSHAN)
            {
               temp_apd_weapon = this.apd_poshan;
            }
            else if(Boolean(this.apd_haiyu) && itemRes.position == ItemPositionRange.POSITION_HAIYU)
            {
               temp_apd_weapon = this.apd_haiyu;
            }
            else if(Boolean(this.apd_tianmingdao) && itemRes.position == ItemPositionRange.POSITION_TIANMINGDAO)
            {
               temp_apd_weapon = this.apd_tianmingdao;
            }
            else if(Boolean(this.apd_jingtianyiji) && itemRes.position == ItemPositionRange.POSITION_JINGTIANYIJI)
            {
               temp_apd_weapon = this.apd_jingtianyiji;
            }
            else if(Boolean(this.apd_jingleijuedao) && itemRes.position == ItemPositionRange.POSITION_JINGLEIJUEDAO)
            {
               temp_apd_weapon = this.apd_jingleijuedao;
            }
            else if(Boolean(this.apd_yingxiongjian) && itemRes.position == ItemPositionRange.POSITION_YINGXIONGJIAN)
            {
               temp_apd_weapon = this.apd_yingxiongjian;
            }
            else if(Boolean(this.apd_changshengjian) && itemRes.position == ItemPositionRange.POSITION_CHANGSHENGJIAN)
            {
               temp_apd_weapon = this.apd_changshengjian;
            }
            else if(Boolean(this.apd_guiyinggong) && itemRes.position == ItemPositionRange.POSITION_GUIYINGGONG)
            {
               temp_apd_weapon = this.apd_guiyinggong;
            }
            else if(Boolean(this.apd_jingleizhang) && itemRes.position == ItemPositionRange.POSITION_JINGLEIZHANG)
            {
               temp_apd_weapon = this.apd_jingleizhang;
            }
            else if(Boolean(this.apd_hundun) && itemRes.position == ItemPositionRange.POSITION_HUNDUN)
            {
               temp_apd_weapon = this.apd_hundun;
            }
            else if(Boolean(this.apd_dinghun) && itemRes.position == ItemPositionRange.POSITION_DINGHUN)
            {
               temp_apd_weapon = this.apd_dinghun;
            }
            else if(Boolean(this.apd_tiandiwuji) && itemRes.position == ItemPositionRange.POSITION_WUJI)
            {
               temp_apd_weapon = this.apd_tiandiwuji;
            }
            else if(Boolean(this.apd_huoxingjian) && itemRes.position == ItemPositionRange.POSITION_HUOXINGJIAN)
            {
               temp_apd_weapon = this.apd_huoxingjian;
            }
            else if(Boolean(this.apd_wangzhefu) && itemRes.position == ItemPositionRange.POSITION_WANGZHEFU)
            {
               temp_apd_weapon = this.apd_wangzhefu;
            }
            else if(Boolean(this.apd_duomingdao) && itemRes.position == ItemPositionRange.POSITION_DUOMINGDAO)
            {
               temp_apd_weapon = this.apd_duomingdao;
            }
            else if(Boolean(this.apd_xiaoshen) && itemRes.position == ItemPositionRange.POSITION_XIAOSHEN)
            {
               temp_apd_weapon = this.apd_xiaoshen;
            }
            else if(Boolean(this.apd_wanshi) && itemRes.position == ItemPositionRange.POSITION_WANSHI)
            {
               temp_apd_weapon = this.apd_wanshi;
            }
            else if(Boolean(this.apd_zhongqiu) && itemRes.position == ItemPositionRange.POSITION_ZHONGQIU)
            {
               temp_apd_weapon = this.apd_zhongqiu;
            }
            else if(Boolean(this.apd_shenjian) && itemRes.position == ItemPositionRange.POSITION_SHENJIAN)
            {
               temp_apd_weapon = this.apd_shenjian;
            }
            else if(Boolean(this.apd_yuhuazhang) && itemRes.position == ItemPositionRange.POSITION_YUHUAZHANG)
            {
               temp_apd_weapon = this.apd_yuhuazhang;
            }
            else if(Boolean(this.apd_baniangong) && itemRes.position == ItemPositionRange.POSITION_BANIANGONG)
            {
               temp_apd_weapon = this.apd_baniangong;
            }
            else if(Boolean(this.apd_banianjian) && itemRes.position == ItemPositionRange.POSITION_BANIANJIAN)
            {
               temp_apd_weapon = this.apd_banianjian;
            }
            else if(Boolean(this.apd_banianji) && itemRes.position == ItemPositionRange.POSITION_BANIANJI)
            {
               temp_apd_weapon = this.apd_banianji;
            }
            else if(Boolean(this.apd_2019shendan) && itemRes.position == ItemPositionRange.POSITION_2019SHENDAN)
            {
               temp_apd_weapon = this.apd_2019shendan;
            }
            else if(Boolean(this.apd_2019gengzi) && itemRes.position == ItemPositionRange.POSITION_2019GENGZI)
            {
               temp_apd_weapon = this.apd_2019gengzi;
            }
            else if(Boolean(this.apd_2019feihua) && itemRes.position == ItemPositionRange.POSITION_2019FEIHUA)
            {
               temp_apd_weapon = this.apd_2019feihua;
            }
            else if(Boolean(this.apd_2019xiongwang) && itemRes.position == ItemPositionRange.POSITION_2019XIONGWANG)
            {
               temp_apd_weapon = this.apd_2019xiongwang;
            }
            else if(Boolean(this.apd_2020xuehuan) && itemRes.position == ItemPositionRange.POSITION_2020XUEHUAN)
            {
               temp_apd_weapon = this.apd_2020xuehuan;
            }
            else if(Boolean(this.apd_2020badao) && itemRes.position == ItemPositionRange.POSITION_2020BADAO)
            {
               temp_apd_weapon = this.apd_2020badao;
            }
            else if(Boolean(this.apd_2020baojian01) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN01)
            {
               temp_apd_weapon = this.apd_2020baojian01;
            }
            else if(Boolean(this.apd_2020baojian02) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN02)
            {
               temp_apd_weapon = this.apd_2020baojian02;
            }
            else if(Boolean(this.apd_2020baojian03) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN03)
            {
               temp_apd_weapon = this.apd_2020baojian03;
            }
            else if(Boolean(this.apd_2020baojian04) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN04)
            {
               temp_apd_weapon = this.apd_2020baojian04;
            }
            else if(Boolean(this.apd_2020baojian05) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN05)
            {
               temp_apd_weapon = this.apd_2020baojian05;
            }
            else if(Boolean(this.apd_2020baojian06) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN06)
            {
               temp_apd_weapon = this.apd_2020baojian06;
            }
            else if(Boolean(this.apd_2020baojian07) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN07)
            {
               temp_apd_weapon = this.apd_2020baojian07;
            }
            else if(Boolean(this.apd_2020baojian08) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN08)
            {
               temp_apd_weapon = this.apd_2020baojian08;
            }
            else if(Boolean(this.apd_2020baojian09) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN09)
            {
               temp_apd_weapon = this.apd_2020baojian09;
            }
            else if(Boolean(this.apd_2020baojian10) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN10)
            {
               temp_apd_weapon = this.apd_2020baojian10;
            }
            else if(Boolean(this.apd_2020baojian11) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN11)
            {
               temp_apd_weapon = this.apd_2020baojian11;
            }
            else if(Boolean(this.apd_2020baojian12) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN12)
            {
               temp_apd_weapon = this.apd_2020baojian12;
            }
            else if(Boolean(this.apd_2020baojian13) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN13)
            {
               temp_apd_weapon = this.apd_2020baojian13;
            }
            else if(Boolean(this.apd_2020baojian14) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN14)
            {
               temp_apd_weapon = this.apd_2020baojian14;
            }
            else if(Boolean(this.apd_2020baojian15) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN15)
            {
               temp_apd_weapon = this.apd_2020baojian15;
            }
            else if(Boolean(this.apd_2020baojian16) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN16)
            {
               temp_apd_weapon = this.apd_2020baojian16;
            }
            else if(Boolean(this.apd_2020baojian17) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN17)
            {
               temp_apd_weapon = this.apd_2020baojian17;
            }
            else if(Boolean(this.apd_2020baojian18) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN18)
            {
               temp_apd_weapon = this.apd_2020baojian18;
            }
            else if(Boolean(this.apd_2020baojian19) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN19)
            {
               temp_apd_weapon = this.apd_2020baojian19;
            }
            else if(Boolean(this.apd_2020baojian20) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN20)
            {
               temp_apd_weapon = this.apd_2020baojian20;
            }
            else if(Boolean(this.apd_2020baojian21) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN21)
            {
               temp_apd_weapon = this.apd_2020baojian21;
            }
            else if(Boolean(this.apd_2020baojian22) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN22)
            {
               temp_apd_weapon = this.apd_2020baojian22;
            }
            else if(Boolean(this.apd_2020baojian23) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN23)
            {
               temp_apd_weapon = this.apd_2020baojian23;
            }
            else if(Boolean(this.apd_2020baojian24) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN24)
            {
               temp_apd_weapon = this.apd_2020baojian24;
            }
            else if(Boolean(this.apd_2020baojian25) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN25)
            {
               temp_apd_weapon = this.apd_2020baojian25;
            }
            else if(Boolean(this.apd_2020baojian26) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN26)
            {
               temp_apd_weapon = this.apd_2020baojian26;
            }
            else if(Boolean(this.apd_2020baojian27) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN27)
            {
               temp_apd_weapon = this.apd_2020baojian27;
            }
            else if(Boolean(this.apd_2020baojian28) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN28)
            {
               temp_apd_weapon = this.apd_2020baojian28;
            }
            else if(Boolean(this.apd_2020baojian29) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN29)
            {
               temp_apd_weapon = this.apd_2020baojian29;
            }
            else if(Boolean(this.apd_2020baojian30) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN30)
            {
               temp_apd_weapon = this.apd_2020baojian30;
            }
            else if(Boolean(this.apd_2020baojian31) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN31)
            {
               temp_apd_weapon = this.apd_2020baojian31;
            }
            else if(Boolean(this.apd_2020baojian32) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN32)
            {
               temp_apd_weapon = this.apd_2020baojian32;
            }
            else if(Boolean(this.apd_2020baojian33) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN33)
            {
               temp_apd_weapon = this.apd_2020baojian33;
            }
            else if(Boolean(this.apd_2020baojian34) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN34)
            {
               temp_apd_weapon = this.apd_2020baojian34;
            }
            else if(Boolean(this.apd_2020baojian35) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN35)
            {
               temp_apd_weapon = this.apd_2020baojian35;
            }
            else if(Boolean(this.apd_2020baojian36) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN36)
            {
               temp_apd_weapon = this.apd_2020baojian36;
            }
            else if(Boolean(this.apd_2020baojian37) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN37)
            {
               temp_apd_weapon = this.apd_2020baojian37;
            }
            else if(Boolean(this.apd_2020baojian38) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN38)
            {
               temp_apd_weapon = this.apd_2020baojian38;
            }
            else if(Boolean(this.apd_2020baojian39) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN39)
            {
               temp_apd_weapon = this.apd_2020baojian39;
            }
            else if(Boolean(this.apd_2020baojian40) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN40)
            {
               temp_apd_weapon = this.apd_2020baojian40;
            }
            else if(Boolean(this.apd_2020baojian41) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN41)
            {
               temp_apd_weapon = this.apd_2020baojian41;
            }
            else if(Boolean(this.apd_2020baojian42) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN42)
            {
               temp_apd_weapon = this.apd_2020baojian42;
            }
            else if(Boolean(this.apd_2020baojian43) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN43)
            {
               temp_apd_weapon = this.apd_2020baojian43;
            }
            else if(Boolean(this.apd_2020baojian44) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN44)
            {
               temp_apd_weapon = this.apd_2020baojian44;
            }
            else if(Boolean(this.apd_2020baojian45) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN45)
            {
               temp_apd_weapon = this.apd_2020baojian45;
            }
            else if(Boolean(this.apd_2020baojian46) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN46)
            {
               temp_apd_weapon = this.apd_2020baojian46;
            }
            else if(Boolean(this.apd_2020baojian47) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN47)
            {
               temp_apd_weapon = this.apd_2020baojian47;
            }
            else if(Boolean(this.apd_2020baojian48) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN48)
            {
               temp_apd_weapon = this.apd_2020baojian48;
            }
            else if(Boolean(this.apd_2020baojian49) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN49)
            {
               temp_apd_weapon = this.apd_2020baojian49;
            }
            else if(Boolean(this.apd_2020baojian50) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN50)
            {
               temp_apd_weapon = this.apd_2020baojian50;
            }
            else if(Boolean(this.apd_2020baojian51) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN51)
            {
               temp_apd_weapon = this.apd_2020baojian51;
            }
            else if(Boolean(this.apd_2020baojian52) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN52)
            {
               temp_apd_weapon = this.apd_2020baojian52;
            }
            else if(Boolean(this.apd_2020baojian53) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN53)
            {
               temp_apd_weapon = this.apd_2020baojian53;
            }
            else if(Boolean(this.apd_2020baojian54) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN54)
            {
               temp_apd_weapon = this.apd_2020baojian54;
            }
            else if(Boolean(this.apd_2020baojian55) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN55)
            {
               temp_apd_weapon = this.apd_2020baojian55;
            }
            else if(Boolean(this.apd_2020baojian56) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN56)
            {
               temp_apd_weapon = this.apd_2020baojian56;
            }
            else if(Boolean(this.apd_2020baojian57) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN57)
            {
               temp_apd_weapon = this.apd_2020baojian57;
            }
            else if(Boolean(this.apd_2020baojian58) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN58)
            {
               temp_apd_weapon = this.apd_2020baojian58;
            }
            else if(Boolean(this.apd_2020baojian59) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN59)
            {
               temp_apd_weapon = this.apd_2020baojian59;
            }
            else if(Boolean(this.apd_2020baojian60) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN60)
            {
               temp_apd_weapon = this.apd_2020baojian60;
            }
            else if(Boolean(this.apd_2020baojian61) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN61)
            {
               temp_apd_weapon = this.apd_2020baojian61;
            }
            else if(Boolean(this.apd_2020baojian62) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN62)
            {
               temp_apd_weapon = this.apd_2020baojian62;
            }
            else if(Boolean(this.apd_2020baojian63) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN63)
            {
               temp_apd_weapon = this.apd_2020baojian63;
            }
            else if(Boolean(this.apd_2020baojian64) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN64)
            {
               temp_apd_weapon = this.apd_2020baojian64;
            }
            else if(Boolean(this.apd_2020baojian65) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN65)
            {
               temp_apd_weapon = this.apd_2020baojian65;
            }
            else if(Boolean(this.apd_2020baojian66) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN66)
            {
               temp_apd_weapon = this.apd_2020baojian66;
            }
            else if(Boolean(this.apd_2020baojian67) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN67)
            {
               temp_apd_weapon = this.apd_2020baojian67;
            }
            else if(Boolean(this.apd_2020baojian68) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN68)
            {
               temp_apd_weapon = this.apd_2020baojian68;
            }
            else if(Boolean(this.apd_2020baojian69) && itemRes.position == ItemPositionRange.POSITION_2020BAOJIAN69)
            {
               temp_apd_weapon = this.apd_2020baojian69;
            }
            else
            {
               temp_apd_weapon = this.apd_weapon;
               this.needChangeAvatarXY = true;
            }
            temp_apd_bow = this.apd_bow;
            if(temp_apd_body != null)
            {
               apdArr.push(temp_apd_body);
            }
            else
            {
               get_body_apd = function(param1:AvatarParamData):AvatarParamData
               {
                  if(param1 != null)
                  {
                     param1.id = SpeciaAvatarPartID.BODY;
                     param1.useType = 1;
                     param1.clearSameType = true;
                  }
                  return param1;
               };
               if($sex == 1)
               {
                  temp_apd_body = get_body_apd(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_1)));
                  apdArr.push(temp_apd_body);
               }
               else if($sex == 0)
               {
                  temp_apd_body = get_body_apd(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_0)));
                  apdArr.push(temp_apd_body);
               }
            }
            if(this.isFeixing)
            {
               apdArr = [];
               if(temp_apd_body != null)
               {
                  tempApdYifu = AvatarManager.getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BODY,int(temp_apd_body.className.toLowerCase().replace(/^[a-z]+/,"")),$sex,this.isFeixing);
                  if(tempApdYifu != null)
                  {
                     apdArr.push(tempApdYifu);
                  }
               }
               if(this.usingFashion == 2)
               {
                  tempApdYifu = AvatarManager.getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,AvatarManager.getHuangZhuAvatarId(SpeciaAvatarPartID.WEAPON,$sex),$sex,this.isFeixing);
                  if(tempApdYifu != null)
                  {
                     apdArr.push(tempApdYifu);
                  }
               }
               else if(temp_apd_weapon != null)
               {
                  tempApdYifu = AvatarManager.getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.WEAPON,int(temp_apd_weapon.className.toLowerCase().replace(/^[a-z]+/,"")),$sex,this.isFeixing);
                  if(tempApdYifu != null)
                  {
                     apdArr.push(tempApdYifu);
                  }
               }
               tempApdYifu = AvatarManager.getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.BOW,AvatarManager.getChiBangAvatarIdByType(this.isFeixing_huanzhuang_Id,$sex),$sex,this.isFeixing);
               if(tempApdYifu != null)
               {
                  apdArr.push(tempApdYifu);
               }
               tempApdYifu = AvatarManager.getAvatarParamDataByTypeAndId(SpeciaAvatarPartID.ZHENHUN,this.isFeixing_wuhun_Id,$sex,this.isFeixing);
               if(tempApdYifu != null)
               {
                  apdArr.push(tempApdYifu);
               }
            }
            else
            {
               if($isWeapon)
               {
                  if(temp_apd_weapon != null)
                  {
                     apdArr.push(temp_apd_weapon);
                  }
               }
               if(temp_apd_bow != null)
               {
                  apdArr.push(temp_apd_bow);
               }
            }
         }
         return apdArr;
      }
      
      public function clear() : void
      {
         this.apd_body = null;
         this.apd_weapon = null;
         this.apd_ylzr = null;
         this.apd_xyj = null;
         this.apd_aojian = null;
         this.apd_shenqi = null;
         this.apd_longya = null;
         this.apd_bow = null;
         this.apd_zhenhun = null;
         this.apd_longyin = null;
         this.apd_quanshen = null;
         this.apd_potianren = null;
         this.apd_tianshang = null;
         this.apd_liekong = null;
         this.apd_pangu = null;
         this.apd_xueyindao = null;
         this.apd_gjmy = null;
         this.apd_longya1 = null;
         this.apd_yanyuedao = null;
         this.apd_xuantiezhongjian = null;
         this.apd_guangmingzhang = null;
         this.apd_huimie = null;
         this.apd_zhumozhang = null;
         this.apd_chiyan = null;
         this.apd_tianjing = null;
         this.apd_fengtianji = null;
         this.apd_tianzhu = null;
         this.apd_pangukaitianfu = null;
         this.apd_tiandijian = null;
         this.apd_hanqibingpo = null;
         this.apd_jianzunlongquanjian = null;
         this.apd_chuangshi = null;
         this.apd_suilieshifu = null;
         this.apd_moyuan = null;
         this.apd_chengjiechangji = null;
         this.apd_tianxiejian = null;
         this.apd_junzijian = null;
         this.apd_wangzhejian = null;
         this.apd_fengbaodao = null;
         this.apd_fengyun = null;
         this.apd_shengdan2015 = null;
         this.apd_fengsha = null;
         this.apd_fengyijian = null;
         this.apd_lexinji = null;
         this.apd_fengyingjian = null;
         this.apd_fengyunjian = null;
         this.apd_zhenfengjian = null;
         this.apd_bingfengjian = null;
         this.apd_bingfengjian = null;
         this.apd_hongleizhangu = null;
         this.apd_sandenggufo = null;
         this.apd_fonuji = null;
         this.apd_fengyinjian = null;
         this.apd_tianmajian = null;
         this.apd_wuhunjian = null;
         this.apd_zhentianjian = null;
         this.apd_tianxue = null;
         this.apd_xiongjijian = null;
         this.apd_wujinjian = null;
         this.apd_shuntianjian = null;
         this.apd_wangzheqicang = null;
         this.apd_bixuejian = null;
         this.apd_wuyijian = null;
         this.apd_shijianshenqi = null;
         this.apd_qingfengjian = null;
         this.apd_huolinjian = null;
         this.apd_zhuihunji = null;
         this.apd_biyudao = null;
         this.apd_wuwozhang = null;
         this.apd_yehuohonglian = null;
         this.apd_mingyuedao = null;
         this.apd_qingfengjian2 = null;
         this.apd_zhizunjian = null;
         this.apd_baoleiji = null;
         this.apd_mingshengzhang = null;
         this.apd_zunshijian = null;
         this.apd_renzhezhang = null;
         this.apd_zhizhejian = null;
         this.apd_yangmingjian = null;
         this.apd_xiwangjian = null;
         this.apd_xuejingjian = null;
         this.apd_xuanbingjian = null;
         this.apd_pinganjian = null;
         this.apd_qinghuajian = null;
         this.apd_yuxujian = null;
         this.apd_duanqingji = null;
         this.apd_nulong = null;
         this.apd_qinian = null;
         this.apd_zhuxian = null;
         this.apd_hanbing = null;
         this.apd_poshan = null;
         this.apd_haiyu = null;
         this.apd_tianmingdao = null;
         this.apd_jingtianyiji = null;
         this.apd_jingleijuedao = null;
         this.apd_yingxiongjian = null;
         this.apd_changshengjian = null;
         this.apd_guiyinggong = null;
         this.apd_jingleizhang = null;
         this.apd_hundun = null;
         this.apd_dinghun = null;
         this.apd_tiandiwuji = null;
         this.apd_huoxingjian = null;
         this.apd_wangzhefu = null;
         this.apd_duomingdao = null;
         this.apd_xiaoshen = null;
         this.apd_wanshi = null;
         this.apd_zhongqiu = null;
         this.apd_shenjian = null;
         this.apd_yuhuazhang = null;
         this.apd_baniangong = null;
         this.apd_banianjian = null;
         this.apd_banianji = null;
         this.apd_2019shendan = null;
         this.apd_2019gengzi = null;
         this.apd_2019feihua = null;
         this.apd_2019xiongwang = null;
         this.apd_2020xuehuan = null;
         this.apd_2020badao = null;
         this.apd_2020baojian01 = null;
         this.apd_2020baojian02 = null;
         this.apd_2020baojian03 = null;
         this.apd_2020baojian04 = null;
         this.apd_2020baojian05 = null;
         this.apd_2020baojian06 = null;
         this.apd_2020baojian07 = null;
         this.apd_2020baojian08 = null;
         this.apd_2020baojian09 = null;
         this.apd_2020baojian10 = null;
         this.apd_2020baojian11 = null;
         this.apd_2020baojian12 = null;
         this.apd_2020baojian13 = null;
         this.apd_2020baojian14 = null;
         this.apd_2020baojian15 = null;
         this.apd_2020baojian16 = null;
         this.apd_2020baojian17 = null;
         this.apd_2020baojian18 = null;
         this.apd_2020baojian19 = null;
         this.apd_2020baojian20 = null;
         this.apd_2020baojian21 = null;
         this.apd_2020baojian22 = null;
         this.apd_2020baojian23 = null;
         this.apd_2020baojian24 = null;
         this.apd_2020baojian25 = null;
         this.apd_2020baojian26 = null;
         this.apd_2020baojian27 = null;
         this.apd_2020baojian28 = null;
         this.apd_2020baojian29 = null;
         this.apd_2020baojian30 = null;
         this.apd_2020baojian31 = null;
         this.apd_2020baojian32 = null;
         this.apd_2020baojian33 = null;
         this.apd_2020baojian34 = null;
         this.apd_2020baojian35 = null;
         this.apd_2020baojian36 = null;
         this.apd_2020baojian37 = null;
         this.apd_2020baojian38 = null;
         this.apd_2020baojian39 = null;
         this.apd_2020baojian40 = null;
         this.apd_2020baojian41 = null;
         this.apd_2020baojian42 = null;
         this.apd_2020baojian43 = null;
         this.apd_2020baojian44 = null;
         this.apd_2020baojian45 = null;
         this.apd_2020baojian46 = null;
         this.apd_2020baojian47 = null;
         this.apd_2020baojian48 = null;
         this.apd_2020baojian49 = null;
         this.apd_2020baojian50 = null;
         this.apd_2020baojian51 = null;
         this.apd_2020baojian52 = null;
         this.apd_2020baojian53 = null;
         this.apd_2020baojian54 = null;
         this.apd_2020baojian55 = null;
         this.apd_2020baojian56 = null;
         this.apd_2020baojian57 = null;
         this.apd_2020baojian58 = null;
         this.apd_2020baojian59 = null;
         this.apd_2020baojian60 = null;
         this.apd_2020baojian61 = null;
         this.apd_2020baojian62 = null;
         this.apd_2020baojian63 = null;
         this.apd_2020baojian64 = null;
         this.apd_2020baojian65 = null;
         this.apd_2020baojian66 = null;
         this.apd_2020baojian67 = null;
         this.apd_2020baojian68 = null;
         this.apd_2020baojian69 = null;
         this.apd_mount_body = null;
         this.apd_mount_weapon = null;
         this.apd_mount_ylzr = null;
         this.apd_mount_xyj = null;
         this.apd_mount_aojian = null;
         this.apd_mount_shenqi = null;
         this.apd_mount_bow = null;
         this.apd_mount_zhenhun = null;
         this.apd_mount = null;
         this.apd_mount_longyin = null;
         this.apd_mount_longya = null;
         this.apd_mount_quanshen = null;
         this.apd_mount_potianren = null;
         this.apd_mount_tianshang = null;
         this.apd_mount_liekong = null;
         this.apd_mount_pangu = null;
         this.apd_mount_xueyindao = null;
         this.apd_mount_gjmy = null;
         this.apd_mount_longya1 = null;
         this.apd_mount_yanyuedao = null;
         this.apd_mount_xuantiezhongjian = null;
         this.apd_mount_guangmingzhang = null;
         this.apd_mount_huimie = null;
         this.apd_mount_zhumozhang = null;
         this.apd_mount_chiyan = null;
         this.apd_mount_tianjing = null;
         this.apd_mount_fengtianji = null;
         this.apd_mount_tianzhu = null;
         this.apd_mount_pangukaitianfu = null;
         this.apd_mount_tiandijian = null;
         this.apd_mount_hanqibingpo = null;
         this.apd_mount_jianzunlongquanjian = null;
         this.apd_mount_chuangshi = null;
         this.apd_mount_suilieshifu = null;
         this.apd_mount_moyuan = null;
         this.apd_mount_chengjiechangji = null;
         this.apd_mount_tianxiejian = null;
         this.apd_mount_junzijian = null;
         this.apd_mount_wangzhejian = null;
         this.apd_mount_fengbaodao = null;
         this.apd_mount_fengyun = null;
         this.apd_mount_shengdan2015 = null;
         this.apd_mount_fengsha = null;
         this.apd_mount_fengyijian = null;
         this.apd_mount_lexinji = null;
         this.apd_mount_fengyingjian = null;
         this.apd_mount_fengyunjian = null;
         this.apd_mount_bingfengjian = null;
         this.apd_mount_hongleizhangu = null;
         this.apd_mount_sandenggufo = null;
         this.apd_mount_fonuji = null;
         this.apd_mount_fengyinjian = null;
         this.apd_mount_tianmajian = null;
         this.apd_mount_wuhunjian = null;
         this.apd_mount_zhentianjian = null;
         this.apd_mount_tianxue = null;
         this.apd_mount_xiongjijian = null;
         this.apd_mount_wujinjian = null;
         this.apd_mount_shuntianjian = null;
         this.apd_mount_wangzheqicang = null;
         this.apd_mount_bixuejian = null;
         this.apd_mount_wuyijian = null;
         this.apd_mount_shijianshenqi = null;
         this.apd_mount_qingfengjian = null;
         this.apd_mount_huolinjian = null;
         this.apd_mount_zhuihunji = null;
         this.apd_mount_biyudao = null;
         this.apd_mount_wuwozhang = null;
         this.apd_mount_yehuohonglian = null;
         this.apd_mount_mingyuedao = null;
         this.apd_mount_qingfengjian2 = null;
         this.apd_mount_zhizunjian = null;
         this.apd_mount_baoleiji = null;
         this.apd_mount_mingshengzhang = null;
         this.apd_mount_zunshijian = null;
         this.apd_mount_renzhezhang = null;
         this.apd_mount_zhizhejian = null;
         this.apd_mount_yangmingjian = null;
         this.apd_mount_xiwangjian = null;
         this.apd_mount_xuejingjian = null;
         this.apd_mount_xuanbingjian = null;
         this.apd_mount_pinganjian = null;
         this.apd_mount_qinghuajian = null;
         this.apd_mount_yuxujian = null;
         this.apd_mount_yuqingshan = null;
         this.apd_mount_huomodao = null;
         this.apd_mount_yiheji = null;
         this.apd_mount_erhejian = null;
         this.apd_mount_sanhedao = null;
         this.apd_mount_duanqingji = null;
         this.apd_mount_nulong = null;
         this.apd_mount_qinian = null;
         this.apd_mount_zhuxian = null;
         this.apd_mount_hanbing = null;
         this.apd_mount_poshan = null;
         this.apd_mount_haiyu = null;
         this.apd_mount_tianmingdao = null;
         this.apd_mount_jingtianyiji = null;
         this.apd_mount_jingleijuedao = null;
         this.apd_mount_yingxiongjian = null;
         this.apd_mount_changshengjian = null;
         this.apd_mount_guiyinggong = null;
         this.apd_mount_jingleizhang = null;
         this.apd_mount_hundun = null;
         this.apd_mount_dinghun = null;
         this.apd_mount_tiandiwuji = null;
         this.apd_mount_huoxingjian = null;
         this.apd_mount_wangzhefu = null;
         this.apd_mount_duomingdao = null;
         this.apd_mount_xiaoshen = null;
         this.apd_mount_wanshi = null;
         this.apd_zhongqiu = null;
         this.apd_mount_shenjian = null;
         this.apd_mount_yuhuazhang = null;
         this.apd_mount_baniangong = null;
         this.apd_mount_banianjian = null;
         this.apd_mount_banianji = null;
         this.apd_mount_2019shendan = null;
         this.apd_mount_2019gengzi = null;
         this.apd_mount_2019feihua = null;
         this.apd_mount_2019xiongwang = null;
         this.apd_mount_2020xuehuan = null;
         this.apd_mount_2020badao = null;
         this.apd_mount_2020baojian01 = null;
         this.apd_mount_2020baojian02 = null;
         this.apd_mount_2020baojian03 = null;
         this.apd_mount_2020baojian04 = null;
         this.apd_mount_2020baojian05 = null;
         this.apd_mount_2020baojian06 = null;
         this.apd_mount_2020baojian07 = null;
         this.apd_mount_2020baojian08 = null;
         this.apd_mount_2020baojian09 = null;
         this.apd_mount_2020baojian10 = null;
         this.apd_mount_2020baojian11 = null;
         this.apd_mount_2020baojian12 = null;
         this.apd_mount_2020baojian13 = null;
         this.apd_mount_2020baojian14 = null;
         this.apd_mount_2020baojian15 = null;
         this.apd_mount_2020baojian16 = null;
         this.apd_mount_2020baojian17 = null;
         this.apd_mount_2020baojian18 = null;
         this.apd_mount_2020baojian19 = null;
         this.apd_mount_2020baojian20 = null;
         this.apd_mount_2020baojian21 = null;
         this.apd_mount_2020baojian22 = null;
         this.apd_mount_2020baojian23 = null;
         this.apd_mount_2020baojian24 = null;
         this.apd_mount_2020baojian25 = null;
         this.apd_mount_2020baojian26 = null;
         this.apd_mount_2020baojian27 = null;
         this.apd_mount_2020baojian28 = null;
         this.apd_mount_2020baojian29 = null;
         this.apd_mount_2020baojian30 = null;
         this.apd_mount_2020baojian31 = null;
         this.apd_mount_2020baojian32 = null;
         this.apd_mount_2020baojian33 = null;
         this.apd_mount_2020baojian34 = null;
         this.apd_mount_2020baojian35 = null;
         this.apd_mount_2020baojian36 = null;
         this.apd_mount_2020baojian37 = null;
         this.apd_mount_2020baojian38 = null;
         this.apd_mount_2020baojian39 = null;
         this.apd_mount_2020baojian40 = null;
         this.apd_mount_2020baojian41 = null;
         this.apd_mount_2020baojian42 = null;
         this.apd_mount_2020baojian43 = null;
         this.apd_mount_2020baojian44 = null;
         this.apd_mount_2020baojian45 = null;
         this.apd_mount_2020baojian46 = null;
         this.apd_mount_2020baojian47 = null;
         this.apd_mount_2020baojian48 = null;
         this.apd_mount_2020baojian49 = null;
         this.apd_mount_2020baojian50 = null;
         this.apd_mount_2020baojian51 = null;
         this.apd_mount_2020baojian52 = null;
         this.apd_mount_2020baojian53 = null;
         this.apd_mount_2020baojian54 = null;
         this.apd_mount_2020baojian55 = null;
         this.apd_mount_2020baojian56 = null;
         this.apd_mount_2020baojian57 = null;
         this.apd_mount_2020baojian58 = null;
         this.apd_mount_2020baojian59 = null;
         this.apd_mount_2020baojian60 = null;
         this.apd_mount_2020baojian61 = null;
         this.apd_mount_2020baojian62 = null;
         this.apd_mount_2020baojian63 = null;
         this.apd_mount_2020baojian64 = null;
         this.apd_mount_2020baojian65 = null;
         this.apd_mount_2020baojian66 = null;
         this.apd_mount_2020baojian67 = null;
         this.apd_mount_2020baojian68 = null;
         this.apd_mount_2020baojian69 = null;
      }
      
      public function clone() : AvatarInfo
      {
         var _loc1_:AvatarInfo = null;
         _loc1_ = new AvatarInfo();
         _loc1_.apd_body = this.apd_body ? this.apd_body.clone() : null;
         _loc1_.apd_weapon = this.apd_weapon ? this.apd_weapon.clone() : null;
         _loc1_.apd_ylzr = this.apd_ylzr ? this.apd_ylzr.clone() : null;
         _loc1_.apd_xyj = this.apd_xyj ? this.apd_xyj.clone() : null;
         _loc1_.apd_aojian = this.apd_aojian ? this.apd_aojian.clone() : null;
         _loc1_.apd_shenqi = this.apd_shenqi ? this.apd_shenqi.clone() : null;
         _loc1_.apd_bow = this.apd_bow ? this.apd_bow.clone() : null;
         _loc1_.apd_zhenhun = this.apd_zhenhun ? this.apd_zhenhun.clone() : null;
         _loc1_.apd_longya = this.apd_longya ? this.apd_longya.clone() : null;
         _loc1_.apd_quanshen = this.apd_quanshen ? this.apd_quanshen.clone() : null;
         _loc1_.apd_longyin = this.apd_longyin ? this.apd_longyin.clone() : null;
         _loc1_.apd_potianren = this.apd_potianren ? this.apd_potianren.clone() : null;
         _loc1_.apd_tianshang = this.apd_tianshang ? this.apd_tianshang.clone() : null;
         _loc1_.apd_liekong = this.apd_liekong ? this.apd_liekong.clone() : null;
         _loc1_.apd_pangu = this.apd_pangu ? this.apd_pangu.clone() : null;
         _loc1_.apd_xueyindao = this.apd_xueyindao ? this.apd_xueyindao.clone() : null;
         _loc1_.apd_gjmy = this.apd_gjmy ? this.apd_gjmy.clone() : null;
         _loc1_.apd_longya1 = this.apd_longya1 ? this.apd_longya1.clone() : null;
         _loc1_.apd_yanyuedao = this.apd_yanyuedao ? this.apd_yanyuedao.clone() : null;
         _loc1_.apd_xuantiezhongjian = this.apd_xuantiezhongjian ? this.apd_xuantiezhongjian.clone() : null;
         _loc1_.apd_guangmingzhang = this.apd_guangmingzhang ? this.apd_guangmingzhang.clone() : null;
         _loc1_.apd_huimie = this.apd_huimie ? this.apd_huimie.clone() : null;
         _loc1_.apd_zhumozhang = this.apd_zhumozhang ? this.apd_zhumozhang.clone() : null;
         _loc1_.apd_chiyan = this.apd_chiyan ? this.apd_chiyan.clone() : null;
         _loc1_.apd_tianjing = this.apd_tianjing ? this.apd_tianjing.clone() : null;
         _loc1_.apd_fengtianji = this.apd_fengtianji ? this.apd_fengtianji.clone() : null;
         _loc1_.apd_tianzhu = this.apd_tianzhu ? this.apd_tianzhu.clone() : null;
         _loc1_.apd_pangukaitianfu = this.apd_pangukaitianfu ? this.apd_pangukaitianfu.clone() : null;
         _loc1_.apd_tiandijian = this.apd_tiandijian ? this.apd_tiandijian.clone() : null;
         _loc1_.apd_hanqibingpo = this.apd_hanqibingpo ? this.apd_hanqibingpo.clone() : null;
         _loc1_.apd_jianzunlongquanjian = this.apd_jianzunlongquanjian ? this.apd_jianzunlongquanjian.clone() : null;
         _loc1_.apd_chuangshi = this.apd_chuangshi ? this.apd_chuangshi.clone() : null;
         _loc1_.apd_suilieshifu = this.apd_suilieshifu ? this.apd_suilieshifu.clone() : null;
         _loc1_.apd_moyuan = this.apd_moyuan ? this.apd_moyuan.clone() : null;
         _loc1_.apd_chengjiechangji = this.apd_chengjiechangji ? this.apd_chengjiechangji.clone() : null;
         _loc1_.apd_tianxiejian = this.apd_tianxiejian ? this.apd_tianxiejian.clone() : null;
         _loc1_.apd_junzijian = this.apd_junzijian ? this.apd_junzijian.clone() : null;
         _loc1_.apd_wangzhejian = this.apd_wangzhejian ? this.apd_wangzhejian.clone() : null;
         _loc1_.apd_fengbaodao = this.apd_fengbaodao ? this.apd_fengbaodao.clone() : null;
         _loc1_.apd_fengyun = this.apd_fengyun ? this.apd_fengyun.clone() : null;
         _loc1_.apd_shengdan2015 = this.apd_shengdan2015 ? this.apd_shengdan2015.clone() : null;
         _loc1_.apd_fengsha = this.apd_fengsha ? this.apd_fengsha.clone() : null;
         _loc1_.apd_fengyijian = this.apd_fengyijian ? this.apd_fengyijian.clone() : null;
         _loc1_.apd_lexinji = this.apd_lexinji ? this.apd_lexinji.clone() : null;
         _loc1_.apd_fengyingjian = this.apd_fengyingjian ? this.apd_fengyingjian.clone() : null;
         _loc1_.apd_zhenfengjian = this.apd_zhenfengjian ? this.apd_zhenfengjian.clone() : null;
         _loc1_.apd_fengyunjian = this.apd_fengyunjian ? this.apd_fengyunjian.clone() : null;
         _loc1_.apd_bingfengjian = this.apd_bingfengjian ? this.apd_bingfengjian.clone() : null;
         _loc1_.apd_hongleizhangu = this.apd_hongleizhangu ? this.apd_hongleizhangu.clone() : null;
         _loc1_.apd_sandenggufo = this.apd_sandenggufo ? this.apd_sandenggufo.clone() : null;
         _loc1_.apd_fonuji = this.apd_fonuji ? this.apd_fonuji.clone() : null;
         _loc1_.apd_fengyinjian = this.apd_fengyinjian ? this.apd_fengyinjian.clone() : null;
         _loc1_.apd_tianmajian = this.apd_tianmajian ? this.apd_tianmajian.clone() : null;
         _loc1_.apd_wuhunjian = this.apd_wuhunjian ? this.apd_wuhunjian.clone() : null;
         _loc1_.apd_zhentianjian = this.apd_zhentianjian ? this.apd_zhentianjian.clone() : null;
         _loc1_.apd_tianxue = this.apd_tianxue ? this.apd_tianxue.clone() : null;
         _loc1_.apd_xiongjijian = this.apd_xiongjijian ? this.apd_xiongjijian.clone() : null;
         _loc1_.apd_wujinjian = this.apd_wujinjian ? this.apd_wujinjian.clone() : null;
         _loc1_.apd_shuntianjian = this.apd_shuntianjian ? this.apd_shuntianjian.clone() : null;
         _loc1_.apd_wangzheqicang = this.apd_wangzheqicang ? this.apd_wangzheqicang.clone() : null;
         _loc1_.apd_bixuejian = this.apd_bixuejian ? this.apd_bixuejian.clone() : null;
         _loc1_.apd_wuyijian = this.apd_wuyijian ? this.apd_wuyijian.clone() : null;
         _loc1_.apd_shijianshenqi = this.apd_shijianshenqi ? this.apd_shijianshenqi.clone() : null;
         _loc1_.apd_qingfengjian = this.apd_qingfengjian ? this.apd_qingfengjian.clone() : null;
         _loc1_.apd_huolinjian = this.apd_huolinjian ? this.apd_huolinjian.clone() : null;
         _loc1_.apd_zhuihunji = this.apd_zhuihunji ? this.apd_zhuihunji.clone() : null;
         _loc1_.apd_biyudao = this.apd_biyudao ? this.apd_biyudao.clone() : null;
         _loc1_.apd_wuwozhang = this.apd_wuwozhang ? this.apd_wuwozhang.clone() : null;
         _loc1_.apd_yehuohonglian = this.apd_yehuohonglian ? this.apd_yehuohonglian.clone() : null;
         _loc1_.apd_mingyuedao = this.apd_mingyuedao ? this.apd_mingyuedao.clone() : null;
         _loc1_.apd_qingfengjian2 = this.apd_qingfengjian2 ? this.apd_qingfengjian2.clone() : null;
         _loc1_.apd_zhizunjian = this.apd_zhizunjian ? this.apd_zhizunjian.clone() : null;
         _loc1_.apd_baoleiji = this.apd_baoleiji ? this.apd_baoleiji.clone() : null;
         _loc1_.apd_mingshengzhang = this.apd_mingshengzhang ? this.apd_mingshengzhang.clone() : null;
         _loc1_.apd_zunshijian = this.apd_zunshijian ? this.apd_zunshijian.clone() : null;
         _loc1_.apd_renzhezhang = this.apd_renzhezhang ? this.apd_renzhezhang.clone() : null;
         _loc1_.apd_zhizhejian = this.apd_zhizhejian ? this.apd_zhizhejian.clone() : null;
         _loc1_.apd_yangmingjian = this.apd_yangmingjian ? this.apd_yangmingjian.clone() : null;
         _loc1_.apd_xiwangjian = this.apd_xiwangjian ? this.apd_xiwangjian.clone() : null;
         _loc1_.apd_xuejingjian = this.apd_xuejingjian ? this.apd_xuejingjian.clone() : null;
         _loc1_.apd_xuanbingjian = this.apd_xuanbingjian ? this.apd_xuanbingjian.clone() : null;
         _loc1_.apd_pinganjian = this.apd_pinganjian ? this.apd_pinganjian.clone() : null;
         _loc1_.apd_qinghuajian = this.apd_qinghuajian ? this.apd_qinghuajian.clone() : null;
         _loc1_.apd_yuxujian = this.apd_yuxujian ? this.apd_yuxujian.clone() : null;
         _loc1_.apd_yuqingshan = this.apd_yuqingshan ? this.apd_yuqingshan.clone() : null;
         _loc1_.apd_huomodao = this.apd_huomodao ? this.apd_huomodao.clone() : null;
         _loc1_.apd_yiheji = this.apd_yiheji ? this.apd_yiheji.clone() : null;
         _loc1_.apd_erhejian = this.apd_erhejian ? this.apd_erhejian.clone() : null;
         _loc1_.apd_sanhedao = this.apd_sanhedao ? this.apd_sanhedao.clone() : null;
         _loc1_.apd_miehushan = this.apd_miehushan ? this.apd_miehushan.clone() : null;
         _loc1_.apd_qingmingdao = this.apd_qingmingdao ? this.apd_qingmingdao.clone() : null;
         _loc1_.apd_huoxingfu = this.apd_huoxingfu ? this.apd_huoxingfu.clone() : null;
         _loc1_.apd_shenzao = this.apd_shenzao ? this.apd_shenzao.clone() : null;
         _loc1_.apd_kaitiangong = this.apd_kaitiangong ? this.apd_kaitiangong.clone() : null;
         _loc1_.apd_yanwenfenmo = this.apd_yanwenfenmo ? this.apd_yanwenfenmo.clone() : null;
         _loc1_.apd_linglongzi = this.apd_linglongzi ? this.apd_linglongzi.clone() : null;
         _loc1_.apd_shashenjian = this.apd_shashenjian ? this.apd_shashenjian.clone() : null;
         _loc1_.apd_duanqingji = this.apd_duanqingji ? this.apd_duanqingji.clone() : null;
         _loc1_.apd_nulong = this.apd_nulong ? this.apd_nulong.clone() : null;
         _loc1_.apd_qinian = this.apd_qinian ? this.apd_qinian.clone() : null;
         _loc1_.apd_zhuxian = this.apd_zhuxian ? this.apd_zhuxian.clone() : null;
         _loc1_.apd_hanbing = this.apd_hanbing ? this.apd_hanbing.clone() : null;
         _loc1_.apd_poshan = this.apd_poshan ? this.apd_poshan.clone() : null;
         _loc1_.apd_haiyu = this.apd_haiyu ? this.apd_haiyu.clone() : null;
         _loc1_.apd_tianmingdao = this.apd_tianmingdao ? this.apd_tianmingdao.clone() : null;
         _loc1_.apd_jingtianyiji = this.apd_jingtianyiji ? this.apd_jingtianyiji.clone() : null;
         _loc1_.apd_jingleijuedao = this.apd_jingleijuedao ? this.apd_jingleijuedao.clone() : null;
         _loc1_.apd_yingxiongjian = this.apd_yingxiongjian ? this.apd_yingxiongjian.clone() : null;
         _loc1_.apd_changshengjian = this.apd_changshengjian ? this.apd_changshengjian.clone() : null;
         _loc1_.apd_guiyinggong = this.apd_guiyinggong ? this.apd_guiyinggong.clone() : null;
         _loc1_.apd_jingleizhang = this.apd_jingleizhang ? this.apd_jingleizhang.clone() : null;
         _loc1_.apd_hundun = this.apd_hundun ? this.apd_hundun.clone() : null;
         _loc1_.apd_dinghun = this.apd_dinghun ? this.apd_dinghun.clone() : null;
         _loc1_.apd_tiandiwuji = this.apd_tiandiwuji ? this.apd_tiandiwuji.clone() : null;
         _loc1_.apd_huoxingjian = this.apd_huoxingjian ? this.apd_huoxingjian.clone() : null;
         _loc1_.apd_wangzhefu = this.apd_wangzhefu ? this.apd_wangzhefu.clone() : null;
         _loc1_.apd_duomingdao = this.apd_duomingdao ? this.apd_duomingdao.clone() : null;
         _loc1_.apd_xiaoshen = this.apd_xiaoshen ? this.apd_xiaoshen.clone() : null;
         _loc1_.apd_wanshi = this.apd_wanshi ? this.apd_wanshi.clone() : null;
         _loc1_.apd_zhongqiu = this.apd_zhongqiu ? this.apd_zhongqiu.clone() : null;
         _loc1_.apd_shenjian = this.apd_shenjian ? this.apd_shenjian.clone() : null;
         _loc1_.apd_yuhuazhang = this.apd_yuhuazhang ? this.apd_yuhuazhang.clone() : null;
         _loc1_.apd_baniangong = this.apd_baniangong ? this.apd_baniangong.clone() : null;
         _loc1_.apd_banianjian = this.apd_banianjian ? this.apd_banianjian.clone() : null;
         _loc1_.apd_banianji = this.apd_banianji ? this.apd_banianji.clone() : null;
         _loc1_.apd_2019shendan = this.apd_2019shendan ? this.apd_2019shendan.clone() : null;
         _loc1_.apd_2019gengzi = this.apd_2019gengzi ? this.apd_2019gengzi.clone() : null;
         _loc1_.apd_2019feihua = this.apd_2019feihua ? this.apd_2019feihua.clone() : null;
         _loc1_.apd_2019xiongwang = this.apd_2019xiongwang ? this.apd_2019xiongwang.clone() : null;
         _loc1_.apd_2020xuehuan = this.apd_2020xuehuan ? this.apd_2020xuehuan.clone() : null;
         _loc1_.apd_2020badao = this.apd_2020badao ? this.apd_2020badao.clone() : null;
         _loc1_.apd_2020baojian01 = this.apd_2020baojian01 ? this.apd_2020baojian01.clone() : null;
         _loc1_.apd_2020baojian02 = this.apd_2020baojian02 ? this.apd_2020baojian02.clone() : null;
         _loc1_.apd_2020baojian03 = this.apd_2020baojian03 ? this.apd_2020baojian03.clone() : null;
         _loc1_.apd_2020baojian04 = this.apd_2020baojian04 ? this.apd_2020baojian04.clone() : null;
         _loc1_.apd_2020baojian05 = this.apd_2020baojian05 ? this.apd_2020baojian05.clone() : null;
         _loc1_.apd_2020baojian06 = this.apd_2020baojian06 ? this.apd_2020baojian06.clone() : null;
         _loc1_.apd_2020baojian07 = this.apd_2020baojian07 ? this.apd_2020baojian07.clone() : null;
         _loc1_.apd_2020baojian08 = this.apd_2020baojian08 ? this.apd_2020baojian08.clone() : null;
         _loc1_.apd_2020baojian09 = this.apd_2020baojian09 ? this.apd_2020baojian09.clone() : null;
         _loc1_.apd_2020baojian10 = this.apd_2020baojian10 ? this.apd_2020baojian10.clone() : null;
         _loc1_.apd_2020baojian11 = this.apd_2020baojian11 ? this.apd_2020baojian11.clone() : null;
         _loc1_.apd_2020baojian12 = this.apd_2020baojian12 ? this.apd_2020baojian12.clone() : null;
         _loc1_.apd_2020baojian13 = this.apd_2020baojian13 ? this.apd_2020baojian13.clone() : null;
         _loc1_.apd_2020baojian14 = this.apd_2020baojian14 ? this.apd_2020baojian14.clone() : null;
         _loc1_.apd_2020baojian15 = this.apd_2020baojian15 ? this.apd_2020baojian15.clone() : null;
         _loc1_.apd_2020baojian16 = this.apd_2020baojian16 ? this.apd_2020baojian16.clone() : null;
         _loc1_.apd_2020baojian17 = this.apd_2020baojian17 ? this.apd_2020baojian17.clone() : null;
         _loc1_.apd_2020baojian18 = this.apd_2020baojian18 ? this.apd_2020baojian18.clone() : null;
         _loc1_.apd_2020baojian19 = this.apd_2020baojian19 ? this.apd_2020baojian19.clone() : null;
         _loc1_.apd_2020baojian20 = this.apd_2020baojian20 ? this.apd_2020baojian20.clone() : null;
         _loc1_.apd_2020baojian21 = this.apd_2020baojian21 ? this.apd_2020baojian21.clone() : null;
         _loc1_.apd_2020baojian22 = this.apd_2020baojian22 ? this.apd_2020baojian22.clone() : null;
         _loc1_.apd_2020baojian23 = this.apd_2020baojian23 ? this.apd_2020baojian23.clone() : null;
         _loc1_.apd_2020baojian24 = this.apd_2020baojian24 ? this.apd_2020baojian24.clone() : null;
         _loc1_.apd_2020baojian25 = this.apd_2020baojian25 ? this.apd_2020baojian25.clone() : null;
         _loc1_.apd_2020baojian26 = this.apd_2020baojian26 ? this.apd_2020baojian26.clone() : null;
         _loc1_.apd_2020baojian27 = this.apd_2020baojian27 ? this.apd_2020baojian27.clone() : null;
         _loc1_.apd_2020baojian28 = this.apd_2020baojian28 ? this.apd_2020baojian28.clone() : null;
         _loc1_.apd_2020baojian29 = this.apd_2020baojian29 ? this.apd_2020baojian29.clone() : null;
         _loc1_.apd_2020baojian30 = this.apd_2020baojian30 ? this.apd_2020baojian30.clone() : null;
         _loc1_.apd_2020baojian31 = this.apd_2020baojian31 ? this.apd_2020baojian31.clone() : null;
         _loc1_.apd_2020baojian32 = this.apd_2020baojian32 ? this.apd_2020baojian32.clone() : null;
         _loc1_.apd_2020baojian33 = this.apd_2020baojian33 ? this.apd_2020baojian33.clone() : null;
         _loc1_.apd_2020baojian34 = this.apd_2020baojian34 ? this.apd_2020baojian34.clone() : null;
         _loc1_.apd_2020baojian35 = this.apd_2020baojian35 ? this.apd_2020baojian35.clone() : null;
         _loc1_.apd_2020baojian36 = this.apd_2020baojian36 ? this.apd_2020baojian36.clone() : null;
         _loc1_.apd_2020baojian37 = this.apd_2020baojian37 ? this.apd_2020baojian37.clone() : null;
         _loc1_.apd_2020baojian38 = this.apd_2020baojian38 ? this.apd_2020baojian38.clone() : null;
         _loc1_.apd_2020baojian39 = this.apd_2020baojian39 ? this.apd_2020baojian39.clone() : null;
         _loc1_.apd_2020baojian40 = this.apd_2020baojian40 ? this.apd_2020baojian40.clone() : null;
         _loc1_.apd_2020baojian41 = this.apd_2020baojian41 ? this.apd_2020baojian41.clone() : null;
         _loc1_.apd_2020baojian42 = this.apd_2020baojian42 ? this.apd_2020baojian42.clone() : null;
         _loc1_.apd_2020baojian43 = this.apd_2020baojian43 ? this.apd_2020baojian43.clone() : null;
         _loc1_.apd_2020baojian44 = this.apd_2020baojian44 ? this.apd_2020baojian44.clone() : null;
         _loc1_.apd_2020baojian45 = this.apd_2020baojian45 ? this.apd_2020baojian45.clone() : null;
         _loc1_.apd_2020baojian46 = this.apd_2020baojian46 ? this.apd_2020baojian46.clone() : null;
         _loc1_.apd_2020baojian47 = this.apd_2020baojian47 ? this.apd_2020baojian47.clone() : null;
         _loc1_.apd_2020baojian48 = this.apd_2020baojian48 ? this.apd_2020baojian48.clone() : null;
         _loc1_.apd_2020baojian49 = this.apd_2020baojian49 ? this.apd_2020baojian49.clone() : null;
         _loc1_.apd_2020baojian50 = this.apd_2020baojian50 ? this.apd_2020baojian50.clone() : null;
         _loc1_.apd_2020baojian51 = this.apd_2020baojian51 ? this.apd_2020baojian51.clone() : null;
         _loc1_.apd_2020baojian52 = this.apd_2020baojian52 ? this.apd_2020baojian52.clone() : null;
         _loc1_.apd_2020baojian53 = this.apd_2020baojian53 ? this.apd_2020baojian53.clone() : null;
         _loc1_.apd_2020baojian54 = this.apd_2020baojian54 ? this.apd_2020baojian54.clone() : null;
         _loc1_.apd_2020baojian55 = this.apd_2020baojian55 ? this.apd_2020baojian55.clone() : null;
         _loc1_.apd_2020baojian56 = this.apd_2020baojian56 ? this.apd_2020baojian56.clone() : null;
         _loc1_.apd_2020baojian57 = this.apd_2020baojian57 ? this.apd_2020baojian57.clone() : null;
         _loc1_.apd_2020baojian58 = this.apd_2020baojian58 ? this.apd_2020baojian58.clone() : null;
         _loc1_.apd_2020baojian59 = this.apd_2020baojian59 ? this.apd_2020baojian59.clone() : null;
         _loc1_.apd_2020baojian60 = this.apd_2020baojian60 ? this.apd_2020baojian60.clone() : null;
         _loc1_.apd_2020baojian61 = this.apd_2020baojian61 ? this.apd_2020baojian61.clone() : null;
         _loc1_.apd_2020baojian62 = this.apd_2020baojian62 ? this.apd_2020baojian62.clone() : null;
         _loc1_.apd_2020baojian63 = this.apd_2020baojian63 ? this.apd_2020baojian63.clone() : null;
         _loc1_.apd_2020baojian64 = this.apd_2020baojian64 ? this.apd_2020baojian64.clone() : null;
         _loc1_.apd_2020baojian65 = this.apd_2020baojian65 ? this.apd_2020baojian65.clone() : null;
         _loc1_.apd_2020baojian66 = this.apd_2020baojian66 ? this.apd_2020baojian66.clone() : null;
         _loc1_.apd_2020baojian67 = this.apd_2020baojian67 ? this.apd_2020baojian67.clone() : null;
         _loc1_.apd_2020baojian68 = this.apd_2020baojian68 ? this.apd_2020baojian68.clone() : null;
         _loc1_.apd_2020baojian69 = this.apd_2020baojian69 ? this.apd_2020baojian69.clone() : null;
         _loc1_.apd_mount_body = this.apd_mount_body ? this.apd_mount_body.clone() : null;
         _loc1_.apd_mount_weapon = this.apd_mount_weapon ? this.apd_mount_weapon.clone() : null;
         _loc1_.apd_mount_ylzr = this.apd_mount_ylzr ? this.apd_mount_ylzr.clone() : null;
         _loc1_.apd_mount_xyj = this.apd_mount_xyj ? this.apd_mount_xyj.clone() : null;
         _loc1_.apd_mount_shenqi = this.apd_mount_shenqi ? this.apd_mount_shenqi.clone() : null;
         _loc1_.apd_mount_bow = this.apd_mount_bow ? this.apd_mount_bow.clone() : null;
         _loc1_.apd_mount_zhenhun = this.apd_mount_zhenhun ? this.apd_mount_zhenhun.clone() : null;
         _loc1_.apd_mount = this.apd_mount ? this.apd_mount.clone() : null;
         _loc1_.apd_mount_aojian = this.apd_mount_aojian ? this.apd_mount_aojian.clone() : null;
         _loc1_.apd_mount_longyin = this.apd_mount_longyin ? this.apd_mount_longyin.clone() : null;
         _loc1_.apd_mount_quanshen = this.apd_mount_quanshen ? this.apd_mount_quanshen.clone() : null;
         _loc1_.apd_mount_longya = this.apd_mount_longya ? this.apd_mount_longya.clone() : null;
         _loc1_.apd_mount_potianren = this.apd_mount_potianren ? this.apd_mount_potianren.clone() : null;
         _loc1_.apd_mount_tianshang = this.apd_mount_tianshang ? this.apd_mount_tianshang.clone() : null;
         _loc1_.apd_mount_liekong = this.apd_mount_liekong ? this.apd_mount_liekong.clone() : null;
         _loc1_.apd_mount_pangu = this.apd_mount_pangu ? this.apd_mount_pangu.clone() : null;
         _loc1_.apd_mount_xueyindao = this.apd_mount_xueyindao ? this.apd_mount_xueyindao.clone() : null;
         _loc1_.apd_mount_gjmy = this.apd_mount_gjmy ? this.apd_mount_gjmy.clone() : null;
         _loc1_.apd_mount_longya1 = this.apd_mount_longya1 ? this.apd_mount_longya1.clone() : null;
         _loc1_.apd_mount_yanyuedao = this.apd_mount_yanyuedao ? this.apd_mount_yanyuedao.clone() : null;
         _loc1_.apd_mount_xuantiezhongjian = this.apd_mount_xuantiezhongjian ? this.apd_mount_xuantiezhongjian.clone() : null;
         _loc1_.apd_mount_guangmingzhang = this.apd_mount_guangmingzhang ? this.apd_mount_guangmingzhang.clone() : null;
         _loc1_.apd_mount_huimie = this.apd_mount_huimie ? this.apd_mount_huimie.clone() : null;
         _loc1_.apd_mount_zhumozhang = this.apd_mount_zhumozhang ? this.apd_mount_zhumozhang.clone() : null;
         _loc1_.apd_mount_chiyan = this.apd_mount_chiyan ? this.apd_mount_chiyan.clone() : null;
         _loc1_.apd_mount_tianjing = this.apd_mount_tianjing ? this.apd_mount_tianjing.clone() : null;
         _loc1_.apd_mount_fengtianji = this.apd_mount_fengtianji ? this.apd_mount_fengtianji.clone() : null;
         _loc1_.apd_mount_tianzhu = this.apd_mount_tianzhu ? this.apd_mount_tianzhu.clone() : null;
         _loc1_.apd_mount_pangukaitianfu = this.apd_mount_pangukaitianfu ? this.apd_mount_pangukaitianfu.clone() : null;
         _loc1_.apd_mount_tiandijian = this.apd_mount_tiandijian ? this.apd_mount_tiandijian.clone() : null;
         _loc1_.apd_mount_hanqibingpo = this.apd_mount_hanqibingpo ? this.apd_mount_hanqibingpo.clone() : null;
         _loc1_.apd_mount_jianzunlongquanjian = this.apd_mount_jianzunlongquanjian ? this.apd_mount_jianzunlongquanjian.clone() : null;
         _loc1_.apd_mount_chuangshi = this.apd_mount_chuangshi ? this.apd_mount_chuangshi.clone() : null;
         _loc1_.apd_mount_suilieshifu = this.apd_mount_suilieshifu ? this.apd_mount_suilieshifu.clone() : null;
         _loc1_.apd_mount_moyuan = this.apd_mount_moyuan ? this.apd_mount_moyuan.clone() : null;
         _loc1_.apd_mount_chengjiechangji = this.apd_mount_chengjiechangji ? this.apd_mount_chengjiechangji.clone() : null;
         _loc1_.apd_mount_tianxiejian = this.apd_mount_tianxiejian ? this.apd_mount_tianxiejian.clone() : null;
         _loc1_.apd_mount_junzijian = this.apd_mount_junzijian ? this.apd_mount_junzijian.clone() : null;
         _loc1_.apd_mount_wangzhejian = this.apd_mount_wangzhejian ? this.apd_mount_wangzhejian.clone() : null;
         _loc1_.apd_mount_fengbaodao = this.apd_mount_fengbaodao ? this.apd_mount_fengbaodao.clone() : null;
         _loc1_.apd_mount_fengyun = this.apd_mount_fengyun ? this.apd_mount_fengyun.clone() : null;
         _loc1_.apd_mount_shengdan2015 = this.apd_mount_shengdan2015 ? this.apd_mount_shengdan2015.clone() : null;
         _loc1_.apd_mount_fengsha = this.apd_mount_fengsha ? this.apd_mount_fengsha.clone() : null;
         _loc1_.apd_mount_fengyijian = this.apd_mount_fengyijian ? this.apd_mount_fengyijian.clone() : null;
         _loc1_.apd_mount_lexinji = this.apd_mount_lexinji ? this.apd_mount_lexinji.clone() : null;
         _loc1_.apd_mount_fengyingjian = this.apd_mount_fengyingjian ? this.apd_mount_fengyingjian.clone() : null;
         _loc1_.apd_mount_fengyunjian = this.apd_mount_fengyunjian ? this.apd_mount_fengyunjian.clone() : null;
         _loc1_.apd_mount_bingfengjian = this.apd_mount_bingfengjian ? this.apd_mount_bingfengjian.clone() : null;
         _loc1_.apd_mount_hongleizhangu = this.apd_mount_hongleizhangu ? this.apd_mount_hongleizhangu.clone() : null;
         _loc1_.apd_mount_sandenggufo = this.apd_mount_sandenggufo ? this.apd_mount_sandenggufo.clone() : null;
         _loc1_.apd_mount_fonuji = this.apd_mount_fonuji ? this.apd_mount_fonuji.clone() : null;
         _loc1_.apd_mount_fengyinjian = this.apd_mount_fengyinjian ? this.apd_mount_fengyinjian.clone() : null;
         _loc1_.apd_mount_tianmajian = this.apd_mount_tianmajian ? this.apd_mount_tianmajian.clone() : null;
         _loc1_.apd_mount_wuhunjian = this.apd_mount_wuhunjian ? this.apd_mount_wuhunjian.clone() : null;
         _loc1_.apd_mount_zhentianjian = this.apd_mount_zhentianjian ? this.apd_mount_zhentianjian.clone() : null;
         _loc1_.apd_mount_tianxue = this.apd_mount_tianxue ? this.apd_mount_tianxue.clone() : null;
         _loc1_.apd_mount_xiongjijian = this.apd_mount_xiongjijian ? this.apd_mount_xiongjijian.clone() : null;
         _loc1_.apd_mount_wujinjian = this.apd_mount_wujinjian ? this.apd_mount_wujinjian.clone() : null;
         _loc1_.apd_mount_shuntianjian = this.apd_mount_shuntianjian ? this.apd_mount_shuntianjian.clone() : null;
         _loc1_.apd_mount_wangzheqicang = this.apd_mount_wangzheqicang ? this.apd_mount_wangzheqicang.clone() : null;
         _loc1_.apd_mount_wujinjian = this.apd_mount_bixuejian ? this.apd_mount_bixuejian.clone() : null;
         _loc1_.apd_mount_wuyijian = this.apd_mount_wuyijian ? this.apd_mount_wuyijian.clone() : null;
         _loc1_.apd_mount_shijianshenqi = this.apd_mount_shijianshenqi ? this.apd_mount_shijianshenqi.clone() : null;
         _loc1_.apd_mount_qingfengjian = this.apd_mount_qingfengjian ? this.apd_mount_qingfengjian.clone() : null;
         _loc1_.apd_mount_huolinjian = this.apd_mount_huolinjian ? this.apd_mount_huolinjian.clone() : null;
         _loc1_.apd_mount_zhuihunji = this.apd_mount_zhuihunji ? this.apd_mount_zhuihunji.clone() : null;
         _loc1_.apd_mount_biyudao = this.apd_mount_biyudao ? this.apd_mount_biyudao.clone() : null;
         _loc1_.apd_mount_wuwozhang = this.apd_mount_wuwozhang ? this.apd_mount_wuwozhang.clone() : null;
         _loc1_.apd_mount_yehuohonglian = this.apd_mount_yehuohonglian ? this.apd_mount_yehuohonglian.clone() : null;
         _loc1_.apd_mount_mingyuedao = this.apd_mount_mingyuedao ? this.apd_mount_mingyuedao.clone() : null;
         _loc1_.apd_mount_qingfengjian2 = this.apd_mount_qingfengjian2 ? this.apd_mount_qingfengjian2.clone() : null;
         _loc1_.apd_mount_zhizunjian = this.apd_mount_zhizunjian ? this.apd_mount_zhizunjian.clone() : null;
         _loc1_.apd_mount_baoleiji = this.apd_mount_baoleiji ? this.apd_mount_baoleiji.clone() : null;
         _loc1_.apd_mount_mingshengzhang = this.apd_mount_mingshengzhang ? this.apd_mount_mingshengzhang.clone() : null;
         _loc1_.apd_mount_zunshijian = this.apd_mount_zunshijian ? this.apd_mount_zunshijian.clone() : null;
         _loc1_.apd_mount_renzhezhang = this.apd_mount_renzhezhang ? this.apd_mount_renzhezhang.clone() : null;
         _loc1_.apd_mount_zhizhejian = this.apd_mount_zhizhejian ? this.apd_mount_zhizhejian.clone() : null;
         _loc1_.apd_mount_yangmingjian = this.apd_mount_yangmingjian ? this.apd_mount_yangmingjian.clone() : null;
         _loc1_.apd_mount_xiwangjian = this.apd_mount_xiwangjian ? this.apd_mount_xiwangjian.clone() : null;
         _loc1_.apd_mount_xuejingjian = this.apd_mount_xuejingjian ? this.apd_mount_xuejingjian.clone() : null;
         _loc1_.apd_mount_xuanbingjian = this.apd_mount_xuanbingjian ? this.apd_mount_xuanbingjian.clone() : null;
         _loc1_.apd_mount_pinganjian = this.apd_mount_pinganjian ? this.apd_mount_pinganjian.clone() : null;
         _loc1_.apd_mount_qinghuajian = this.apd_mount_qinghuajian ? this.apd_mount_qinghuajian.clone() : null;
         _loc1_.apd_mount_yuxujian = this.apd_mount_yuxujian ? this.apd_mount_yuxujian.clone() : null;
         _loc1_.apd_mount_yuqingshan = this.apd_mount_yuqingshan ? this.apd_mount_yuqingshan.clone() : null;
         _loc1_.apd_mount_huomodao = this.apd_mount_huomodao ? this.apd_mount_huomodao.clone() : null;
         _loc1_.apd_mount_yiheji = this.apd_mount_yiheji ? this.apd_mount_yiheji.clone() : null;
         _loc1_.apd_mount_erhejian = this.apd_mount_erhejian ? this.apd_mount_erhejian.clone() : null;
         _loc1_.apd_mount_sanhedao = this.apd_mount_sanhedao ? this.apd_mount_sanhedao.clone() : null;
         _loc1_.apd_mount_miehushan = this.apd_mount_miehushan ? this.apd_mount_miehushan.clone() : null;
         _loc1_.apd_mount_qingmingdao = this.apd_mount_qingmingdao ? this.apd_mount_qingmingdao.clone() : null;
         _loc1_.apd_mount_huoxingfu = this.apd_mount_huoxingfu ? this.apd_mount_huoxingfu.clone() : null;
         _loc1_.apd_mount_shenzao = this.apd_mount_shenzao ? this.apd_mount_shenzao.clone() : null;
         _loc1_.apd_mount_kaitiangong = this.apd_mount_kaitiangong ? this.apd_mount_kaitiangong.clone() : null;
         _loc1_.apd_mount_yanwenfenmo = this.apd_mount_yanwenfenmo ? this.apd_mount_yanwenfenmo.clone() : null;
         _loc1_.apd_mount_linglongzi = this.apd_mount_linglongzi ? this.apd_mount_linglongzi.clone() : null;
         _loc1_.apd_mount_shashenjian = this.apd_mount_shashenjian ? this.apd_mount_shashenjian.clone() : null;
         _loc1_.apd_mount_duanqingji = this.apd_mount_duanqingji ? this.apd_mount_duanqingji.clone() : null;
         _loc1_.apd_mount_nulong = this.apd_mount_nulong ? this.apd_mount_nulong.clone() : null;
         _loc1_.apd_mount_qinian = this.apd_mount_qinian ? this.apd_mount_qinian.clone() : null;
         _loc1_.apd_mount_zhuxian = this.apd_mount_zhuxian ? this.apd_mount_zhuxian.clone() : null;
         _loc1_.apd_mount_hanbing = this.apd_mount_hanbing ? this.apd_mount_hanbing.clone() : null;
         _loc1_.apd_mount_poshan = this.apd_mount_poshan ? this.apd_mount_poshan.clone() : null;
         _loc1_.apd_mount_haiyu = this.apd_mount_haiyu ? this.apd_mount_haiyu.clone() : null;
         _loc1_.apd_mount_tianmingdao = this.apd_mount_tianmingdao ? this.apd_mount_tianmingdao.clone() : null;
         _loc1_.apd_mount_jingtianyiji = this.apd_mount_jingtianyiji ? this.apd_mount_jingtianyiji.clone() : null;
         _loc1_.apd_mount_jingleijuedao = this.apd_mount_jingleijuedao ? this.apd_mount_jingleijuedao.clone() : null;
         _loc1_.apd_mount_yingxiongjian = this.apd_mount_yingxiongjian ? this.apd_mount_yingxiongjian.clone() : null;
         _loc1_.apd_mount_changshengjian = this.apd_mount_changshengjian ? this.apd_mount_changshengjian.clone() : null;
         _loc1_.apd_mount_guiyinggong = this.apd_mount_guiyinggong ? this.apd_mount_guiyinggong.clone() : null;
         _loc1_.apd_mount_jingleizhang = this.apd_mount_jingleizhang ? this.apd_mount_jingleizhang.clone() : null;
         _loc1_.apd_mount_hundun = this.apd_mount_hundun ? this.apd_mount_hundun.clone() : null;
         _loc1_.apd_mount_dinghun = this.apd_mount_dinghun ? this.apd_mount_dinghun.clone() : null;
         _loc1_.apd_mount_tiandiwuji = this.apd_mount_tiandiwuji ? this.apd_mount_tiandiwuji.clone() : null;
         _loc1_.apd_mount_huoxingjian = this.apd_mount_huoxingjian ? this.apd_mount_huoxingjian.clone() : null;
         _loc1_.apd_mount_wangzhefu = this.apd_mount_wangzhefu ? this.apd_mount_wangzhefu.clone() : null;
         _loc1_.apd_mount_duomingdao = this.apd_mount_duomingdao ? this.apd_mount_duomingdao.clone() : null;
         _loc1_.apd_mount_xiaoshen = this.apd_mount_xiaoshen ? this.apd_mount_xiaoshen.clone() : null;
         _loc1_.apd_mount_wanshi = this.apd_mount_wanshi ? this.apd_mount_wanshi.clone() : null;
         _loc1_.apd_mount_zhongqiu = this.apd_mount_zhongqiu ? this.apd_mount_zhongqiu.clone() : null;
         _loc1_.apd_mount_shenjian = this.apd_mount_shenjian ? this.apd_mount_shenjian.clone() : null;
         _loc1_.apd_mount_yuhuazhang = this.apd_mount_yuhuazhang ? this.apd_mount_yuhuazhang.clone() : null;
         _loc1_.apd_mount_baniangong = this.apd_mount_baniangong ? this.apd_mount_baniangong.clone() : null;
         _loc1_.apd_mount_banianjian = this.apd_mount_banianjian ? this.apd_mount_banianjian.clone() : null;
         _loc1_.apd_mount_banianji = this.apd_mount_banianji ? this.apd_mount_banianji.clone() : null;
         _loc1_.apd_mount_2019shendan = this.apd_mount_2019shendan ? this.apd_mount_2019shendan.clone() : null;
         _loc1_.apd_mount_2019gengzi = this.apd_mount_2019gengzi ? this.apd_mount_2019gengzi.clone() : null;
         _loc1_.apd_mount_2019feihua = this.apd_mount_2019feihua ? this.apd_mount_2019feihua.clone() : null;
         _loc1_.apd_mount_2019xiongwang = this.apd_mount_2019xiongwang ? this.apd_mount_2019xiongwang.clone() : null;
         _loc1_.apd_mount_2020xuehuan = this.apd_mount_2020xuehuan ? this.apd_mount_2020xuehuan.clone() : null;
         _loc1_.apd_mount_2020badao = this.apd_mount_2020badao ? this.apd_mount_2020badao.clone() : null;
         _loc1_.apd_mount_2020baojian01 = this.apd_mount_2020baojian01 ? this.apd_mount_2020baojian01.clone() : null;
         _loc1_.apd_mount_2020baojian02 = this.apd_mount_2020baojian02 ? this.apd_mount_2020baojian02.clone() : null;
         _loc1_.apd_mount_2020baojian03 = this.apd_mount_2020baojian03 ? this.apd_mount_2020baojian03.clone() : null;
         _loc1_.apd_mount_2020baojian04 = this.apd_mount_2020baojian04 ? this.apd_mount_2020baojian04.clone() : null;
         _loc1_.apd_mount_2020baojian05 = this.apd_mount_2020baojian05 ? this.apd_mount_2020baojian05.clone() : null;
         _loc1_.apd_mount_2020baojian06 = this.apd_mount_2020baojian06 ? this.apd_mount_2020baojian06.clone() : null;
         _loc1_.apd_mount_2020baojian07 = this.apd_mount_2020baojian07 ? this.apd_mount_2020baojian07.clone() : null;
         _loc1_.apd_mount_2020baojian08 = this.apd_mount_2020baojian08 ? this.apd_mount_2020baojian08.clone() : null;
         _loc1_.apd_mount_2020baojian09 = this.apd_mount_2020baojian09 ? this.apd_mount_2020baojian09.clone() : null;
         _loc1_.apd_mount_2020baojian10 = this.apd_mount_2020baojian10 ? this.apd_mount_2020baojian10.clone() : null;
         _loc1_.apd_mount_2020baojian11 = this.apd_mount_2020baojian11 ? this.apd_mount_2020baojian11.clone() : null;
         _loc1_.apd_mount_2020baojian12 = this.apd_mount_2020baojian12 ? this.apd_mount_2020baojian12.clone() : null;
         _loc1_.apd_mount_2020baojian13 = this.apd_mount_2020baojian13 ? this.apd_mount_2020baojian13.clone() : null;
         _loc1_.apd_mount_2020baojian14 = this.apd_mount_2020baojian14 ? this.apd_mount_2020baojian14.clone() : null;
         _loc1_.apd_mount_2020baojian15 = this.apd_mount_2020baojian15 ? this.apd_mount_2020baojian15.clone() : null;
         _loc1_.apd_mount_2020baojian16 = this.apd_mount_2020baojian16 ? this.apd_mount_2020baojian16.clone() : null;
         _loc1_.apd_mount_2020baojian17 = this.apd_mount_2020baojian17 ? this.apd_mount_2020baojian17.clone() : null;
         _loc1_.apd_mount_2020baojian18 = this.apd_mount_2020baojian18 ? this.apd_mount_2020baojian18.clone() : null;
         _loc1_.apd_mount_2020baojian19 = this.apd_mount_2020baojian19 ? this.apd_mount_2020baojian19.clone() : null;
         _loc1_.apd_mount_2020baojian20 = this.apd_mount_2020baojian20 ? this.apd_mount_2020baojian20.clone() : null;
         _loc1_.apd_mount_2020baojian21 = this.apd_mount_2020baojian21 ? this.apd_mount_2020baojian21.clone() : null;
         _loc1_.apd_mount_2020baojian22 = this.apd_mount_2020baojian22 ? this.apd_mount_2020baojian22.clone() : null;
         _loc1_.apd_mount_2020baojian23 = this.apd_mount_2020baojian23 ? this.apd_mount_2020baojian23.clone() : null;
         _loc1_.apd_mount_2020baojian24 = this.apd_mount_2020baojian24 ? this.apd_mount_2020baojian24.clone() : null;
         _loc1_.apd_mount_2020baojian25 = this.apd_mount_2020baojian25 ? this.apd_mount_2020baojian25.clone() : null;
         _loc1_.apd_mount_2020baojian26 = this.apd_mount_2020baojian26 ? this.apd_mount_2020baojian26.clone() : null;
         _loc1_.apd_mount_2020baojian27 = this.apd_mount_2020baojian27 ? this.apd_mount_2020baojian27.clone() : null;
         _loc1_.apd_mount_2020baojian28 = this.apd_mount_2020baojian28 ? this.apd_mount_2020baojian28.clone() : null;
         _loc1_.apd_mount_2020baojian29 = this.apd_mount_2020baojian29 ? this.apd_mount_2020baojian29.clone() : null;
         _loc1_.apd_mount_2020baojian30 = this.apd_mount_2020baojian30 ? this.apd_mount_2020baojian30.clone() : null;
         _loc1_.apd_mount_2020baojian31 = this.apd_mount_2020baojian31 ? this.apd_mount_2020baojian31.clone() : null;
         _loc1_.apd_mount_2020baojian32 = this.apd_mount_2020baojian32 ? this.apd_mount_2020baojian32.clone() : null;
         _loc1_.apd_mount_2020baojian33 = this.apd_mount_2020baojian33 ? this.apd_mount_2020baojian33.clone() : null;
         _loc1_.apd_mount_2020baojian34 = this.apd_mount_2020baojian34 ? this.apd_mount_2020baojian34.clone() : null;
         _loc1_.apd_mount_2020baojian35 = this.apd_mount_2020baojian35 ? this.apd_mount_2020baojian35.clone() : null;
         _loc1_.apd_mount_2020baojian36 = this.apd_mount_2020baojian36 ? this.apd_mount_2020baojian36.clone() : null;
         _loc1_.apd_mount_2020baojian37 = this.apd_mount_2020baojian37 ? this.apd_mount_2020baojian37.clone() : null;
         _loc1_.apd_mount_2020baojian38 = this.apd_mount_2020baojian38 ? this.apd_mount_2020baojian38.clone() : null;
         _loc1_.apd_mount_2020baojian39 = this.apd_mount_2020baojian39 ? this.apd_mount_2020baojian39.clone() : null;
         _loc1_.apd_mount_2020baojian40 = this.apd_mount_2020baojian40 ? this.apd_mount_2020baojian40.clone() : null;
         _loc1_.apd_mount_2020baojian41 = this.apd_mount_2020baojian41 ? this.apd_mount_2020baojian41.clone() : null;
         _loc1_.apd_mount_2020baojian42 = this.apd_mount_2020baojian42 ? this.apd_mount_2020baojian42.clone() : null;
         _loc1_.apd_mount_2020baojian43 = this.apd_mount_2020baojian43 ? this.apd_mount_2020baojian43.clone() : null;
         _loc1_.apd_mount_2020baojian44 = this.apd_mount_2020baojian44 ? this.apd_mount_2020baojian44.clone() : null;
         _loc1_.apd_mount_2020baojian45 = this.apd_mount_2020baojian45 ? this.apd_mount_2020baojian45.clone() : null;
         _loc1_.apd_mount_2020baojian46 = this.apd_mount_2020baojian46 ? this.apd_mount_2020baojian46.clone() : null;
         _loc1_.apd_mount_2020baojian47 = this.apd_mount_2020baojian47 ? this.apd_mount_2020baojian47.clone() : null;
         _loc1_.apd_mount_2020baojian48 = this.apd_mount_2020baojian48 ? this.apd_mount_2020baojian48.clone() : null;
         _loc1_.apd_mount_2020baojian49 = this.apd_mount_2020baojian49 ? this.apd_mount_2020baojian49.clone() : null;
         _loc1_.apd_mount_2020baojian50 = this.apd_mount_2020baojian50 ? this.apd_mount_2020baojian50.clone() : null;
         _loc1_.apd_mount_2020baojian51 = this.apd_mount_2020baojian51 ? this.apd_mount_2020baojian51.clone() : null;
         _loc1_.apd_mount_2020baojian52 = this.apd_mount_2020baojian52 ? this.apd_mount_2020baojian52.clone() : null;
         _loc1_.apd_mount_2020baojian53 = this.apd_mount_2020baojian53 ? this.apd_mount_2020baojian53.clone() : null;
         _loc1_.apd_mount_2020baojian54 = this.apd_mount_2020baojian54 ? this.apd_mount_2020baojian54.clone() : null;
         _loc1_.apd_mount_2020baojian55 = this.apd_mount_2020baojian55 ? this.apd_mount_2020baojian55.clone() : null;
         _loc1_.apd_mount_2020baojian56 = this.apd_mount_2020baojian56 ? this.apd_mount_2020baojian56.clone() : null;
         _loc1_.apd_mount_2020baojian57 = this.apd_mount_2020baojian57 ? this.apd_mount_2020baojian57.clone() : null;
         _loc1_.apd_mount_2020baojian58 = this.apd_mount_2020baojian58 ? this.apd_mount_2020baojian58.clone() : null;
         _loc1_.apd_mount_2020baojian59 = this.apd_mount_2020baojian59 ? this.apd_mount_2020baojian59.clone() : null;
         _loc1_.apd_mount_2020baojian60 = this.apd_mount_2020baojian60 ? this.apd_mount_2020baojian60.clone() : null;
         _loc1_.apd_mount_2020baojian61 = this.apd_mount_2020baojian61 ? this.apd_mount_2020baojian61.clone() : null;
         _loc1_.apd_mount_2020baojian62 = this.apd_mount_2020baojian62 ? this.apd_mount_2020baojian62.clone() : null;
         _loc1_.apd_mount_2020baojian63 = this.apd_mount_2020baojian63 ? this.apd_mount_2020baojian63.clone() : null;
         _loc1_.apd_mount_2020baojian64 = this.apd_mount_2020baojian64 ? this.apd_mount_2020baojian64.clone() : null;
         _loc1_.apd_mount_2020baojian65 = this.apd_mount_2020baojian65 ? this.apd_mount_2020baojian65.clone() : null;
         _loc1_.apd_mount_2020baojian66 = this.apd_mount_2020baojian66 ? this.apd_mount_2020baojian66.clone() : null;
         _loc1_.apd_mount_2020baojian67 = this.apd_mount_2020baojian67 ? this.apd_mount_2020baojian67.clone() : null;
         _loc1_.apd_mount_2020baojian68 = this.apd_mount_2020baojian68 ? this.apd_mount_2020baojian68.clone() : null;
         _loc1_.apd_mount_2020baojian69 = this.apd_mount_2020baojian69 ? this.apd_mount_2020baojian69.clone() : null;
         return _loc1_;
      }
   }
}

