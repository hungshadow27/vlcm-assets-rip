package com.tgame.moudels.ui
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ui.controller.UI_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class UI_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.login.UI_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const HIDE_ALL_UI_EXCEPT_MAINUI:String = "HIDE_ALL_UI_EXCEPT_MAINUI";
      
      public static const SHOW_MAINUI:String = "SHOW_MAINUI";
      
      public static const SHOW_MAINCHAR_ATTRIBUTE_PLANE:String = "SHOW_MAINCHAR_ATTRIBUTE_PLANE";
      
      public static const SHOW_MAINCHAR_BACKPACK:String = "SHOW_MAINCHAR_BACKPACK";
      
      public static const SHOW_MAINCHAR_KUNGFU:String = "SHOW_MAINCHAR_KUNGFU";
      
      public static const SHOW_TARGET_CHAR_ATTRIBUTE_PLANE:String = "SHOW_TARGET_CHAR_ATTRIBUTE_PLANE";
      
      public static const SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE:String = "SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE";
      
      public static const SHOW_MAINCHAR_ACCEPT_CYC_TASK_ATTRIBUTE_PLANE:String = "SHOW_MAINCHAR_ACCEPT_CYC_TASK_ATTRIBUTE_PLANE";
      
      public static const SHOW_MAINCHAR_TEAM_ATTRIBUTE_PLANE:String = "SHOW_MAINCHAR_TEAM_ATTRIBUTE_PLANE";
      
      public static const SHOW_MEIREN_PANEL:String = "SHOW_MEIREN_PANEL";
      
      public static const SHOW_MONTHSIGNIN_PANEL:String = "SHOW_MONTHSIGNIN_PANEL";
      
      public static const SHOW_XINNIANZHUFU_PANEL:String = "SHOW_XINNIANZHUFU_PANEL";
      
      public static const SHOW_LONGWENKEHUA_PANEL:String = "SHOW_LONGWENKEHUA_PANEL";
      
      public static const SHOW_MAINCHAR_RIDEBTN_PLANE:String = "SHOW_MAINCHAR_RIDEBTN_PLANE";
      
      public static const SHOW_MAINCHAR_RIDE_SKILL_RESET_PLANE:String = "SHOW_MAINCHAR_RIDE_SKILL_RESET_PLANE";
      
      public static const SHOW_MAINCHAR_RIDE_YINCANG_SHUXING_JIHUO_PLANE:String = "SHOW_MAINCHAR_RIDE_YINCANG_SHUXING_JIHUO_PLANE";
      
      public static const SHOW_MENGHUANDAN_PLANE:String = "SHOW_MENGHUANDAN_PLANE";
      
      public static const SHOW_MAINCHAR_RIDE_QIANNENGDAN_PANEL:String = "SHOW_MAINCHAR_RIDE_QIANNENGDAN_PANEL";
      
      public static const SHOW_DEPOT_PANEL:String = "SHOW_DEPOT_PANEL";
      
      public static const SHOW_RIDE_DEPOT_PANEL:String = "SHOW_RIDE_DEPOT_PANEL";
      
      public static const SHOW_MAINCHAR_SHOP_PANEL:String = "SHOW_MAINCHAR_SHOP_PANEL";
      
      public static const SHOW_NPC_DIALOG_PLANE:String = "SHOW_NPC_DIALOG_PLANE";
      
      public static const HIDE_NPC_DIALOG_PLANE:String = "HIDE_NPC_DIALOG_PLANE";
      
      public static const SHOW_EQUIP_PUDDING_PLANE:String = "SHOW_EQUIP_PUDDING_PLANE";
      
      public static const SHOW_ITEM_SYNTHESIZE_PLANE:String = "SHOW_ITEM_SYNTHESIZE_PLANE";
      
      public static const SHOW_MALL_PLANE:String = "SHOW_MALL_PLANE";
      
      public static const SHOW_FRIEND_PLANE:String = "SHOW_FRIEND_PLANE";
      
      public static const SHOW_RANK_PLANE:String = "SHOW_RANK_PLANE";
      
      public static const SHOW_MAINCHAR_SHOP_LIST_PANEL:String = "SHOW_MAINCHAR_SHOP_LIST_PANEL";
      
      public static const SHOW_OTHERCHAR_SHOP_PANEL:String = "SHOW_OTHERCHAR_SHOP_PANEL";
      
      public static const SHOW_TRADE_PANEL:String = "SHOW_TRADE_PANEL";
      
      public static const SHOW_NPC_SHOP_PANEL:String = "SHOW_NPC_SHOP_PANEL";
      
      public static const SHOW_RIDE_ATTR_PANEL:String = "SHOW_RIDE_ATTR_PANEL";
      
      public static const SHOW_PICK_UP_PLANE:String = "SHOW_PICK_UP_PLANE";
      
      public static const SHOW_BIGUAN_PANEL:String = "SHOW_BIGUAN_PANEL";
      
      public static const SHOW_AFK_PANEL:String = "SHOW_AFK_PANEL";
      
      public static const SHOW_REPAIR_PANEL:String = "SHOW_REPAIR_PANEL";
      
      public static const SHOW_GIFT_PLANE:String = "SHOW_GIFT_PLANE";
      
      public static const SHOW_WANJIAHUIKUI:String = "SHOW_WANJIAHUIKUI";
      
      public static const SHOW_SETTINGS_PANEL_TAB:String = "SHOW_SETTINGS_PANEL_TAB";
      
      public static const CLOSE_ITEM_SYNTHESIZE_PLANE:String = "CLOSE_ITEM_SYNTHESIZE_PLANE";
      
      public static const SHOW_INFOQUERY_PANEL:String = "SHOW_INFOQUERY_PANEL";
      
      public static const SHOW_BOSS_REFURBISH_PANEL:String = "SHOW_BOSS_REFURBISH_PANEL";
      
      public static const SHOW_WAIT_TODO_PANEL:String = "SHOW_WAIT_TODO_PANEL";
      
      public static const SHOW_ACTIVE_PANEL:String = "SHOW_ACTIVE_PANEL";
      
      public static const SHOW_DAZUO_PANEL:String = "SHOW_DAZUO_PANEL";
      
      public static const SHOW_SHUANGXIU_PANEL:String = "SHOW_SHUANGXIU_PANEL";
      
      public static const SHOW_REFRESHPOINT_PLANE:String = "SHOW_REFRESHPOINT_PLANE";
      
      public static const SHOW_MAINCHAR_XINFA_XIULIAN:String = "SHOW_MAINCHAR_XINFA_XIULIAN";
      
      public static const SHOW_CHENGJIU_PANEL:String = "SHOW_CHENGJIU_PANEL";
      
      public static const SHOW_TEAM_INSTANCE_PANEL:String = "SHOW_TEAM_INSTANCE_PANEL";
      
      public static const SHOW_INSTANCE_SELECT_PANEL:String = "SHOW_INSTANCE_SELECT_PANEL";
      
      public static const SHOW_ZHENQI_DOLL_PANEL:String = "SHOW_ZHENQI_DOLL_PANEL";
      
      public static const SHOW_MOXUE_DOLL_PANEL:String = "SHOW_MOXUE_DOLL_PANEL";
      
      public static const SHOW_ZHENQI_DOLL_SUPER_PANEL:String = "SHOW_ZHENQI_DOLL_SUPER_PANEL";
      
      public static const SHOW_SHOUJI_PANEL:String = "SHOW_SHOUJI_PANEL";
      
      public static const SHOW_BANGHUI_LIST_PANEL:String = "SHOW_BANGHUI_LIST_PANEL";
      
      public static const SHOW_BANGHUI_CREAT_PANEL:String = "SHOW_BANGHUI_CREAT_PANEL";
      
      public static const SHOW_BANGHUI_INFO_PANEL:String = "SHOW_BANGHUI_INFO_PANEL";
      
      public static const SHOW_BANGHUI_MEMBER_LIST_PANEL:String = "SHOW_BANGHUI_MEMBER_LIST_PANEL";
      
      public static const SHOW_BANGHUI_NEWS_PANEL:String = "SHOW_BANGHUI_NEWS_PANEL";
      
      public static const SHOW_BANGQI_INFO_PANEL:String = "SHOW_BANGQI_INFO_PANEL";
      
      public static const SHOW_BANGQI_ANCHA_PANEL:String = "SHOW_BANGQI_ANCHA_PANEL";
      
      public static const SHOW_BANGQI_BANGONG_PANEL:String = "SHOW_BANGQI_BANGONG_PANEL";
      
      public static const SHOW_GONGCHENG_XIANGYANGGUISHU_PANEL:String = "SHOW_GONGCHENG_XIANGYANGGUISHU_PANEL";
      
      public static const SHOW_GONGCHENG_GONGCHENGCHE_PANEL:String = "SHOW_GONGCHENG_GONGCHENGCHE_PANEL";
      
      public static const SHOW_ZHAN_WEN_KE_HUA_PANEL:String = "SHOW_ZHAN_WEN_KE_HUA_PANEL";
      
      public static const SHOW_ZHAN_WEN_KE_HUA_HELP_PANEL:String = "SHOW_ZHAN_WEN_KE_HUA_HELP_PANEL";
      
      public static const SHOW_STONE_PANEL:String = "SHOW_STONE_PANEL";
      
      public static const SHOW_MOVING_PANEL:String = "SHOW_MOVING_PANEL";
      
      public static const SHOW_FB_RANK_PLANE:String = "SHOW_FB_RANK_PLANE";
      
      public static const SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE:String = "SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE";
      
      public static const CLOSE_EASY_STONE_PLANE:String = "CLOSE_EASY_STONE_PLANE";
      
      public static const SHOW_AMULT:String = "SHOW_AMULT";
      
      public static const SHOW_AMULT_ADD_SHELIZI:String = "SHOW_AMULT_ADD_SHELIZI";
      
      public static const CLOSE_AMULT_ADD_SHELIZI:String = "CLOSE_AMULT_ADD_SHELIZI";
      
      public static const SHOW_SHEN_LONG_AMULT:String = "SHOW_SHEN_LONG_AMULT";
      
      public static const SHOW_PARTY_SKILL:String = "SHOW_PARTY_SKILL";
      
      public static const SHOW_LAUNCH_PROPOSAL_PANEL:String = "SHOW_LAUNCH_PROPOSAL_PANEL";
      
      public static const SHOW_PROPOSAL_AFFIRM_PANEL:String = "SHOW_PROPOSAL_AFFIRM_PANEL";
      
      public static const SHOW_MARRIAGE_SUCCESS_PANEL:String = "SHOW_MARRIAGE_SUCCESS_PANEL";
      
      public static const SHOW_MARRIAGE_WEDDING_PLANE:String = "SHOW_MARRIAGE_WEDDING_PLANE";
      
      public static const SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE:String = "SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE";
      
      public static const SHOW_MARRIAGE_GIVE_CASH_GIFT_PLANE:String = "SHOW_MARRIAGE_GIVE_CASH_GIFT_PLANE";
      
      public static const SHOW_MARRIAGE_DINE_PLANE:String = "SHOW_MARRIAGE_DINE_PLANE";
      
      public static const SHOW_GOLD_SQUIRREL_GIFT_PLANE:String = "SHOW_GOLD_SQUIRREL_GIFT_PLANE";
      
      public static const SHOW_TA_KUNGFU:String = "SHOW_TA_KUNGFU";
      
      public static const SHOW_TA_JINGMAI_PANEL:String = "SHOW_TA_JINGMAI_PANEL";
      
      public static const SHOW_EQUIP_PUDDING_HELP_PLANE:String = "SHOW_EQUIP_PUDDING_HELP_PLANE";
      
      public static const SHOW_LABOUR_PANEL:String = "SHOW_LABOUR_PANEL";
      
      public static const SHOW_ANQI_ACTIVE:String = "SHOW_ANQI_ACTIVE";
      
      public static const SHOW_GIFT_CARD_PANEL:String = "SHOW_GIFT_CARD_PANEL";
      
      public static const SHOW_EQUIP_UPDATA_TYPE_PANEL:String = "SHOW_EQUIP_UPDATA_TYPE_PANEL";
      
      public static const SHOW_LIAOSHANG_PANEL:String = "SHOW_LIAOSHANG_PANEL";
      
      public static const SHOW_MAINCHAR_KUAFU_BACKPACK:String = "SHOW_MAINCHAR_KUAFU_BACKPACK";
      
      public static const SHOW_MAINCHAR_MALL:String = "SHOW_MAINCHAR_MALL";
      
      public static const SHOW_NITA_SKILL:String = "SHOW_NITA_SKILL";
      
      public static const SHOW_SIX_STONE_TO_SEVEN_STONE:String = "SHOW_SIX_STONE_TO_SEVEN_STONE";
      
      public static const SHOW_SILINGZHEN_PANEL:String = "SHOW_SILINGZHEN_PANEL";
      
      public static const SHOW_QIAN_CHUI_BAI_LIAN_PLANE:String = "SHOW_QIAN_CHUI_BAI_LIAN_PLANE";
      
      public static const SHOW_XIAN_TIAN_WU_JING:String = "SHOW_XIAN_TIAN_WU_JING";
      
      public static const SHOW_TEAM_INSTANCE_PANEL_3V3:String = "SHOW_TEAM_INSTANCE_PANEL_3V3";
      
      public static const SHOW_KUAFU3V3_RESULT_PANEL:String = "SHOW_KUAFU3V3_RESULT_PANEL";
      
      public static const SHOW_PARTY_TASK_PANEL:String = "SHOW_PARTY_TASK_PANEL";
      
      public static const SHOW_PARTY_TASK_INVITE_PANEL:String = "SHOW_PARTY_TASK_INVITE_PANEL";
      
      public static const SHOW_PARTY_TASK_COMPLETE_PANEL:String = "SHOW_PARTY_TASK_COMPLETE_PANEL";
      
      public static const SHOW_SHUXINGDAZAOKA_PANEL:String = "SHOW_SHUXINGDAZAOKA_PANEL";
      
      public static const SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING:String = "SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING";
      
      public static const SHOW_QIAN_KUN_PU_KE_PANEL:String = "SHOW_QIAN_KUN_PU_KE_PANEL";
      
      public static const SHOW_TU_TENG_CADE:String = "SHOW_TU_TENG_CADE";
      
      public static const SHOW_FREE_MALL_PLANE:String = "SHOW_FREE_MALL_PLANE";
      
      public static const SHOW_ORANGE_EQUIP_PANEL:String = "SHOW_ORANGE_EQUIP_PANEL";
      
      public static const SHOW_CHANGE_SUPER_MOUNT:String = "SHOW_CHANGE_SUPER_MOUNT";
      
      public static const SHOW_JIN_CHUI_ZI_PANEL:String = "SHOW_JIN_CHUI_ZI_PANEL";
      
      public static const SHOW_RANK_ATTACK_PLANE:String = "SHOW_RANK_ATTACK_PLANE";
      
      public static const SHOW_SHITU_PANEL:String = "SHOW_SHITU_PANEL";
      
      public static const SHOW_JINGYANJIANGLI_PANEL:String = "SHOW_JINGYANJIANGLI_PANEL";
      
      public static const SHOW_WUXIEZHIJING_PANEL:String = "SHOW_WUXIEZHIJING_PANEL";
      
      public static const SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG:String = "SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG";
      
      public static const SHOW_BAJIGUIYUANHUFU_DA_KONG:String = "SHOW_BAJIGUIYUANHUFU_DA_KONG";
      
      public static const SHOW_CHANGE_SUPER_MOUNT_TO_SUPER_MOUNT:String = "SHOW_CHANGE_SUPER_MOUNT_TO_SUPER_MOUNT";
      
      public static const SHOW_MO_SHOU_HU_HUAN:String = "SHOW_MO_SHOU_HU_HUAN";
      
      public static const SHOW_RIDE_CHANGE_MOSHOU_PANEL:String = "SHOW_RIDE_CHANGE_MOSHOU_PANEL";
      
      public static const SHOW_HUYI_KAIGUANG_PANEL:String = "SHOW_HUYI_KAIGUANG_PANEL";
      
      public static const SHOW_HUYI_LINGHUA_PANEL:String = "SHOW_HUYI_LINGHUA_PANEL";
      
      public static const SHOW_HUYI_XILIAN_PANEL:String = "SHOW_HUYI_XILIAN_PANEL";
      
      public static const SHOW_ZHUANGBEI_JIHUO_PANEL:String = "SHOW_ZHUANGBEI_JIHUO_PANEL";
      
      public static const SHOW_BIWUDUIJUE_PANEL:String = "SHOW_BIWUDUIJUE_PANEL";
      
      public static const SHOW_BIWU_CROSSPLATFORM_PANEL:String = "SHOW_BIWU_CROSSPLATFORM_PANEL";
      
      public static const SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL:String = "SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL";
      
      public static const SHOW_BAOSHIJIANSHANG_PANEL:String = "SHOW_BAOSHIJIANSHANG_PANEL";
      
      public static const SHOW_BAOSHIJIANSHANG_GUIZE_PANEL:String = "SHOW_BAOSHIJIANSHANG_GUIZE_PANEL";
      
      public static const SHOW_DAOJUTIQUKA_PANEL:String = "SHOW_DAOJUTIQUKA_PANEL";
      
      public static const SHOW_HUIZHANG_PANEL:String = "SHOW_HUIZHANG_PANEL";
      
      public static const SHOW_TEAM_INSTANCE_PANEL_XIANGYANGZHANCHANG:String = "SHOW_TEAM_INSTANCE_PANEL_XIANGYANGZHANCHANG";
      
      public static const SHOW_MALL_JI_FEN_PLANE:String = "SHOW_MALL_JI_FEN_PLANE";
      
      public static const SHOW_CISHA_QIANZHUANG_PANEL:String = "SHOW_DIXIAQIANZHUANG_PANEL";
      
      public static const SHOW_SHISHIZHANKUANG_PANEL:String = "SHOW_SHISHIZHANKUANG_PANEL";
      
      public static const SHOW_WANFASHIYITU:String = "SHOW_WANFASHIYITU";
      
      public static const SHOW_KUAFU_LEITAI:String = "SHOW_KUAFU_LEITAI";
      
      public static const SHOW_KUAFU_LEITAI_JIEGUO:String = "SHOW_KUAFU_LEITAI_JIEGUO";
      
      public static const SHOW_XIANSHIDAJIANGDUIHUAN:String = "SHOW_XIANSHIDAJIANGDUIHUAN";
      
      public static const QINGGONGYAN_CHI:String = "QINGGONGYAN_CHI";
      
      public static const SHOW_QINGGONGYAN_OVER:String = "SHOW_QINGGONGYAN_OVER";
      
      public static const SHOW_SHENLONGHUSHENFU_XILIAN_PANEL:String = "SHOW_SHENLONGHUSHENFU_XILIAN_PANEL";
      
      public static const SHOW_ZHANHUNDAI_BAOGUO:String = "SHOW_ZHANHUNDAI_BAOGUO";
      
      public static const SHOW_XUNZHAGNZHANQI_DUANZAO:String = "SHOW_XUNZHAGNZHANQI_DUANZAO";
      
      public static const SHOW_SHENGDAN_PANEL_DUANZAO:String = "SHOW_SHENGDAN_PANEL_DUANZAO";
      
      public static const SHOW_SISHENGSHOUKEWEN:String = "SHOW_SISHENGSHOUKEWEN";
      
      public static const SHOW_SHISHIKAIFENG_PANEL:String = "SHOW_SHISHIKAIFENG_PANEL";
      
      public static const SHOW_TISHENGPINZHI_PANEL:String = "SHOW_TISHENGPINZHI_PANEL";
      
      public static const SHOW_FUCHOU_OK_PANEL:String = "SHOW_FUCHOU_OK_PANEL";
      
      public static const SHOW_DIXIAQIANZHUANG_PANEL:String = "SHOW_DIXIAQIANZHUANG_PANEL";
      
      public static const SHOW_CISHA_OK_PANEL:String = "SHOW_CISHA_OK_PANEL";
      
      public static const SHOW_CISHAMILING_PANEL:String = "SHOW_CISHAMILING_PANEL";
      
      public static const SHOW_AOJIANDUANZAO_PANEL:String = "SHOW_AOJIANDUANZAO_PANEL";
      
      public static const SHOW_XIANGQIANTIANFU_PANEL:String = "SHOW_XIANGQIANTIANFU_PANEL";
      
      public static const SHOW_JUBAOPEN_PANEL:String = "SHOW_JUBAOPEN_PANEL";
      
      public static const CLOSE_JUBAOPEN_PANEL:String = "CLOSE_JUBAOPEN_PANEL";
      
      public static const SHOW_XUNZHANGDUIHUAN_PANEL:String = "SHOW_XUNZHANGDUIHUAN_PANEL";
      
      public static const SHOW_TIMEBAOZANG_PANEL:String = "SHOW_TIMEBAOZANG_PANEL";
      
      public static const SHOW_CANAGBAOGEXUNZHANGXIANGQIAN_PANEL:String = "SHOW_CANAGBAOGEXUNZHANGXIANGQIAN_PANEL";
      
      public static const HIDE_ALL_UI_TENS:String = "HIDE_ALL_UI_TENS";
      
      public static const SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL:String = "SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL";
      
      public static const SHOW_JILEIZHI_PANEL:String = "SHOW_JILEIZHI_PANEL";
      
      public static const SHOW_TIANSHANGZHIHUN_SHENGJIE:String = "SHOW_TIANSHANGZHIHUN_SHENGJIE";
      
      public static const SHOW_MENPAIZHUANHUAN_PANEL:String = "SHOW_MENPAIZHUANHUAN_PANEL";
      
      public static const SHOW_PARTYEQUIPCHANGE_PANEL:String = "SHOW_PARTYEQUIPCHANGE_PANEL";
      
      public static const SHOW_SHENDIAO_PLANE:String = "SHOW_SHENDIAO_PLANE";
      
      public static const SHOW_GANJIANGMOYEZHUZAO_PLANE:String = "SHOW_GANJIANGMOYEZHUZAO_PLANE";
      
      public static const START_SHENDIAOXIALVHUODONG:String = "START_SHENDIAOXIALVHUODONG";
      
      public static const SHOW_YUENANRANKING_PANEL:String = "SHOW_YUENANRANKING_PANEL";
      
      public static const REQUEST_YUENANRANKING_PANEL:String = "REQUEST_YUENANRANKING_PANEL";
      
      public static const SHOW_FASHION_PANEL:String = "SHOW_FASHION_PANEL";
      
      public static const REQUEST_YUENANJUBAOPEN_PANEL:String = "REQUEST_YUENANJUBAOPEN_PANEL";
      
      public static const SHOW_YUENANJUBAOPEN_PANEL:String = "SHOW_YUENANJUBAOPEN_PANEL";
      
      public static const SHOW_YNRENAME_PANEL:String = "SHOW_YNRENAME_PANEL";
      
      public static const SHOW_YUENANSHIJIEBEIRANK_PANEL:String = "SHOW_YUENANSHIJIEBEIRANK_PANEL";
      
      public static const SHOW_YUENAN888SHOP:String = "SHOW_YUENAN888SHOP";
      
      public static const SHOW_YUENANONLINEPANEL:String = "SHOW_YUENANONLINEPANEL";
      
      public static const REQUEST_YUENANONLINE_PANEL:String = "REQUEST_YUENANONLINE_PANEL";
      
      public static const SHOW_YUENANRICHANGGONGGAO_PANEL:String = "SHOW_YUENANRICHANGGONGGAO_PANEL";
      
      public static const SHOW_YUENAN2014ZHONGQIU_PANEL:String = "SHOW_YUENAN2014ZHONGQIU_PANEL";
      
      public static const SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL:String = "SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL";
      
      public static const SHOW_WANBAOGE_BAOSHIJIANSHANG_PANEL:String = "SHOW_WANBAOGE_BAOSHIJIANSHANG_PANEL";
      
      public static const SHOW_NEWYEAR_PANEL:String = "SHOW_NEWYEAR_PANEL";
      
      public static const SHOW_YURENJIE_PANEL:String = "SHOW_YURENJIE_PANEL";
      
      public static const SHOW_YURENJIE_RANK_PANEL:String = "SHOW_YURENJIE_RANK_PANEL";
      
      public static const SHOW_FENGZHENGJIE_PANEL:String = "SHOW_FENGZHENGJIE_PANEL";
      
      public static const SHOW_FENGZHENGJIE_RANK_PANEL:String = "SHOW_FENGZHENGJIE_RANK_PANEL";
      
      public static const SHOW_QINGRENJIESONGHUA_PLANE:String = "SHOW_QINGRENJIESONGHUA_PLANE";
      
      public static const SHOW_QINGRENJIE_SONGHUABANG_PLANE:String = "SHOW_QINGRENJIE_SONGHUABANG_PLANE";
      
      public static const SHOW_WISHINGTREE_PANEL:String = "SHOW_WISHINGTREE_PANEL";
      
      public static const SHOW_GERENCHENGHAO_PANEL:String = "SHOW_GERENCHENGHAO_PANEL";
      
      public static const SHOW_CHUANGONGWUXUE_PANEL:String = "SHOW_CHUANGONGWUXUE_PANEL";
      
      public static const SHOW_HUANGTUBAYE_PANEL:String = "SHOW_HUANGTUBAYE_PANEL";
      
      public static const SHOW_JIANGSHANSHEJI_CHAKAN_PLANE:String = "SHOW_JIANGSHANSHEJI_CHAKAN_PLANE";
      
      public static const SHOW_BANGHUI_RONGYU_LIST_PANEL:String = "SHOW_BANGHUI_RONGYU_LIST_PANEL";
      
      public static const SHOW_DOUDIZHU_PANEL:String = "SHOW_DOUDIZHU_PANEL";
      
      public static const SHOW_DOUDIZHU_RANK_PANEL:String = "SHOW_DOUDIZHU_RANK_PANEL";
      
      public static const SHOW_FABAO_PANEL:String = "SHOW_FABAO_PANEL";
      
      public static const SHOW_FABAO_TUPO_PANEL:String = "SHOW_FABAO_TUPO_PANEL";
      
      public static const SHOW_FABAOLINGLIPANEL:String = "SHOW_FABAOLINGLIPANEL";
      
      public static const SHOW_DUANWUJIE_PANEL:String = "SHOW_DUANWUJIE_PANEL";
      
      public static const SHOW_CHAOJILABA_PANEL:String = "SHOW_CHAOJILABA_PANEL";
      
      public static const SHOW_ZHONGZHIXUANYUANJIAN_PANEL:String = "SHOW_ZHONGZHIXUANYUANJIAN_PANEL";
      
      public static const SHOW_SHIJIEBEI_PANEL:String = "SHOW_SHIJIEBEI_PANEL";
      
      public static const SHOW_SHENGXIAO_PANEL:String = "SHOW_SHENGXIAO_PANEL";
      
      public static const SHOW_WUXIAKAPAI_PANEL:String = "SHOW_WUXIAKAPAI_PANEL";
      
      public static const SHOW_WUXIAKAPAI_XIANGXI_PANEL:String = "SHOW_WUXIAKAPAI_XIANGXI_PANEL";
      
      public static const SHOW_QIXIJIE_PANEL:String = "SHOW_QIXIJIE_PANEL";
      
      public static const SHOW_HUANGJINSHU_PANEL:String = "SHOW_HUANGJINSHU_PANEL";
      
      public static const SHOW_WANGZHEZHIBANG_PANEL:String = "SHOW_WANGZHEZHIBANG_PANEL";
      
      public static const SHOW_XIAOZHUKUAIPAO_PANEL:String = "SHOW_XIAOZHUKUAIPAO_PANEL";
      
      public static const YN_SHOW_LONGWUGEPANEL:String = "YN_SHOW_LONGWUGEPANEL";
      
      public static const SHOW_DUIXUEREN_PANEL:String = "SHOW_DUIXUEREN_PANEL";
      
      public static const SHOW_LONGFENGDANGPU_PANEL:String = "SHOW_LONGFENGDANGPU_PANEL";
      
      public static const SHOW_MOXUEZHANCHANG_PANEL:String = "SHOW_MOXUEZHANCHANG_PANEL";
      
      public static const SHOW_DUANWUJIE2015_PANEL:String = "SHOW_DUANWUJIE2015_PANEL";
      
      public static const SHOW_XIANMOZHILU_PANEL:String = "SHOW_XIANMOZHILU_PANEL";
      
      public static const SHOW_XIANMOZHILU_ZHUANZHI_PANEL:String = "SHOW_XIANMOZHILU_ZHUANZHI_PANEL";
      
      public static const SHOW_WUHUN_PANEL:String = "SHOW_WUHUN_PANEL";
      
      public function UI_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_UI,PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI,PipeConstants.SHOW_MAINUI,PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE,PipeConstants.SHOW_MAINCHAR_BACKPACK,PipeConstants.SHOW_MAINCHAR_KUNGFU,PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE,PipeConstants.SHOW_MAINCHAR_ACCEPT_CYC_TASK_ATTRIBUTE_PLANE,PipeConstants.SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE,PipeConstants.SHOW_MAINCHAR_TEAM_ATTRIBUTE_PLANE,PipeConstants.SHOW_MAINCHAR_RIDEBTN_PLANE,PipeConstants.SHOW_MAINCHAR_RIDE_SKILL_RESET_PLANE,PipeConstants.SHOW_MAINCHAR_RIDE_YINCANG_SHUXING_JIHUO_PLANE,PipeConstants.SHOW_MAINCHAR_RIDE_QIANNENGDAN_PANEL,PipeConstants.SHOW_MENGHUANDAN_PLANE,PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE,PipeConstants.SHOW_EQUIP_PUDDING_PLANE,PipeConstants.SHOW_DEPOT_PANEL,PipeConstants.SHOW_MAINCHAR_SHOP_PANEL,PipeConstants.SHOW_NPC_DIALOG_PLANE,PipeConstants.HIDE_NPC_DIALOG_PLANE,PipeConstants.SHOW_GIFT_PLANE,PipeConstants.SHOW_WANJIAHUIKUI,PipeConstants.SHOW_MALL_PLANE,PipeConstants
         .SHOW_FRIEND_PLANE,PipeConstants.SHOW_RANK_PLANE,PipeConstants.SHOW_RIDE_DEPOT_PANEL,PipeConstants.SHOW_MAINCHAR_SHOP_LIST_PANEL,PipeConstants.SHOW_OTHERCHAR_SHOP_PANEL,PipeConstants.SHOW_TRADE_PANEL,PipeConstants.SHOW_NPC_SHOP_PANEL,PipeConstants.SHOW_RIDE_ATTR_PANEL,PipeConstants.SHOW_BIGUAN_PANEL,PipeConstants.SHOW_PICK_UP_PLANE,PipeConstants.SHOW_AFK_PANEL,PipeConstants.SHOW_REPAIR_PANEL,PipeConstants.SHOW_SETTINGS_PANEL_TAB,PipeConstants.CLOSE_EASY_STONE_PLANE,PipeConstants.SHOW_INFOQUERY_PANEL,PipeConstants.SHOW_BOSS_REFURBISH_PANEL,PipeConstants.SHOW_WAIT_TODO_PANEL,PipeConstants.SHOW_ACTIVE_PANEL,PipeConstants.SHOW_DAZUO_PANEL,PipeConstants.SHOW_SHUANGXIU_PANEL,PipeConstants.SHOW_REFRESHPOINT_PLANE,PipeConstants.SHOW_MAINCHAR_XINFA_XIULIAN,PipeConstants.SHOW_CHENGJIU_PANEL,PipeConstants.SHOW_TEAM_INSTANCE_PANEL,PipeConstants.SHOW_INSTANCE_SELECT_PANEL,PipeConstants.SHOW_ZHENQI_DOLL_PANEL,PipeConstants.SHOW_ZHENQI_DOLL_SUPER_PANEL,PipeConstants.SHOW_SHOUJI_PANEL,PipeConstants.SHOW_BANGHUI_LIST_PANEL
         ,PipeConstants.SHOW_BANGHUI_CREAT_PANEL,PipeConstants.SHOW_BANGHUI_INFO_PANEL,PipeConstants.SHOW_BANGHUI_MEMBER_LIST_PANEL,PipeConstants.SHOW_BANGHUI_NEWS_PANEL,PipeConstants.SHOW_BANGQI_INFO_PANEL,PipeConstants.SHOW_BANGQI_ANCHA_PANEL,PipeConstants.SHOW_BANGQI_BANGGONG_PANEL,PipeConstants.SHOW_GONGCHENG_XIANGYANGGUISHU_PANEL,PipeConstants.SHOW_GONGCHENG_GONGCHENGCHE_PANEL,PipeConstants.SHOW_STONE_PLANE,PipeConstants.SHOW_MOVING_PANEL,PipeConstants.SHOW_FB_RANK_PLANE,PipeConstants.SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE,PipeConstants.SHOW_AMULT,PipeConstants.SHOW_AMULT_ADD_SHELIZI,PipeConstants.CLOSE_AMULT_ADD_SHELIZI,PipeConstants.SHOW_SHEN_LONG_AMULT,PipeConstants.SHOW_PARTY_SKILL,PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL,PipeConstants.SHOW_LAUNCH_PROPOSAL_PANEL,PipeConstants.SHOW_PROPOSAL_AFFIRM_PANEL,PipeConstants.SHOW_MARRIAGE_SUCCESS_PANEL,PipeConstants.SHOW_MARRIAGE_WEDDING_PLANE,PipeConstants.SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE,PipeConstants.SHOW_MARRIAGE_GIVE_CASH_GIFT_PLANE,PipeConstants
         .SHOW_MARRIAGE_DINE_PLANE,PipeConstants.SHOW_GOLD_SQUIRREL_GIFT_PLANE,PipeConstants.SHOW_TA_KUNGFU,PipeConstants.SHOW_TA_JINGMAI_PANEL,PipeConstants.SHOW_LABOUR_PANEL,PipeConstants.SHOW_ANQI_ACTIVE,PipeConstants.SHOW_GIFT_CARD_PANEL,PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL,PipeConstants.SHOW_LIAOSHANG_PANEL,PipeConstants.SHOW_MAINCHAR_KUAFU_BACKPACK,PipeConstants.SHOW_MAINCHAR_MALL,PipeConstants.SHOW_NITA_SKILL,PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE,PipeConstants.SHOW_SILINGZHEN_PANEL,PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE,PipeConstants.SHOW_XIAN_TIAN_WU_JING,PipeConstants.SHOW_KUAFU3V3_RESULT_PANEL,PipeConstants.SHOW_TEAM_INSTANCE_PANEL_3V3,PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL,PipeConstants.SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING,PipeConstants.SHOW_PARTY_TASK,PipeConstants.OPEN_JIE_YABIAO_PANEL,PipeConstants.OPEN_JIAO_YABIAO_PANEL,PipeConstants.OPEN_PARTY_TASK_INVITE,PipeConstants.SHOW_QIAN_KUN_PU_KE_PANEL,PipeConstants.SHOW_TU_TENG_CADE,PipeConstants.SHOW_FREE_MALL_PLANE,PipeConstants
         .SHOW_ORANGE_EQUIP_PANEL,PipeConstants.SHOW_CHANGE_SUPER_MOUNT,PipeConstants.SHOW_JIN_CHUI_ZI_PANEL,PipeConstants.SHOW_RANK_ATTACK_PANEL,PipeConstants.SHOW_SHITU_PANEL,PipeConstants.SHOW_JINGYANJIANGLI_PANEL,PipeConstants.SHOW_WUXIEZHIJING_PANEL,PipeConstants.SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG,PipeConstants.SHOW_BAJIGUIYUANHUFU_DA_KONG,PipeConstants.SHOW_CHANGE_SUPER_MOUNT_TO_SUPER_MOUNT,PipeConstants.SHOW_MO_SHOU_HU_HUAN,PipeConstants.SHOW_HUYI_KAIGUANG_PANEL,PipeConstants.SHOW_HUYI_LINGHUA_PANEL,PipeConstants.SHOW_HUYI_XILIAN_PANEL,PipeConstants.SHOW_ZHUANGBEI_JIHUO_PANEL,PipeConstants.SHOW_BIWUDUIJUE_PANEL,PipeConstants.SHOW_BAOSHIJIANSHANG_PANEL,PipeConstants.SHOW_BAOSHIJIANSHANG_GUIZE_PANEL,PipeConstants.SHOW_DAOJUTIQUKA_PANEL,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.SHOW_MALL_JI_FEN_PLANE,PipeConstants.SHOW_HUIZHANG_PANEL,PipeConstants.SHOW_SHI_SHI_ZHAN_KUANG,PipeConstants.SHOW_TEAM_INSTANCE_PANEL_XIANGYANGZHANCHANG,PipeConstants.SHOW_KUAFU_LEITAI,PipeConstants.SHOW_WANFASHIYITU_CLICK
         ,PipeConstants.SHOW_KUAFU_LEITAI_JIEGUO,PipeConstants.SHOW_XIANSHIDAJIANGDUIHUAN,PipeConstants.QINGGONGYAN_CHI,PipeConstants.SHOW_HUSHEN_XILIAN_PANEL,PipeConstants.SHOW_QINGGONGYAN_OVER,PipeConstants.SHOW_BIWU_CROSSPLATFORM_PANEL,PipeConstants.SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL,PipeConstants.SHOW_ZHANHUNDAI_BAOGUO,PipeConstants.SHOW_XUNZHANG_DUANZAO,PipeConstants.SHOW_SISHENGSHOUKEWEN_PANEL,PipeConstants.MENU_XIANGQIAN,PipeConstants.SUPER_XIANGQIAN,PipeConstants.SHOW_SHISHIKAIFENG_PANEL,PipeConstants.SHOW_TISHENGPINZHI_PANEL,PipeConstants.SHOW_CISHA_OK_PANEL,PipeConstants.SHOW_CISHAMILING_PLANE,PipeConstants.SHOW_FUCHOU_OK_PANEL,PipeConstants.SHOW_DIXIAQIANZHUANG_PANEL,PipeConstants.SHOW_AOJIAN_ZHUZAO,PipeConstants.SHOW_MONTHSIGNIN_PANEL,PipeConstants.SHOW_SHENGDAN_PANEL_DUANZAO,PipeConstants.SHOW_JUBAOPEN_PANEL,PipeConstants.CLOSE_JUBAOPEN_PANEL,PipeConstants.SHOW_XUNZHANGDUIHUAN_PANEL,PipeConstants.MENU_XUNZHANGXIANGQIAN,PipeConstants.SHOW_MOXUE_DOLL_PANEL,PipeConstants.SHOW_TIMEBAOZANG_PANEL
         ,PipeConstants.HIDE_ALL_UI_TENS,PipeConstants.SHOW_MEIREN_PANEL,PipeConstants.SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL,PipeConstants.SHOW_JILEIZHI_PANEL,PipeConstants.SHOW_TIANSHANGZHIHUN_SHENGJIE,PipeConstants.SHOW_MENPAIZHUANHUAN_PANEL,PipeConstants.SHOW_PARTYEQUIPCHANGE_PANEL,PipeConstants.SHOW_SHENDIAO_PLANE,PipeConstants.SHOW_YUENANRANKING_PANEL,PipeConstants.REQUEST_YUENANRANKING_PANEL,PipeConstants.SHOW_FASHION_PANEL,PipeConstants.REQUEST_YUENANJUBAOPEN_PANEL,PipeConstants.SHOW_YUENANJUBAOPEN_PANEL,PipeConstants.SHOW_RENAME_PANEL,PipeConstants.SHOW_YUENANSHIJIEBEIRANK_PANEL,PipeConstants.SHOW_YUENAN888SHOP,PipeConstants.SHOW_YUENANONLINEPANEL,PipeConstants.REQUEST_YUENANONLINE_PANEL,PipeConstants.SHOW_YUENANRICHANGGONGGAO_PANEL,PipeConstants.SHOW_YUENAN2014ZHONGQIU_PANEL,PipeConstants.SHOW_GANJIANGMOYEZHUZAO_PLANE,PipeConstants.SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL,PipeConstants.SHOW_WANBAOGE_BAOSHIJIANSHANG_PANEL,PipeConstants.SHOW_NEWYEAR_PANEL,PipeConstants.SHOW_YURENJIE_PANEL,PipeConstants
         .SHOW_YURENJIE_RANK_PANEL,PipeConstants.SHOW_FENGZHENGJIE_PANEL,PipeConstants.SHOW_FENGZHENGJIE_RANK_PANEL,PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE,PipeConstants.SHOW_QINGRENJIE_SONGHUABANG_PLANE,PipeConstants.SHOW_WISHINGTREE_PANEL,PipeConstants.HUANGJINSHU_WATER,PipeConstants.SHOW_GERENCHENGHAO_PANEL,PipeConstants.SHOW_CHUANGONGWUXUE_PANEL,PipeConstants.SHOW_HUANGTUBAYE_PANEL,PipeConstants.SHOW_JIANGSHANSHEJI_CHAKAN_PLANE,PipeConstants.SHOW_BANGHUI_RONGYU_LIST_PANEL,PipeConstants.SHOW_DOUDIZHU_PANEL,PipeConstants.SHOW_DOUDIZHU_RANK_PANEL,PipeConstants.SHOW_FABAOPANEL,PipeConstants.SHOW_FABAOLINGLIPANEL,PipeConstants.SHOW_FABAOTUPOPANEL,PipeConstants.SHOW_DUANWUJIE_PANEL,PipeConstants.SHOW_CHAOJILABA_PANEL,PipeConstants.SHOW_ZHONGZHIXUANYUANJIAN_PANEL,PipeConstants.SHOW_SHIJIEBEI_PANEL,PipeConstants.SHOW_SHENGXIAO_PANEL,PipeConstants.SHOW_WUXIAKAPAI_PANEL,PipeConstants.SHOW_WUXIAKAPAI_XIANGXI_PANEL,PipeConstants.SHOW_QIXIJIE_PANEL,PipeConstants.SHOW_WANGZHEZHIBANG_PANEL,PipeConstants
         .GET_XIAOZHUKUAIPAO_PANEL,PipeConstants.YN_SHOW_LONGWUGEPANEL,PipeConstants.SHOW_DUIXUEREN,PipeConstants.SHOW_MOXUEZHANCHANG,PipeConstants.GET_LONGFENGDANGPU_PANEL,PipeConstants.GET_DUANWUJIE2015_PANEL,PipeConstants.SHOW_XIANMOZHILU,PipeConstants.SHOW_ZHONGZU_PLANE,PipeConstants.GET_WUHUNXITONG_PANEL],this.handlePipeMessage,UI_ApplicationFacade);
      }
      
      public static function getInstance() : UI_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new UI_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as UI_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,UI_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_UI:
               this.startup();
               break;
            case PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI:
               sendNotification(HIDE_ALL_UI_EXCEPT_MAINUI);
               break;
            case PipeConstants.SHOW_MAINUI:
               sendNotification(SHOW_MAINUI);
               break;
            case PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE:
               sendNotification(SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               break;
            case PipeConstants.SHOW_MAINCHAR_BACKPACK:
               sendNotification(SHOW_MAINCHAR_BACKPACK);
               break;
            case PipeConstants.SHOW_MAINCHAR_KUNGFU:
               sendNotification(SHOW_MAINCHAR_KUNGFU);
               break;
            case PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE:
               sendNotification(SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case PipeConstants.SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE:
               sendNotification(SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE);
               break;
            case PipeConstants.SHOW_MAINCHAR_ACCEPT_CYC_TASK_ATTRIBUTE_PLANE:
               sendNotification(SHOW_MAINCHAR_ACCEPT_CYC_TASK_ATTRIBUTE_PLANE);
               break;
            case PipeConstants.SHOW_MAINCHAR_TEAM_ATTRIBUTE_PLANE:
               sendNotification(SHOW_MAINCHAR_TEAM_ATTRIBUTE_PLANE);
               break;
            case PipeConstants.SHOW_MEIREN_PANEL:
               sendNotification(SHOW_MEIREN_PANEL);
               break;
            case PipeConstants.SHOW_MAINCHAR_RIDEBTN_PLANE:
               sendNotification(SHOW_MAINCHAR_RIDEBTN_PLANE);
               break;
            case PipeConstants.SHOW_MAINCHAR_RIDE_SKILL_RESET_PLANE:
               sendNotification(SHOW_MAINCHAR_RIDE_SKILL_RESET_PLANE);
               break;
            case PipeConstants.SHOW_MAINCHAR_RIDE_YINCANG_SHUXING_JIHUO_PLANE:
               sendNotification(SHOW_MAINCHAR_RIDE_YINCANG_SHUXING_JIHUO_PLANE);
               break;
            case PipeConstants.SHOW_MENGHUANDAN_PLANE:
               sendNotification(SHOW_MENGHUANDAN_PLANE);
               break;
            case PipeConstants.SHOW_MAINCHAR_RIDE_QIANNENGDAN_PANEL:
               sendNotification(SHOW_MAINCHAR_RIDE_QIANNENGDAN_PANEL);
               break;
            case PipeConstants.SHOW_EQUIP_PUDDING_PLANE:
               sendNotification(SHOW_EQUIP_PUDDING_PLANE);
               break;
            case PipeConstants.SHOW_DEPOT_PANEL:
               sendNotification(SHOW_DEPOT_PANEL);
               break;
            case PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE:
               sendNotification(SHOW_ITEM_SYNTHESIZE_PLANE);
               break;
            case PipeConstants.SHOW_MAINCHAR_SHOP_PANEL:
               sendNotification(SHOW_MAINCHAR_SHOP_PANEL);
               break;
            case PipeConstants.SHOW_NPC_DIALOG_PLANE:
               sendNotification(SHOW_NPC_DIALOG_PLANE);
               break;
            case PipeConstants.HIDE_NPC_DIALOG_PLANE:
               sendNotification(HIDE_NPC_DIALOG_PLANE);
               break;
            case PipeConstants.SHOW_MALL_PLANE:
               sendNotification(SHOW_MALL_PLANE);
               break;
            case PipeConstants.SHOW_FRIEND_PLANE:
               sendNotification(SHOW_FRIEND_PLANE);
               break;
            case PipeConstants.SHOW_RANK_PLANE:
               sendNotification(SHOW_RANK_PLANE);
               break;
            case PipeConstants.SHOW_RIDE_DEPOT_PANEL:
               sendNotification(SHOW_RIDE_DEPOT_PANEL);
               break;
            case PipeConstants.SHOW_MAINCHAR_SHOP_LIST_PANEL:
               sendNotification(SHOW_MAINCHAR_SHOP_LIST_PANEL);
               break;
            case PipeConstants.SHOW_OTHERCHAR_SHOP_PANEL:
               sendNotification(SHOW_OTHERCHAR_SHOP_PANEL);
               break;
            case PipeConstants.SHOW_TRADE_PANEL:
               sendNotification(SHOW_TRADE_PANEL);
               break;
            case PipeConstants.SHOW_NPC_SHOP_PANEL:
               sendNotification(SHOW_NPC_SHOP_PANEL);
               break;
            case PipeConstants.SHOW_RIDE_ATTR_PANEL:
               sendNotification(SHOW_RIDE_ATTR_PANEL);
               break;
            case PipeConstants.SHOW_PICK_UP_PLANE:
               sendNotification(SHOW_PICK_UP_PLANE);
               break;
            case PipeConstants.SHOW_BIGUAN_PANEL:
               sendNotification(SHOW_BIGUAN_PANEL);
               break;
            case PipeConstants.SHOW_AFK_PANEL:
               sendNotification(SHOW_AFK_PANEL);
               break;
            case PipeConstants.SHOW_REPAIR_PANEL:
               sendNotification(SHOW_REPAIR_PANEL);
               break;
            case PipeConstants.SHOW_GIFT_PLANE:
               sendNotification(SHOW_GIFT_PLANE);
               break;
            case PipeConstants.SHOW_SETTINGS_PANEL_TAB:
               sendNotification(SHOW_SETTINGS_PANEL_TAB);
               break;
            case PipeConstants.SHOW_INFOQUERY_PANEL:
               sendNotification(SHOW_INFOQUERY_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BOSS_REFURBISH_PANEL:
               sendNotification(SHOW_BOSS_REFURBISH_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WAIT_TODO_PANEL:
               sendNotification(SHOW_WAIT_TODO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ACTIVE_PANEL:
               sendNotification(SHOW_ACTIVE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DAZUO_PANEL:
               sendNotification(SHOW_DAZUO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHUANGXIU_PANEL:
               sendNotification(SHOW_SHUANGXIU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_REFRESHPOINT_PLANE:
               sendNotification(SHOW_REFRESHPOINT_PLANE,_loc2_);
               break;
            case PipeConstants.SHOW_MAINCHAR_XINFA_XIULIAN:
               sendNotification(SHOW_MAINCHAR_XINFA_XIULIAN,_loc2_);
               break;
            case PipeConstants.SHOW_CHENGJIU_PANEL:
               sendNotification(SHOW_CHENGJIU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_TEAM_INSTANCE_PANEL:
               sendNotification(SHOW_TEAM_INSTANCE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_INSTANCE_SELECT_PANEL:
               sendNotification(SHOW_INSTANCE_SELECT_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHENQI_DOLL_PANEL:
               sendNotification(SHOW_ZHENQI_DOLL_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHENQI_DOLL_SUPER_PANEL:
               sendNotification(SHOW_ZHENQI_DOLL_SUPER_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHOUJI_PANEL:
               sendNotification(SHOW_SHOUJI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BANGHUI_LIST_PANEL:
               sendNotification(SHOW_BANGHUI_LIST_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BANGHUI_CREAT_PANEL:
               sendNotification(SHOW_BANGHUI_CREAT_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BANGHUI_INFO_PANEL:
               sendNotification(SHOW_BANGHUI_INFO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BANGHUI_MEMBER_LIST_PANEL:
               sendNotification(SHOW_BANGHUI_MEMBER_LIST_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BANGHUI_NEWS_PANEL:
               sendNotification(SHOW_BANGHUI_NEWS_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BANGQI_INFO_PANEL:
               sendNotification(SHOW_BANGQI_INFO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BANGQI_ANCHA_PANEL:
               sendNotification(SHOW_BANGQI_ANCHA_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_BANGQI_BANGGONG_PANEL:
               sendNotification(SHOW_BANGQI_BANGONG_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_GONGCHENG_XIANGYANGGUISHU_PANEL:
               sendNotification(SHOW_GONGCHENG_XIANGYANGGUISHU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_GONGCHENG_GONGCHENGCHE_PANEL:
               sendNotification(SHOW_GONGCHENG_GONGCHENGCHE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_STONE_PLANE:
               sendNotification(SHOW_STONE_PANEL,_loc2_);
               break;
            case PipeConstants.CLOSE_EASY_STONE_PLANE:
               sendNotification(CLOSE_EASY_STONE_PLANE);
               break;
            case PipeConstants.SHOW_MOVING_PANEL:
               sendNotification(SHOW_MOVING_PANEL);
               break;
            case PipeConstants.SHOW_FB_RANK_PLANE:
               sendNotification(SHOW_FB_RANK_PLANE);
               break;
            case PipeConstants.SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE:
               sendNotification(SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE);
               break;
            case PipeConstants.SHOW_AMULT:
               sendNotification(SHOW_AMULT);
               break;
            case PipeConstants.SHOW_AMULT_ADD_SHELIZI:
               sendNotification(SHOW_AMULT_ADD_SHELIZI);
               break;
            case PipeConstants.CLOSE_AMULT_ADD_SHELIZI:
               sendNotification(CLOSE_AMULT_ADD_SHELIZI);
               break;
            case PipeConstants.SHOW_SHEN_LONG_AMULT:
               sendNotification(SHOW_SHEN_LONG_AMULT);
               break;
            case PipeConstants.SHOW_PARTY_SKILL:
               sendNotification(SHOW_PARTY_SKILL);
               break;
            case PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL:
               sendNotification(SHOW_ZHAN_WEN_KE_HUA_PANEL);
               break;
            case PipeConstants.SHOW_LAUNCH_PROPOSAL_PANEL:
               sendNotification(SHOW_LAUNCH_PROPOSAL_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_PROPOSAL_AFFIRM_PANEL:
               sendNotification(SHOW_PROPOSAL_AFFIRM_PANEL);
               break;
            case PipeConstants.SHOW_MARRIAGE_SUCCESS_PANEL:
               sendNotification(SHOW_MARRIAGE_SUCCESS_PANEL);
               break;
            case PipeConstants.SHOW_MARRIAGE_WEDDING_PLANE:
               sendNotification(SHOW_MARRIAGE_WEDDING_PLANE);
               break;
            case PipeConstants.SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE:
               sendNotification(SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE);
               break;
            case PipeConstants.SHOW_MARRIAGE_GIVE_CASH_GIFT_PLANE:
               sendNotification(SHOW_MARRIAGE_GIVE_CASH_GIFT_PLANE);
               break;
            case PipeConstants.SHOW_MARRIAGE_DINE_PLANE:
               sendNotification(SHOW_MARRIAGE_DINE_PLANE);
               break;
            case PipeConstants.SHOW_GOLD_SQUIRREL_GIFT_PLANE:
               sendNotification(SHOW_GOLD_SQUIRREL_GIFT_PLANE,_loc2_);
               break;
            case PipeConstants.SHOW_TA_KUNGFU:
               sendNotification(SHOW_TA_KUNGFU,_loc2_);
               break;
            case PipeConstants.SHOW_TA_JINGMAI_PANEL:
               sendNotification(SHOW_TA_JINGMAI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_LABOUR_PANEL:
               sendNotification(SHOW_LABOUR_PANEL);
               break;
            case PipeConstants.SHOW_ANQI_ACTIVE:
               sendNotification(SHOW_ANQI_ACTIVE);
               break;
            case PipeConstants.SHOW_GIFT_CARD_PANEL:
               sendNotification(SHOW_GIFT_CARD_PANEL);
               break;
            case PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL:
               sendNotification(SHOW_EQUIP_UPDATA_TYPE_PANEL);
               break;
            case PipeConstants.SHOW_LIAOSHANG_PANEL:
               sendNotification(SHOW_LIAOSHANG_PANEL);
               break;
            case PipeConstants.SHOW_MAINCHAR_KUAFU_BACKPACK:
               sendNotification(SHOW_MAINCHAR_KUAFU_BACKPACK);
               break;
            case PipeConstants.SHOW_MAINCHAR_MALL:
               sendNotification(SHOW_MAINCHAR_MALL);
               break;
            case PipeConstants.SHOW_NITA_SKILL:
               sendNotification(SHOW_NITA_SKILL);
               break;
            case PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE:
               sendNotification(SHOW_SIX_STONE_TO_SEVEN_STONE);
               break;
            case PipeConstants.SHOW_SILINGZHEN_PANEL:
               sendNotification(SHOW_SILINGZHEN_PANEL);
               break;
            case PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE:
               sendNotification(SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
               break;
            case PipeConstants.SHOW_XIAN_TIAN_WU_JING:
               sendNotification(SHOW_XIAN_TIAN_WU_JING);
               break;
            case PipeConstants.SHOW_TEAM_INSTANCE_PANEL_3V3:
               sendNotification(SHOW_TEAM_INSTANCE_PANEL_3V3,_loc2_);
               break;
            case PipeConstants.SHOW_KUAFU3V3_RESULT_PANEL:
               sendNotification(SHOW_KUAFU3V3_RESULT_PANEL);
               break;
            case PipeConstants.SHOW_PARTY_TASK:
            case PipeConstants.OPEN_JIE_YABIAO_PANEL:
               sendNotification(SHOW_PARTY_TASK_PANEL,_loc2_);
               break;
            case PipeConstants.OPEN_JIAO_YABIAO_PANEL:
               sendNotification(SHOW_PARTY_TASK_COMPLETE_PANEL,_loc2_);
               break;
            case PipeConstants.OPEN_PARTY_TASK_INVITE:
               sendNotification(SHOW_PARTY_TASK_INVITE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL:
               sendNotification(SHOW_SHUXINGDAZAOKA_PANEL);
               break;
            case PipeConstants.SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING:
               sendNotification(SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING);
               break;
            case PipeConstants.SHOW_QIAN_KUN_PU_KE_PANEL:
               sendNotification(SHOW_QIAN_KUN_PU_KE_PANEL);
               break;
            case PipeConstants.SHOW_TU_TENG_CADE:
               sendNotification(SHOW_TU_TENG_CADE);
               break;
            case PipeConstants.SHOW_FREE_MALL_PLANE:
               sendNotification(SHOW_FREE_MALL_PLANE);
               break;
            case PipeConstants.SHOW_ORANGE_EQUIP_PANEL:
               sendNotification(SHOW_ORANGE_EQUIP_PANEL);
               break;
            case PipeConstants.SHOW_CHANGE_SUPER_MOUNT:
               sendNotification(SHOW_CHANGE_SUPER_MOUNT);
               break;
            case PipeConstants.SHOW_JIN_CHUI_ZI_PANEL:
               sendNotification(SHOW_JIN_CHUI_ZI_PANEL);
               break;
            case PipeConstants.SHOW_RANK_ATTACK_PANEL:
               sendNotification(SHOW_RANK_ATTACK_PLANE);
               break;
            case PipeConstants.SHOW_SHITU_PANEL:
               sendNotification(SHOW_SHITU_PANEL);
               break;
            case PipeConstants.SHOW_JINGYANJIANGLI_PANEL:
               sendNotification(SHOW_JINGYANJIANGLI_PANEL);
               break;
            case PipeConstants.SHOW_WUXIEZHIJING_PANEL:
               sendNotification(SHOW_WUXIEZHIJING_PANEL);
               break;
            case PipeConstants.SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG:
               sendNotification(SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG);
               break;
            case PipeConstants.SHOW_BAJIGUIYUANHUFU_DA_KONG:
               sendNotification(SHOW_BAJIGUIYUANHUFU_DA_KONG);
               break;
            case PipeConstants.SHOW_CHANGE_SUPER_MOUNT_TO_SUPER_MOUNT:
               sendNotification(SHOW_CHANGE_SUPER_MOUNT_TO_SUPER_MOUNT);
               break;
            case PipeConstants.SHOW_MO_SHOU_HU_HUAN:
               sendNotification(SHOW_MO_SHOU_HU_HUAN);
               break;
            case PipeConstants.SHOW_HUYI_KAIGUANG_PANEL:
               sendNotification(SHOW_HUYI_KAIGUANG_PANEL);
               break;
            case PipeConstants.SHOW_HUYI_LINGHUA_PANEL:
               sendNotification(SHOW_HUYI_LINGHUA_PANEL);
               break;
            case PipeConstants.SHOW_ZHUANGBEI_JIHUO_PANEL:
               sendNotification(SHOW_ZHUANGBEI_JIHUO_PANEL);
               break;
            case PipeConstants.SHOW_HUYI_XILIAN_PANEL:
               sendNotification(SHOW_HUYI_XILIAN_PANEL);
               break;
            case PipeConstants.SHOW_BIWUDUIJUE_PANEL:
               sendNotification(SHOW_BIWUDUIJUE_PANEL);
               break;
            case PipeConstants.SHOW_BAOSHIJIANSHANG_PANEL:
               sendNotification(SHOW_BAOSHIJIANSHANG_PANEL);
               break;
            case PipeConstants.SHOW_BAOSHIJIANSHANG_GUIZE_PANEL:
               sendNotification(SHOW_BAOSHIJIANSHANG_GUIZE_PANEL);
               break;
            case PipeConstants.SHOW_DAOJUTIQUKA_PANEL:
               sendNotification(SHOW_DAOJUTIQUKA_PANEL);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.CHANGE_MOSHOU_BY_CRASH)
               {
                  sendNotification(SHOW_RIDE_CHANGE_MOSHOU_PANEL);
               }
               break;
            case PipeConstants.SHOW_HUIZHANG_PANEL:
               sendNotification(SHOW_HUIZHANG_PANEL);
               break;
            case PipeConstants.SHOW_MALL_JI_FEN_PLANE:
               sendNotification(SHOW_MALL_JI_FEN_PLANE);
               break;
            case PipeConstants.SHOW_SHI_SHI_ZHAN_KUANG:
               sendNotification(SHOW_SHISHIZHANKUANG_PANEL);
               break;
            case PipeConstants.SHOW_WANFASHIYITU_CLICK:
               sendNotification(SHOW_WANFASHIYITU);
               break;
            case PipeConstants.SHOW_TEAM_INSTANCE_PANEL_XIANGYANGZHANCHANG:
               sendNotification(SHOW_TEAM_INSTANCE_PANEL_XIANGYANGZHANCHANG,_loc2_);
               break;
            case PipeConstants.SHOW_WANJIAHUIKUI:
               sendNotification(SHOW_WANJIAHUIKUI);
               break;
            case PipeConstants.SHOW_KUAFU_LEITAI:
               sendNotification(SHOW_KUAFU_LEITAI);
               break;
            case PipeConstants.SHOW_KUAFU_LEITAI_JIEGUO:
               sendNotification(SHOW_KUAFU_LEITAI_JIEGUO);
               break;
            case PipeConstants.SHOW_XIANSHIDAJIANGDUIHUAN:
               sendNotification(SHOW_XIANSHIDAJIANGDUIHUAN,_loc2_);
               break;
            case PipeConstants.SHOW_QINGGONGYAN_OVER:
               sendNotification(SHOW_QINGGONGYAN_OVER);
               break;
            case PipeConstants.QINGGONGYAN_CHI:
               sendNotification(QINGGONGYAN_CHI,_loc2_);
               break;
            case PipeConstants.SHOW_HUSHEN_XILIAN_PANEL:
               sendNotification(SHOW_SHENLONGHUSHENFU_XILIAN_PANEL);
               break;
            case PipeConstants.SHOW_BIWU_CROSSPLATFORM_PANEL:
               sendNotification(SHOW_BIWU_CROSSPLATFORM_PANEL);
               break;
            case PipeConstants.SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL:
               sendNotification(SHOW_BIWUDUIJUE_CROSSPLATFORM_PANEL);
               break;
            case PipeConstants.SHOW_ZHANHUNDAI_BAOGUO:
               sendNotification(SHOW_ZHANHUNDAI_BAOGUO);
               break;
            case PipeConstants.SHOW_XUNZHANG_DUANZAO:
               sendNotification(SHOW_XUNZHAGNZHANQI_DUANZAO);
               break;
            case PipeConstants.SHOW_SHENGDAN_PANEL_DUANZAO:
               sendNotification(SHOW_SHENGDAN_PANEL_DUANZAO);
               break;
            case PipeConstants.SHOW_SISHENGSHOUKEWEN_PANEL:
               sendNotification(SHOW_SISHENGSHOUKEWEN);
               break;
            case PipeConstants.MENU_XIANGQIAN:
            case PipeConstants.SUPER_XIANGQIAN:
               sendNotification(SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE);
               break;
            case PipeConstants.SHOW_SHISHIKAIFENG_PANEL:
               sendNotification(SHOW_SHISHIKAIFENG_PANEL);
               break;
            case PipeConstants.SHOW_TISHENGPINZHI_PANEL:
               sendNotification(SHOW_TISHENGPINZHI_PANEL);
               break;
            case PipeConstants.SHOW_FUCHOU_OK_PANEL:
               sendNotification(SHOW_FUCHOU_OK_PANEL);
               break;
            case PipeConstants.SHOW_CISHA_OK_PANEL:
               sendNotification(SHOW_CISHA_OK_PANEL);
               break;
            case PipeConstants.SHOW_DIXIAQIANZHUANG_PANEL:
               sendNotification(SHOW_DIXIAQIANZHUANG_PANEL);
               break;
            case PipeConstants.SHOW_CISHAMILING_PLANE:
               sendNotification(SHOW_CISHAMILING_PANEL);
               break;
            case PipeConstants.SHOW_AOJIAN_ZHUZAO:
               sendNotification(SHOW_AOJIANDUANZAO_PANEL);
               break;
            case PipeConstants.SHOW_MONTHSIGNIN_PANEL:
               sendNotification(SHOW_MONTHSIGNIN_PANEL);
               break;
            case PipeConstants.SHOW_JUBAOPEN_PANEL:
               sendNotification(SHOW_JUBAOPEN_PANEL);
               break;
            case PipeConstants.CLOSE_JUBAOPEN_PANEL:
               sendNotification(CLOSE_JUBAOPEN_PANEL);
               break;
            case PipeConstants.SHOW_XUNZHANGDUIHUAN_PANEL:
               sendNotification(SHOW_XUNZHANGDUIHUAN_PANEL);
               break;
            case PipeConstants.MENU_XUNZHANGXIANGQIAN:
               sendNotification(SHOW_CANAGBAOGEXUNZHANGXIANGQIAN_PANEL);
               break;
            case PipeConstants.SHOW_MOXUE_DOLL_PANEL:
               sendNotification(SHOW_MOXUE_DOLL_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_TIMEBAOZANG_PANEL:
               sendNotification(SHOW_TIMEBAOZANG_PANEL);
               break;
            case PipeConstants.HIDE_ALL_UI_TENS:
               sendNotification(HIDE_ALL_UI_TENS,_loc2_);
               break;
            case PipeConstants.SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL:
               sendNotification(SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL);
               break;
            case PipeConstants.SHOW_JILEIZHI_PANEL:
               sendNotification(SHOW_JILEIZHI_PANEL);
               break;
            case PipeConstants.SHOW_TIANSHANGZHIHUN_SHENGJIE:
               sendNotification(SHOW_TIANSHANGZHIHUN_SHENGJIE,_loc2_);
               break;
            case PipeConstants.SHOW_MENPAIZHUANHUAN_PANEL:
               sendNotification(SHOW_MENPAIZHUANHUAN_PANEL);
               break;
            case PipeConstants.SHOW_PARTYEQUIPCHANGE_PANEL:
               sendNotification(SHOW_PARTYEQUIPCHANGE_PANEL);
               break;
            case PipeConstants.SHOW_SHENDIAO_PLANE:
               sendNotification(SHOW_SHENDIAO_PLANE);
               break;
            case PipeConstants.SHOW_GANJIANGMOYEZHUZAO_PLANE:
               sendNotification(SHOW_GANJIANGMOYEZHUZAO_PLANE);
               break;
            case PipeConstants.REQUEST_YUENANRANKING_PANEL:
               sendNotification(REQUEST_YUENANRANKING_PANEL);
               break;
            case PipeConstants.SHOW_YUENANRANKING_PANEL:
               sendNotification(SHOW_YUENANRANKING_PANEL);
               break;
            case PipeConstants.SHOW_FASHION_PANEL:
               sendNotification(SHOW_FASHION_PANEL);
               break;
            case PipeConstants.REQUEST_YUENANJUBAOPEN_PANEL:
               sendNotification(REQUEST_YUENANJUBAOPEN_PANEL);
               break;
            case PipeConstants.SHOW_YUENANJUBAOPEN_PANEL:
               sendNotification(SHOW_YUENANJUBAOPEN_PANEL);
               break;
            case PipeConstants.SHOW_RENAME_PANEL:
               sendNotification(SHOW_YNRENAME_PANEL);
               break;
            case PipeConstants.SHOW_YUENANSHIJIEBEIRANK_PANEL:
               sendNotification(SHOW_YUENANSHIJIEBEIRANK_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YUENAN888SHOP:
               sendNotification(SHOW_YUENAN888SHOP);
               break;
            case PipeConstants.SHOW_YUENANONLINEPANEL:
               sendNotification(SHOW_YUENANONLINEPANEL);
               break;
            case PipeConstants.REQUEST_YUENANONLINE_PANEL:
               sendNotification(REQUEST_YUENANONLINE_PANEL);
               break;
            case PipeConstants.SHOW_YUENANRICHANGGONGGAO_PANEL:
               sendNotification(SHOW_YUENANRICHANGGONGGAO_PANEL);
               break;
            case PipeConstants.SHOW_YUENAN2014ZHONGQIU_PANEL:
               sendNotification(SHOW_YUENAN2014ZHONGQIU_PANEL);
               break;
            case PipeConstants.SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL:
               sendNotification(SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL);
               break;
            case PipeConstants.SHOW_WANBAOGE_BAOSHIJIANSHANG_PANEL:
               sendNotification(SHOW_WANBAOGE_BAOSHIJIANSHANG_PANEL);
               break;
            case PipeConstants.SHOW_NEWYEAR_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_NEWYEAR_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YURENJIE_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_YURENJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YURENJIE_RANK_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_YURENJIE_RANK_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_FENGZHENGJIE_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_FENGZHENGJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_FENGZHENGJIE_RANK_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_FENGZHENGJIE_RANK_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DOUDIZHU_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_DOUDIZHU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DUANWUJIE_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_DUANWUJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_QIXIJIE_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_QIXIJIE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_CHAOJILABA_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_CHAOJILABA_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHONGZHIXUANYUANJIAN_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_ZHONGZHIXUANYUANJIAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DOUDIZHU_RANK_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_DOUDIZHU_RANK_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE:
               sendNotification(SHOW_QINGRENJIESONGHUA_PLANE,_loc2_);
               break;
            case PipeConstants.SHOW_QINGRENJIE_SONGHUABANG_PLANE:
               sendNotification(SHOW_QINGRENJIE_SONGHUABANG_PLANE);
               break;
            case PipeConstants.SHOW_WISHINGTREE_PANEL:
               sendNotification(SHOW_WISHINGTREE_PANEL);
               break;
            case PipeConstants.HUANGJINSHU_WATER:
               sendNotification(SHOW_HUANGJINSHU_PANEL);
               break;
            case PipeConstants.SHOW_GERENCHENGHAO_PANEL:
               sendNotification(SHOW_GERENCHENGHAO_PANEL);
               break;
            case PipeConstants.SHOW_CHUANGONGWUXUE_PANEL:
               sendNotification(SHOW_CHUANGONGWUXUE_PANEL);
               break;
            case PipeConstants.SHOW_HUANGTUBAYE_PANEL:
               sendNotification(SHOW_HUANGTUBAYE_PANEL);
               break;
            case PipeConstants.SHOW_JIANGSHANSHEJI_CHAKAN_PLANE:
               sendNotification(SHOW_JIANGSHANSHEJI_CHAKAN_PLANE);
               break;
            case PipeConstants.SHOW_BANGHUI_RONGYU_LIST_PANEL:
               sendNotification(SHOW_BANGHUI_RONGYU_LIST_PANEL);
               break;
            case PipeConstants.SHOW_FABAOPANEL:
               sendNotification(SHOW_FABAO_PANEL);
               break;
            case PipeConstants.SHOW_FABAOLINGLIPANEL:
               sendNotification(SHOW_FABAOLINGLIPANEL);
               break;
            case PipeConstants.SHOW_FABAOTUPOPANEL:
               sendNotification(SHOW_FABAO_TUPO_PANEL);
               break;
            case PipeConstants.SHOW_SHIJIEBEI_PANEL:
               sendNotification(SHOW_SHIJIEBEI_PANEL);
               break;
            case PipeConstants.SHOW_SHENGXIAO_PANEL:
               sendNotification(SHOW_SHENGXIAO_PANEL);
               break;
            case PipeConstants.SHOW_WUXIAKAPAI_PANEL:
               sendNotification(SHOW_WUXIAKAPAI_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WUXIAKAPAI_XIANGXI_PANEL:
               sendNotification(SHOW_WUXIAKAPAI_XIANGXI_PANEL);
               break;
            case PipeConstants.SHOW_WANGZHEZHIBANG_PANEL:
               sendNotification(SHOW_WANGZHEZHIBANG_PANEL);
               break;
            case PipeConstants.GET_XIAOZHUKUAIPAO_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_XIAOZHUKUAIPAO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WANGZHEZHIBANG_PANEL:
               sendNotification(SHOW_WANGZHEZHIBANG_PANEL);
               break;
            case PipeConstants.YN_SHOW_LONGWUGEPANEL:
               sendNotification(YN_SHOW_LONGWUGEPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DUIXUEREN:
               _loc2_ = param1.body;
               sendNotification(SHOW_DUIXUEREN_PANEL,_loc2_);
               break;
            case PipeConstants.GET_LONGFENGDANGPU_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_LONGFENGDANGPU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_MOXUEZHANCHANG:
               _loc2_ = param1.body;
               sendNotification(SHOW_MOXUEZHANCHANG_PANEL,_loc2_);
               break;
            case PipeConstants.GET_DUANWUJIE2015_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_DUANWUJIE2015_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_XIANMOZHILU:
               _loc2_ = param1.body;
               sendNotification(SHOW_XIANMOZHILU_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_ZHONGZU_PLANE:
               _loc2_ = param1.body;
               sendNotification(SHOW_XIANMOZHILU_ZHUANZHI_PANEL,_loc2_);
               break;
            case PipeConstants.GET_WUHUNXITONG_PANEL:
               _loc2_ = param1.body;
               sendNotification(SHOW_WUHUN_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

