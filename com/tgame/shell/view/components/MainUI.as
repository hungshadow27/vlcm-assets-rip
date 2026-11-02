package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.DP_qixuan;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.ChristmasRank.ChristmasRankCanvas;
   import com.tgame.shell.view.components.baguazhen.BaGuaZhenMainPanel;
   import com.tgame.shell.view.components.baoshijianshang.MainBaoShiJianShangCanvas;
   import com.tgame.shell.view.components.chengfajinggao.ChengfajinggaoPanel;
   import com.tgame.shell.view.components.dantiaowang.DTWRankPanel;
   import com.tgame.shell.view.components.dantiaowang.DanTiaoWangShuomingPanel;
   import com.tgame.shell.view.components.duixueren.DuiXueRen_MapXueRen;
   import com.tgame.shell.view.components.mainui.AojianZhengbaSelectCanvas;
   import com.tgame.shell.view.components.mainui.CharHead;
   import com.tgame.shell.view.components.mainui.Combo;
   import com.tgame.shell.view.components.mainui.FunctionBar;
   import com.tgame.shell.view.components.mainui.HuaShanZhiDianJiangLi;
   import com.tgame.shell.view.components.mainui.IcoTipCanvas;
   import com.tgame.shell.view.components.mainui.ImageLeadCanvas;
   import com.tgame.shell.view.components.mainui.JianMianYouLiCanvas_mainui;
   import com.tgame.shell.view.components.mainui.KuaFuLineSelectCanvas;
   import com.tgame.shell.view.components.mainui.KuaFuLunJian3v3GuiZheCanvas;
   import com.tgame.shell.view.components.mainui.KuaFuLunJianGuiZheCanvas;
   import com.tgame.shell.view.components.mainui.LevelTipCanvas;
   import com.tgame.shell.view.components.mainui.MainBiwuDahuiCanvas;
   import com.tgame.shell.view.components.mainui.SkillLevelBar;
   import com.tgame.shell.view.components.mainui.SmallMap;
   import com.tgame.shell.view.components.mainui.SysAfficheCanvas;
   import com.tgame.shell.view.components.mainui.SysTipCanvas;
   import com.tgame.shell.view.components.mainui.Target;
   import com.tgame.shell.view.components.mainui.TaskTrack;
   import com.tgame.shell.view.components.mainui.TeamMemberList;
   import com.tgame.shell.view.components.mainui.WanbaogeFunctionBar;
   import com.tgame.shell.view.components.mainui.chat.Chat;
   import com.tgame.shell.view.components.moshouzhanchang.MoShouZhanChangFuHuoPanel;
   import com.tgame.shell.view.components.moshouzhanchang.MoShouZhanChangJiangLiPanel;
   import com.tgame.shell.view.components.moshouzhanchang.MoShouZhanChangYanShiView;
   import com.tgame.shell.view.components.utils.UITools;
   import com.tgame.shell.view.components.yitiantulong.YiTianTuLongBang;
   import com.tgame.shell.view.components.zhengba.RankPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.common.utils.ZMath;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import gs.TweenMax;
   
   public class MainUI extends Sprite
   {
      
      public static const TYPE_DEFAULT_TIP:String = "ui.scene.default.tip";
      
      public static const TYPE_TEAM_TIP:String = "ui.scene.team.tip";
      
      public static const TYPE_TASK_TIP:String = "ui.scene.task.tip";
      
      public static const TYPE_TRADING_TIP:String = "ui.scene.trading.tip";
      
      public static const TYPE_FRIEND_TIP:String = "ui.scene.addfriend.tip";
      
      public static const TYPE_PARTY_TIP:String = "ui.scene.joinparty.tip";
      
      public static const TYPE_GIFT_TIP:String = "ui.scene.gift.tip";
      
      public static const TYPE_COURTSHIP_TIP:String = "ui.scene.courtship.tip";
      
      public static const TYPE_ADDPOINT_TIP:String = "ui.scene.addpoint.tip";
      
      public static const TYPE_MAIL_TIP:String = "ui.scene.mail.tip";
      
      public static const TYPE_MESSAGE_TIP:String = "ui.scene.message.tip";
      
      public static const TYPE_REPAIREQUIP_TIP:String = "ui.scene.repairequip.tip";
      
      public static const TYPE_LIAOSHANG_TIP:String = "ui.scene.liaoshang.tip";
      
      public static const TYPE_YABIAO_TIP:String = "ui.scene.yabiao.tip";
      
      public static const TYPE_SHITU_TIP:String = "ui.scene.shitu.tip";
      
      public static const TYPE_ITEM_FULL_TIP:String = "ui.scene.default.tip";
      
      public static const TYPE_ZHENQI_FULL_TIP:String = "ui.scene.default.tip";
      
      public static const TYPE_RED_ZORE:String = "ui.scene.default.tip";
      
      public static const TYPE_BLUE_ZORE_TIP:String = "ui.scene.default.tip";
      
      public static const TYPE_YELLOW_ZORE_TIP:String = "ui.scene.default.tip";
      
      public static const TYPE_MOUNT_LEVEL_UP_TIP:String = "ui.scene.default.tip";
      
      public static const TYPE_EQUIP_ZORE_TIP:String = "ui.scene.default.tip";
      
      public static const TYPE_SKILL_STUDY_TIP:String = "ui.scene.default.tip";
      
      public static const TYPE_SKILL_LEVEL_UP_TIP:String = "ui.scene.default.tip";
      
      public static const TYPE_DAZUO_TIP:String = "ui.scene.shuangxiu.tip";
      
      public static const IMAGE_LEAD_TYPE_POINT:int = 1;
      
      public static const IMAGE_LEAD_TYPE_RIDE_LV:int = 2;
      
      public static const IMAGE_LEAD_TYPE_NEW_KUNGFU:int = 3;
      
      public static const IMAGE_LEAD_TYPE_KUNGFU_LV:int = 4;
      
      public static const IMAGE_LEAD_TYPE_KUNGFU_BOOK:int = 5;
      
      public static const IMAGE_LEAD_TYPE_ZHIXIAN_TASK_APPECTABLE:int = 6;
      
      public static const IMAGE_LEAD_TYPE_NEJIU_ZREO:int = 7;
      
      public static const IMAGE_LEAD_TYPE_BACKPACK_FULL:int = 8;
      
      public static const IMAGE_LEAD_TYPE_RECOVER_HP_NOEN:int = 9;
      
      public static const IMAGE_LEAD_TYPE_RECOVER_MP_NOEN:int = 10;
      
      public static const IMAGE_LEAD_TYPE_RECOVER_SP_NOEN:int = 11;
      
      public static const IMAGE_LEAD_TYPE_ZHENGQI_FULL:int = 12;
      
      public static const IMAGE_LEAD_TYPE_APPECTED_NEW_TASK:int = 13;
      
      public static const IMAGE_LEAD_TYPE_TASK_TARGET_COMPLETE:int = 14;
      
      public static const IMAGE_LEAD_TYPE_TASK_PRIZE_EQUIP:int = 15;
      
      public static const IMAGE_LEAD_TYPE_NEW_GOOD_EQUIP:int = 16;
      
      public static const IMAGE_LEAD_TYPE_GET_ITEM_FLOOR:int = 17;
      
      public static const IMAGE_LEAD_TYPE_BIGUAN_TIME_TO_12_HORSE_FLOOR:int = 18;
      
      public static const IMAGE_LEAD_TYPE_GIFT_FLOOR:int = 19;
      
      public static const IMAGE_LEAD_TYPE_ANQI_LV_STOP:int = 20;
      
      public static const IMAGE_LEAD_TYPE_GTE_ANQI:int = 21;
      
      public static const IMAGE_LEAD_TYPE_BYE_BYE_IS_FRIEND:int = 22;
      
      public static const IMAGE_LEAD_TYPE_YU_PEI_UPDATA:int = 23;
      
      public static const IMAGE_LEAD_TYPE_NEW_EYE_SPEAK:int = 24;
      
      public static const IMAGE_LEAD_TYPE_NEW_EAT:int = 25;
      
      public static const IMAGE_LEAD_TYPE_NEW_MONEY:int = 26;
      
      public static const IMAGE_LEAD_TYPE_NO_JIAN:int = 27;
      
      public static const IMAGE_LEAD_TYPE_FANG_CHEN_MI:int = 28;
      
      public static const IMAGE_LEAD_TYPE_XIAKEDAO_MAP_OPEN:int = 29;
      
      public static const IMAGE_LEAD_TYPE_GET_LUNJIANTAI_GIFT:int = 30;
      
      public static const IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT:int = 31;
      
      public static const IMAGE_LEAD_TYPE_LUNJIANTAI_START:int = 32;
      
      public static const IMAGE_LEAD_TYPE_CHUI_XIAO_UP:int = 33;
      
      public static const IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT2:int = 34;
      
      public static const IMAGE_LEAD_TYPE_EN_SHI_LING:int = 35;
      
      public static const IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT3:int = 36;
      
      public static const IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT4:int = 37;
      
      public static const IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT5:int = 50;
      
      public static const QINGGONGYAN_BEIGIN:int = 38;
      
      public static const LEIJI_DENGLU_JIANGLI:int = 39;
      
      public static const SHUANG_BEI_SHIJIAN:int = 40;
      
      public static const RENWU_XIANSHI_BIAOQIAN:int = 41;
      
      public static const IMAGE_LEAD_TYPE_CISHA:int = 42;
      
      public static const IMAGE_LEAD_TYPE_FUCHOU:int = 43;
      
      public static const IMAGE_LEAD_TYPE_DIWANGHUANGQI:int = 47;
      
      public static const IMAGE_LEAD_TYPE_MOXUE_FULL:int = 44;
      
      public static const IMAGE_LEAD_TYPE_GIRL_XINQING_LOW:int = 45;
      
      public static const IMAGE_LEAD_TYPE_LIANQI_FULL:int = 46;
      
      public static const IMAGE_LEAD_TYPE_SHENDIAOXIALV:int = 47;
      
      public static const IMAGE_LEAD_TYPE_BYE_BYE_QUJIAN:int = 48;
      
      public static const IMAGE_LEAD_TYPE_ZHIZHANZHISHANG_LINGQU:int = 51;
      
      public static const IMAGE_LEAD_TYPE_FUQI_ITEM:int = 49;
      
      public static const IMAGE_LEAD_TYPE_WANGZHEZHIBANG:int = 52;
      
      public static const TARGET_VIEWBTN_CLICK:String = "ui.main.target.view.btn.click";
      
      public static const TARGET_TRADINGBTN_CLICK:String = "ui.main.target.trading.click";
      
      public static const TARGET_FRIENDBTN_CLICK:String = "ui.main.target.friend.click";
      
      public static const TARGET_TEAMBTN_CLICK:String = "ui.main.target.team.click";
      
      public static const TARGET_CHATBTN_CLICK:String = "ui.main.target.chat.click";
      
      public static const TARGET_PARTY_INVITE_CLICK:String = "TARGET_PARTY_INVITE_CLICK";
      
      public static const TARGET_LARGESS_FLOWER_CLICK:String = "TARGET_LARGESS_FLOWER_CLICK";
      
      public static const TARGET_COURTSHIP_CLICK:String = "TARGET_COURTSHIP_CLICK";
      
      public static const TARGET_LOOK_SHOP_CLICK:String = "TARGET_LOOK_SHOP_CLICK";
      
      public static const TARGET_SHUANGXIU_CLICK:String = "TARGET_SHUANGXIU_CLICK";
      
      public static const TARGET_CHENGJIU_CLICK:String = "TARGET_CHENGJIU_CLICK";
      
      public static const TARGET_LIAOSHANG_CLICK:String = "TARGET_LIAOSHANG_CLICK";
      
      public static const TARGET_JINYAN_CLICK:String = "TARGET_JINYAN_CLICK";
      
      public static const TARGET_QICHENG_CLICK:String = "TARGET_QICHENG_CLICK";
      
      public static const MAP_ZHENGFU_BTN_CLICK:String = "MAP_ZHENGFU_BTN_CLICK";
      
      public static const MAP_HUODONG_BTN_CLICK:String = "MAP_HUODONG_BTN_CLICK";
      
      public static const MAP_INFO_BTN_CLICK:String = "MAP_INFO_BTN_CLICK";
      
      public static const MAP_CHANGEOTHERCHARNAMESHOWBTN_CLICK:String = "ui.map.name.click";
      
      public static const MAP_OPTIONBTN_CLICK:String = "ui.main.map.option.click";
      
      public static const MAP_MAPBTN_CLICK:String = "ui.main.map.map.click";
      
      public static const MAP_TOPBTN_CLICK:String = "ui.main.map.top.click";
      
      public static const MAP_LINEBTN_CLICK:String = "ui.main.map.line.click";
      
      public static const MAP_JING_CLICK:String = "ui.main.map.jing.click";
      
      public static const MAP_ZHAN_CLICK:String = "ui.main.map.zhan.click";
      
      public static const FUNCTION_CHARBTN_CLICK:String = "ui.main.functin.char.click";
      
      public static const FUNCTION_BACKPACKBTN_CLICK:String = "ui.main.function.backpack.click";
      
      public static const FUNCTION_SKLLBTN_CLICK:String = "ui.main.function.skill.click";
      
      public static const FUNCTION_RIDEBTN_CLICK:String = "ui.main.function.ride.click";
      
      public static const FUNCTION_TASKBTN_CLICK:String = "ui.main.funcion.task.click";
      
      public static const FUNCTION_TEAMBTN_CLICK:String = "ui.main.function.team.click";
      
      public static const FUNCTION_FRIENDBTN_CLICK:String = "ui.main.function.friend.click";
      
      public static const FUNCTION_STEUPBTN_CLICK:String = "ui.main.function.steup.click";
      
      public static const FUNCTION_MALLBTN_CLICK:String = "ui.main.function.mall.click";
      
      public static const FUNCTION_STUDYBTN_CLICK:String = "ui.main.function.study.click";
      
      public static const FUNCTION_MEIREN_CLICK:String = "ui.main.function.meiren.click";
      
      public static const FUNCTION_SHORTCUT_CLICK:String = "FUNCTION_USEITEM";
      
      public static const FUNCTION_SHORTCU_DRAG_STRAT:String = "FUNCTION_SHORTCU_DRAG_STRAT";
      
      public static const FUNCITON_RIDE_SKILL_SHORTCUT_CLICK:String = "FUNCITON_RIDE_SKILL_SHORTCUT_CLICK";
      
      public static const FUNCITON_JUMP_BTN_CLICK:String = "FUNCITON_JUMP_BTN_CLICK";
      
      public static const FUNCITON_SIT_BTN_CLICK:String = "FUNCITON_SIT_BTN_CLICK";
      
      public static const FUNCTION_OPTION_BTN_CLICK:String = "FUNCTION_OPTION_BTN_CLICK";
      
      public static const FUNCTION_BIWU_CROSSPLATFORM_BTN_CLICK:String = "FUNCTION_BIWU_CROSSPLATFORM_BTN_CLICK";
      
      public static const FUNCITON_AUTO_BTN_CLICK:String = "FUNCITON_AUTO_BTN_CLICK";
      
      public static const FUNCTION_RIDE_BTN_CLICK:String = "FUNCTION_FRIDE_BTN_CLICK";
      
      public static const FUNCTION_QI_BTN_CLICK:String = "FUNCTION_QI_BTN";
      
      public static const CHAT_SENDMESSAGEBTN_CLICK:String = "ui.main.chat.sendmessage";
      
      public static const CHAT_MENU_CLICK:String = "CHAT_MENU_CLICK";
      
      public static const CHAT_ITEM_LINK_CLICK:String = "CHAT_ITEM_LINK_CLICK";
      
      public static const CHAT_ITEM_LINK_HIDE:String = "CHAT_ITEM_LINK_HIDE";
      
      public static const TASK_TRACK_ACCEPTEDLIST_CLICK:String = "TASK_TRACK_ACCEPTEDLIST_CLICK";
      
      public static const TASK_TRACK_ACCEPTABLELIST_CLICK:String = "TASK_TRACK_ACCEPTABLELIST_CLICK";
      
      public static const TASK_TRACK_CHENGJIU_CLICK:String = "TASK_TRACK_CHENGJIU_CLICK";
      
      public static const MAINUI_PK_MODEL_CHANGE:String = "MAINUI_PK_MODEL_CHANGE";
      
      public static const MAINUI_MAINCHAR_AUTO_BTN_CLICK:String = "MAINUI_MAINCHAR_AUTO_BTN_CLICK";
      
      public static const MAINUI_MAINCHAR_AUTO_VALUE_CHANGE:String = "MAINUI_MAINCHAR_AUTO_VALUE_CHANGE";
      
      public static const MAINUI_GIFT_BTN_CLICK:String = "MAINUI_GIFT_BTN";
      
      public static const MAINUI_GIFT_BOX_CLICK:String = "MAINUI_GIFT_BOX_CLICK";
      
      public static const MAINUI_TEAMMEMBERLIST_MOUSEOVER:String = "MAINUI_TEAMMEMBERLIST_MOUSEOVER";
      
      public static const MAINUI_TIMEGIFT_BTN_CLICK:String = "MAINUI_TIMEGIFT_BTN_CLICK";
      
      public static const MAINUI_CHARHEAD_HEAD_IMG_CHANGE:String = "MAINUI_CHARHEAD_HEAD_IMG_CHANGE";
      
      public static const MAINUI_KUAFU_GUIZHE_QUERY:String = "MAINUI_KUAFU_GUIZHE_QUERY";
      
      public static const MAINUI_KUAFU_LIKAI_CLICK:String = "MAINUI_KUAFU_LIKAI_CLICK";
      
      public static const MAINUI_KUAFU_LINE_SELECT:String = "MAINUI_KUAFU_LINE_SELECT";
      
      public static const MAINUI_PARTY_TASK_HUBIAO_CANCEL:String = "MAINUI_PARTY_TASK_HUBIAO_CANCEL";
      
      public static const MAINUI_ZHANDOULI_BTN_CLICK:String = "MAINUI_ZHANDOULI_BTN_CLICK";
      
      public static const MAINUI_SHISHIZHANKUANG_BTN_CLICK:String = "MAINUI_SHISHIZHANKUANG_BTN_CLICK";
      
      public static const MAINUI_WANFASHIYITU_BTN_CLICK:String = "MAINUI_WANFASHIYITU_BTN_CLICK";
      
      public static const MAINUI_JUBAOPEN_BTN_CLICK:String = "MAINUI_JUBAOPEN_BTN_CLICK";
      
      public static const MAINUI_XUNZHANGDUIHUAN_BTN_CLICK:String = "MAINUI_XUNZHANGDUIHUAN_BTN_CLICK";
      
      public static const MAINUI_SUISHENTANWEI_BTN_CLICK:String = "MAINUI_SUISHENTANWEI_BTN_CLICK";
      
      public static const MAINUI_FEIXING_BTN_CLICK:String = "MAINUI_FEIXING_BTN_CLICK";
      
      public static const MAINUI_QIANLIDIAN_GUIDE:String = "MAINUI_QIANLIDIAN_GUIDE";
      
      public static const MAINUI_JINENG_GUIDE:String = "MAINUI_JINENG_GUIDE";
      
      public static const MAINUI_SHUANG_GUIDE:String = "MAINUI_SHUANG_GUIDE";
      
      public static const MAINUI_JIANG_GUIDE:String = "MAINUI_JIANG_GUIDE";
      
      public static const MAINUI_CISHA_GUIDE:String = "MAINUI_CISHA_GUIDE";
      
      public static const MAINUI_FUCHOU_GUIDE:String = "MAINUI_FUCHOU_GUIDE";
      
      public static const MAINUI_GIRL_GUIDE:String = "MAINUI_GIRL_GUIDE";
      
      public static const MAINUI_AOJIANZHENGBA_LINE_SELECT:String = "MAINUI_AOJIANZHENGBA_LINE_SELECT";
      
      public static const MAINUI_KUAFUBAOGUO:String = "MAINUI_KUAFUBAOGUO";
      
      public static const UI_FUQIJINGJI_XIAZHU_CLICK:String = "UI_FUQIJINGJI_XIAZHU_CLICK";
      
      public static const UI_RETURN_FUQIJINGJI_CLICK:String = "UI_RETURN_FUQIJINGJI_CLICK";
      
      public static const MAINUI_WANBAOGE_YABAO_CLICK:String = "MAINUI_WANBAOGE_YABAO_CLICK";
      
      public static const MAINUI_TIAOYUE_DIGUN_CLICK:String = "MAINUI_TIAOYUE_DIGUN_CLICK";
      
      public static const FUNCTION_NEWYEAR_BTN_CLICK:String = "FUNCTION_NEWYEAR_BTN_CLICK";
      
      public static const FUNCTION_YURENJIE_BTN_CLICK:String = "FUNCTION_YURENJIE_BTN_CLICK";
      
      public static const FUNCTION_FENGZHENGJIE_BTN_CLICK:String = "FUNCTION_FENGZHENGJIE_BTN_CLICK";
      
      public static const FUNCTION_DOUDIZHU_BTN_CLICK:String = "FUNCTION_DOUDIZHU_BTN_CLICK";
      
      public static const FUNCTION_DUANWUJIE_BTN_CLICK:String = "FUNCTION_DUANWUJIE_BTN_CLICK";
      
      public static const FUNCTION_QIXIJIE_BTN_CLICK:String = "FUNCTION_QIXIJIE_BTN_CLICK";
      
      public static const FUNCTION_NEWYEAR_YASUIQIAN_BTN_CLICK:String = "FUNCTION_NEWYEAR_YASUIQIAN_BTN_CLICK";
      
      public static const WOHUCANGLONG_BTN_CLICK:String = "WOHUCANGLONG_BTN_CLICK";
      
      public static const MAINUI_FUHUO_BTN_CLICK:String = "MAINUI_FUHUO_BTN_CLICK";
      
      public static const MAINUI_XUNZHANG_ITEM_CLICK:String = "MAINUI_XUNZHANG_ITEM_CLICK";
      
      public static const FUNCTION_XIAOZHUKUAIPAO_BTN_CLICK:String = "FUNCTION_XIAOZHUKUAIPAO_BTN_CLICK";
      
      public static const FUNCTION_DUIXUEREN_BTN_CLICK:String = "FUNCTION_DUIXUEREN_BTN_CLICK";
      
      public static const FUNCTION_LONGFENGDANGPU_BTN_CLICK:String = "FUNCTION_LONGFENGDANGPU_BTN_CLICK";
      
      public static const DUIXUEREN_BTN_TIJIAO_CLICK:String = "DUIXUEREN_BTN_TIJIAO_CLICK";
      
      public static const FUNCTION_MOXUEZHANCHANG_BTN_CLICK:String = "FUNCTION_MOXUEZHANCHANG_BTN_CLICK";
      
      public static const FUNCTION_GUOSETIANXIANG_BTN_CLICK:String = "FUNCTION_GUOSETIANXIANG_BTN_CLICK";
      
      public static const FUNCTION_FULIHUODONG_BTN_CLICK:String = "FUNCTION_FULIHUODONG_BTN_CLICK";
      
      public static const FUNCTION_DUANWUJIE2015_BTN_CLICK:String = "FUNCTION_DUANWUJIE2015_BTN_CLICK";
      
      public static const YITIANTULONG_SHARENBANG_CLICK:String = "YITIANTULONG_SHARENBANG_CLICK";
      
      public static const YITIANTULONG_TUICHU_CLICK:String = "YITIANTULONG_TUICHU_CLICK";
      
      public static const HUASHANZHIDIANJIANGLI_CLOSE_CLICK:String = "HUASHANZHIDIANJIANGLI_CLOSE_CLICK";
      
      public static const BAGUAZHENMAINUI_PANEL_REQ:String = "BAGUAZHENMAINUI_PANEL_REQ";
      
      public static const BAGUAZHENMAINUI_PANEL_CLICK:String = "BAGUAZHENMAINUI_PANEL_CLICK";
      
      public static const MOSHOUZHANCHANG_LINGQU_CLICK:String = "MOSHOUZHANCHANG_LINGQU_CLICK";
      
      public static const MOSHOUZHANCHANG_FUHUO_CLICK:String = "MOSHOUZHANCHANG_FUHUO_CLICK";
      
      public static const FUNCTION_XIANMOZHILU_BTN_CLICK:String = "FUNCTION_XIANMOZHILU_BTN_CLICK";
      
      public var charContainer:CharHead;
      
      private var targetContainer:Target;
      
      private var buffContainer:Sprite;
      
      private var mapContainer:SmallMap;
      
      private var kuaFuLunJianContainer:KuaFuLunJianGuiZheCanvas;
      
      private var kuaFuLunJian3v3Container:KuaFuLunJian3v3GuiZheCanvas;
      
      private var teamContainer:TeamMemberList;
      
      private var afficheContainer:SysAfficheCanvas;
      
      private var defaultIcoTipContainer:IcoTipCanvas;
      
      private var comboContainer:Combo;
      
      public var taskContainer:TaskTrack;
      
      public var imageLeadContainer:Sprite;
      
      public var chatContainer:Chat;
      
      private var giftTipContainer:Sprite;
      
      private var sysIcoTipContainer:IcoTipCanvas;
      
      private var sysTipsContainer:SysTipCanvas;
      
      private var concernmentIcoTipContainer:Sprite;
      
      private var levelTipContainer:LevelTipCanvas;
      
      private var jianMianYouLiContainer:JianMianYouLiCanvas_mainui;
      
      public var functionContainer:FunctionBar;
      
      public var biwudahuiContainer:MainBiwuDahuiCanvas;
      
      public var baoshijianshangContainer:MainBaoShiJianShangCanvas;
      
      public var zunrongWanbaogeFunctionContainer:WanbaogeFunctionBar;
      
      private var fuHuoBtn:FSimpleButton;
      
      public var skillBar:SkillLevelBar;
      
      private var yitiantulong:YiTianTuLongBang;
      
      private var lianzhanSpr:Sprite;
      
      private var lianzhanArr:Array = [];
      
      private var lianzhanBg:DisplayObject;
      
      private var stratTime:int;
      
      private var zhunbeiSpr:Sprite;
      
      private var time2:int;
      
      private var stratTime2:int;
      
      private var zhunbeiBg:DisplayObject;
      
      private var tiaozhanSpr:Sprite;
      
      private var time3:int;
      
      private var stratTime3:int;
      
      private var tiaozhanBg:DisplayObject;
      
      public var huashanzhidianjiangliContainer:HuaShanZhiDianJiangLi;
      
      private var chengfajinggaoPanel:ChengfajinggaoPanel;
      
      public var effBox:Sprite;
      
      private var duiXueRen:DuiXueRen_MapXueRen;
      
      private var chongZhiJiangLi:*;
      
      private var zhengbaList:RankPanel;
      
      private var christmasRank:ChristmasRankCanvas;
      
      private var chenmiSprite:FangChenMiSprite;
      
      private var chenmiTips:FangChenMiTips;
      
      private var dantiaowangList:DTWRankPanel;
      
      private var fuqiJingjiTouzhuContainer:FuqiJingjiTouzhuPanel;
      
      private var fuqiJingjiResultContaier:FuqiJingjiResultPanel;
      
      private var fuqiJingjiVSContainer:FuqiJingjiVSPanel;
      
      private var kulou:DisplayObject;
      
      private var zhengguMC:MovieClip;
      
      private var shijianshalouBrn:NewSkinButton;
      
      private var timeFt:FTextArea;
      
      private var time4:int;
      
      private var stratTime4:int;
      
      private var time:int;
      
      private var baGuaZhenMainUIPanel:BaGuaZhenMainPanel;
      
      private var moShouZhanChangJiangLi:MoShouZhanChangJiangLiPanel;
      
      private var moShouZhanChangFuHuo:MoShouZhanChangFuHuoPanel;
      
      private var moShouZhanChangYanShi:MoShouZhanChangYanShiView;
      
      private var kuafuLineSelect:KuaFuLineSelectCanvas;
      
      private var zhengbaLineSelect:AojianZhengbaSelectCanvas;
      
      private var danTiaoWangShuomingPanel:DanTiaoWangShuomingPanel;
      
      public var window:Sprite = new Sprite();
      
      private var currBaGuaZhenMainUIPanelType:Boolean = true;
      
      public function MainUI()
      {
         super();
         this.initUI();
      }
      
      private function initUI() : void
      {
         this.initBuffUI();
         this.initMapUI();
         this.initTeamUI();
         this.initAfficheUI();
         this.initDefaultIcoTipUI();
         this.initComboUI();
         this.initTaskUI();
         this.initChatUI();
         this.initGiftTipUI();
         this.initSysTipsUI();
         this.initConcernmentIcoTipUI();
         this.initCharUI();
         this.initTargetUI();
         this.initFunctionUI();
         this.initZhengbaUI();
         this.initChristmasRankUI();
         this.initDanTiaoWangUI();
         this.levelTipContainer = new LevelTipCanvas();
         this.sysIcoTipContainer = new IcoTipCanvas();
         this.sysIcoTipContainer.snapType = IcoTipCanvas.TYPE_RIGHT;
         this.sysIcoTipContainer.stratX = -500;
         addChild(this.sysIcoTipContainer);
         this.imageLeadContainer = new Sprite();
         addChild(this.imageLeadContainer);
         this.initChenmiUI();
         this.initFuqijingjiTouzhuUI();
         this.initFuqijingjiVSUI();
         this.initZunrongWanbaogeFunctionUI();
         this.initBaGuaZhenMainUIPanel();
         this.initYiTianTuLongUI();
         this.initLianZhanUI();
         this.initZhunBeiUI();
         this.initChengFaJingGaoPanel();
         this.skillBar = new SkillLevelBar();
         this.skillBar.visible = false;
         addChild(this.skillBar);
         this.initShiJianShaLouBtnUI();
         this.effBox = new Sprite();
         this.effBox.mouseChildren = false;
         this.effBox.mouseEnabled = false;
         addChild(this.effBox);
      }
      
      private function initZhengbaUI() : void
      {
         this.zhengbaList = new RankPanel();
         addChild(this.zhengbaList);
         this.zhengbaList.visible = false;
      }
      
      private function initChristmasRankUI() : void
      {
         this.christmasRank = new ChristmasRankCanvas();
         addChild(this.christmasRank);
         this.christmasRank.visible = false;
      }
      
      private function initDanTiaoWangUI() : void
      {
         this.dantiaowangList = new DTWRankPanel();
         addChild(this.dantiaowangList);
         this.dantiaowangList.visible = false;
      }
      
      private function initCharUI() : void
      {
         this.charContainer = new CharHead();
         addChild(this.charContainer);
      }
      
      private function initTargetUI() : void
      {
         this.targetContainer = new Target();
         addChild(this.targetContainer);
      }
      
      private function initBuffUI() : void
      {
         this.buffContainer = new Sprite();
         addChild(this.buffContainer);
      }
      
      private function initMapUI() : void
      {
         this.mapContainer = new SmallMap();
         addChild(this.mapContainer);
      }
      
      private function initTeamUI() : void
      {
         this.teamContainer = new TeamMemberList();
         this.teamContainer.$parent = this;
         addChild(this.teamContainer);
      }
      
      private function initAfficheUI() : void
      {
         this.afficheContainer = new SysAfficheCanvas();
         addChild(this.afficheContainer);
      }
      
      private function initDefaultIcoTipUI() : void
      {
         this.defaultIcoTipContainer = new IcoTipCanvas();
         this.defaultIcoTipContainer.stratX = -500;
         this.defaultIcoTipContainer.snapType = IcoTipCanvas.TYPE_CENTER;
         addChild(this.defaultIcoTipContainer);
      }
      
      private function initComboUI() : void
      {
         this.comboContainer = new Combo();
         addChild(this.comboContainer);
      }
      
      private function initTaskUI() : void
      {
         this.taskContainer = new TaskTrack();
         addChild(this.taskContainer);
      }
      
      private function initChatUI() : void
      {
         this.chatContainer = new Chat();
         this.chatContainer.$parent = this;
         addChild(this.chatContainer);
      }
      
      private function initGiftTipUI() : void
      {
         this.giftTipContainer = new Sprite();
         addChild(this.giftTipContainer);
      }
      
      private function initSysTipsUI() : void
      {
         this.sysTipsContainer = new SysTipCanvas();
         addChild(this.sysTipsContainer);
      }
      
      private function initConcernmentIcoTipUI() : void
      {
         this.concernmentIcoTipContainer = new Sprite();
         addChild(this.concernmentIcoTipContainer);
      }
      
      private function initFunctionUI() : void
      {
         this.functionContainer = new FunctionBar();
         addChild(this.functionContainer);
         this.functionContainer.$parent = this;
      }
      
      private function initChenmiUI() : void
      {
         this.chenmiSprite = new FangChenMiSprite();
         addChild(this.chenmiSprite);
         this.chenmiSprite.visible = true;
      }
      
      private function initFuqijingjiTouzhuUI() : void
      {
         this.fuqiJingjiTouzhuContainer = new FuqiJingjiTouzhuPanel();
         addChild(this.fuqiJingjiTouzhuContainer);
         this.fuqiJingjiTouzhuContainer.setParent = this;
         this.fuqiJingjiTouzhuContainer.visible = false;
      }
      
      private function initFuqijingjiVSUI() : void
      {
         this.fuqiJingjiVSContainer = new FuqiJingjiVSPanel();
         addChild(this.fuqiJingjiVSContainer);
         this.fuqiJingjiVSContainer.visible = false;
      }
      
      private function initZunrongWanbaogeFunctionUI() : void
      {
         this.zunrongWanbaogeFunctionContainer = new WanbaogeFunctionBar();
         addChild(this.zunrongWanbaogeFunctionContainer);
         this.zunrongWanbaogeFunctionContainer._parent = this;
         this.zunrongWanbaogeFunctionContainer.visible = false;
      }
      
      private function initBaGuaZhenMainUIPanel() : void
      {
         this.baGuaZhenMainUIPanel = new BaGuaZhenMainPanel();
         addChild(this.baGuaZhenMainUIPanel);
         this.baGuaZhenMainUIPanel.$parent = this;
      }
      
      public function initShengxiaofubenRight() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.shengxiaoRightSpr))
         {
            GameInstance.uiInstance.shengxiaoRightSpr.x = GameConfig.sceneWidth - GameInstance.uiInstance.shengxiaoRightSpr.width;
            GameInstance.uiInstance.shengxiaoRightSpr.y = 188;
            addChild(GameInstance.uiInstance.shengxiaoRightSpr);
         }
      }
      
      private function initYiTianTuLongUI() : void
      {
         this.yitiantulong = new YiTianTuLongBang();
         addChild(this.yitiantulong);
         this.yitiantulong.$parent = this;
         this.yitiantulong.visible = false;
      }
      
      private function initLianZhanUI() : void
      {
         this.lianzhanSpr = new Sprite();
         addChild(this.lianzhanSpr);
         this.lianzhanSpr.visible = false;
         this.lianzhanArr = new Array();
      }
      
      private function initZhunBeiUI() : void
      {
         this.zhunbeiSpr = new Sprite();
         addChild(this.zhunbeiSpr);
         this.zhunbeiSpr.visible = false;
      }
      
      private function initChengFaJingGaoPanel() : void
      {
         if(!this.chengfajinggaoPanel)
         {
            this.chengfajinggaoPanel = new ChengfajinggaoPanel();
         }
         if(!Fun.isVisible(this.chengfajinggaoPanel))
         {
            UITools.showPanel(this.chengfajinggaoPanel);
         }
      }
      
      public function setXiaoZhuKuaiPaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setXiaoZhuKuaiPaoBtnVisible(param1);
      }
      
      public function setDuiXueRenBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setDuiXueRenBtnVisible(param1);
      }
      
      public function setYNshierdizhiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNshierdizhiBtnVisible(param1);
      }
      
      public function setYN201638huodongBtnBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYN201638huodongBtnBtnVisible(param1);
      }
      
      public function setYN201638huodong1BtnBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYN201638huodong1BtnBtnVisible(param1);
      }
      
      public function setYN2016CGVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016CGVisible(param1);
      }
      
      public function setYN2016DLVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016DLVisible(param1);
      }
      
      public function setYN2016OnlineVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016OnlineVisible(param1);
      }
      
      public function setYN2016newyearVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016newyearVisible(param1);
      }
      
      public function setYN2016YNzhuanpanBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016YNzhuanpanBtnVisible(param1);
      }
      
      public function setYNchongzhidafaBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNchongzhidafaBtnVisible(param1);
      }
      
      public function setYNbaimeiguiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNbaimeiguiBtnVisible(param1);
      }
      
      public function setYNXSKSBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXSKSBtnVisible(param1);
      }
      
      public function setYNSBBKSYBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNSBBKSYBtnVisible(param1);
      }
      
      public function setYNzmqzBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNzmqzBtnVisible(param1);
      }
      
      public function setYNwzzbBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNwzzbBtnVisible(param1);
      }
      
      public function setYNASSLBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNASSLBtnVisible(param1);
      }
      
      public function setYNDDSQBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNDDSQBtnVisible(param1);
      }
      
      public function setYNWZWZBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWZWZBtnVisible(param1);
      }
      
      public function setYNXFBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXFBtnVisible(param1);
      }
      
      public function setYNBHBtnVisible(param1:Boolean) : void
      {
      }
      
      public function setLongFengDangPuBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setLongFengDangPuBtnVisible(param1);
      }
      
      public function setYNXWHDVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXWHDVisible(param1);
      }
      
      public function setYNXFHDVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXFHDVisible(param1);
      }
      
      public function setYNWSZLVisible(param1:Boolean) : void
      {
      }
      
      public function setXLHTVisible(param1:Boolean) : void
      {
         this.charContainer.setXLHTVisible(param1);
      }
      
      public function setOZZQVisible(param1:Boolean) : void
      {
         this.charContainer.setOZZQVisible(param1);
      }
      
      public function setRTJVisible(param1:Boolean) : void
      {
         this.charContainer.setRTJVisible(param1);
      }
      
      public function setYNXianHeZhanGongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXianHeZhanGongVisible(param1);
      }
      
      public function setYN2016JieFangRiVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016JieFangRiVisible(param1);
      }
      
      public function setYN2016WuYiVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016WuYiVisible(param1);
      }
      
      public function setYN2016YouHuiVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016YouHuiVisible(param1);
      }
      
      public function setYN2016519YouHuiVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016519YouHuiVisible(param1);
      }
      
      public function setYN2016cjqhVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016cjqhVisible(param1);
      }
      
      public function setYN201661Visible(param1:Boolean) : void
      {
         this.charContainer.setYN201661Visible(param1);
      }
      
      public function setYN2016WSZLVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWSZLVisible(param1);
      }
      
      public function setOZZQ2Visible(param1:Boolean) : void
      {
         this.charContainer.setOZZQ2Visible(param1);
      }
      
      public function setMiemifengVisible(param1:Boolean) : void
      {
         this.charContainer.setMiemifengVisible(param1);
      }
      
      public function setYNDuanwujieVisible(param1:Boolean) : void
      {
         this.charContainer.setYNDuanwujieVisible(param1);
      }
      
      public function setYNBifangchushiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNBifangchushiVisible(param1);
      }
      
      public function setYNMeitianyouhui2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNMeitianyouhui2Visible(param1);
      }
      
      public function setYNSuperStrongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNSuperStrongVisible(param1);
      }
      
      public function setYN2016ZuqiuVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2016ZuqiuVisible(param1);
      }
      
      public function setYNqiseyiseVisible(param1:Boolean) : void
      {
         this.charContainer.setYNQiseyiseVisible(param1);
      }
      
      public function setYNZhienVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhienVisible(param1);
      }
      
      public function setYNZhuilongxueshaVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhuilongxueshaVisible(param1);
      }
      
      public function setYNLongjingzhibaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNLongjingzhibaoVisible(param1);
      }
      
      public function setYNZhengdouVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhengdouVisible(param1);
      }
      
      public function setYNWuzhuanghuzhuVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWuzhuanghuzhuVisible(param1);
      }
      
      public function setYNKaizhanVisible(param1:Boolean) : void
      {
         this.charContainer.setYNKaizhanVisible(param1);
      }
      
      public function setYNWangbangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWangbangVisible(param1);
      }
      
      public function setYNSongmanxinaiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNSongmanxinaiVisible(param1);
      }
      
      public function setYNXiatiankuaileVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXiatiankuaileVisible(param1);
      }
      
      public function setYNXiatiankuaile2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNXiatiankuaile2Visible(param1);
      }
      
      public function setYNXiatiankuaile3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNXiatiankuaile3Visible(param1);
      }
      
      public function setYNXiatiankuaile4Visible(param1:Boolean) : void
      {
         this.charContainer.setYNXiatiankuaile4Visible(param1);
      }
      
      public function setYNHuangrugeshiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNHuangrugeshiVisible(param1);
      }
      
      public function setYNSilingdazhanVisible(param1:Boolean) : void
      {
         this.charContainer.setYNSilingdazhanVisible(param1);
      }
      
      public function setYNDazaoshenbingVisible(param1:Boolean) : void
      {
         this.charContainer.setYNDazaoshenbingVisible(param1);
      }
      
      public function setYNTiandinghunpoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNTiandinghunpoVisible(param1);
      }
      
      public function setYNLongjinglibaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNLongjinglibaoVisible(param1);
      }
      
      public function setYNZongjuesaiduihuanVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZongjuesaiduihuanVisible(param1);
      }
      
      public function setYNZhouqicailuVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhouqicailuVisible(param1);
      }
      
      public function setYNGaoshouwushuangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNGaoshouwushuangVisible(param1);
      }
      
      public function setYNShengzhanshiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNShengzhanshiVisible(param1);
      }
      
      public function setYNLiehuoshengxieVisible(param1:Boolean) : void
      {
         this.charContainer.setYNLiehuoshengxieVisible(param1);
      }
      
      public function setYNWujuegongfaVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWujuegongfaVisible(param1);
      }
      
      public function setYNShenmiliwuVisible(param1:Boolean) : void
      {
         this.charContainer.setYNShenmiliwuVisible(param1);
      }
      
      public function setYNhunqianmengVisible(param1:Boolean) : void
      {
         this.charContainer.setYNhunqianmengVisible(param1);
      }
      
      public function setYNlexinchujiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNlexinchujiVisible(param1);
      }
      
      public function setYNZhouyihuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhouyihuodongVisible(param1);
      }
      
      public function setYNZhouerhuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhouerhuodongVisible(param1);
      }
      
      public function setYNZhouerhuodong2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNZhouerhuodong2Visible(param1);
      }
      
      public function setYNZhousanhuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhousanhuodongVisible(param1);
      }
      
      public function setYNZhousihuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhousihuodongVisible(param1);
      }
      
      public function setYNzhouwuhuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNzhouwuhuodongVisible(param1);
      }
      
      public function setYNZhouliuhuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhouliuhuodongVisible(param1);
      }
      
      public function setYNZhourihuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhourihuodongVisible(param1);
      }
      
      public function setYNmeiriyouhui3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNmeiriyouhui3Visible(param1);
      }
      
      public function setYNyulanhejieVisible(param1:Boolean) : void
      {
         this.charContainer.setYNyulanhejieVisible(param1);
      }
      
      public function setYNJingsuidongxiaVisible(param1:Boolean) : void
      {
         this.charContainer.setYNJingsuidongxiaVisible(param1);
      }
      
      public function setYNKaizhenyuanVisible(param1:Boolean) : void
      {
         this.charContainer.setYNKaizhenyuanVisible(param1);
      }
      
      public function setYNKaizhenyuan3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNKaizhenyuan3Visible(param1);
      }
      
      public function setYNQiziquanzhenjiaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNQiziquanzhenjiaoVisible(param1);
      }
      
      public function setYNBayuediVisible(param1:Boolean) : void
      {
         this.charContainer.setYNBayuediVisible(param1);
      }
      
      public function setYNXianglongjingVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXianglongjingVisible(param1);
      }
      
      public function setYNQijianyingxiongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNQijianyingxiongVisible(param1);
      }
      
      public function setYNGuoqinghuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNGuoqinghuodongVisible(param1);
      }
      
      public function setYNPaihangbangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNPaihangbangVisible(param1);
      }
      
      public function setYNYingxiongshijianVisible(param1:Boolean) : void
      {
         this.charContainer.setYNYingxiongshijianVisible(param1);
      }
      
      public function setYNChongjiuzhiyangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNChongjiuzhiyangVisible(param1);
      }
      
      public function setYNYuelungujiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNYuelungujiVisible(param1);
      }
      
      public function setYNXiangyangyueseVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXiangyangyueseVisible(param1);
      }
      
      public function setYNQunyingquhuiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNQunyingquhuiVisible(param1);
      }
      
      public function setYNWushenVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWushenVisible(param1);
      }
      
      public function setYNWushen2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNWushen2Visible(param1);
      }
      
      public function setYNXichuanhongmianbaihuapaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXichuanhongmianbaihuapaoVisible(param1);
      }
      
      public function setYNShenmilibaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNShenmilibaoVisible(param1);
      }
      
      public function setYNKaizhenyuan2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNKaizhenyuan2Visible(param1);
      }
      
      public function setYNWangzhezhengxiongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWangzhezhengxiongVisible(param1);
      }
      
      public function setYNZhongjizuoqishendanVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhongjizuoqishendanVisible(param1);
      }
      
      public function setYNZhongjizuoqishendan2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNZhongjizuoqishendan2Visible(param1);
      }
      
      public function setYNZuoqipeichangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZuoqipeichangVisible(param1);
      }
      
      public function setYNWangbangchuzhanVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWangbangchuzhanVisible(param1);
      }
      
      public function setYNWeixilibaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWeixilibaoVisible(param1);
      }
      
      public function setYNJiuyuediVisible(param1:Boolean) : void
      {
         this.charContainer.setYNJiuyuediVisible(param1);
      }
      
      public function setYNQiongjinzhanyiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNQiongjinzhanyiVisible(param1);
      }
      
      public function setYNFanliVisible(param1:Boolean) : void
      {
         this.charContainer.setYNFanliVisible(param1);
      }
      
      public function setYNFuqitongxinVisible(param1:Boolean) : void
      {
         this.charContainer.setYNFuqitongxinVisible(param1);
      }
      
      public function setYNSilongtianzhuaVisible(param1:Boolean) : void
      {
         this.charContainer.setYNSilongtianzhuaVisible(param1);
      }
      
      public function setYNWuseduohuaVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWuseduohuaVisible(param1);
      }
      
      public function setYNYuenanfunvjieVisible(param1:Boolean) : void
      {
         this.charContainer.setYNYuenanfunvjieVisible(param1);
      }
      
      public function setYNLonghunVisible(param1:Boolean) : void
      {
         this.charContainer.setYNLonghunVisible(param1);
      }
      
      public function setYNLonghun2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNLonghun2Visible(param1);
      }
      
      public function setYNLonghun3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNLonghun3Visible(param1);
      }
      
      public function setYNZhanjipiaodangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhanjipiaodangVisible(param1);
      }
      
      public function setYNAojianwunianVisible(param1:Boolean) : void
      {
         this.charContainer.setYNAojianwunianVisible(param1);
      }
      
      public function setYNTianmajianVisible(param1:Boolean) : void
      {
         this.charContainer.setYNTianmajianVisible(param1);
      }
      
      public function setYNWunianzhimengVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWunianzhimengVisible(param1);
      }
      
      public function setYNWunianzhienVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWunianzhienVisible(param1);
      }
      
      public function setYNTianmidangaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNTianmidangaoVisible(param1);
      }
      
      public function setYNShengrizhoujiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNShengrizhoujiVisible(param1);
      }
      
      public function setYNWujinkuaileVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWujinkuaileVisible(param1);
      }
      
      public function setYNBaguaiwushendunVisible(param1:Boolean) : void
      {
         this.charContainer.setYNBaguaiwushendunVisible(param1);
      }
      
      public function setYNTupowugongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNTupowugongVisible(param1);
      }
      
      public function setYNLiupaijingjiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNLiupaijingjiVisible(param1);
      }
      
      public function setYNLiumaijianVisible(param1:Boolean) : void
      {
         this.charContainer.setYNLiumaijianVisible(param1);
      }
      
      public function setYNXunshixuedaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXunshixuedaoVisible(param1);
      }
      
      public function setYNYidazunshiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNYidazunshiVisible(param1);
      }
      
      public function setYNYingbinzhouliVisible(param1:Boolean) : void
      {
         this.charContainer.setYNYingbinzhouliVisible(param1);
      }
      
      public function setYNWangzheVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWangzheVisible(param1);
      }
      
      public function setYNZhouwuguangliangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhouwuguangliangVisible(param1);
      }
      
      public function setYNWuhunjianVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWuhunjianVisible(param1);
      }
      
      public function setYNDingfengshenshouVisible(param1:Boolean) : void
      {
         this.charContainer.setYNDingfengshenshouVisible(param1);
      }
      
      public function setYNTianxiangwangzheVisible(param1:Boolean) : void
      {
         this.charContainer.setYNTianxiangwangzheVisible(param1);
      }
      
      public function setYNQisehuluVisible(param1:Boolean) : void
      {
         this.charContainer.setYNQisehuluVisible(param1);
      }
      
      public function setYNBansuizuqiuduiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNBansuizuqiuduiVisible(param1);
      }
      
      public function setYNDingfengzhouqiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNDingfengzhouqiVisible(param1);
      }
      
      public function setYNZhentianshenqiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhentianshenqiVisible(param1);
      }
      
      public function setYNLongjingzhangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNLongjingzhangVisible(param1);
      }
      
      public function setYNFeilongjingVisible(param1:Boolean) : void
      {
         this.charContainer.setYNFeilongjingVisible(param1);
      }
      
      public function setYNFeilongjing2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNFeilongjing2Visible(param1);
      }
      
      public function setYNFeilongjing3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNFeilongjing3Visible(param1);
      }
      
      public function setYNBanjuesailingjiangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNBanjuesailingjiangVisible(param1);
      }
      
      public function setYNXunzhaobaozangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXunzhaobaozangVisible(param1);
      }
      
      public function setYNJingxijinpiaodaliVisible(param1:Boolean) : void
      {
         this.charContainer.setYNJingxijinpiaodaliVisible(param1);
      }
      
      public function setYNZhentianjiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhentianjiVisible(param1);
      }
      
      public function setYNHuashanlunjianVisible(param1:Boolean) : void
      {
         this.charContainer.setYNHuashanlunjianVisible(param1);
      }
      
      public function setYNShengdanjieVisible(param1:Boolean) : void
      {
         this.charContainer.setYNShengdanjieVisible(param1);
      }
      
      public function setYNShengdanjinpiaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNShengdanjinpiaoVisible(param1);
      }
      
      public function setYNTianxueshenbingVisible(param1:Boolean) : void
      {
         this.charContainer.setYNTianxueshenbingVisible(param1);
      }
      
      public function setYNHuashanwuzhangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNHuashanwuzhangVisible(param1);
      }
      
      public function setYNTaohuajiuVisible(param1:Boolean) : void
      {
         this.charContainer.setYNTaohuajiuVisible(param1);
      }
      
      public function setYNTaohuajiu2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNTaohuajiu2Visible(param1);
      }
      
      public function setYNTaohuajiu3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNTaohuajiu3Visible(param1);
      }
      
      public function setYNKaichunwanfuVisible(param1:Boolean) : void
      {
         this.charContainer.setYNKaichunwanfuVisible(param1);
      }
      
      public function setYNXinnianlibaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXinnianlibaoVisible(param1);
      }
      
      public function setYNXianglongchaojiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXianglongchaojiVisible(param1);
      }
      
      public function setYNXianglongchaoji2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNXianglongchaoji2Visible(param1);
      }
      
      public function setYNXianglongchaoji3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNXianglongchaoji3Visible(param1);
      }
      
      public function setYNZhenbaogeVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZhenbaogeVisible(param1);
      }
      
      public function setYNTengtianyuVisible(param1:Boolean) : void
      {
         this.charContainer.setYNTengtianyuVisible(param1);
      }
      
      public function setYNTengtianyu2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNTengtianyu2Visible(param1);
      }
      
      public function setYNWeiyongwushuangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWeiyongwushuangVisible(param1);
      }
      
      public function setYNWujinjindingriVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWujinjindingriVisible(param1);
      }
      
      public function setYNWujinjindingri2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNWujinjindingri2Visible(param1);
      }
      
      public function setYNWujinjindingri3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNWujinjindingri3Visible(param1);
      }
      
      public function setYNXinnianyasuiqianVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXinnianyasuiqianVisible(param1);
      }
      
      public function setYNZaowangVisible(param1:Boolean) : void
      {
         this.charContainer.setYNZaowangVisible(param1);
      }
      
      public function setYNFangyanhuaVisible(param1:Boolean) : void
      {
         this.charContainer.setYNFangyanhuaVisible(param1);
      }
      
      public function setBtnChuYiErSanVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnChuYiErSanVisible(param1);
      }
      
      public function setYNXiongjiquanVisible(param1:Boolean) : void
      {
         this.charContainer.setYNXiongjiquanVisible(param1);
      }
      
      public function setYNChunjieduilianVisible(param1:Boolean) : void
      {
         this.charContainer.setYNChunjieduilianVisible(param1);
      }
      
      public function setYNGaishishenlongVisible(param1:Boolean) : void
      {
         this.charContainer.setYNGaishishenlongVisible(param1);
      }
      
      public function setYNGuguchengqinVisible(param1:Boolean) : void
      {
         this.charContainer.setYNGuguchengqinVisible(param1);
      }
      
      public function setYNYuanyangxishuiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNYuanyangxishuiVisible(param1);
      }
      
      public function setYNTianyuchanVisible(param1:Boolean) : void
      {
         this.charContainer.setYNTianyuchanVisible(param1);
      }
      
      public function setYNTianshenshiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNTianshenshiVisible(param1);
      }
      
      public function setYNQixingzhuangbeiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNQixingzhuangbeiVisible(param1);
      }
      
      public function setYNLingDanZhenPinVisible(param1:Boolean) : void
      {
         this.charContainer.setYNLingDanZhenPinVisible(param1);
      }
      
      public function setYNLingDanZhenPin2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNLingDanZhenPin2Visible(param1);
      }
      
      public function setYNLingDanZhenPin3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNLingDanZhenPin3Visible(param1);
      }
      
      public function setYNErYueDiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNErYueDiVisible(param1);
      }
      
      public function setYNXiangYangDuiJue1Visible(param1:Boolean) : void
      {
         this.charContainer.setYNXiangYangDuiJue1Visible(param1);
      }
      
      public function setYNXiangYangDuiJue2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNXiangYangDuiJue2Visible(param1);
      }
      
      public function setYNXiangYangDuiJue3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNXiangYangDuiJue3Visible(param1);
      }
      
      public function setYNWuJinJianVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWuJinJianVisible(param1);
      }
      
      public function setYNYingXiongChuBaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNYingXiongChuBaoVisible(param1);
      }
      
      public function setMoXueBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setMoXueBtnVisible(param1);
      }
      
      public function setGuoSeTianXiangBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setGuoSeTianXiangBtnVisible(param1);
      }
      
      public function setWudushengzhenBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWudushengzhenBtnVisible(param1);
      }
      
      public function setJiangHunBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setJiangHunBtnVisible(param1);
      }
      
      public function setJueshijiaren1BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setJueshijiaren1BtnVisible(param1);
      }
      
      public function setJueshijiaren2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setJueshijiaren2BtnVisible(param1);
      }
      
      public function setJueshijiaren3BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setJueshijiaren3BtnVisible(param1);
      }
      
      public function setAiqingtangguoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setAiqingtangguoBtnVisible(param1);
      }
      
      public function setAidehuibaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setAidehuibaoBtnVisible(param1);
      }
      
      public function setZhongyuanbaobiaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setZhongyuanbaobiaoBtnVisible(param1);
      }
      
      public function setTiandaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setTiandaoBtnVisible(param1);
      }
      
      public function setZhuixunxianglongBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setZhuixunxianglongBtnVisible(param1);
      }
      
      public function setYouhuizhouqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYouhuizhouqiBtnVisible(param1);
      }
      
      public function setYNSanYueDiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNSanYueDiVisible(param1);
      }
      
      public function setOuleBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setOuleBtnVisible(param1);
      }
      
      public function setYurenjieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYurenjieBtnVisible(param1);
      }
      
      public function setXiongwangdaliBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setXiongwangdaliBtnVisible(param1);
      }
      
      public function setYNShenghuoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNShenghuoVisible(param1);
      }
      
      public function setYNShenfengVisible(param1:Boolean) : void
      {
         this.charContainer.setYNShenfengVisible(param1);
      }
      
      public function setYNWulinzhibaoVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWulinzhibaoVisible(param1);
      }
      
      public function setYNWangzhezhibang5Visible(param1:Boolean) : void
      {
         this.charContainer.setYNWangzhezhibang5Visible(param1);
      }
      
      public function setYNBumiezhuqueVisible(param1:Boolean) : void
      {
         this.charContainer.setYNBumiezhuqueVisible(param1);
      }
      
      public function setYNJingyingjuhuiVisible(param1:Boolean) : void
      {
         this.charContainer.setYNJingyingjuhuiVisible(param1);
      }
      
      public function setYNKaizhan5Visible(param1:Boolean) : void
      {
         this.charContainer.setYNKaizhan5Visible(param1);
      }
      
      public function setDuanWuJie2015BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setDuanWuJie2015BtnVisible(param1);
      }
      
      public function setQuanlongBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setQuanlongBtnVisible(param1);
      }
      
      public function setWulinmijiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWulinmijiBtnVisible(param1);
      }
      
      public function setTianshizhouqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setTianshizhouqiBtnVisible(param1);
      }
      
      public function setSiyuediBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setSiyuediBtnVisible(param1);
      }
      
      public function setZhanshenzhongyuanBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setZhanshenzhongyuanBtnVisible(param1);
      }
      
      public function setDajieyouhuiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setDajieyouhuiBtnVisible(param1);
      }
      
      public function setNantianhaoqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNantianhaoqiBtnVisible(param1);
      }
      
      public function setRongguangBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setRongguangBtnVisible(param1);
      }
      
      public function setBaGuaZhenBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setBaGuaZhenBtnVisible(param1);
      }
      
      public function setBaGuaZhenMainMenuUIVisible(param1:Boolean) : void
      {
         this.baGuaZhenMainUIPanel.visible = param1;
      }
      
      public function setZhenpinShangchengBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setZhenpinShangchengBtnVisible(param1);
      }
      
      public function setJuezhanShangchengBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setJuezhanShangchengBtnVisible(param1);
      }
      
      public function setFodanBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setFodanBtnVisible(param1);
      }
      
      public function setWulindazhanBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWulindazhanBtnVisible(param1);
      }
      
      public function setYXMingchengBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYXMingchengBtnVisible(param1);
      }
      
      public function setWandulingBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWandulingBtnVisible(param1);
      }
      
      public function setJianghuluwuBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setJianghuluwuBtnVisible(param1);
      }
      
      public function setWuduBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWuduBtnVisible(param1);
      }
      
      public function setDuijuezhouqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setDuijuezhouqiBtnVisible(param1);
      }
      
      public function set0519BtnVisible(param1:Boolean) : void
      {
         this.charContainer.set0519BtnVisible(param1);
      }
      
      public function setErtongjieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setErtongjieBtnVisible(param1);
      }
      
      public function setTangmenjuejiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setTangmenjuejiBtnVisible(param1);
      }
      
      public function setLianbaojianBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setLianbaojianBtnVisible(param1);
      }
      
      public function setJianshexiangyangBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setJianshexiangyangBtnVisible(param1);
      }
      
      public function setKuangbaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setKuangbaoBtnVisible(param1);
      }
      
      public function setDianfengzhouqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setDianfengzhouqiBtnVisible(param1);
      }
      
      public function setQingzhuBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setQingzhuBtnVisible(param1);
      }
      
      public function setMeitianyouhuiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setMeitianyouhuiBtnVisible(param1);
      }
      
      public function setShenfengBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShenfengBtnVisible(param1);
      }
      
      public function setZhenpinShangcheng2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setZhenpinShangcheng2BtnVisible(param1);
      }
      
      public function setJuezhanShangcheng2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setJuezhanShangcheng2BtnVisible(param1);
      }
      
      public function setMeitianyouhui2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setMeitianyouhui2BtnVisible(param1);
      }
      
      public function setShiJianShaLouBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShiJianShaLouBtnVisible(param1);
      }
      
      public function setHuoyueBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setHuoyueBtnVisible(param1);
      }
      
      public function setWudushengzhen1BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWudushengzhen1BtnVisible(param1);
      }
      
      public function setWudushengzhen2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWudushengzhen2BtnVisible(param1);
      }
      
      public function setTengtianyu3BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setTengtianyu3BtnVisible(param1);
      }
      
      public function setJinye1BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setJinye1BtnVisible(param1);
      }
      
      public function setLiuyueyuanmanBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setLiuyueyuanmanBtnVisible(param1);
      }
      
      public function setLiuyueqingzhuVisible(param1:Boolean) : void
      {
         this.charContainer.setLiuyueqingzhuVisible(param1);
      }
      
      public function setFangfengzheng170621Visible(param1:Boolean) : void
      {
         this.charContainer.setFangfengzheng170621Visible(param1);
      }
      
      public function setLiuyuediVisible(param1:Boolean) : void
      {
         this.charContainer.setLiuyuediVisible(param1);
      }
      
      public function setChewuquanVisible(param1:Boolean) : void
      {
         this.charContainer.setChewuquanVisible(param1);
      }
      
      public function setWudushengzhen3BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWudushengzhen3BtnVisible(param1);
      }
      
      public function setWudushengzhen4BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWudushengzhen4BtnVisible(param1);
      }
      
      public function setWudushengzhen5BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWudushengzhen5BtnVisible(param1);
      }
      
      public function setWudushengzhen6BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWudushengzhen6BtnVisible(param1);
      }
      
      public function setMeitianchongzhilibaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setMeitianchongzhilibaoBtnVisible(param1);
      }
      
      public function setShenshougumuBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShenshougumuBtnVisible(param1);
      }
      
      public function setFeilongshenbaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setFeilongshenbaoBtnVisible(param1);
      }
      
      public function setDishiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setDishiBtnVisible(param1);
      }
      
      public function setNewTengtianyu1BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu1BtnVisible(param1);
      }
      
      public function setNewTengtianyu2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu2BtnVisible(param1);
      }
      
      public function setNewTengtianyu3BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu3BtnVisible(param1);
      }
      
      public function setNewTengtianyu4BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu4BtnVisible(param1);
      }
      
      public function setNewTengtianyu5BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu5BtnVisible(param1);
      }
      
      public function setNewTengtianyu6BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu6BtnVisible(param1);
      }
      
      public function setNewTengtianyu7BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu7BtnVisible(param1);
      }
      
      public function setWei300BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWei300BtnVisible(param1);
      }
      
      public function setFeishengjingjieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setFeishengjingjieBtnVisible(param1);
      }
      
      public function setShouchongshijianBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShouchongshijianBtnVisible(param1);
      }
      
      public function setMoshizhouqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setMoshizhouqiBtnVisible(param1);
      }
      
      public function setXiatianzhienBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setXiatianzhienBtnVisible(param1);
      }
      
      public function setBayuetouBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setBayuetouBtnVisible(param1);
      }
      
      public function setTonglefeishengjingjieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setTonglefeishengjingjieBtnVisible(param1);
      }
      
      public function setZhanzhengBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setZhanzhengBtnVisible(param1);
      }
      
      public function setBuchangBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setBuchangBtnVisible(param1);
      }
      
      public function setMobingjingongVisible(param1:Boolean) : void
      {
         this.charContainer.setMobingjingongVisible(param1);
      }
      
      public function setZhouqiyouhuiVisible(param1:Boolean) : void
      {
         this.charContainer.setZhouqiyouhuiVisible(param1);
      }
      
      public function setGumuzhengdouVisible(param1:Boolean) : void
      {
         this.charContainer.setGumuzhengdouVisible(param1);
      }
      
      public function setShenqizhouqiVisible(param1:Boolean) : void
      {
         this.charContainer.setShenqizhouqiVisible(param1);
      }
      
      public function setWulinshendibao1Visible(param1:Boolean) : void
      {
         this.charContainer.setWulinshendibao1Visible(param1);
      }
      
      public function setWulinshendibao2Visible(param1:Boolean) : void
      {
         this.charContainer.setWulinshendibao2Visible(param1);
      }
      
      public function setWulinshendibao3Visible(param1:Boolean) : void
      {
         this.charContainer.setWulinshendibao3Visible(param1);
      }
      
      public function setWulinshendibao4Visible(param1:Boolean) : void
      {
         this.charContainer.setWulinshendibao4Visible(param1);
      }
      
      public function set1908Visible(param1:Boolean) : void
      {
         this.charContainer.set1908Visible(param1);
      }
      
      public function setQixihuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setQixihuodongVisible(param1);
      }
      
      public function setNiulangzhinvVisible(param1:Boolean) : void
      {
         this.charContainer.setNiulangzhinvVisible(param1);
      }
      
      public function setLibaozhouqiVisible(param1:Boolean) : void
      {
         this.charContainer.setLibaozhouqiVisible(param1);
      }
      
      public function setShijian902Visible(param1:Boolean) : void
      {
         this.charContainer.setShijian902Visible(param1);
      }
      
      public function setYulianjieVisible(param1:Boolean) : void
      {
         this.charContainer.setYulianjieVisible(param1);
      }
      
      public function setWexiVisible(param1:Boolean) : void
      {
         this.charContainer.setWexiVisible(param1);
      }
      
      public function setQiaolianjiumuVisible(param1:Boolean) : void
      {
         this.charContainer.setQiaolianjiumuVisible(param1);
      }
      
      public function setYingxionglianVisible(param1:Boolean) : void
      {
         this.charContainer.setYingxionglianVisible(param1);
      }
      
      public function setChongjiuhuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setChongjiuhuodongVisible(param1);
      }
      
      public function setWulinzhenyuanVisible(param1:Boolean) : void
      {
         this.charContainer.setWulinzhenyuanVisible(param1);
      }
      
      public function setKaixueqiqiuVisible(param1:Boolean) : void
      {
         this.charContainer.setKaixueqiqiuVisible(param1);
      }
      
      public function setQiqiuVisible(param1:Boolean) : void
      {
         this.charContainer.setQiqiuVisible(param1);
      }
      
      public function setYiTianTuLongBtnVisible(param1:Boolean, param2:int) : void
      {
         this.charContainer.setYiTianTuLongBtnVisible(param1,param2);
      }
      
      public function setHuozhenjiashiVisible(param1:Boolean) : void
      {
         this.charContainer.setHuozhenjiashiVisible(param1);
      }
      
      public function setXuanswuxingjunVisible(param1:Boolean) : void
      {
         this.charContainer.setXuanswuxingjunVisible(param1);
      }
      
      public function setJingyingbicaiVisible(param1:Boolean) : void
      {
         this.charContainer.setJingyingbicaiVisible(param1);
      }
      
      public function setWangbangzhengxiongVisible(param1:Boolean) : void
      {
         this.charContainer.setWangbangzhengxiongVisible(param1);
      }
      
      public function setWangzhehuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setWangzhehuodongVisible(param1);
      }
      
      public function setLiujianVisible(param1:Boolean) : void
      {
         this.charContainer.setLiujianVisible(param1);
      }
      
      public function setZhongqiuhuodongVisible(param1:Boolean) : void
      {
         this.charContainer.setZhongqiuhuodongVisible(param1);
      }
      
      public function setBaihuxingjunVisible(param1:Boolean) : void
      {
         this.charContainer.setBaihuxingjunVisible(param1);
      }
      
      public function setZhongqiu2017Visible(param1:Boolean) : void
      {
         this.charContainer.setZhongqiu2017Visible(param1);
      }
      
      public function setNewTengtianyu8BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu8BtnVisible(param1);
      }
      
      public function setNewTengtianyu9BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu9BtnVisible(param1);
      }
      
      public function setNewTengtianyu10BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu10BtnVisible(param1);
      }
      
      public function setNewTengtianyu11BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu11BtnVisible(param1);
      }
      
      public function setNewTengtianyu12BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu12BtnVisible(param1);
      }
      
      public function setNewTengtianyu13BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu13BtnVisible(param1);
      }
      
      public function setNewTengtianyu14BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewTengtianyu14BtnVisible(param1);
      }
      
      public function setWulinshendibao5Visible(param1:Boolean) : void
      {
         this.charContainer.setWulinshendibao5Visible(param1);
      }
      
      public function setWulinshendibao6Visible(param1:Boolean) : void
      {
         this.charContainer.setWulinshendibao6Visible(param1);
      }
      
      public function setWulinshendibao7Visible(param1:Boolean) : void
      {
         this.charContainer.setWulinshendibao7Visible(param1);
      }
      
      public function setWulinshendibao8Visible(param1:Boolean) : void
      {
         this.charContainer.setWulinshendibao8Visible(param1);
      }
      
      public function setShenfeng2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShenfeng2BtnVisible(param1);
      }
      
      public function setWuduqirenVisible(param1:Boolean) : void
      {
         this.charContainer.setWuduqirenVisible(param1);
      }
      
      public function setQinglongxingjunVisible(param1:Boolean) : void
      {
         this.charContainer.setQinglongxingjunVisible(param1);
      }
      
      public function setLihejueVisible(param1:Boolean) : void
      {
         this.charContainer.setLihejueVisible(param1);
      }
      
      public function set10yueyouhuiVisible(param1:Boolean) : void
      {
         this.charContainer.set10yueyouhuiVisible(param1);
      }
      
      public function setZhenbaoge2Visible(param1:Boolean) : void
      {
         this.charContainer.setZhenbaoge2Visible(param1);
      }
      
      public function setMeitianchongzhilibao2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setMeitianchongzhilibao2BtnVisible(param1);
      }
      
      public function setPJubaopeng2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setPJubaopeng2BtnVisible(param1);
      }
      
      public function setGJubaopeng2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setGJubaopeng2BtnVisible(param1);
      }
      
      public function setCJubaopeng2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setCJubaopeng2BtnVisible(param1);
      }
      
      public function setZhuquexingjunBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setZhuquexingjunBtnVisible(param1);
      }
      
      public function setZengsongnvrenBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setZengsongnvrenBtnVisible(param1);
      }
      
      public function set20171020BtnVisible(param1:Boolean) : void
      {
         this.charContainer.set20171020BtnVisible(param1);
      }
      
      public function setSuixinxiaofeiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setSuixinxiaofeiBtnVisible(param1);
      }
      
      public function set2017FunvjieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017FunvjieBtnVisible(param1);
      }
      
      public function set2017LiunianhuodongBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017LiunianhuodongBtnVisible(param1);
      }
      
      public function set2017LiunianpeibanBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017LiunianpeibanBtnVisible(param1);
      }
      
      public function set2017GanenliunianBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017GanenliunianBtnVisible(param1);
      }
      
      public function set2017ShengrizhouqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017ShengrizhouqiBtnVisible(param1);
      }
      
      public function set2017HuazhuangdasaiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017HuazhuangdasaiBtnVisible(param1);
      }
      
      public function set2017WeixiwulinBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017WeixiwulinBtnVisible(param1);
      }
      
      public function set2017HuazhuanghuodongBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017HuazhuanghuodongBtnVisible(param1);
      }
      
      public function set2017XuantiezhixingzhouqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017XuantiezhixingzhouqiBtnVisible(param1);
      }
      
      public function set20170601ShijianVisible(param1:Boolean) : void
      {
         this.charContainer.set20170601ShijianVisible(param1);
      }
      
      public function set2017ShangrenVisible(param1:Boolean) : void
      {
         this.charContainer.set2017ShangrenVisible(param1);
      }
      
      public function setQinglongxingjunfuwenBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setQinglongxingjunfuwenBtnVisible(param1);
      }
      
      public function setNeiligaishiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNeiligaishiBtnVisible(param1);
      }
      
      public function setChaojixianglongzhouqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setChaojixianglongzhouqiBtnVisible(param1);
      }
      
      public function set2017JiaoshijieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017JiaoshijieBtnVisible(param1);
      }
      
      public function set2017ShuanglongzhanBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017ShuanglongzhanBtnVisible(param1);
      }
      
      public function set2017ZhenpinzhouqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set2017ZhenpinzhouqiBtnVisible(param1);
      }
      
      public function set1205ShijianBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set1205ShijianBtnVisible(param1);
      }
      
      public function set1212ShijianBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set1212ShijianBtnVisible(param1);
      }
      
      public function setYitianbaojinzhouqiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYitianbaojinzhouqiBtnVisible(param1);
      }
      
      public function set1219ShijianBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set1219ShijianBtnVisible(param1);
      }
      
      public function setWangjidianliBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWangjidianliBtnVisible(param1);
      }
      
      public function setYinshechudongBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYinshechudongBtnVisible(param1);
      }
      
      public function set1226shijianBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set1226shijianBtnVisible(param1);
      }
      
      public function setShengdanchongmanBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShengdanchongmanBtnVisible(param1);
      }
      
      public function setDuixuerenBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setDuixuerenBtnVisible(param1);
      }
      
      public function set5quxinshoulibaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.set5quxinshoulibaoBtnVisible(param1);
      }
      
      public function setWanshihaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWanshihaoBtnVisible(param1);
      }
      
      public function setQianghuajinshenBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setQianghuajinshenBtnVisible(param1);
      }
      
      public function setChuzhanBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setChuzhanBtnVisible(param1);
      }
      
      public function setGengxinbuchangBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setGengxinbuchangBtnVisible(param1);
      }
      
      public function setPeiyangdianfengshouBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setPeiyangdianfengshouBtnVisible(param1);
      }
      
      public function setBtnDingFengZhuanPanVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnDingFengZhuanPanVisible(param1);
      }
      
      public function setBtnYiTianTuLongDaoVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnYiTianTuLongDaoVisible(param1);
      }
      
      public function setBtnTianRenHeVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnTianRenHeVisible(param1);
      }
      
      public function setBtnJiZaoJieVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnJiZaoJieVisible(param1);
      }
      
      public function setBtnZaoYeVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnZaoYeVisible(param1);
      }
      
      public function setBtnRongQingAiYiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnRongQingAiYiVisible(param1);
      }
      
      public function setShuangLongZhan2BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShuangLongZhan2BtnVisible(param1);
      }
      
      public function setShuangLongZhan3BtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShuangLongZhan3BtnVisible(param1);
      }
      
      public function setBtnChaoJiWuLinDabao1Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChaoJiWuLinDabao1Visible(param1);
      }
      
      public function setBtnChaoJiWuLinDabao2Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChaoJiWuLinDabao2Visible(param1);
      }
      
      public function setBtnChaoJiWuLinDabao3Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChaoJiWuLinDabao3Visible(param1);
      }
      
      public function setBtnChaoJiWuLinDabao4Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChaoJiWuLinDabao4Visible(param1);
      }
      
      public function setBtnChaoJiWuLinDabao5Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChaoJiWuLinDabao5Visible(param1);
      }
      
      public function setBtnChaoJiWuLinDabao6Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChaoJiWuLinDabao6Visible(param1);
      }
      
      public function setBtnWuXuZhouQiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnWuXuZhouQiVisible(param1);
      }
      
      public function setBtnSanHeVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnSanHeVisible(param1);
      }
      
      public function setBtnXinShou2018Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnXinShou2018Visible(param1);
      }
      
      public function setBtn2018FuNvJieVisible(param1:Boolean) : void
      {
         this.charContainer.setBtn2018FuNvJieVisible(param1);
      }
      
      public function setBtnJinShenZhouQiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnJinShenZhouQiVisible(param1);
      }
      
      public function setBtnNvErZengSongVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnNvErZengSongVisible(param1);
      }
      
      public function setBtnBaiQiaoKeLiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnBaiQiaoKeLiVisible(param1);
      }
      
      public function setBtnDaHuangJinZhouQiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnDaHuangJinZhouQiVisible(param1);
      }
      
      public function setBtnQingRenJieHuanLiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnQingRenJieHuanLiVisible(param1);
      }
      
      public function setBtnTianRenHe2Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnTianRenHe2Visible(param1);
      }
      
      public function setBtnQiangHuaJinShen2Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnQiangHuaJinShen2Visible(param1);
      }
      
      public function setBtnYuanBaoYouHuiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnYuanBaoYouHuiVisible(param1);
      }
      
      public function setBtnYuRenJie2018Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnYuRenJie2018Visible(param1);
      }
      
      public function setBtnChangNianChongZhi1Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChangNianChongZhi1Visible(param1);
      }
      
      public function setBtnChangNianChongZhi2Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChangNianChongZhi2Visible(param1);
      }
      
      public function setBtnChangNianChongZhi3Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChangNianChongZhi3Visible(param1);
      }
      
      public function setBtnChangNianChongZhi4Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChangNianChongZhi4Visible(param1);
      }
      
      public function setBtnChangNianChongZhi5Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnChangNianChongZhi5Visible(param1);
      }
      
      public function setBtnWuSeTangYuanVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnWuSeTangYuanVisible(param1);
      }
      
      public function setBtnHanShiJieVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnHanShiJieVisible(param1);
      }
      
      public function setBtnDaShengZhouQiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnDaShengZhouQiVisible(param1);
      }
      
      public function setBtn2018LaoDongJieVisible(param1:Boolean) : void
      {
         this.charContainer.setBtn2018LaoDongJieVisible(param1);
      }
      
      public function setBtnBanBenYouHuiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnBanBenYouHuiVisible(param1);
      }
      
      public function setBtnLiXia2018Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnLiXia2018Visible(param1);
      }
      
      public function setBtnShuiGuoLeiJiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnShuiGuoLeiJiVisible(param1);
      }
      
      public function setBtn519HuoDong2018Visible(param1:Boolean) : void
      {
         this.charContainer.setBtn519HuoDong2018Visible(param1);
      }
      
      public function setBtnTianXiaWuGongChuShaoLinVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnTianXiaWuGongChuShaoLinVisible(param1);
      }
      
      public function setBtnXiaRiShuiGuoVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnXiaRiShuiGuoVisible(param1);
      }
      
      public function setBtnChaoJiZhouQiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnChaoJiZhouQiVisible(param1);
      }
      
      public function setBtnYueXiaoFeiYueLingJiangVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnYueXiaoFeiYueLingJiangVisible(param1);
      }
      
      public function setBtnZhiZunChengHaoZhengDuoVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnZhiZunChengHaoZhengDuoVisible(param1);
      }
      
      public function setBtnTaoHuaZhiJingVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnTaoHuaZhiJingVisible(param1);
      }
      
      public function setBtnQuanZhenXiaoYaoVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnQuanZhenXiaoYaoVisible(param1);
      }
      
      public function setBtnFeiShengJingJieVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnFeiShengJingJieVisible(param1);
      }
      
      public function setbtnShiJieBei2018Visible(param1:Boolean) : void
      {
         this.charContainer.setbtnShiJieBei2018Visible(param1);
      }
      
      public function setbtnBuBaiJinShenVisible(param1:Boolean) : void
      {
         this.charContainer.setbtnBuBaiJinShenVisible(param1);
      }
      
      public function setBtnLianXuBaoMingVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnLianXuBaoMingVisible(param1);
      }
      
      public function setBtnDuanWuJie2018Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnDuanWuJie2018Visible(param1);
      }
      
      public function setBtnXiaTianKuaiLeVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnXiaTianKuaiLeVisible(param1);
      }
      
      public function setBtnHuanQiukaiMuVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnHuanQiukaiMuVisible(param1);
      }
      
      public function setBtnMingJiaoZhiZunVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnMingJiaoZhiZunVisible(param1);
      }
      
      public function setBtnYaoJueHuoDongVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnYaoJueHuoDongVisible(param1);
      }
      
      public function setBtnZaiXianLeiJiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnZaiXianLeiJiVisible(param1);
      }
      
      public function setBtnFeiShengShenBaoVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnFeiShengShenBaoVisible(param1);
      }
      
      public function setBtnBuChangVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnBuChangVisible(param1);
      }
      
      public function setBtnZhengDuoZhanVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnZhengDuoZhanVisible(param1);
      }
      
      public function setBtnDaGengXinHuoDongVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnDaGengXinHuoDongVisible(param1);
      }
      
      public function setBtnWangZheZhouQiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnWangZheZhouQiVisible(param1);
      }
      
      public function setBtnDuiHuanGongNengVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnDuiHuanGongNengVisible(param1);
      }
      
      public function setBtnXingYunXingXingVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnXingYunXingXingVisible(param1);
      }
      
      public function setBtnWangZheZhiBangHDVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnWangZheZhiBangHDVisible(param1);
      }
      
      public function setBtnQiangHuaJinShen3Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnQiangHuaJinShen3Visible(param1);
      }
      
      public function setMoShouZhanChangBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setMoShouZhanChangBtnVisible(param1);
      }
      
      public function setBtnYingXiongHuoDongVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnYingXiongHuoDongVisible(param1);
      }
      
      public function setBtnHuanYingBaYueVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnHuanYingBaYueVisible(param1);
      }
      
      public function setBtnMeiJiuPaiHangVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnMeiJiuPaiHangVisible(param1);
      }
      
      public function setBtnNiangJiuHuoDongVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnNiangJiuHuoDongVisible(param1);
      }
      
      public function setBtnYuLanZhouQiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnYuLanZhouQiVisible(param1);
      }
      
      public function setBtnYuLanZhiEnVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnYuLanZhiEnVisible(param1);
      }
      
      public function setBtnGuoQingZhouQiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnGuoQingZhouQiVisible(param1);
      }
      
      public function setBtnGuoQingZengSongVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnGuoQingZengSongVisible(param1);
      }
      
      public function setBtnZiHaoZhanDouVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnZiHaoZhanDouVisible(param1);
      }
      
      public function setBtnYingJieGuoQingVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnYingJieGuoQingVisible(param1);
      }
      
      public function setBtnSiGuiZhouQiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnSiGuiZhouQiVisible(param1);
      }
      
      public function setBtnShuangJiuHuoDongVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnShuangJiuHuoDongVisible(param1);
      }
      
      public function setBtnZhongQiuZengSongVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnZhongQiuZengSongVisible(param1);
      }
      
      public function setBtnZhongQiuTianBingVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnZhongQiuTianBingVisible(param1);
      }
      
      public function setBtnZhongQiuJie2018Visible(param1:Boolean) : void
      {
         this.charContainer.setBtnZhongQiuJie2018Visible(param1);
      }
      
      public function setBtnZhongQiuZhouQiVisible(param1:Boolean) : void
      {
         this.charContainer.setBtnZhongQiuZhouQiVisible(param1);
      }
      
      public function setBtnVisible(param1:int, param2:Boolean, param3:Boolean = false) : void
      {
         this.charContainer.setBtnVisible(param1,param2,param3);
      }
      
      public function setCharHead(param1:String) : void
      {
         var value:String = param1;
         try
         {
            this.charContainer.head.bitmapData = StaticValue.getBitmapByClassName(value).bitmapData;
         }
         catch(e:Error)
         {
            charContainer.head.bitmapData = StaticValue.getBitmapByClassName("defaultHead").bitmapData;
         }
      }
      
      public function setCharName(param1:String) : void
      {
         this.charContainer.charName.text = param1;
      }
      
      public function setCharLevel(param1:String) : void
      {
         this.charContainer.level.text = "LV:" + param1;
      }
      
      public function setCharHP(param1:Number, param2:Number) : void
      {
         this.charContainer.redBar.setValue(Math.floor(param1),Math.floor(param2));
      }
      
      public function setCharMP(param1:Number, param2:Number) : void
      {
         this.charContainer.blueBar.setValue(Math.floor(param1),Math.floor(param2));
      }
      
      public function setPhysical(param1:Number, param2:Number) : void
      {
         this.charContainer.yellowBar.setValue(Math.floor(param1),Math.floor(param2));
      }
      
      public function setFabaoHp(param1:int, param2:int, param3:int) : void
      {
         this.charContainer.setPureColor(param1,param2,param3);
      }
      
      public function setLingli(param1:int, param2:int, param3:int) : void
      {
         this.charContainer.setOrangeColor(param1,param2,param3);
      }
      
      public function setCharMode(param1:int) : void
      {
         this.charContainer.setPK(param1);
      }
      
      public function setAutoValue(param1:int, param2:int, param3:int) : void
      {
         this.charContainer.setAutoValue(param1,param2,param3);
      }
      
      public function showComboEffect(param1:int) : void
      {
         this.charContainer.showComboEffect(param1);
      }
      
      public function setXianshiBtnVisible(param1:Boolean, param2:Number = 0) : void
      {
         this.charContainer.setXianshiBtnVisible(param1,param2);
      }
      
      public function setBiwuDahuiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setBiwuDahuiBtnVisible(param1);
      }
      
      public function setCiShaBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setCiShaBtnVisible(param1);
      }
      
      public function seAojianZhengbaBtnVisible(param1:Boolean) : void
      {
         this.charContainer.seAojianZhengbaBtnVisible(param1);
      }
      
      public function setZhiZhanZhiShangVisible(param1:Boolean) : void
      {
         this.charContainer.setZhiZhanZhiShangVisible(param1);
      }
      
      public function setYNFengdengjieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNFengdengjieBtnVisible(param1);
      }
      
      public function setYNWuLinShenBingBtnBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNWuLinShenBingBtnBtnVisible(param1);
      }
      
      public function setYN38JieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYN38JieBtnVisible(param1);
      }
      
      public function setYNRoseBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNRoseBtnVisible(param1);
      }
      
      public function setYNLianyaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNLianyaoBtnVisible(param1);
      }
      
      public function setYNJinshenHuodongBtnBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNJinshenHuodongBtnBtnVisible(param1);
      }
      
      public function setYNChristmasBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNChristmasBtnVisible(param1);
      }
      
      public function setYNLongzhizhufuBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNLongzhizhufuBtnVisible(param1);
      }
      
      public function setYNWebBtn1Visible(param1:Boolean) : void
      {
         this.charContainer.setYNWebBtn1Visible(param1);
      }
      
      public function setYNChristmasGiftBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNChristmasHuodongBtnVisible(param1);
      }
      
      public function seQianDaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.seQianDaoBtnVisible(param1);
      }
      
      public function createJuBaoPenBtn(param1:Boolean) : FSimpleButton
      {
         return this.charContainer.createJuBaoPenBtn(param1);
      }
      
      public function hideJuBaoPenBtn() : void
      {
         this.charContainer.hideJuBaoPenBtn();
      }
      
      public function setDanTiaoWangBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setDanTiaoWangBtnVisible(param1);
      }
      
      public function setYeWaiBossBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYeWaiBossBtnVisible(param1);
      }
      
      public function setTianJiangXiangRuiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setTianJiangXiangRuiBtnVisible(param1);
      }
      
      public function setBiWuZhaoQinBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setBiWuZhaoQinBtnVisible(param1);
      }
      
      public function setXinMoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setXinMoBtnVisible(param1);
      }
      
      public function setRankingBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setRankingBtnVisible(param1);
      }
      
      public function setJubaopenBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setJubaopenBtnVisible(param1);
      }
      
      public function setJubaopenBtnVisible1(param1:Boolean) : void
      {
         this.charContainer.setJubaopenBtnVisible1(param1);
      }
      
      public function setJubaopenBtnVisible2(param1:Boolean) : void
      {
         this.charContainer.setJubaopenBtnVisible2(param1);
      }
      
      public function setJubaopenBtnVisible3(param1:Boolean) : void
      {
         this.charContainer.setJubaopenBtnVisible3(param1);
      }
      
      public function setJubaopenBtnVisible5(param1:Boolean) : void
      {
         this.charContainer.setJubaopenBtnVisible5(param1);
      }
      
      public function setJubaopenBtnVisible6(param1:Boolean) : void
      {
         this.charContainer.setJubaopenBtnVisible6(param1);
      }
      
      public function setHuangTuBaYeBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setHuangTuBaYeBtnVisible(param1);
      }
      
      public function setShijieBeiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShijieBeiBtnVisible(param1);
      }
      
      public function showShishizhankuangButton(param1:Boolean) : void
      {
         this.charContainer.showShishizhankuangButton(param1);
      }
      
      public function showKuafubaoguoButton(param1:Boolean) : void
      {
         this.charContainer.showKuafubaoguoButton(param1);
      }
      
      public function showBiGuanButton(param1:Boolean) : void
      {
         this.charContainer.showBiGuanButton(param1);
      }
      
      public function showWZZBGuizeButton(param1:Boolean) : void
      {
         this.charContainer.showWZZBGuizeButton(param1);
      }
      
      public function showBtnVisble(param1:Boolean) : void
      {
         this.charContainer.setBtnShow(param1);
      }
      
      public function setYaSuiQianBtnVisible(param1:Boolean, param2:int = 0) : void
      {
         this.charContainer.setYaSuiQianBtnVisible(param1,param2);
      }
      
      public function setShengxiaoBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShengxiaoBtnVisible(param1);
      }
      
      public function setWoHuCangLongBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWoHuCangLongBtnVisible(param1);
      }
      
      public function setWishingTreeBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWishingTreeBtnVisible(param1);
      }
      
      public function setYN888ShopBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYN888ShopBtnVisible(param1);
      }
      
      public function set targetVisable(param1:Boolean) : void
      {
         this.targetContainer.visible = param1;
         if(param1)
         {
            this.targetContainer.menuCanvas.visible = false;
         }
      }
      
      public function set isPlayer(param1:Boolean) : void
      {
         this.targetContainer.isNPC = !param1;
      }
      
      public function setTargetHead(param1:*) : void
      {
         var _loc2_:Bitmap = null;
         if(param1 is String)
         {
            _loc2_ = StaticValue.getBitmapByClassName(param1);
            if(_loc2_ != null)
            {
               _loc2_.width = _loc2_.height = 40;
               this.targetContainer.setHead(_loc2_);
            }
         }
         else
         {
            this.targetContainer.setHead(ResPathManager.getSmallICO(param1,40,40));
         }
      }
      
      public function setTargetName(param1:String) : void
      {
         param1 = param1.replace(/^(.*?)(\(.+\)*)$/,"$1");
         this.targetContainer.charName.text = param1;
      }
      
      public function setTargetLevel(param1:String) : void
      {
         this.targetContainer.level.text = "LV:" + param1;
      }
      
      public function setTaretHP(param1:Number, param2:Number) : void
      {
         this.targetContainer.redBar.setValue(Math.floor(param1),Math.floor(param2));
      }
      
      public function setTargetMP(param1:Number, param2:Number) : void
      {
         this.targetContainer.blueBar.setValue(Math.floor(param1),Math.floor(param2));
      }
      
      public function setTargetPhysical(param1:Number, param2:Number) : void
      {
         this.targetContainer.yellowBar.setValue(Math.floor(param1),Math.floor(param2));
      }
      
      public function setTargetButtonVisble(param1:Boolean) : *
      {
         this.targetContainer.setShowButton(param1);
      }
      
      public function setTargetBtnStatus(param1:Boolean) : *
      {
         this.targetContainer.setBtnStatus(param1);
      }
      
      public function setMonstrTypeTip(param1:String) : void
      {
         this.targetContainer.setMonsterTypeTip(param1);
      }
      
      public function setBuff(param1:Array, param2:Array) : void
      {
      }
      
      public function addBuff(param1:Buff, param2:Array = null) : void
      {
         this.mapContainer.addBuff(param1,param2);
      }
      
      public function delBuff(param1:int, param2:Array = null) : void
      {
         this.mapContainer.delBuff(param1,param2);
      }
      
      public function delAll() : void
      {
         this.mapContainer.delAll();
      }
      
      public function setCombo(param1:int, param2:int) : void
      {
         this.comboContainer.play(param1,param2);
      }
      
      public function setMapName(param1:String) : void
      {
         this.mapContainer.mapName.text = LanResManager.getLanCommonTextWords("【") + param1 + LanResManager.getLanCommonTextWords("】");
      }
      
      public function setMap(param1:BitmapData) : void
      {
         this.mapContainer.setMap(param1);
      }
      
      public function setCharXY(param1:Point) : void
      {
         this.mapContainer.setCharXY(param1);
      }
      
      public function setCharDirection(param1:Number) : void
      {
         this.mapContainer.setCharDirection(param1);
      }
      
      public function setOtherPlayer(param1:Array) : void
      {
         this.mapContainer.setOtherPlayer(param1);
      }
      
      public function setTeamMebmer(param1:Array) : void
      {
         this.mapContainer.setTeamMebmer(param1);
      }
      
      public function setMonster(param1:Array) : void
      {
         this.mapContainer.setMonster(param1);
      }
      
      public function setNPC(param1:Array) : void
      {
         this.mapContainer.setNPC(param1);
      }
      
      public function setTaskNPC(param1:Array) : void
      {
         this.mapContainer.setTaskNPC(param1);
      }
      
      public function setFunctionNPC(param1:Array) : void
      {
         this.mapContainer.setFunctionNPC(param1);
      }
      
      public function setBusinessNPC(param1:Array) : void
      {
         this.mapContainer.setBusinessNPC(param1);
      }
      
      public function setPortal(param1:Array) : void
      {
         this.mapContainer.setPortal(param1);
      }
      
      public function setWuQi(param1:Object = null) : void
      {
         this.mapContainer.setWuQi(param1);
      }
      
      public function setXiuQiu(param1:Object = null) : void
      {
         this.mapContainer.setXiuQiu(param1);
      }
      
      public function setRenShenTianDi(param1:Array) : void
      {
         this.mapContainer.setRenShenTianDi(param1);
      }
      
      public function setRenShenTianDi3v3(param1:Array) : void
      {
         this.mapContainer.setRenShenTianDi3v3(param1);
      }
      
      public function setBiaoChe(param1:Object = null) : void
      {
      }
      
      public function setTaskNPCState(param1:Array, param2:Array, param3:Array) : void
      {
         this.mapContainer.setTaskState(param1,param2,param3);
      }
      
      public function setLineName(param1:String) : void
      {
         this.mapContainer.lineBtn.label = param1;
      }
      
      public function setSoundBtnSkin(param1:Boolean) : void
      {
         this.mapContainer.setSoundBtnSkin(param1);
      }
      
      public function setPlayerShowBtnSkin(param1:Boolean) : void
      {
         this.mapContainer.setPlayerShowBtnSkin(param1);
      }
      
      public function showJing(param1:int) : void
      {
         this.mapContainer.showJing(param1);
      }
      
      public function hideJing() : void
      {
         this.mapContainer.hideJing();
      }
      
      public function showZhan(param1:String) : void
      {
         this.mapContainer.showZhan(param1);
      }
      
      public function hideZhan() : void
      {
         this.mapContainer.hideZhan();
      }
      
      public function isShowKuaFuLunJian(param1:Boolean) : void
      {
         if(param1)
         {
            if(!this.kuaFuLunJianContainer)
            {
               this.kuaFuLunJianContainer = new KuaFuLunJianGuiZheCanvas();
            }
            if(this.kuaFuLunJianContainer.parent != this)
            {
               addChild(this.kuaFuLunJianContainer);
               this.kuaFuLunJianContainer.y = 100;
            }
         }
         else if(Boolean(this.kuaFuLunJianContainer) && Boolean(this.kuaFuLunJianContainer.parent))
         {
            this.kuaFuLunJianContainer.parent.removeChild(this.kuaFuLunJianContainer);
         }
      }
      
      public function setKuaFuValue(param1:int, param2:int, param3:String, param4:int, param5:Number) : void
      {
         if(this.kuaFuLunJianContainer)
         {
            this.kuaFuLunJianContainer.setValue(param1,param2,param3,param4,param5);
         }
      }
      
      public function showKuaFuLineSelectPanel(param1:XML) : void
      {
         if(!this.kuafuLineSelect)
         {
            this.kuafuLineSelect = new KuaFuLineSelectCanvas();
            this.kuafuLineSelect.$parent = this;
         }
         this.kuafuLineSelect.dataProvider = param1;
         GameInstance.uiInstance.uiContainer.addChild(this.kuafuLineSelect);
         this.kuafuLineSelect.x = (GameConfig.sceneWidth - this.kuafuLineSelect.panelWidth) / 2;
         this.kuafuLineSelect.y = (GameConfig.sceneHeight - this.kuafuLineSelect.panelHeight) / 2;
      }
      
      public function isShowKuaFuLunJian3v3(param1:Boolean) : void
      {
         if(param1)
         {
            if(!this.kuaFuLunJian3v3Container)
            {
               this.kuaFuLunJian3v3Container = new KuaFuLunJian3v3GuiZheCanvas();
            }
            if(this.kuaFuLunJian3v3Container.parent != this)
            {
               addChild(this.kuaFuLunJian3v3Container);
               this.kuaFuLunJian3v3Container.y = 100;
            }
         }
         else if(Boolean(this.kuaFuLunJian3v3Container) && Boolean(this.kuaFuLunJian3v3Container.parent))
         {
            this.kuaFuLunJian3v3Container.parent.removeChild(this.kuaFuLunJian3v3Container);
         }
      }
      
      public function setKuaFuValue3v3(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:Array, param7:int, param8:int, param9:int) : void
      {
         if(this.kuaFuLunJian3v3Container)
         {
            this.kuaFuLunJian3v3Container.setValue(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         }
         this.setKuaFuValue3v3VS(param2,param5);
      }
      
      public function setKuaFuValue3v3_PK(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:Array, param7:int, param8:int, param9:int) : void
      {
         if(this.kuaFuLunJian3v3Container)
         {
            this.kuaFuLunJian3v3Container.setValue_PK(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         }
         this.setKuaFuValue3v3VS(param2,param5);
      }
      
      private function setKuaFuValue3v3VS(param1:int, param2:int) : void
      {
         GameInstance.uiInstance.kuafu3v3VSResultPanel.setVS(param1,param2);
         if(GameInstance.uiInstance.kuafu3v3VSResultPanel.parent == null)
         {
            GameInstance.uiInstance.uiContainer.addChildAt(GameInstance.uiInstance.kuafu3v3VSResultPanel,0);
         }
         GameInstance.uiInstance.kuafu3v3VSResultPanel.x = GameInstance.stage.stageWidth / 2 - GameInstance.uiInstance.kuafu3v3VSResultPanel.width / 2;
         GameInstance.uiInstance.kuafu3v3VSResultPanel.y = GameInstance.stage.stageHeight * 0.12;
      }
      
      public function teamMemberListIsShow(param1:Boolean) : void
      {
         this.teamContainer.visible = param1;
      }
      
      public function set isLeader(param1:Boolean) : void
      {
         this.charContainer.leaderIco.visible = param1;
      }
      
      public function setTeamMemberList(param1:Array, param2:String = "", param3:int = 0) : void
      {
         this.teamContainer.setMember(param1,param2,param3);
      }
      
      public function setAffiche(param1:String) : void
      {
         this.afficheContainer.setTip(param1);
      }
      
      public function showICOTip(param1:String = "ui.scene.default.tip", param2:Function = null, param3:Object = null) : void
      {
         this.defaultIcoTipContainer.showICO(param1,param2,param3);
      }
      
      public function showSysICOTip(param1:String = "ui.scene.default.tip", param2:Function = null, param3:Object = null) : void
      {
         this.sysIcoTipContainer.showICO(param1,param2,param3);
      }
      
      public function setTrack(param1:DisplayObject) : void
      {
         this.taskContainer.setTrack(param1);
      }
      
      public function taskTrackSrollUpdate(param1:Boolean) : void
      {
         this.taskContainer.scrollUpdate(param1);
      }
      
      public function taskTrackFold(param1:Boolean) : void
      {
         this.taskContainer.fold(param1);
      }
      
      public function setTrackShowHide(param1:Boolean) : void
      {
         this.taskContainer.showHide(param1);
      }
      
      public function setTrackVisible(param1:Boolean) : void
      {
         this.taskContainer.visible = param1;
      }
      
      public function setImageTip(param1:ImageLeadCanvas, param2:int, param3:* = null) : ImageLeadCanvas
      {
         if(!param1)
         {
            param1 = new ImageLeadCanvas();
         }
         this.imageLeadContainer.addChild(param1);
         param1.showTip(param2,param3);
         this.imageLeadContainer.x = GameConfig.sceneWidth - this.imageLeadContainer.width;
         this.imageLeadContainer.y = 270;
         return param1;
      }
      
      public function closeTip(param1:ImageLeadCanvas, param2:*) : void
      {
         if(param1)
         {
            param1.onClose(null,param2);
         }
      }
      
      public function setImageLeadContainerVisible(param1:Boolean) : void
      {
         this.imageLeadContainer.visible = param1;
      }
      
      public function receiveMessage(param1:int = 1, param2:String = "", param3:int = -1, param4:String = "", param5:int = -1, param6:String = "", param7:Boolean = false, param8:Boolean = false, param9:Boolean = false) : void
      {
         this.chatContainer.showChat(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setPrivateChat(param1:String) : void
      {
         this.chatContainer.setPrivateTarget(param1);
      }
      
      public function setItemToChat(param1:Goods, param2:int) : void
      {
         this.chatContainer.setItem(param1,param2);
      }
      
      public function changeChatSize() : void
      {
         this.chatContainer.changeSize();
      }
      
      public function setTeamChatChannel(param1:Boolean = true) : void
      {
         this.chatContainer.setTeamChannel(param1);
      }
      
      public function setLevelTip(param1:String) : void
      {
         this.levelTipContainer.setTip(param1);
         addChild(this.levelTipContainer);
         this.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
      }
      
      public function setSysTip(param1:String) : void
      {
         this.sysTipsContainer.setTip(param1);
      }
      
      public function setJianMianYouLi(param1:String, param2:int) : void
      {
         if(!this.jianMianYouLiContainer)
         {
            this.jianMianYouLiContainer = new JianMianYouLiCanvas_mainui();
         }
         addChild(this.jianMianYouLiContainer);
         this.jianMianYouLiContainer.setGift(param1,param2);
         this.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
      }
      
      public function setShortcutBarItem(param1:Array) : void
      {
         this.functionContainer.showItem(param1);
      }
      
      public function getItemFaceByBaseItem(param1:BaseItem) : ItemFace
      {
         return this.functionContainer.getItemFaceByBaseItem(param1);
      }
      
      public function setItemFaceAndShowMovie(param1:ItemFace) : void
      {
         this.functionContainer.setItemFaceAndShowMovie(param1);
      }
      
      public function setExp(param1:Number = -1, param2:Number = -1) : void
      {
         this.functionContainer.setExp(param1,param2);
      }
      
      public function setStrongAndNuqi(param1:int, param2:int) : void
      {
         this.functionContainer.rectBar.setValue(param1,param2,-1,-1);
         this.functionContainer.circleBar.setValue(param1,param2,-1,-1);
      }
      
      public function setNuQi(param1:int, param2:int) : void
      {
         this.functionContainer.rectBar.setValue(-1,-1,param1,param2);
         this.functionContainer.circleBar.setValue(-1,-1,param1,param2);
      }
      
      public function setMoxueValue(param1:int, param2:int) : void
      {
         this.charContainer.setMoXueValue(param1,param2);
      }
      
      public function setRideSkillShortCut(param1:Array) : void
      {
         this.functionContainer.setRideSkill(param1);
      }
      
      public function getFunctionContainerXY() : Point
      {
         return new Point(this.functionContainer.x,this.functionContainer.y);
      }
      
      public function getmapContainerXY() : Point
      {
         return new Point(this.mapContainer.x,this.mapContainer.y);
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         this.charContainer.x = 0;
         this.charContainer.y = 0;
         this.targetContainer.x = (param1 - this.targetContainer.width) / 2;
         this.targetContainer.y = 0;
         this.buffContainer.x = (param1 - (this.targetContainer.x + this.targetContainer.width) - this.mapContainer.width) / 2 + this.targetContainer.x + this.targetContainer.width;
         this.buffContainer.y = 3;
         this.mapContainer.x = param1 - 209;
         this.mapContainer.y = 0;
         this.zhengbaList.x = param1 - 400;
         this.zhengbaList.y = 180;
         this.christmasRank.x = param1 - this.christmasRank.width;
         this.christmasRank.y = 180;
         this.dantiaowangList.x = param1 - 300;
         this.dantiaowangList.y = 180;
         this.chenmiSprite.x = (param1 - this.chenmiSprite.width) / 2 + 240;
         this.chenmiSprite.y = 0;
         this.fuqiJingjiTouzhuContainer.x = 0;
         this.fuqiJingjiTouzhuContainer.y = 225;
         this.fuqiJingjiVSContainer.x = (param1 - this.fuqiJingjiVSContainer.width) / 2;
         this.fuqiJingjiVSContainer.y = 130;
         if(Boolean(this.kuaFuLunJianContainer) && Boolean(this.kuaFuLunJianContainer.parent))
         {
            this.kuaFuLunJianContainer.x = 0;
            this.kuaFuLunJianContainer.y = 100;
         }
         if(Boolean(this.kuaFuLunJian3v3Container) && Boolean(this.kuaFuLunJian3v3Container.parent))
         {
            this.kuaFuLunJian3v3Container.x = 0;
            this.kuaFuLunJian3v3Container.y = 100;
         }
         if(Boolean(GameInstance.uiInstance.tunShiTianDiVSResultPanel) && GameInstance.uiInstance.tunShiTianDiVSResultPanel.parent != null)
         {
            GameInstance.uiInstance.tunShiTianDiVSResultPanel.x = GameInstance.stage.stageWidth / 2 - GameInstance.uiInstance.tunShiTianDiVSResultPanel.width / 2;
            GameInstance.uiInstance.tunShiTianDiVSResultPanel.y = GameInstance.stage.stageHeight * 0.15;
         }
         this.teamContainer.x = 0;
         this.teamContainer.y = 120;
         this.afficheContainer.x = (param1 - this.afficheContainer.width) / 2;
         this.afficheContainer.y = this.teamContainer.y;
         this.defaultIcoTipContainer.x = param1 / 2;
         this.defaultIcoTipContainer.y = 200;
         this.comboContainer.x = 241;
         this.comboContainer.y = 93;
         this.taskContainer.x = param1 - 203;
         this.taskContainer.y = 188;
         if(this.imageLeadContainer)
         {
            this.imageLeadContainer.x = param1 - this.imageLeadContainer.width;
            this.imageLeadContainer.y = 270;
         }
         this.skillBar.x = 0;
         this.skillBar.y = param2 - 350;
         this.chatContainer.x = 0;
         this.chatContainer.y = param2 - 84;
         this.giftTipContainer.x = param1 / 2;
         this.giftTipContainer.y = param2 - 90;
         this.sysTipsContainer.x = param1 - this.sysTipsContainer.width - 5;
         this.sysTipsContainer.y = param2 - 70 - this.sysTipsContainer.height;
         this.concernmentIcoTipContainer.x = param1 - this.concernmentIcoTipContainer.width - 10;
         this.concernmentIcoTipContainer.y = param2 - 60;
         if(Boolean(this.jianMianYouLiContainer) && Boolean(this.jianMianYouLiContainer.parent))
         {
            this.levelTipContainer.x = (param1 - this.levelTipContainer.width) / 2;
            this.levelTipContainer.y = this.jianMianYouLiContainer.isExpend == true ? param2 - 160 - this.levelTipContainer.height : param2 - 100 - this.levelTipContainer.height;
            this.jianMianYouLiContainer.x = param1 / 2 - 25;
            this.jianMianYouLiContainer.y = param2 - 160 - 66;
            if(Boolean(this.fuHuoBtn) && this.fuHuoBtn.visible)
            {
               this.fuHuoBtn.x = param1 / 2 - 25 + 65;
               this.fuHuoBtn.y = param2 - 160;
            }
         }
         else
         {
            this.levelTipContainer.x = (param1 - this.levelTipContainer.width) / 2;
            this.levelTipContainer.y = param2 - 100 - this.levelTipContainer.height;
            if(Boolean(this.fuHuoBtn) && this.fuHuoBtn.visible)
            {
               this.fuHuoBtn.x = param1 / 2 - 25;
               this.fuHuoBtn.y = param2 - 160;
            }
         }
         if(this.shijianshalouBrn)
         {
            this.shijianshalouBrn.x = 20 + 40;
            this.shijianshalouBrn.y = 140;
         }
         if(Boolean(this.timeFt) && Boolean(this.shijianshalouBrn))
         {
            this.timeFt.x = this.shijianshalouBrn.x - 40;
            this.timeFt.y = this.shijianshalouBrn.y + 60;
         }
         this.sysIcoTipContainer.x = param1;
         this.sysIcoTipContainer.y = param2 - 135;
         this.functionContainer.x = (param1 - 1000) / 2;
         this.functionContainer.y = param2 - 60;
         this.zunrongWanbaogeFunctionContainer.x = (param1 - this.zunrongWanbaogeFunctionContainer.width) / 2;
         this.zunrongWanbaogeFunctionContainer.y = param2 - 200 + 129;
         if(Boolean(this.kulou) && Boolean(this.kulou.parent))
         {
            this.kulou.x = (param1 - 175) / 2 - 18;
            this.kulou.y = param2 - 173 - 173 + 116;
         }
         GameInstance.uiInstance.shengxiaoRightSpr.x = param1 - GameInstance.uiInstance.shengxiaoRightSpr.width;
         GameInstance.uiInstance.shengxiaoRightSpr.y = 188;
         if(this.yitiantulong)
         {
            this.yitiantulong.x = param1 - 350;
            this.yitiantulong.y = 180;
         }
         if(this.lianzhanSpr)
         {
            this.lianzhanSpr.x = 370;
            this.lianzhanSpr.y = 260;
         }
         if(this.zhunbeiSpr)
         {
            this.zhunbeiSpr.x = (param1 - this.zhunbeiSpr.width) / 2;
            this.zhunbeiSpr.y = 260;
         }
         if(this.moShouZhanChangJiangLi)
         {
            this.moShouZhanChangJiangLi.x = GameConfig.sceneWidth - this.moShouZhanChangJiangLi.width;
            this.moShouZhanChangJiangLi.y = 220;
         }
         if(this.moShouZhanChangFuHuo)
         {
            this.moShouZhanChangFuHuo.x = GameConfig.sceneWidth - this.moShouZhanChangFuHuo.width >> 1;
            this.moShouZhanChangFuHuo.y = GameConfig.sceneHeight - this.moShouZhanChangFuHuo.height >> 1;
         }
         if(this.moShouZhanChangYanShi)
         {
            this.moShouZhanChangYanShi.x = GameConfig.sceneWidth - this.moShouZhanChangYanShi.width >> 1;
            this.moShouZhanChangYanShi.y = GameConfig.sceneHeight - this.moShouZhanChangYanShi.height >> 1;
         }
         this.resizeBaGuaZhenMainUIPanel();
      }
      
      public function shouBiao(param1:Boolean) : void
      {
         this.functionContainer.shouBiao(param1);
      }
      
      public function setBiaoZhuangtai(param1:int) : void
      {
         this.functionContainer.setBiaoZhuangtai(param1);
      }
      
      public function setBiaoWeizhi(param1:int, param2:int, param3:String, param4:int) : void
      {
         this.functionContainer.setBiaoWeizhi(param1,param2,param3,param4);
      }
      
      public function isShowBiwuDahui(param1:int) : void
      {
         if(param1 == 1)
         {
            if(!this.biwudahuiContainer)
            {
               this.biwudahuiContainer = new MainBiwuDahuiCanvas();
            }
            if(this.biwudahuiContainer.parent != this)
            {
               addChild(this.biwudahuiContainer);
               this.biwudahuiContainer.y = 100;
               this.biwudahuiContainer.$parent = this;
               this.biwudahuiContainer.setBtn(param1);
            }
         }
         else if(param1 == 2)
         {
            if(!this.biwudahuiContainer)
            {
               this.biwudahuiContainer = new MainBiwuDahuiCanvas();
            }
            if(this.biwudahuiContainer.parent != this)
            {
               addChild(this.biwudahuiContainer);
               this.biwudahuiContainer.y = 100;
               this.biwudahuiContainer.$parent = this;
               this.biwudahuiContainer.setBtn(param1);
            }
         }
         else if(param1 == 0)
         {
            if(Boolean(this.biwudahuiContainer) && Boolean(this.biwudahuiContainer.parent))
            {
               this.biwudahuiContainer.parent.removeChild(this.biwudahuiContainer);
            }
         }
         else if(param1 == 3)
         {
            if(!this.biwudahuiContainer)
            {
               this.biwudahuiContainer = new MainBiwuDahuiCanvas();
            }
            if(this.biwudahuiContainer.parent != this)
            {
               addChild(this.biwudahuiContainer);
               this.biwudahuiContainer.y = 100;
               this.biwudahuiContainer.$parent = this;
               this.biwudahuiContainer.setBtn(param1);
            }
         }
      }
      
      public function isShowBaoShiJianShangInfo(param1:int, param2:int = 0, param3:int = 0) : void
      {
         if(param1 == 0)
         {
            if(Boolean(this.baoshijianshangContainer) && Boolean(this.baoshijianshangContainer.parent))
            {
               this.baoshijianshangContainer.parent.removeChild(this.baoshijianshangContainer);
            }
         }
         else
         {
            if(!this.baoshijianshangContainer)
            {
               this.baoshijianshangContainer = new MainBaoShiJianShangCanvas();
            }
            if(this.baoshijianshangContainer.parent != this)
            {
               addChild(this.baoshijianshangContainer);
               this.baoshijianshangContainer.x = 50;
               this.baoshijianshangContainer.y = 110;
            }
            this.baoshijianshangContainer.setTimer(param2);
            this.baoshijianshangContainer.showBaoShiIco(param3);
         }
      }
      
      public function updateBaoShiJianShangTimer(param1:int) : void
      {
         if(!this.baoshijianshangContainer)
         {
            this.baoshijianshangContainer = new MainBaoShiJianShangCanvas();
         }
         this.baoshijianshangContainer.setTimer(param1);
      }
      
      public function showAutoButton(param1:Boolean) : void
      {
         this.charContainer.showAutoButton(param1);
      }
      
      public function setBiwuDahuiFenshu(param1:String, param2:int, param3:String, param4:int) : void
      {
         GameInstance.uiInstance.biwudahuiVSResultPanel.setVS(param1,param2,param3,param4);
         if(GameInstance.uiInstance.biwudahuiVSResultPanel.parent == null)
         {
            GameInstance.uiInstance.mainUI.charContainer.addChildAt(GameInstance.uiInstance.biwudahuiVSResultPanel,0);
            GameInstance.uiInstance.biwudahuiVSResultPanel.y = 90;
         }
      }
      
      public function showBiwuDaHuiFenshu(param1:Boolean) : void
      {
         if(param1)
         {
            if(GameInstance.uiInstance.biwudahuiVSResultPanel.parent == null)
            {
               GameInstance.uiInstance.mainUI.charContainer.addChildAt(GameInstance.uiInstance.biwudahuiVSResultPanel,0);
               GameInstance.uiInstance.biwudahuiVSResultPanel.y = 90;
            }
         }
         else if(GameInstance.uiInstance.biwudahuiVSResultPanel.parent != null)
         {
            GameInstance.uiInstance.biwudahuiVSResultPanel.parent.removeChild(GameInstance.uiInstance.biwudahuiVSResultPanel);
         }
      }
      
      public function showguidbar(param1:Boolean) : void
      {
         if(param1)
         {
            GameInstance.uiInstance.mainUI.functionContainer.guideBar.visible = false;
         }
         else
         {
            GameInstance.uiInstance.mainUI.functionContainer.guideBar.visible = true;
         }
      }
      
      public function showZhengbaLineSelectPanel(param1:XML) : void
      {
         if(!this.zhengbaLineSelect)
         {
            this.zhengbaLineSelect = new AojianZhengbaSelectCanvas();
            this.zhengbaLineSelect.$parent = this;
         }
         this.zhengbaLineSelect.dataProvider = param1;
         GameInstance.uiInstance.uiContainer.addChild(this.zhengbaLineSelect);
         this.zhengbaLineSelect.x = (GameConfig.sceneWidth - this.zhengbaLineSelect.panelWidth) / 2;
         this.zhengbaLineSelect.y = (GameConfig.sceneHeight - this.zhengbaLineSelect.panelHeight) / 2;
      }
      
      public function setZhengbaInitialize(param1:XML) : void
      {
         if(GameInstance.scene.mapConfig.mapID != 20263)
         {
            return;
         }
         if(Boolean(this.zhengbaList) && this.zhengbaList.parent != null)
         {
            this.zhengbaList.visible = true;
            this.zhengbaList.setInitialize(param1);
         }
      }
      
      public function removeZhengba() : void
      {
         if(Boolean(this.zhengbaList) && this.zhengbaList.parent != null)
         {
            this.zhengbaList.visible = false;
         }
      }
      
      public function showChristmasRank(param1:Array) : void
      {
         if(Boolean(this.christmasRank) && Boolean(this.christmasRank.parent))
         {
            this.christmasRank.visible = true;
            this.christmasRank.setData(param1);
         }
      }
      
      public function hideChristmasRank() : void
      {
         if(Boolean(this.christmasRank) && Boolean(this.christmasRank.parent))
         {
            this.christmasRank.visible = false;
         }
      }
      
      public function setTime(param1:int) : void
      {
         if(param1 == -1)
         {
            this.chenmiSprite.visible = false;
         }
         else
         {
            this.chenmiSprite.visible = true;
         }
         this.chenmiSprite.setTime(param1);
      }
      
      public function setChenmiTips(param1:int) : void
      {
         if(!this.chenmiTips)
         {
            this.chenmiTips = new FangChenMiTips();
         }
         addChild(this.chenmiTips);
         this.chenmiTips.x = (GameConfig.sceneWidth - this.chenmiTips.width) / 2;
         this.chenmiTips.y = (GameConfig.sceneHeight - this.chenmiTips.height) / 2;
         this.chenmiTips.setTips(param1);
      }
      
      public function setBtnEnabled(param1:Boolean) : void
      {
         this.functionContainer.setBtnEnabled(param1);
      }
      
      public function zhengfuYincang(param1:Boolean) : void
      {
         this.mapContainer.zhengfuYincang(param1);
      }
      
      public function showDanTiaoWangShuomingPanel() : void
      {
         if(!this.danTiaoWangShuomingPanel)
         {
            this.danTiaoWangShuomingPanel = new DanTiaoWangShuomingPanel();
         }
         else if(this.danTiaoWangShuomingPanel.parent != null)
         {
            this.danTiaoWangShuomingPanel.parent.removeChild(this.danTiaoWangShuomingPanel);
            return;
         }
         GameInstance.uiInstance.uiContainer.addChild(this.danTiaoWangShuomingPanel);
         this.danTiaoWangShuomingPanel.x = (GameConfig.sceneWidth - this.danTiaoWangShuomingPanel.panelWidth) / 2;
         this.danTiaoWangShuomingPanel.y = (GameConfig.sceneHeight - this.danTiaoWangShuomingPanel.panelHeight) / 2;
      }
      
      public function setDanTiaoWangInitialize(param1:XML, param2:int, param3:int, param4:int) : void
      {
         if(Boolean(this.dantiaowangList) && this.dantiaowangList.parent != null)
         {
            this.dantiaowangList.visible = true;
            this.dantiaowangList.setInitialize(param1,param2,param3,param4);
         }
      }
      
      public function removeDanTiaoWang() : void
      {
         if(Boolean(this.dantiaowangList) && this.dantiaowangList.parent != null)
         {
            this.dantiaowangList.visible = false;
         }
      }
      
      public function setFuqiJingjiTouzhuPanelInitialize(param1:int, param2:Array) : void
      {
         if(Boolean(this.fuqiJingjiTouzhuContainer) && this.fuqiJingjiTouzhuContainer.parent != null)
         {
            this.fuqiJingjiTouzhuContainer.visible = true;
            this.fuqiJingjiTouzhuContainer.setXiazhuBaoshi(param2);
            this.fuqiJingjiTouzhuContainer.setXiazhuNum(param1);
         }
      }
      
      public function removeFuqiJingjiTouzhuPanel() : void
      {
         if(Boolean(this.fuqiJingjiTouzhuContainer) && this.fuqiJingjiTouzhuContainer.parent != null)
         {
            this.fuqiJingjiTouzhuContainer.visible = false;
         }
      }
      
      public function setFuqiJingjiResultPanelInitialize(param1:Array, param2:int, param3:int, param4:Boolean, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int) : void
      {
         if(!this.fuqiJingjiResultContaier)
         {
            this.fuqiJingjiResultContaier = new FuqiJingjiResultPanel();
            this.fuqiJingjiResultContaier.$parent = this;
         }
         GameInstance.uiInstance.uiContainer.addChild(this.fuqiJingjiResultContaier);
         this.fuqiJingjiResultContaier.x = (GameConfig.sceneWidth - this.fuqiJingjiResultContaier.panelWidth) / 2;
         this.fuqiJingjiResultContaier.y = (GameConfig.sceneHeight - this.fuqiJingjiResultContaier.panelHeight) / 2;
         this.fuqiJingjiResultContaier.setInitialize(param1);
         this.fuqiJingjiResultContaier.setTeamJifenNum(param2,param3);
         this.fuqiJingjiResultContaier.setTeamJiangli(param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function removeFuqiJingjiResultPanel() : void
      {
         if(Boolean(this.fuqiJingjiResultContaier) && this.fuqiJingjiResultContaier.parent != null)
         {
            this.fuqiJingjiResultContaier.parent.removeChild(this.fuqiJingjiResultContaier);
         }
      }
      
      public function setFuQiJingJiVSPanelInitialize(param1:int, param2:int) : void
      {
         if(Boolean(this.fuqiJingjiVSContainer) && this.fuqiJingjiVSContainer.parent != null)
         {
            this.fuqiJingjiVSContainer.visible = true;
            this.fuqiJingjiVSContainer.setVS(param1,param2);
         }
      }
      
      public function removeFuQiJingJiVSPanel() : void
      {
         if(Boolean(this.fuqiJingjiVSContainer) && this.fuqiJingjiVSContainer.parent != null)
         {
            this.fuqiJingjiVSContainer.visible = false;
         }
      }
      
      public function setWanbaogeBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWanbaogeBtnVisible(param1);
      }
      
      public function setWanbaogeFunctionBarVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.zunrongWanbaogeFunctionContainer.visible = true;
            this.functionContainer.visible = false;
            KeyboardManager.zunrongEnable = true;
            if(this.jianMianYouLiContainer)
            {
               this.jianMianYouLiContainer.visible = false;
            }
            this.zunrongWanbaogeFunctionContainer.setJumpOrDigunBtn();
            this.charContainer.setBtnEnable(true);
            DP_qixuan.isWanbaoge = true;
         }
         else
         {
            this.zunrongWanbaogeFunctionContainer.visible = false;
            this.functionContainer.visible = true;
            KeyboardManager.zunrongEnable = false;
            if(this.jianMianYouLiContainer)
            {
               this.jianMianYouLiContainer.visible = true;
            }
            GameInstance.mainChar.moveData.onDigun = false;
            this.charContainer.setBtnEnable(false);
            DP_qixuan.isWanbaoge = false;
         }
         KeyboardManager._keyArr = [];
         KeyboardManager._ctrl_keyArr = [];
      }
      
      public function setwanbaogeShortcutBarItem(param1:Array) : void
      {
         this.zunrongWanbaogeFunctionContainer.setSkill(param1);
      }
      
      public function setYanbaoBtn(param1:int) : void
      {
         this.zunrongWanbaogeFunctionContainer.setYanbaoBtn(param1);
      }
      
      public function setNuqiNum(param1:int) : void
      {
         this.zunrongWanbaogeFunctionContainer.setNuqiNum(param1);
      }
      
      public function setKulou() : void
      {
         var pi:Point;
         var si:Point;
         var onCom:Function = null;
         onCom = function():void
         {
            if(Boolean(kulou) && Boolean(kulou.parent))
            {
               kulou.parent.removeChild(kulou);
               kulou = null;
            }
         };
         if(!this.kulou)
         {
            this.kulou = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zunrongwanbaoge/kulou.swf");
            addChild(this.kulou);
         }
         pi = localToGlobal(new Point(this.kulou.x,this.kulou.y));
         si = GameInstance.uiInstance.mainUI.getmapContainerXY();
         this.kulou.x = (GameConfig.sceneWidth - 175) / 2 - 105 + 87;
         this.kulou.y = GameConfig.sceneHeight - 173 - 235 + 175;
         addChild(this.kulou);
         TweenMax.to(this.kulou,1,{
            "x":si.x - 15,
            "y":si.y + 85 + 170,
            "width":0,
            "height":0,
            "delay":2,
            "onComplete":onCom
         });
      }
      
      public function showZhengGu() : void
      {
         var n:int = 0;
         var onEnterFrame:Function = null;
         onEnterFrame = function(param1:Event):void
         {
            if(zhengguMC.currentFrame == zhengguMC.totalFrames)
            {
               if(Boolean(zhengguMC) && Boolean(zhengguMC.parent))
               {
                  zhengguMC.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
                  zhengguMC.parent.removeChild(zhengguMC);
                  zhengguMC = null;
               }
            }
         };
         n = ZMath.getRandomNumber(1,2);
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            zhengguMC = _loc2_.content as MovieClip;
            if(n == 1)
            {
               zhengguMC.x = GameInstance.stage.stageWidth / 2 - 370 / 2;
               zhengguMC.y = GameInstance.stage.stageHeight / 2 - 262 / 2;
            }
            else
            {
               zhengguMC.x = GameInstance.stage.stageWidth / 2 - 736 / 2;
               zhengguMC.y = GameInstance.stage.stageHeight / 2 - 524 / 2;
            }
            zhengguMC.gotoAndPlay(1);
            addChild(zhengguMC);
            zhengguMC.addEventListener(Event.ENTER_FRAME,onEnterFrame);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/zhenggu/" + n + ".swf");
      }
      
      public function setNewYearBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setNewYearBtnVisible(param1);
      }
      
      public function setYuRenJieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYuRenJieBtnVisible(param1);
      }
      
      public function showFuHuoBtn(param1:Boolean) : void
      {
         if(this.fuHuoBtn == null)
         {
            this.fuHuoBtn = new FSimpleButton();
            this.fuHuoBtn.skin = "fuHuoButton";
            this.fuHuoBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("复活死亡的玩家或弟子") + "</font>";
            this.fuHuoBtn.addEventListener(MouseEvent.CLICK,this.onFuHuoClick);
            addChild(this.fuHuoBtn);
            this.resize(GameConfig.sceneWidth,GameConfig.sceneHeight);
         }
         this.fuHuoBtn.visible = param1;
      }
      
      private function onFuHuoClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(MAINUI_FUHUO_BTN_CLICK));
      }
      
      public function setLayout(param1:Boolean) : void
      {
         this.functionContainer.setLayout(param1);
         this.charContainer.setFaBaoVisible(!param1);
         this.charContainer.setDiziButton(param1);
         if(param1)
         {
            this.charContainer.setXianshiBtnVisible(false);
         }
      }
      
      public function setFengZhengJieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setFengZhengJieBtnVisible(param1);
      }
      
      public function setDouDiZhuBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setDouDiZhuBtnVisible(param1);
      }
      
      public function setItem(param1:Boolean, param2:int) : void
      {
         this.functionContainer.showItemContainer(param1);
         this.functionContainer.setItem(param2);
      }
      
      public function setDuanWuJieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setDuanWuJieBtnVisible(param1);
      }
      
      public function setQiXiJieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setQiXiJieBtnVisible(param1);
      }
      
      public function setShiJieBeiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setShiJieBeiBtnVisible(param1);
      }
      
      public function setBuchangFubenBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setBuchangFubenBtnVisible(param1);
      }
      
      public function setZhongQiuJieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setZhongQiuJieBtnVisible(param1);
      }
      
      public function setYNBookRankBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNBookRankBtnVisible(param1);
      }
      
      public function setWangZheZhiBangBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setWangZheZhiBangBtnVisible(param1);
      }
      
      public function setYuanXiaoJieBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYuanXiaoJieBtnVisible(param1);
      }
      
      public function setYNMIKBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNMIKBtnVisible(param1);
      }
      
      public function setYNlianhuanchongzhiBtnVisible(param1:Boolean, param2:int) : void
      {
         this.charContainer.setYNlianhuanchongzhiBtnVisible(param1,param2);
      }
      
      public function setYNshoucichongzhiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNshoucichongzhiBtnVisible(false);
      }
      
      public function setYN2015zhongqiuBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYN2015zhongqiuBtnVisible(param1);
      }
      
      public function setYNChongzhiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNChongzhiBtnVisible(param1);
      }
      
      public function setYNqianghuazhishenVisible(param1:Boolean) : void
      {
         this.charContainer.setYNqianghuazhishenVisible(param1);
      }
      
      public function setYNqianghuazhishen2Visible(param1:Boolean) : void
      {
         this.charContainer.setYNqianghuazhishen2Visible(param1);
      }
      
      public function setYNqianghuazhishen3Visible(param1:Boolean) : void
      {
         this.charContainer.setYNqianghuazhishen3Visible(param1);
      }
      
      public function setYNqianghuazhishen4Visible(param1:Boolean) : void
      {
         this.charContainer.setYNqianghuazhishen4Visible(param1);
      }
      
      public function setYNshiziBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setYNshiziBtnVisible(param1);
      }
      
      public function setTunShiTianDiBtnVisible(param1:Boolean) : void
      {
         this.charContainer.setTunShiTianDiBtnVisible(param1);
      }
      
      public function setSkillBarVisible(param1:Boolean) : void
      {
         this.skillBar.visible = param1;
      }
      
      public function setSkillBarType(param1:int) : void
      {
         this.skillBar.setType(param1);
      }
      
      public function setSkillBarValue(param1:int, param2:Number, param3:Number, param4:int) : void
      {
         this.skillBar.setValue(param1,param2,param3,param4);
      }
      
      public function setTunShiTianDiFenShu(param1:int, param2:int) : void
      {
         GameInstance.uiInstance.tunShiTianDiVSResultPanel.setVS("",param1,"",param2);
         if(GameInstance.uiInstance.tunShiTianDiVSResultPanel.parent == null)
         {
            GameInstance.uiInstance.mainUI.charContainer.addChildAt(GameInstance.uiInstance.tunShiTianDiVSResultPanel,0);
            GameInstance.uiInstance.tunShiTianDiVSResultPanel.x = GameInstance.stage.stageWidth / 2 - GameInstance.uiInstance.tunShiTianDiVSResultPanel.width / 2;
            GameInstance.uiInstance.tunShiTianDiVSResultPanel.y = GameInstance.stage.stageHeight * 0.15;
         }
      }
      
      public function showTunShiTianDiFenShu(param1:Boolean) : void
      {
         if(param1)
         {
            if(GameInstance.uiInstance.tunShiTianDiVSResultPanel.parent == null)
            {
               GameInstance.uiInstance.mainUI.charContainer.addChildAt(GameInstance.uiInstance.tunShiTianDiVSResultPanel,0);
               GameInstance.uiInstance.tunShiTianDiVSResultPanel.x = GameInstance.stage.stageWidth / 2 - GameInstance.uiInstance.tunShiTianDiVSResultPanel.width / 2;
               GameInstance.uiInstance.tunShiTianDiVSResultPanel.y = GameInstance.stage.stageHeight * 0.15;
            }
         }
         else if(GameInstance.uiInstance.tunShiTianDiVSResultPanel.parent != null)
         {
            GameInstance.uiInstance.tunShiTianDiVSResultPanel.parent.removeChild(GameInstance.uiInstance.tunShiTianDiVSResultPanel);
         }
      }
      
      public function setMainUIType(param1:Boolean) : void
      {
         var _loc2_:SmallButton = null;
         if(param1)
         {
            this.window.graphics.clear();
            this.window.graphics.beginFill(0,0);
            this.window.graphics.drawRect(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
            this.window.graphics.endFill();
            addChildAt(this.window,this.numChildren);
            _loc2_ = new SmallButton();
            _loc2_.label = LanResManager.getLanCommonTextWords("退出双人坐骑状态");
            _loc2_.toolTip = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击退出双人坐骑状态") + "</font>";
            this.window.addChild(_loc2_);
            _loc2_.x = 22;
            _loc2_.y = GameConfig.sceneHeight / 2;
            _loc2_.addEventListener(MouseEvent.CLICK,this.onClick);
            addChildAt(this.chatContainer,this.numChildren);
         }
         else if(Boolean(this.window) && Boolean(this.window.parent))
         {
            this.window.parent.removeChild(this.window);
         }
      }
      
      public function setTargetBtnMoreList(param1:Boolean) : void
      {
         this.targetContainer.setMoreList(param1);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.MAINUI_QUEXIAO_QICHENG);
      }
      
      public function initDuiXueRenMapUI() : void
      {
         if(!this.duiXueRen)
         {
            this.duiXueRen = new DuiXueRen_MapXueRen();
            this.duiXueRen._parent = this;
         }
         addChild(this.duiXueRen);
         this.duiXueRen.x = GameConfig.sceneWidth - 700 >> 1;
         this.duiXueRen.y = GameConfig.sceneHeight - 361 >> 1;
      }
      
      public function setDuiXueRenMapData(param1:Object, param2:int, param3:String) : void
      {
         this.duiXueRen.setDuiXueRenMapData(param1,param2,param3);
      }
      
      public function setBaGuaZhenMainUIData(param1:Object) : void
      {
         this.baGuaZhenMainUIPanel.setBaGuaZhenMainData(param1);
      }
      
      public function setBaGuaZhenMainUIDiBanType(param1:Boolean) : void
      {
         this.currBaGuaZhenMainUIPanelType = param1;
         this.baGuaZhenMainUIPanel.setDiBanType(param1);
         this.resizeBaGuaZhenMainUIPanel();
      }
      
      private function resizeBaGuaZhenMainUIPanel() : void
      {
         if(Boolean(this.baGuaZhenMainUIPanel) && this.currBaGuaZhenMainUIPanelType)
         {
            this.baGuaZhenMainUIPanel.x = (GameConfig.sceneWidth - 126) / 2 + 7;
            this.baGuaZhenMainUIPanel.y = GameConfig.sceneHeight - 160;
         }
         else
         {
            this.baGuaZhenMainUIPanel.x = (GameConfig.sceneWidth - 126) / 2 + 7;
            this.baGuaZhenMainUIPanel.y = GameConfig.sceneHeight - 130;
         }
      }
      
      public function duiXueRenGoodsChangeHandler() : void
      {
         if(this.duiXueRen)
         {
            this.duiXueRen.duiXueRenGoodsChangeHandler();
         }
      }
      
      public function initShiJianShaLouBtnUI() : void
      {
         this.shijianshalouBrn = new NewSkinButton();
         this.shijianshalouBrn.skin = "shijianshalou_jishiqi_Button";
         addChild(this.shijianshalouBrn);
         this.shijianshalouBrn.visible = false;
         this.shijianshalouBrn.addEventListener(MouseEvent.CLICK,this.onClick22);
         this.timeFt = new FTextArea();
         addChild(this.timeFt);
         this.timeFt.filters = StaticValue.filter;
         this.timeFt.textColor = StaticValue.RED;
         this.timeFt.width = 175;
      }
      
      private function onClick22(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_SHIJIANSHALOU_PANEL);
      }
      
      public function setPanel(param1:int, param2:int, param3:String, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean) : void
      {
         var _loc12_:ShiJianShaLou = null;
         if(_loc12_ == null)
         {
            _loc12_ = new ShiJianShaLou();
            _loc12_.x = (GameConfig.sceneWidth - _loc12_.width) / 2;
            _loc12_.y = (GameConfig.sceneHeight - _loc12_.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(_loc12_);
         }
         _loc12_.setPanel(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,this.time);
      }
      
      public function showShiJianShaLouPanel(param1:int, param2:Boolean) : void
      {
         this.shijianshalouBrn.visible = !param2;
         this.time4 = param1;
         this.stratTime4 = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme4);
      }
      
      private function onEnterFarme4(param1:Event) : void
      {
         var _loc2_:int = (getTimer() - this.stratTime4) / 1000;
         _loc2_ = this.time4 - _loc2_;
         if(_loc2_ > 0)
         {
            this.timeFt.htmlText = "Thời gian còn lại：" + Math.floor(_loc2_ / 3600) + ":" + Math.floor(_loc2_ % 3600 / 60) + ":" + Math.floor(_loc2_ % 3600 % 60);
            this.timeFt.visible = true;
         }
         else
         {
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme4);
            this.timeFt.visible = false;
         }
      }
      
      public function setYiTianTuLongJiangLi(param1:int, param2:int, param3:Array) : void
      {
         if(!this.huashanzhidianjiangliContainer)
         {
            this.initHuaShanZhiDianJiangLiUI();
         }
         this.huashanzhidianjiangliContainer.setYiTianTuLongJiangLi(param1,param2,param3);
      }
      
      public function showYiTianTuLong(param1:Boolean, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:Array = null, param7:int = 0) : void
      {
         if(Boolean(this.yitiantulong) && this.yitiantulong.parent != null)
         {
            this.yitiantulong.visible = param1;
            if(param1)
            {
               this.yitiantulong.setpanel(param1,param2,param3,param4,param5,param6,param7);
            }
            else
            {
               this.removeHuaShanZhiDianJiangLi();
            }
         }
      }
      
      private function initHuaShanZhiDianJiangLiUI() : void
      {
         this.huashanzhidianjiangliContainer = new HuaShanZhiDianJiangLi();
         this.huashanzhidianjiangliContainer.x = GameConfig.sceneWidth - 565 >> 1;
         this.huashanzhidianjiangliContainer.y = GameConfig.sceneHeight - 314 >> 1;
         addChild(this.huashanzhidianjiangliContainer);
         this.huashanzhidianjiangliContainer.$parent = this;
      }
      
      public function removeHuaShanZhiDianJiangLi() : void
      {
         if(!this.huashanzhidianjiangliContainer)
         {
            return;
         }
         if(this.huashanzhidianjiangliContainer.parent)
         {
            this.huashanzhidianjiangliContainer.parent.removeChild(this.huashanzhidianjiangliContainer);
            this.huashanzhidianjiangliContainer = null;
         }
      }
      
      public function showLianZhan(param1:int) : void
      {
         if(param1 > 0)
         {
            this.lianzhanSpr.visible = true;
         }
         else
         {
            this.lianzhanSpr.visible = false;
         }
         while(this.lianzhanSpr.numChildren > 0)
         {
            this.lianzhanSpr.removeChildAt(0);
         }
         this.setTimelz(10);
         this.lianzhanBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/" + param1 + ".swf");
         this.lianzhanBg.x = 10;
         this.lianzhanBg.y = 2;
         this.lianzhanSpr.addChild(this.lianzhanBg);
         this.lianzhanArr[param1] = this.lianzhanBg;
      }
      
      public function setTimelz(param1:int) : void
      {
         this.time = param1;
         this.stratTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = (getTimer() - this.stratTime) / 1000;
         _loc2_ = this.time - _loc2_;
         if(_loc2_ > 0)
         {
            this.lianzhanSpr.visible = true;
         }
         else
         {
            this.lianzhanSpr.visible = false;
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
      }
      
      public function showZhunBei(param1:int) : void
      {
         this.time2 = param1;
         this.stratTime2 = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme1);
      }
      
      private function onEnterFarme1(param1:Event) : void
      {
         var _loc2_:int = (getTimer() - this.stratTime2) / 1000;
         _loc2_ = this.time2 - _loc2_;
         if(_loc2_ > 0)
         {
            this.zhunbeiSpr.visible = true;
            while(this.zhunbeiSpr.numChildren > 0)
            {
               this.zhunbeiSpr.removeChildAt(0);
            }
            this.zhunbeiBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/m" + _loc2_ + ".swf");
            this.zhunbeiSpr.addChild(this.zhunbeiBg);
            GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
         }
         else
         {
            this.zhunbeiSpr.visible = false;
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme1);
            GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
         }
      }
      
      public function setMoShouZhanChangJiangLiData(param1:Object) : void
      {
         if(!param1.isInto)
         {
            if(Boolean(this.moShouZhanChangJiangLi) && Boolean(this.moShouZhanChangJiangLi.parent))
            {
               this.moShouZhanChangJiangLi.parent.removeChild(this.moShouZhanChangJiangLi);
               this.moShouZhanChangJiangLi = null;
            }
            return;
         }
         if(!this.moShouZhanChangJiangLi || !this.moShouZhanChangJiangLi.parent)
         {
            this.moShouZhanChangJiangLi = new MoShouZhanChangJiangLiPanel();
            this.moShouZhanChangJiangLi._parent = this;
            this.moShouZhanChangJiangLi.x = GameConfig.sceneWidth - this.moShouZhanChangJiangLi.width;
            this.moShouZhanChangJiangLi.y = 220;
            addChild(this.moShouZhanChangJiangLi);
         }
         this.moShouZhanChangJiangLi.setMoShouZhanChangJiangLiData(param1);
      }
      
      public function setMoShouZhanChangFuHuoData() : void
      {
         if(!this.moShouZhanChangFuHuo || !this.moShouZhanChangFuHuo.parent)
         {
            this.moShouZhanChangFuHuo = new MoShouZhanChangFuHuoPanel();
            this.moShouZhanChangFuHuo._parent = this;
            addChild(this.moShouZhanChangFuHuo);
         }
         this.moShouZhanChangFuHuo.x = GameConfig.sceneWidth - this.moShouZhanChangFuHuo.width >> 1;
         this.moShouZhanChangFuHuo.y = GameConfig.sceneHeight - this.moShouZhanChangFuHuo.height >> 1;
         this.moShouZhanChangFuHuo.setMoShouZhanChangFuHuoData();
      }
      
      public function setMoShouZhanChangYanShiData() : void
      {
         if(!this.moShouZhanChangYanShi || !this.moShouZhanChangYanShi.parent)
         {
            this.moShouZhanChangYanShi = new MoShouZhanChangYanShiView();
            this.moShouZhanChangYanShi._parent = this;
            addChild(this.moShouZhanChangYanShi);
         }
         this.moShouZhanChangYanShi.x = GameConfig.sceneWidth - this.moShouZhanChangYanShi.width >> 1;
         this.moShouZhanChangYanShi.y = GameConfig.sceneHeight - this.moShouZhanChangYanShi.height >> 1;
         this.moShouZhanChangYanShi.setMoShouZhanChangYanShiData();
      }
   }
}

