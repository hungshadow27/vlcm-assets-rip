package com.tgame.moudels.gift
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.gift.controller.Gift_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Gift_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.gift.Gift_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_WGSJD_PANEL:String = "SHOW_WGSJD_PANEL";
      
      public static const SHOW_PTYHTQK_PANEL:String = "SHOW_PTYHTQK_PANEL";
      
      public static const SHOW_ZHUANGBEI_HUISHOU_PANEL:String = "SHOW_ZHUANGBEI_HUISHOU_PANEL";
      
      public static const SHOW_LEIJIDENGLU:String = "SHOW_LEIJIDENGLU";
      
      public static const SHOW_CONQUERPANEL_BOSS:String = "SHOW_CONQUERPANEL_BOSS";
      
      public static const YN_REQUEST_HUODONG_PANEL:String = "YN_REQUEST_HUODONG_PANEL";
      
      public static const SHOW_XIANSHIDAJIANGDUIHUAN_TYPE:String = "SHOW_XIANSHIDAJIANGDUIHUAN_TYPE";
      
      public static const YN_YUENANHUODONGYOUHUA_CLICK:String = "YN_YUENANHUODONGYOUHUA_CLICK";
      
      public static const YN_XIAOFEI_REQUEST_INFO:String = "YN_XIAOFEI_REQUEST_INFO";
      
      public static const SHOW_YN2016HUODONGXIAOFEI:String = "SHOW_YN2016HUODONGXIAOFEI";
      
      public static const SHOW_YN2016FANLIPANEL:String = "SHOW_YN2016FANLIPANEL";
      
      public static const SHOW_YN2016SHENGRIZHOUJIPANEL:String = "SHOW_YN2016SHENGRIZHOUJIPANEL";
      
      public static const SHOW_YN2016FUQITONGXINPANEL:String = "SHOW_YN2016FUQITONGXINPANEL";
      
      public static const SHOW_YN2016ZHOUQICAILU:String = "SHOW_YN2016ZHOUQICAILU";
      
      public static const SHOW_YN2016PAIHANGBANG:String = "SHOW_YN2016PAIHANGBANG";
      
      public static const SHOW_YN2016QICAIPAIHANGBANG:String = "SHOW_YN2016QICAIPAIHANGBANG";
      
      public static const SHOW_YN2016YINGXIONGSHIJIAN:String = "SHOW_YN2016YINGXIONGSHIJIAN";
      
      public static const SHOW_YN2016YUELUNGUJI:String = "SHOW_YN2016YUELUNGUJI";
      
      public static const SHOW_YN2016CHONGJIUZHIYANG:String = "SHOW_YN2016CHONGJIUZHIYANG";
      
      public static const SHOW_YN2016LIUPAIJINJIPLANE:String = "SHOW_YN2016LIUPAIJINJIPLANE";
      
      public static const SHOW_YN2016YINGBINZHOULIPLANE:String = "SHOW_YN2016YINGBINZHOULIPLANE";
      
      public static const SHOW_YN2016WUYUEGUANGLIANGPLANE:String = "SHOW_YN2016WUYUEGUANGLIANGPLANE";
      
      public static const SHOW_YN2016DINGFENGZHOUQIPLANE:String = "SHOW_YN2016DINGFENGZHOUQIPLANE";
      
      public static const SHOW_YN2016HUASHANLUNJIANPLANE:String = "SHOW_YN2016HUASHANLUNJIANPLANE";
      
      public static const SHOW_YN2016SHENGDANJIEPLANE:String = "SHOW_YN2016SHENGDANJIEPLANE";
      
      public static const SHOW_YN2016SHENGDANJINPIAOPLANE:String = "SHOW_YN2016SHENGDANJINPIAOPLANE";
      
      public static const SHOW_YN2016ZHENBAOGEPLANE:String = "SHOW_YN2016ZHENBAOGEPLANE";
      
      public static const SHOW_YN2017FANGYANHUAPANEL:String = "SHOW_YN2017FANGYANHUAPANEL";
      
      public static const SHOW_YN2017ZAOWANGPANEL:String = "SHOW_YN2017ZAOWANGPANEL";
      
      public static const SHOW_CHUNJIE123_PLANE:String = "SHOW_CHUNJIE123_PLANE";
      
      public static const SHOW_YUANYANGXISHUI_PLANE:String = "SHOW_YUANYANGXISHUI_PLANE";
      
      public static const SHOW_GUOSETIANXIANG_PLANE:String = "SHOW_GUOSETIANXIANG_PLANE";
      
      public static const SHOW_AIDEHUIBAO_PANEL:String = "SHOW_AIDEHUIBAO_PANEL";
      
      public static const SHOW_YOUHUIZHOUQI_PANEL:String = "SHOW_YOUHUIZHOUQI_PANEL";
      
      public static const SHOW_OULE_PANEL:String = "SHOW_OULE_PANEL";
      
      public static const SHOW_2017YURENJIE_PANEL:String = "SHOW_2017YURENJIE_PANEL";
      
      public static const SHOW_2017XIONGWANGDALI_PANEL:String = "SHOW_2017XIONGWANGDALI_PANEL";
      
      public static const SHOW_KAIZHAN5_PANEL:String = "SHOW_KAIZHAN5_PANEL";
      
      public static const SHOW_TIANSHIZHOUQI_PANEL:String = "SHOW_TIANSHIZHOUQI_PANEL";
      
      public static const SHOW_NANTIANHAOQI_PANEL:String = "SHOW_NANTIANHAOQI_PANEL";
      
      public static const SHOW_RONGGUANG_PANEL:String = "SHOW_RONGGUANG_PANEL";
      
      public static const SHOW_FODAN_PANEL:String = "SHOW_FODAN_PANEL";
      
      public static const SHOW_YINGXIONGMINGCHENG_PANEL:String = "SHOW_YINGXIONGMINGCHENG_PANEL";
      
      public static const SHOW_DUIJUEZHOUQI_PANEL:String = "SHOW_DUIJUEZHOUQI_PANEL";
      
      public static const SHOW_LIUYIERTONGJIE_PANEL:String = "SHOW_LIUYIERTONGJIE_PANEL";
      
      public static const SHOW_0519_PANEL:String = "SHOW_0519_PANEL";
      
      public static const SHOW_KUANGBAO_PANEL:String = "SHOW_KUANGBAO_PANEL";
      
      public static const SHOW_DIANFENGZHOUQI_PANEL:String = "SHOW_DIANFENGZHOUQI_PANEL";
      
      public static const SHOW_QINGZHU_PANEL:String = "SHOW_QINGZHU_PANEL";
      
      public static const SHOW_MEITIANYOUHUI_PANEL:String = "SHOW_MEITIANYOUHUI_PANEL";
      
      public static const SHOW_SHENFENG_PANEL:String = "SHOW_SHENFENG_PANEL";
      
      public static const SHOW_SHENGZHEN_PANEL:String = "SHOW_SHENGZHEN_PANEL";
      
      public static const SHOW_JINYE_PANEL:String = "SHOW_JINYE_PANEL";
      
      public static const SHOW_LIUYUEYUANMAN_PANEL:String = "SHOW_LIUYUEYUANMAN_PANEL";
      
      public static const SHOW_LIUYUEQINGZHU_PANEL:String = "SHOW_LIUYUEQINGZHU_PANEL";
      
      public static const SHOW_LIUYUEDI_PANEL:String = "SHOW_LIUYUEDI_PANEL";
      
      public static const SHOW_MEITIANYOUHUIIBAO_PANEL:String = "SHOW_MEITIANYOUHUIIBAO_PANEL";
      
      public static const SHOW_DISHI_PANEL:String = "SHOW_DISHI_PANEL";
      
      public static const SHOW_WEI300_PANEL:String = "SHOW_WEI300_PANEL";
      
      public static const SHOW_SHOUCHONGSHIJIAN_PANEL:String = "SHOW_SHOUCHONGSHIJIAN_PANEL";
      
      public static const SHOW_MOSHIZHOUQI_PANEL:String = "SHOW_MOSHIZHOUQI_PANEL";
      
      public static const SHOW_XIATIANZHIEN_PANEL:String = "SHOW_XIATIANZHIEN_PANEL";
      
      public static const SHOW_BAYUETOU_PANEL:String = "SHOW_BAYUETOU_PANEL";
      
      public static const SHOW_TONGLEFEISHENGJINGJIE_PANEL:String = "SHOW_TONGLEFEISHENGJINGJIE_PANEL";
      
      public static const SHOW_SHENQIZHOUQI_PANEL:String = "SHOW_SHENQIZHOUQI_PANEL";
      
      public static const SHOW_1908_PANEL:String = "SHOW_1908_PANEL";
      
      public static const SHOW_QIXIHUODONG_PANEL:String = "SHOW_QIXIHUODONG_PANEL";
      
      public static const SHOW_LIBAOZHOUQI_PANEL:String = "SHOW_LIBAOZHOUQI_PANEL";
      
      public static const SHOW_SHIJIAN902_PANEL:String = "SHOW_SHIJIAN902_PANEL";
      
      public static const SHOW_YULANJIE_PANEL:String = "SHOW_YULANJIE_PANEL";
      
      public static const SHOW_HUANYINGWEIXI_PANEL:String = "SHOW_HUANYINGWEIXI_PANEL";
      
      public static const SHOW_CHONGJIUHUODONG_PANEL:String = "SHOW_CHONGJIUHUODONG_PANEL";
      
      public static const SHOW_WULINZHENYUAN_PANEL:String = "SHOW_WULINZHENYUAN_PANEL";
      
      public static const SHOW_KAIXUEQIQIU_PANEL:String = "SHOW_KAIXUEQIQIU_PANEL";
      
      public static const SHOW_HUOZHENJIASHI_PANEL:String = "SHOW_HUOZHENJIASHI_PANEL";
      
      public static const SHOW_XUANWUXINGJUN_PANEL:String = "SHOW_XUANWUXINGJUN_PANEL";
      
      public static const SHOW_WANGZHEZHENGXIONG_PANEL:String = "SHOW_WANGZHEZHENGXIONG_PANEL";
      
      public static const SHOW_WANGZHEHUODONG6_PANEL:String = "SHOW_WANGZHEHUODONG6_PANEL";
      
      public static const SHOW_BAIHUXINGJUN_PANEL:String = "SHOW_BAIHUXINGJUN_PANEL";
      
      public static const SHOW_ZHONGQIU2017_PANEL:String = "SHOW_ZHONGQIU2017_PANEL";
      
      public static const SHOW_QINGLONGXINGJUN_PANEL:String = "SHOW_QINGLONGXINGJUN_PANEL";
      
      public static const SHOW_LIHEJUE_PANEL:String = "SHOW_LIHEJUE_PANEL";
      
      public static const SHOW_10YUEYOUHUIZHOUQI_PANEL:String = "SHOW_10YUEYOUHUIZHOUQI_PANEL";
      
      public static const SHOW_MEITIANYOUHUIIBAO2_PANEL:String = "SHOW_MEITIANYOUHUIIBAO2_PANEL";
      
      public static const SHOW_ZHUQUEXINGJUN_PANEL:String = "SHOW_ZHUQUEXINGJUN_PANEL";
      
      public static const SHOW_YN2016WUSHENZHANLIAN:String = "SHOW_YN2016WUSHENZHANLIAN";
      
      public static const SHOW_20171020_PANEL:String = "SHOW_20171020_PANEL";
      
      public static const SHOW_ZENGSONGNVREN_PANEL:String = "SHOW_ZENGSONGNVREN_PANEL";
      
      public static const SHOW_SUIXINXIAOFEI_PANEL:String = "SHOW_SUIXINXIAOFEI_PANEL";
      
      public static const SHOW_LIUNIANHUODONG_PANEL:String = "SHOW_LIUNIANHUODONG_PANEL";
      
      public static const SHOW_LIUNIANPEIBAN_PANEL:String = "SHOW_LIUNIANPEIBAN_PANEL";
      
      public static const SHOW_GANENLIUNIAN_PANEL:String = "SHOW_GANENLIUNIAN_PANEL";
      
      public static const SHOW_SHENGRIZHOUQI_PANEL:String = "SHOW_SHENGRIZHOUQI_PANEL";
      
      public static const SHOW_HUAZHUANGDASAI_PANEL:String = "SHOW_HUAZHUANGDASAI_PANEL";
      
      public static const SHOW_XUANTIEZHIXINGZHOUQI_PANEL:String = "SHOW_XUANTIEZHIXINGZHOUQI_PANEL";
      
      public static const SHOW_0601SHIJIAN_PANEL:String = "SHOW_0601SHIJIAN_PANEL";
      
      public static const SHOW_QINGLONGXINGJUNFUWEN_PANEL:String = "SHOW_QINGLONGXINGJUNFUWEN_PANEL";
      
      public static const SHOW_NEILIGAISHI_PANEL:String = "SHOW_NEILIGAISHI_PANEL";
      
      public static const SHOW_CHAOJIXIANGLONGZHOUQI_PANEL:String = "SHOW_CHAOJIXIANGLONGZHOUQI_PANEL";
      
      public static const SHOW_2017JIAOSHIJIE_PANEL:String = "SHOW_2017JIAOSHIJIE_PANEL";
      
      public static const SHOW_2017SHUANGLONGZHAN_PANEL:String = "SHOW_2017SHUANGLONGZHAN_PANEL";
      
      public static const SHOW_2017ZHENPINZHOUQI_PANEL:String = "SHOW_2017ZHENPINZHOUQI_PANEL";
      
      public static const SHOW_20171205SHIJIAN_PANEL:String = "SHOW_20171205SHIJIAN_PANEL";
      
      public static const SHOW_20171212SHIJIAN_PANEL:String = "SHOW_20171212SHIJIAN_PANEL";
      
      public static const SHOW_YITIANBAOJINZHOUQI_PANEL:String = "SHOW_YITIANBAOJINZHOUQI_PANEL";
      
      public static const SHOW_20171219SHIJIAN_PANEL:String = "SHOW_20171219SHIJIAN_PANEL";
      
      public static const SHOW_YINSHECHUDONG_PANEL:String = "SHOW_YINSHECHUDONG_PANEL";
      
      public static const SHOW_20171226SHIJIAN_PANEL:String = "SHOW_20171226SHIJIAN_PANEL";
      
      public static const SHOW_SHENGDANCHONGMAN_PANEL:String = "SHOW_SHENGDANCHONGMAN_PANEL";
      
      public static const SHOW_WANSHIXING_PANEL:String = "SHOW_WANSHIXING_PANEL";
      
      public static const SHOW_QIANGHUAJINSHEN_PANEL:String = "SHOW_QIANGHUAJINSHEN_PANEL";
      
      public static const SHOW_PEIYANGDIANFENGSHOU_PANEL:String = "SHOW_PEIYANGDIANFENGSHOU_PANEL";
      
      public static const SHOW_YITIANTULONGDAO_PANEL:String = "SHOW_YITIANTULONGDAO_PANEL";
      
      public static const SHOW_TIANRENHE_PANEL:String = "SHOW_TIANRENHE_PANEL";
      
      public static const SHOW_RONGQINGAIYI_PANEL:String = "SHOW_RONGQINGAIYI_PANEL";
      
      public static const SHOW_CHAOJIWULINDABAO_PANEL:String = "SHOW_CHAOJIWULINDABAO_PANEL";
      
      public static const SHOW_2018FUNVJIE_PANEL:String = "SHOW_2018FUNVJIE_PANEL";
      
      public static const SHOW_JINSHENZHOUQI_PANEL:String = "SHOW_JINSHENZHOUQI_PANEL";
      
      public static const SHOW_BAIQIAOKELI_PANEL:String = "SHOW_BAIQIAOKELI_PANEL";
      
      public static const SHOW_DAJINSHENZHOUQI_PANEL:String = "SHOW_DAJINSHENZHOUQI_PANEL";
      
      public static const SHOW_TIANRENHE2_PANEL:String = "SHOW_TIANRENHE2_PANEL";
      
      public static const SHOW_QIANGHUAJINSHEN2_PANEL:String = "SHOW_QIANGHUAJINSHEN2_PANEL";
      
      public static const SHOW_QIANGHUAJINSHEN3_PANEL:String = "SHOW_QIANGHUAJINSHEN3_PANEL";
      
      public static const SHOW_YUANBAOYOUHUI_PANEL:String = "SHOW_YUANBAOYOUHUI_PANEL";
      
      public static const SHOW_YURENJIE2018_PANEL:String = "SHOW_YURENJIE2018_PANEL";
      
      public static const SHOW_CHANGNIANCHONGZHI_PANEL:String = "SHOW_CHANGNIANCHONGZHI_PANEL";
      
      public static const SHOW_HANSHIJIE_PANEL:String = "SHOW_HANSHIJIE_PANEL";
      
      public static const SHOW_DASHENGZHOUQI_PANEL:String = "SHOW_DASHENGZHOUQI_PANEL";
      
      public static const SHOW_2018LAODONGJIE_PANEL:String = "SHOW_2018LAODONGJIE_PANEL";
      
      public static const SHOW_BANBENYOUHUI_PANEL:String = "SHOW_BANBENYOUHUI_PANEL";
      
      public static const SHOW_LIXIA2018_PANEL:String = "SHOW_LIXIA2018_PANEL";
      
      public static const SHOW_SHUIGUOLEIJI_PANEL:String = "SHOW_SHUIGUOLEIJI_PANEL";
      
      public static const SHOW_519HUODONG2018_PANEL:String = "SHOW_519HUODONG2018_PANEL";
      
      public static const SHOW_TIANXIAWUGONGCHUSHAOLIN_PANEL:String = "SHOW_TIANXIAWUGONGCHUSHAOLIN_PANEL";
      
      public static const SHOW_CHAOJIZHOUQI_PANEL:String = "SHOW_CHAOJIZHOUQI_PANEL";
      
      public static const SHOW_YUEXIAOFEIYUELINGJIANG_PANEL:String = "SHOW_YUEXIAOFEIYUELINGJIANG_PANEL";
      
      public static const SHOW_ZHIZUNCHENGHAOZHENGDUO_PANEL:String = "SHOW_ZHIZUNCHENGHAOZHENGDUO_PANEL";
      
      public static const SHOW_TAOHUAZHIJING_PANEL:String = "SHOW_TAOHUAZHIJING_PANEL";
      
      public static const SHOW_QUANZHENXIAOYAO_PANEL:String = "SHOW_QUANZHENXIAOYAO_PANEL";
      
      public static const SHOW_LIANXUBAOMING_PANEL:String = "SHOW_LIANXUBAOMING_PANEL";
      
      public static const SHOW_DUANWU2018_PANEL:String = "SHOW_DUANWU2018_PANEL";
      
      public static const SHOW_XIATIANKUAILE_PANEL:String = "SHOW_XIATIANKUAILE_PANEL";
      
      public static const SHOW_HUANQIUKAIMU_PANEL:String = "SHOW_HUANQIUKAIMU_PANEL";
      
      public static const SHOW_MINGJIAOZHIZUN_PANEL:String = "SHOW_MINGJIAOZHIZUN_PANEL";
      
      public static const SHOW_FEISHENGSHENBAO_PANEL:String = "SHOW_FEISHENGSHENBAO_PANEL";
      
      public static const SHOW_ZHENGDUOZHAN_PANEL:String = "SHOW_ZHENGDUOZHAN_PANEL";
      
      public static const SHOW_DAGENGXINHUODONG_PANEL:String = "SHOW_DAGENGXINHUODONG_PANEL";
      
      public static const SHOW_WANGZHEZHOUQI_PANEL:String = "SHOW_WANGZHEZHOUQI_PANEL";
      
      public static const SHOW_YINGJIEFUNVJIE_PANEL:String = "SHOW_YINGJIEFUNVJIE_PANEL";
      
      public static const SHOW_ZHOUYIKUAILE_PANEL:String = "SHOW_ZHOUYIKUAILE_PANEL";
      
      public static const SHOW_ZHOUMORENAO_PANEL:String = "SHOW_ZHOUMORENAO_PANEL";
      
      public static const SHOW_WANGZHEZHIBANGHD_PANEL:String = "SHOW_WANGZHEZHIBANGHD_PANEL";
      
      public static const SHOW_CHONGZHIDAY_PANEL:String = "SHOW_CHONGZHIDAY_PANEL";
      
      public function Gift_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_GIFT,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.SHOW_WGSJD_PANEL,PipeConstants.SHOW_PTYHTQK_PANEL,PipeConstants.SHOW_ZHUANGBEI_HUISHOU_PANEL,PipeConstants.SHOW_LEIJIDENGLU,PipeConstants.SHOW_CONQUERPANEL_BOSS,PipeConstants.YN_REQUEST_HUODONG_PANEL,PipeConstants.SHOW_XIANSHIDAJIANGDUIHUAN_TYPE,PipeConstants.YN_YUENANHUODONGYOUHUA_CLICK,PipeConstants.SHOW_YN2016XIAOFEI,PipeConstants.SHOW_YN2016HUODONGXIAOFEI,PipeConstants.SHOW_YN2016FANLIPANEL,PipeConstants.SHOW_YN2016SHENGRIZHOUJIPANEL,PipeConstants.SHOW_YN2016FUQITONGXINPANEL,PipeConstants.SHOW_YN2016ZHOUQICAILU,PipeConstants.SHOW_YN2016PAIHANGBANG,PipeConstants.SHOW_YN2016QICAIPAIHANGBANG,PipeConstants.SHOW_YN2016YINGXIONGSHIJIAN,PipeConstants.SHOW_YN2016YUELUNGUJI,PipeConstants.SHOW_YN2016CHONGJIUZHIYANG,PipeConstants.YN_WUSHEN_ZHANLIAN_PANEL,PipeConstants.SHOW_YN2016LIUPAIJINJIPLANE,PipeConstants.SHOW_YN2016YINGBINZHOULIPLANE,PipeConstants.SHOW_YN2016WUYUEGUANGLIANGPLANE,PipeConstants
         .SHOW_YN2016DINGFENGZHOUQIPLANE,PipeConstants.SHOW_YN2016HUASHANLUNJIANPLANE,PipeConstants.SHOW_YN2016SHENGDANJIEPLANE,PipeConstants.SHOW_YN2016SHENGDANJINPIAOPLANE,PipeConstants.SHOW_YN2016ZHENBAOGEPLANE,PipeConstants.SHOW_YN2017FANGYANHUAPANEL,PipeConstants.SHOW_YN2017ZAOWANGPANEL,PipeConstants.SHOW_CHUNJIE123_PLANE,PipeConstants.SHOW_YUANYANGXISHUI_PLANE,PipeConstants.SHOW_GUOSETIANXIANG_PANEL,PipeConstants.SHOW_AIDEHUIBAO_PANEL,PipeConstants.SHOW_YOUHUIZHOUQIO_PANEL,PipeConstants.SHOW_OULE_PANEL,PipeConstants.SHOW_2017YURENJIE_PANEL,PipeConstants.SHOW_2017XIONGWANGDALI_PANEL,PipeConstants.SHOW_KAIZHAN5_PANEL,PipeConstants.SHOW_TIANSHIZHOUQI_PANEL,PipeConstants.SHOW_NANTIANHAOQI_PANEL,PipeConstants.SHOW_RONGGUANG_PANEL,PipeConstants.SHOW_FODAN_PANEL,PipeConstants.SHOW_YINGXIONGMINGCHENG_PANEL,PipeConstants.SHOW_DUIJUEZHOUQI_PANEL,PipeConstants.SHOW_LIUYIERTONGJIE_PANEL,PipeConstants.SHOW_0519_PANEL,PipeConstants.SHOW_DIANFENGZHOUQI_PANEL,PipeConstants.SHOW_KUANGBAO_PANEL,PipeConstants
         .SHOW_QINGZHU_PANEL,PipeConstants.SHOW_MEITIANYOUHUI_PANEL,PipeConstants.SHOW_SHENFENG_PANEL,PipeConstants.SHOW_SHENGZHEN_PANEL,PipeConstants.SHOW_JINYE_PANEL,PipeConstants.SHOW_LIUYUEYUANMAN_PANEL,PipeConstants.SHOW_LIUYUEQINGZHU_PANEL,PipeConstants.SHOW_MEITIANYOUHUIIBAO_PANEL,PipeConstants.SHOW_LIUYUEDI_PANEL,PipeConstants.SHOW_DISHI_PANEL,PipeConstants.SHOW_WEI300_PANEL,PipeConstants.SHOW_SHOUCHONGSHIJIAN_PANEL,PipeConstants.SHOW_MOSHIZHOUQI_PANEL,PipeConstants.SHOW_BAYUETOU_PANEL,PipeConstants.SHOW_TONGLEFEISHENGJINGJIE_PANEL,PipeConstants.SHOW_SHENQIZHOUQI_PANEL,PipeConstants.SHOW_XIATIANZHIEN_PANEL,PipeConstants.SHOW_1908_PANEL,PipeConstants.SHOW_QIXIHUODONG_PANEL,PipeConstants.SHOW_LIBAOZHOUQI_PANEL,PipeConstants.SHOW_SHIJIAN902_PANEL,PipeConstants.SHOW_YULANJIE_PANEL,PipeConstants.SHOW_HUANYINGWEIXI_PANEL,PipeConstants.SHOW_CHONGJIUHUODONG_PANEL,PipeConstants.SHOW_WULINZHENYUAN_PANEL,PipeConstants.SHOW_KAIXUEQIQIU_PANEL,PipeConstants.SHOW_HUOZHENJIASHI_PANEL,PipeConstants.SHOW_WANGZHEHUODONG6_PANEL
         ,PipeConstants.SHOW_XUANWUXINGJUN_PANEL,PipeConstants.SHOW_WANGZHEZHENGXIONG_PANEL,PipeConstants.SHOW_BAIHUXINGJUN_PANEL,PipeConstants.SHOW_ZHONGQIU2017_PANEL,PipeConstants.SHOW_LIHEJUE_PANEL,PipeConstants.SHOW_10YUEYOUHUIZHOUQI_PANEL,PipeConstants.SHOW_QINGLONGXINGJUN_PANEL,PipeConstants.SHOW_MEITIANYOUHUIIBAO2_PANEL,PipeConstants.SHOW_ZHUQUEXINGJUN_PANEL,PipeConstants.SHOW_20171020_PANEL,PipeConstants.SHOW_ZENGSONGNVREN_PANEL,PipeConstants.SHOW_SUIXINXIAOFEI_PANEL,PipeConstants.SHOW_LIUNIANHUODONG_PANEL,PipeConstants.SHOW_LIUNIANPEIBAN_PANEL,PipeConstants.SHOW_GANENLIUNIAN_PANEL,PipeConstants.SHOW_SHENGRIZHOUQI_PANEL,PipeConstants.SHOW_HUAZHUANGDASAI_PANEL,PipeConstants.SHOW_XUANTIEZHIXINGZHOUQI_PANEL,PipeConstants.SHOW_0601SHIJIAN_PANEL,PipeConstants.SHOW_QINGLONGXINGJUNFUWEN_PANEL,PipeConstants.SHOW_CHAOJIXIANGLONGZHOUQI_PANEL,PipeConstants.SHOW_2017JIAOSHIJIE_PANEL,PipeConstants.SHOW_2017SHUANGLONGZHAN_PANEL,PipeConstants.SHOW_2017ZHENPINZHOUQI_PANEL,PipeConstants.SHOW_20171205SHIJIAN_PANEL
         ,PipeConstants.SHOW_20171212SHIJIAN_PANEL,PipeConstants.SHOW_YITIANBAOJINZHOUQI_PANEL,PipeConstants.SHOW_20171219SHIJIAN_PANEL,PipeConstants.SHOW_YINSHECHUDONG_PANEL,PipeConstants.SHOW_20171226SHIJIAN_PANEL,PipeConstants.SHOW_SHENGDANCHONGMAN_PANEL,PipeConstants.SHOW_WANSHIXING_PANEL,PipeConstants.SHOW_QIANGHUAJINSHEN_PANEL,PipeConstants.SHOW_NEILIGAISHI_PANEL,PipeConstants.SHOW_PEIYANGDIANFENGSHOU_PANEL,PipeConstants.SHOW_YITIANTULONGDAO_PANEL,PipeConstants.SHOW_TIANRENHE_PANEL,PipeConstants.SHOW_RONGQINGAIYI_PANEL,PipeConstants.SHOW_CHAOJIWULINDABAO_PANEL,PipeConstants.SHOW_2018FUNVJIE_PANEL,PipeConstants.SHOW_JINSHENZHOUQI_PANEL,PipeConstants.SHOW_BAIQIAOKELI_PANEL,PipeConstants.SHOW_DAJINSHENZHOUQI_PANEL,PipeConstants.SHOW_TIANRENHE2_PANEL,PipeConstants.SHOW_QIANGHUAJINSHEN2_PANEL,PipeConstants.SHOW_QIANGHUAJINSHEN3_PANEL,PipeConstants.SHOW_YUANBAOYOUHUI_PANEL,PipeConstants.SHOW_YURENJIE2018_PANEL,PipeConstants.SHOW_CHANGNIANCHONGZHI_PANEL,PipeConstants.SHOW_HANSHIJIE_PANEL,PipeConstants
         .SHOW_DASHENGZHOUQI_PANEL,PipeConstants.SHOW_2018LAODONGJIE_PANEL,PipeConstants.SHOW_BANBENYOUHUI_PANEL,PipeConstants.SHOW_LIXIA2018_PANEL,PipeConstants.SHOW_SHUIGUOLEIJI_PANEL,PipeConstants.SHOW_519HUODONG2018_PANEL,PipeConstants.SHOW_TIANXIAWUGONGCHUSHAOLIN_PANEL,PipeConstants.SHOW_CHAOJIZHOUQI_PANEL,PipeConstants.SHOW_YUEXIAOFEIYUELINGJIANG_PANEL,PipeConstants.SHOW_ZHIZUNCHENGHAOZHENGDUO_PANEL,PipeConstants.SHOW_TAOHUAZHIJING_PANEL,PipeConstants.SHOW_QUANZHENXIAOYAO_PANEL,PipeConstants.SHOW_LIANXUBAOMING_PANEL,PipeConstants.SHOW_DUANWU2018_PANEL,PipeConstants.SHOW_XIATIANKUAILE_PANEL,PipeConstants.SHOW_HUANQIUKAIMU_PANEL,PipeConstants.SHOW_MINGJIAOZHIZUN_PANEL,PipeConstants.SHOW_FEISHENGSHENBAO_PANEL,PipeConstants.SHOW_ZHENGDUOZHAN_PANEL,PipeConstants.SHOW_DAGENGXINHUODONG_PANEL,PipeConstants.SHOW_WANGZHEZHOUQI_PANEL,PipeConstants.SHOW_YINGJIEFUNVJIE_PANEL,PipeConstants.SHOW_ZHOUYIKUAILE_PANEL,PipeConstants.SHOW_ZHOUMORENAO_PANEL,PipeConstants.SHOW_WANGZHEZHIBANGHD_PANEL,PipeConstants
         .SHOW_CHONGZHIDAY_PANEL],this.handlePipeMessage,Gift_ApplicationFacade);
      }
      
      public static function getInstance() : Gift_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Gift_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Gift_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Gift_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_GIFT:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.CHONGZHI_DUIHUAN)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
               }
               break;
            case PipeConstants.SHOW_WGSJD_PANEL:
               sendNotification(SHOW_WGSJD_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_PTYHTQK_PANEL:
               sendNotification(SHOW_PTYHTQK_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHUANGBEI_HUISHOU_PANEL:
               sendNotification(SHOW_ZHUANGBEI_HUISHOU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LEIJIDENGLU:
               sendNotification(SHOW_LEIJIDENGLU);
               break;
            case PipeConstants.SHOW_CONQUERPANEL_BOSS:
               sendNotification(SHOW_CONQUERPANEL_BOSS);
               break;
            case PipeConstants.YN_REQUEST_HUODONG_PANEL:
               sendNotification(YN_REQUEST_HUODONG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_XIANSHIDAJIANGDUIHUAN_TYPE:
               sendNotification(SHOW_XIANSHIDAJIANGDUIHUAN_TYPE,_loc2_);
               break;
            case PipeConstants.YN_YUENANHUODONGYOUHUA_CLICK:
               sendNotification(YN_YUENANHUODONGYOUHUA_CLICK,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016XIAOFEI:
               sendNotification(YN_XIAOFEI_REQUEST_INFO,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016HUODONGXIAOFEI:
               sendNotification(SHOW_YN2016HUODONGXIAOFEI,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016FANLIPANEL:
               sendNotification(SHOW_YN2016FANLIPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016SHENGRIZHOUJIPANEL:
               sendNotification(SHOW_YN2016SHENGRIZHOUJIPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016FUQITONGXINPANEL:
               sendNotification(SHOW_YN2016FUQITONGXINPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016ZHOUQICAILU:
               sendNotification(SHOW_YN2016ZHOUQICAILU,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016LIUPAIJINJIPLANE:
               sendNotification(SHOW_YN2016LIUPAIJINJIPLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016YINGBINZHOULIPLANE:
               sendNotification(SHOW_YN2016YINGBINZHOULIPLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016WUYUEGUANGLIANGPLANE:
               sendNotification(SHOW_YN2016WUYUEGUANGLIANGPLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016DINGFENGZHOUQIPLANE:
               sendNotification(SHOW_YN2016DINGFENGZHOUQIPLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016HUASHANLUNJIANPLANE:
               sendNotification(SHOW_YN2016HUASHANLUNJIANPLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016SHENGDANJIEPLANE:
               sendNotification(SHOW_YN2016SHENGDANJIEPLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016SHENGDANJINPIAOPLANE:
               sendNotification(SHOW_YN2016SHENGDANJINPIAOPLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2017ZAOWANGPANEL:
               sendNotification(SHOW_YN2017ZAOWANGPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_CHUNJIE123_PLANE:
               sendNotification(SHOW_CHUNJIE123_PLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YUANYANGXISHUI_PLANE:
               sendNotification(SHOW_YUANYANGXISHUI_PLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2017FANGYANHUAPANEL:
               sendNotification(SHOW_YN2017FANGYANHUAPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016ZHENBAOGEPLANE:
               sendNotification(SHOW_YN2016ZHENBAOGEPLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016PAIHANGBANG:
               sendNotification(SHOW_YN2016PAIHANGBANG,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016QICAIPAIHANGBANG:
               sendNotification(SHOW_YN2016QICAIPAIHANGBANG,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016YINGXIONGSHIJIAN:
               sendNotification(SHOW_YN2016YINGXIONGSHIJIAN,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016YUELUNGUJI:
               sendNotification(SHOW_YN2016YUELUNGUJI,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016CHONGJIUZHIYANG:
               sendNotification(SHOW_YN2016CHONGJIUZHIYANG,_loc2_);
               break;
            case PipeConstants.SHOW_GUOSETIANXIANG_PANEL:
               sendNotification(SHOW_GUOSETIANXIANG_PLANE,_loc2_);
               break;
            case PipeConstants.SHOW_AIDEHUIBAO_PANEL:
               sendNotification(SHOW_AIDEHUIBAO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YOUHUIZHOUQIO_PANEL:
               sendNotification(SHOW_YOUHUIZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_OULE_PANEL:
               sendNotification(SHOW_OULE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_2017YURENJIE_PANEL:
               sendNotification(SHOW_2017YURENJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_2017XIONGWANGDALI_PANEL:
               sendNotification(SHOW_2017XIONGWANGDALI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_KAIZHAN5_PANEL:
               sendNotification(SHOW_KAIZHAN5_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_TIANSHIZHOUQI_PANEL:
               sendNotification(SHOW_TIANSHIZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_NANTIANHAOQI_PANEL:
               sendNotification(SHOW_NANTIANHAOQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_RONGGUANG_PANEL:
               sendNotification(SHOW_RONGGUANG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_FODAN_PANEL:
               sendNotification(SHOW_FODAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YINGXIONGMINGCHENG_PANEL:
               sendNotification(SHOW_YINGXIONGMINGCHENG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DUIJUEZHOUQI_PANEL:
               sendNotification(SHOW_DUIJUEZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LIUYIERTONGJIE_PANEL:
               sendNotification(SHOW_LIUYIERTONGJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_0519_PANEL:
               sendNotification(SHOW_0519_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_KUANGBAO_PANEL:
               sendNotification(SHOW_KUANGBAO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DIANFENGZHOUQI_PANEL:
               sendNotification(SHOW_DIANFENGZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_QINGZHU_PANEL:
               sendNotification(SHOW_QINGZHU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_MEITIANYOUHUI_PANEL:
               sendNotification(SHOW_MEITIANYOUHUI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHENFENG_PANEL:
               sendNotification(SHOW_SHENFENG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHENGZHEN_PANEL:
               sendNotification(SHOW_SHENGZHEN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_JINYE_PANEL:
               sendNotification(SHOW_JINYE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LIUYUEYUANMAN_PANEL:
               sendNotification(SHOW_LIUYUEYUANMAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LIUYUEQINGZHU_PANEL:
               sendNotification(SHOW_LIUYUEQINGZHU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_MEITIANYOUHUIIBAO_PANEL:
               sendNotification(SHOW_MEITIANYOUHUIIBAO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LIUYUEDI_PANEL:
               sendNotification(SHOW_LIUYUEDI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DISHI_PANEL:
               sendNotification(SHOW_DISHI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WEI300_PANEL:
               sendNotification(SHOW_WEI300_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHOUCHONGSHIJIAN_PANEL:
               sendNotification(SHOW_SHOUCHONGSHIJIAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_MOSHIZHOUQI_PANEL:
               sendNotification(SHOW_MOSHIZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BAYUETOU_PANEL:
               sendNotification(SHOW_BAYUETOU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_TONGLEFEISHENGJINGJIE_PANEL:
               sendNotification(SHOW_TONGLEFEISHENGJINGJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHENQIZHOUQI_PANEL:
               sendNotification(SHOW_SHENQIZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_XIATIANZHIEN_PANEL:
               sendNotification(SHOW_XIATIANZHIEN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_1908_PANEL:
               sendNotification(SHOW_1908_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_QIXIHUODONG_PANEL:
               sendNotification(SHOW_QIXIHUODONG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LIBAOZHOUQI_PANEL:
               sendNotification(SHOW_LIBAOZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHIJIAN902_PANEL:
               sendNotification(SHOW_SHIJIAN902_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YULANJIE_PANEL:
               sendNotification(SHOW_YULANJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_HUANYINGWEIXI_PANEL:
               sendNotification(SHOW_HUANYINGWEIXI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_CHONGJIUHUODONG_PANEL:
               sendNotification(SHOW_CHONGJIUHUODONG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WULINZHENYUAN_PANEL:
               sendNotification(SHOW_WULINZHENYUAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_KAIXUEQIQIU_PANEL:
               sendNotification(SHOW_KAIXUEQIQIU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_HUOZHENJIASHI_PANEL:
               sendNotification(SHOW_HUOZHENJIASHI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WANGZHEHUODONG6_PANEL:
               sendNotification(SHOW_WANGZHEHUODONG6_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_XUANWUXINGJUN_PANEL:
               sendNotification(SHOW_XUANWUXINGJUN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WANGZHEZHENGXIONG_PANEL:
               sendNotification(SHOW_WANGZHEZHENGXIONG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BAIHUXINGJUN_PANEL:
               sendNotification(SHOW_BAIHUXINGJUN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHONGQIU2017_PANEL:
               sendNotification(SHOW_ZHONGQIU2017_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_QINGLONGXINGJUN_PANEL:
               sendNotification(SHOW_QINGLONGXINGJUN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LIHEJUE_PANEL:
               sendNotification(SHOW_LIHEJUE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_10YUEYOUHUIZHOUQI_PANEL:
               sendNotification(SHOW_10YUEYOUHUIZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_MEITIANYOUHUIIBAO2_PANEL:
               sendNotification(SHOW_MEITIANYOUHUIIBAO2_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHUQUEXINGJUN_PANEL:
               sendNotification(SHOW_ZHUQUEXINGJUN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_20171020_PANEL:
               sendNotification(SHOW_20171020_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZENGSONGNVREN_PANEL:
               sendNotification(SHOW_ZENGSONGNVREN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SUIXINXIAOFEI_PANEL:
               sendNotification(SHOW_SUIXINXIAOFEI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LIUNIANHUODONG_PANEL:
               sendNotification(SHOW_LIUNIANHUODONG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LIUNIANPEIBAN_PANEL:
               sendNotification(SHOW_LIUNIANPEIBAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHENGRIZHOUQI_PANEL:
               sendNotification(SHOW_SHENGRIZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_GANENLIUNIAN_PANEL:
               sendNotification(SHOW_GANENLIUNIAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_HUAZHUANGDASAI_PANEL:
               sendNotification(SHOW_HUAZHUANGDASAI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_XUANTIEZHIXINGZHOUQI_PANEL:
               sendNotification(SHOW_XUANTIEZHIXINGZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_0601SHIJIAN_PANEL:
               sendNotification(SHOW_0601SHIJIAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_QINGLONGXINGJUNFUWEN_PANEL:
               sendNotification(SHOW_QINGLONGXINGJUNFUWEN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_CHAOJIXIANGLONGZHOUQI_PANEL:
               sendNotification(SHOW_CHAOJIXIANGLONGZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_2017JIAOSHIJIE_PANEL:
               sendNotification(SHOW_2017JIAOSHIJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_2017SHUANGLONGZHAN_PANEL:
               sendNotification(SHOW_2017SHUANGLONGZHAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_2017ZHENPINZHOUQI_PANEL:
               sendNotification(SHOW_2017ZHENPINZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_20171205SHIJIAN_PANEL:
               sendNotification(SHOW_20171205SHIJIAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_20171212SHIJIAN_PANEL:
               sendNotification(SHOW_20171212SHIJIAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YITIANBAOJINZHOUQI_PANEL:
               sendNotification(SHOW_YITIANBAOJINZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_20171219SHIJIAN_PANEL:
               sendNotification(SHOW_20171219SHIJIAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YINSHECHUDONG_PANEL:
               sendNotification(SHOW_YINSHECHUDONG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_20171226SHIJIAN_PANEL:
               sendNotification(SHOW_20171226SHIJIAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHENGDANCHONGMAN_PANEL:
               sendNotification(SHOW_SHENGDANCHONGMAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WANSHIXING_PANEL:
               sendNotification(SHOW_WANSHIXING_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_QIANGHUAJINSHEN_PANEL:
               sendNotification(SHOW_QIANGHUAJINSHEN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_NEILIGAISHI_PANEL:
               sendNotification(SHOW_NEILIGAISHI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_PEIYANGDIANFENGSHOU_PANEL:
               sendNotification(SHOW_PEIYANGDIANFENGSHOU_PANEL,_loc2_);
               break;
            case PipeConstants.YN_WUSHEN_ZHANLIAN_PANEL:
               sendNotification(SHOW_YN2016WUSHENZHANLIAN,_loc2_);
               break;
            case PipeConstants.SHOW_YITIANTULONGDAO_PANEL:
               sendNotification(SHOW_YITIANTULONGDAO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_TIANRENHE_PANEL:
               sendNotification(SHOW_TIANRENHE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_RONGQINGAIYI_PANEL:
               sendNotification(SHOW_RONGQINGAIYI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_CHAOJIWULINDABAO_PANEL:
               sendNotification(SHOW_CHAOJIWULINDABAO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_2018FUNVJIE_PANEL:
               sendNotification(SHOW_2018FUNVJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_JINSHENZHOUQI_PANEL:
               sendNotification(SHOW_JINSHENZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BAIQIAOKELI_PANEL:
               sendNotification(SHOW_BAIQIAOKELI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DAJINSHENZHOUQI_PANEL:
               sendNotification(SHOW_DAJINSHENZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_TIANRENHE2_PANEL:
               sendNotification(SHOW_TIANRENHE2_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_QIANGHUAJINSHEN2_PANEL:
               sendNotification(SHOW_QIANGHUAJINSHEN2_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_QIANGHUAJINSHEN3_PANEL:
               sendNotification(SHOW_QIANGHUAJINSHEN3_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YUANBAOYOUHUI_PANEL:
               sendNotification(SHOW_YUANBAOYOUHUI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YURENJIE2018_PANEL:
               sendNotification(SHOW_YURENJIE2018_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_CHANGNIANCHONGZHI_PANEL:
               sendNotification(SHOW_CHANGNIANCHONGZHI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_HANSHIJIE_PANEL:
               sendNotification(SHOW_HANSHIJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DASHENGZHOUQI_PANEL:
               sendNotification(SHOW_DASHENGZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_2018LAODONGJIE_PANEL:
               sendNotification(SHOW_2018LAODONGJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BANBENYOUHUI_PANEL:
               sendNotification(SHOW_BANBENYOUHUI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LIXIA2018_PANEL:
               sendNotification(SHOW_LIXIA2018_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHUIGUOLEIJI_PANEL:
               sendNotification(SHOW_SHUIGUOLEIJI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_519HUODONG2018_PANEL:
               sendNotification(SHOW_519HUODONG2018_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_TIANXIAWUGONGCHUSHAOLIN_PANEL:
               sendNotification(SHOW_TIANXIAWUGONGCHUSHAOLIN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_CHAOJIZHOUQI_PANEL:
               sendNotification(SHOW_CHAOJIZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YUEXIAOFEIYUELINGJIANG_PANEL:
               sendNotification(SHOW_YUEXIAOFEIYUELINGJIANG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHIZUNCHENGHAOZHENGDUO_PANEL:
               sendNotification(SHOW_ZHIZUNCHENGHAOZHENGDUO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_TAOHUAZHIJING_PANEL:
               sendNotification(SHOW_TAOHUAZHIJING_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_QUANZHENXIAOYAO_PANEL:
               sendNotification(SHOW_QUANZHENXIAOYAO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LIANXUBAOMING_PANEL:
               sendNotification(SHOW_LIANXUBAOMING_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DUANWU2018_PANEL:
               sendNotification(SHOW_DUANWU2018_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_XIATIANKUAILE_PANEL:
               sendNotification(SHOW_XIATIANKUAILE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_HUANQIUKAIMU_PANEL:
               sendNotification(SHOW_HUANQIUKAIMU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_MINGJIAOZHIZUN_PANEL:
               sendNotification(SHOW_MINGJIAOZHIZUN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_FEISHENGSHENBAO_PANEL:
               sendNotification(SHOW_FEISHENGSHENBAO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHENGDUOZHAN_PANEL:
               sendNotification(SHOW_ZHENGDUOZHAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DAGENGXINHUODONG_PANEL:
               sendNotification(SHOW_DAGENGXINHUODONG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WANGZHEZHOUQI_PANEL:
               sendNotification(SHOW_WANGZHEZHOUQI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YINGJIEFUNVJIE_PANEL:
               sendNotification(SHOW_YINGJIEFUNVJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHOUYIKUAILE_PANEL:
               sendNotification(SHOW_ZHOUYIKUAILE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHOUMORENAO_PANEL:
               sendNotification(SHOW_ZHOUMORENAO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WANGZHEZHIBANGHD_PANEL:
               sendNotification(SHOW_WANGZHEZHIBANGHD_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_CHONGZHIDAY_PANEL:
               sendNotification(SHOW_CHONGZHIDAY_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

