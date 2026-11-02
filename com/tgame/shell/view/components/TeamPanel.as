package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.couple.BuyGoodsPanel;
   import com.tgame.shell.view.components.couple.YupeiListRender;
   import com.tgame.shell.view.components.friend.SearchPlayerPanel;
   import com.tgame.shell.view.components.team.CombinationSelect;
   import com.tgame.shell.view.components.team.MyConsort;
   import com.tgame.shell.view.components.team.MyTteam;
   import com.tgame.shell.view.components.team.OtherPlayer;
   import com.tgame.shell.view.components.team.OtherTeam;
   import com.tgame.shell.view.components.team.SeekingSearch;
   import com.tgame.shell.view.components.team.WeddingList;
   import com.tgame.shell.view.components.team.XinzengqingyuListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   
   public class TeamPanel extends FPanel
   {
      
      public static const UI_TEAMPANEL_MYTEAM_SHOW:String = "UI_TEAMPANEL_MYTEAM_SHOW";
      
      public static const UI_TEAMPANEL_MYTEAM_ORDERBTN_CLICK:String = "UI_TEAMPANEL_MYTEAM_ORDERBTN_CLICK";
      
      public static const UI_TEAMPANEL_MYTEAM_4LINGZHENG_CLICK:String = "UI_TEAMPANEL_MYTEAM_4LINGZHENG_CLICK";
      
      public static const UI_TEAMPANEL_MYTEAM_ORDER_USE:String = "UI_TEAMPANEL_MYTEAM_ORDER_USE";
      
      public static const UI_TEAMPANEL_MYTEAM_SHOW_PREREQUISITE_CHANGE:String = "UI_TEAMPANEL_MYTEAM_SHOW_PREREQUISITE_CHANGE";
      
      public static const UI_TEAMPANEL_MYTEAM_MODIFT_DECLARE:String = "UI_TEAMPANEL_MYTEAM_MODIFT_DECLARE";
      
      public static const UI_TEAMPANEL_MYTEAM_CREATETAMEBTN_CLICK:String = "UI_TEAMPANEL_MYTEAM_CREATETAMEBTN_CLICK";
      
      public static const UI_TEAMPANEL_MYTEAM_APPOINTLEADERBTN_CLICK:String = "UI_TEAMPANEL_MYTEAM_APPOINTLEADERBTN_CLICK";
      
      public static const UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_CLICK:String = "UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_CLICK";
      
      public static const UI_TEAMPANEL_MYTEAM_SEARCH_PLAYER:String = "UI_FRIEND_SEARCH_BNT_CLICK";
      
      public static const UI_TEAMPANEL_MYTEAM_GET_PREPAGE:String = "UI_FRIEND_GET_PREPAGE";
      
      public static const UI_TEAMPANEL_MYTEAM_GET_NEXTPAGE:String = "UI_FRIEND_GET_NEXTPAGE";
      
      public static const UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_MEMBER:String = "UI_TEAMPANEL_MYTEAM_ADDMEMBERBTN_MEMBER";
      
      public static const UI_TEAMPANEL_MYTEAM_LEAVETEAMBTN_CLICK:String = "UI_TEAMPANEL_MYTEAM_LEAVETEAMBTN_CLICK";
      
      public static const UI_TEAMPANEL_MYTEAM_DISEMPLOYTEAMBTN_CLICK:String = "UI_TEAMPANEL_MYTEAM_DISEMPLOYTEAMBTN_CLICK";
      
      public static const UI_TEAMPANEL_MYTEAM_LOOKINFOBTN_CLICK:String = "UI_FRIEND_LOOK_INFOBTN_CLICK";
      
      public static const UI_TEAMPANEL_OTHERTEAM_SHOW:String = "UI_TEAMPANEL_OTHERTEAM_SHOW";
      
      public static const UI_TEAMPANEL_OTHERTEAM_GET_PAGE:String = "UI_TEAMPANEL_OTHERTEAM_GET_PAGE";
      
      public static const UI_TEAMPANEL_OTHERTEAM_GET_OTHERTEAM_MEMBERLIST:String = "UI_TEAMPANEL_OTHERTEAM_GET_OTHERTEAM_MEMBERLIST";
      
      public static const UI_TEAMPANEL_OTHERTEAM_REFRESH_LIST:String = "UI_TEAMPANEL_OTHERTEAM_REFRESH_LIST";
      
      public static const UI_TEAMPANEL_OTHERTEAM_ADD_TEAM:String = "UI_TEAMPANEL_OTHERTEAM_ADD_TEAM";
      
      public static const UI_TEAMPANEL_OTHERPLAYER_SHOW:String = "UI_TEAMPANEL_OTHERPLAYER_SHOW";
      
      public static const UI_TEAMPANEL_OTHERPLAYER_GET_PAGE:String = "UI_TEAMPANEL_OTHERPLAYER_GET_PAGE";
      
      public static const UI_TEAMPANEL_OTHERPLAYER_REFRESH_LIST:String = "UI_TEAMPANEL_OTHERPLAYER_REFRESH_LIST";
      
      public static const UI_TEAMPANEL_OTHERPLAYER_LOOKINFO:String = "UI_TEAMPANEL_OTHERPLAYER_LOOKINFO";
      
      public static const UI_TEAMPANEL_OTHERPLAYER_INVITE_TEAM:String = "UI_TEAMPANEL_OTHERPLAYER_INVITE_TEAM";
      
      public static const UI_TEAMPANEL_OTHERPLAYER_SEARCH_PLAYER:String = "UI_TEAMPANEL_OTHERPLAYER_SEARCH_PLAYER";
      
      public static const UI_TEAMPANEL_OTHERPLAYER_MENU_CLICK:String = "UI_TEAMPANEL_OTHERPLAYER_MENU_CLICK";
      
      public static const UI_TEAMPANEL_HUNYAN_SHOW:String = "UI_TEAMPANEL_HUNYAN_SHOW";
      
      public static const UI_TEAMPANEL_HUNYAN_GET_PAGE:String = "UI_TEAMPANEL_HUNYAN_GET_PAGE";
      
      public static const UI_TEAMPANEL_HUNYANBANGZHU_CLICK:String = "UI_TEAMPANEL_HUNYANBANGZHU_CLICK";
      
      public static const UI_TEAMPANEL_SONGSHANGHONGBAO_CLICK:String = "UI_TEAMPANEL_SONGSHANGHONGBAO_CLICK";
      
      public static const UI_TEAMPANEL_LINGQUHONGBAO_CLICK:String = "UI_TEAMPANEL_LINGQUHONGBAO_CLICK";
      
      public static const UI_TEAMPANEL_MYCONSORT_SHOW:String = "UI_TEAMPANEL_MYCONSORT_SHOW";
      
      public static const UI_TEAMPANEL_MYCONSORT_TANCHUXIANGXIZILIAO_CLICK:String = "UI_TEAMPANEL_MYCONSORT_TANCHUXIANGXIZILIAO_CLICK";
      
      public static const UI_TEAMPANEL_MYCONSORT_XINZENGQINGYU_CLICK:String = "UI_TEAMPANEL_MYCONSORT_XINZENGQINGYU_CLICK";
      
      public static const UI_TEAMPANEL_MYCONSORT_GENGHUANYUPEI_CLICK:String = "UI_TEAMPANEL_MYCONSORT_GENGHUANYUPEI_CLICK";
      
      public static const UI_TEAMPANEL_MYCONSORT_YIZHIXIUSHU_CLICK:String = "UI_TEAMPANEL_MYCONSORT_YIZHIXIUSHU_CLICK";
      
      public static const UI_TEAMPANEL_MYCONSORT_TADEJINGMAI_CLICK:String = "UI_TEAMPANEL_MYCONSORT_TADEJINGMAI_CLICK";
      
      public static const UI_TEAMPANEL_MYCONSORT_JUBANHUNYAN_CLICK:String = "UI_TEAMPANEL_MYCONSORT_JUBANHUNYAN_CLICK";
      
      public static const UI_TEAMPANEL_MYCONSORT_TADEWUGONG_CLICK:String = "UI_TEAMPANEL_MYCONSORT_TADEWUGONG_CLICK";
      
      public static const UI_TEAMPANEL_MYCONSORT_DONGTAYIXIA_CLICK:String = "UI_TEAMPANEL_MYCONSORT_DONGTAYIXIA_CLICK";
      
      public static const UI_XINZENGXINYUPANEL_DELECT_XINZENG:String = "UI_XINZENGXINYUPANEL_DELECT_XINZENG";
      
      public static const UI_XINZENGXINYUPANEL_XINZENG:String = "UI_XINZENGXINYUPANEL_XINZENG";
      
      public static const UI_YUPEISWAPPANEL_FANGRUDINGQINGPEI_CLICK:String = "UI_YUPEISWAPPANEL_FANGRUDINGQINGPEI_CLICK";
      
      public static const UI_YUPEISWAPPANEL_GOUMAIDINGQINGPEI_CLICK:String = "UI_YUPEISWAPPANEL_GOUMAIDINGQINGPEI_CLICK";
      
      public static const UI_YUPEISWAPPANEL_KAISHIJIAOHUAN_CLICK:String = "UI_YUPEISWAPPANEL_KAISHIJIAOHUAN_CLICK";
      
      public static const UI_YUPEISWAPPANEL_QUHUIYUANPEI_CLICK:String = "UI_YUPEISWAPPANEL_QUHUIYUANPEI_CLICK";
      
      public static const UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK:String = "UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK";
      
      public static const UI_LIHUNXIUSHU_FASONGXIEYIXIUSHU_CLICK:String = "UI_LIHUNXIUSHU_FASONGXIEYIXIUSHU_CLICK";
      
      public static const UI_LIHUNXIUSHU_QIANGZHILIHUN_CLICK:String = "UI_LIHUNXIUSHU_QIANGZHILIHUN_CLICK";
      
      public static const UI_TEAMPANEL_MYCONSORT_SHENDIAOXIALV_CLICK:String = "UI_TEAMPANEL_MYCONSORT_SHENDIAOXIALV_CLICK";
      
      public static const UI_YUPEISWAPPANEL_QUHUIDUIJIAN_CLICK:String = "UI_YUPEISWAPPANEL_QUHUIDUIJIAN_CLICK";
      
      public static const UI_MYCONSORT_SKILL_DRAG_START:String = "UI_MYCONSORT_SKILL_DRAG_START";
      
      public var tabBar:FTabBar;
      
      private var myTeam:MyTteam;
      
      private var oTeam:OtherTeam;
      
      private var oPlayer:OtherPlayer;
      
      private var weddinglist:WeddingList;
      
      private var combination:CombinationSelect;
      
      public var myconsort:MyConsort;
      
      private var seekingsearch:SeekingSearch;
      
      private var searchPanel:SearchPlayerPanel;
      
      private var yupeishopPanel:YupeiShopPanel;
      
      public function TeamPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 576;
         height = 432;
         titleText = LanResManager.getLanCommonTextWords("我的队伍与我的TA");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.myTeam = new MyTteam();
         this.myTeam.$parent = this;
         addChild(this.myTeam);
         this.myTeam.x = 10;
         this.myTeam.y = 22;
         this.oTeam = new OtherTeam();
         this.oTeam.$parent = this;
         addChild(this.oTeam);
         this.oTeam.x = 10;
         this.oTeam.y = 22;
         this.oPlayer = new OtherPlayer();
         this.oPlayer.$parent = this;
         addChild(this.oPlayer);
         this.oPlayer.x = 10;
         this.oPlayer.y = 22;
         this.seekingsearch = new SeekingSearch();
         this.seekingsearch.$parent = this;
         addChild(this.seekingsearch);
         this.seekingsearch.x = 10;
         this.seekingsearch.y = 22;
         this.myconsort = new MyConsort();
         this.myconsort.$parent = this;
         this.myconsort.zanwenValue.$parent = this;
         addChild(this.myconsort);
         this.myconsort.x = 10;
         this.myconsort.y = 22;
         XinzengqingyuListRender.$parent = this;
         this.weddinglist = new WeddingList();
         this.weddinglist.$parent = this;
         addChild(this.weddinglist);
         this.weddinglist.x = 10;
         this.weddinglist.y = 22;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.myTeam.bgImg);
         _loc1_.push(this.oTeam.bgImg);
         _loc1_.push(this.oPlayer.bgImg);
         _loc1_.push(this.myconsort.bgImg);
         _loc1_.push(this.myconsort.bgImg2);
         _loc1_.push(this.myconsort.bgImg3);
         _loc1_.push(this.seekingsearch.bgImg);
         _loc1_.push(this.weddinglist.bgImg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("我的队伍"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("附近队伍"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("附近玩家"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("我的配偶"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("婚宴列表"),this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         addEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_YUPEILISTRENDERI_OK_CLICK,this.goumaiQueren);
      }
      
      private function goumaiQueren(param1:BaseEvent) : void
      {
         this.showBuyPanel(param1.data.id,param1.data.tubiaoMath,param1.data.name,int(param1.data.price));
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("我的队伍"):
               dispatchEvent(new BaseEvent(UI_TEAMPANEL_MYTEAM_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("附近队伍"):
               dispatchEvent(new BaseEvent(UI_TEAMPANEL_OTHERTEAM_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("附近玩家"):
               dispatchEvent(new BaseEvent(UI_TEAMPANEL_OTHERPLAYER_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("我的配偶"):
               dispatchEvent(new BaseEvent(UI_TEAMPANEL_MYCONSORT_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("征婚搜索"):
               break;
            case LanResManager.getLanCommonTextWords("婚宴列表"):
               dispatchEvent(new BaseEvent(UI_TEAMPANEL_HUNYAN_SHOW));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.close();
      }
      
      public function showMyTeam() : void
      {
         this.myTeam.visible = true;
         this.myTeam.hideInputNamePanel();
         this.oTeam.visible = false;
         this.oPlayer.visible = false;
         this.weddinglist.visible = false;
         this.myconsort.visible = false;
         this.myconsort.hideZanWen();
         this.seekingsearch.visible = false;
      }
      
      public function setMyTeamMember(param1:Array) : void
      {
         this.myTeam.setMember(param1);
      }
      
      public function setMyTeamDeclare(param1:String) : void
      {
         this.myTeam.setDeclare(param1);
      }
      
      public function setBtnState(param1:int) : void
      {
         this.myTeam.setBtnState(param1);
      }
      
      public function setMyTeamShowPrerequisite(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.myTeam.setShowPrerequisite(param1,param2,param3);
      }
      
      public function setOrderName(param1:String) : void
      {
         this.myTeam.setOrderName(param1);
      }
      
      public function showOrderPanel(param1:Array) : void
      {
         this.myTeam.showOrderPanel(param1);
      }
      
      public function showInviteInputNamePanel() : void
      {
         this.myTeam.showInputNamePanel();
      }
      
      public function showSearchPanel() : void
      {
         if(!this.searchPanel)
         {
            this.searchPanel = new SearchPlayerPanel();
            this.searchPanel.type = LanResManager.getLanCommonTextWords("组队");
            this.searchPanel.$parent = this;
         }
         this.searchPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.searchPanel);
         this.searchPanel.x = (GameConfig.sceneWidth - this.searchPanel.panelWidth) / 2;
         this.searchPanel.y = (GameConfig.sceneHeight - this.searchPanel.panelHeight) / 2;
      }
      
      public function setSearchResult(param1:XML, param2:int) : void
      {
         this.searchPanel.setList(param1,param2);
      }
      
      public function showOtherTeam() : void
      {
         this.myTeam.visible = false;
         this.oTeam.visible = true;
         this.oPlayer.visible = false;
         this.weddinglist.visible = false;
         this.myconsort.visible = false;
         this.myconsort.hideZanWen();
         this.seekingsearch.visible = false;
      }
      
      public function setOtherTeamList(param1:XML, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.oTeam.setTeamList(param1,param2,param3,param4,param5);
      }
      
      public function setOtherTeamMemberList(param1:XML) : void
      {
         this.oTeam.setTeamMemberList(param1);
      }
      
      public function showOtherPlayer() : void
      {
         this.myTeam.visible = false;
         this.oTeam.visible = false;
         this.oPlayer.visible = true;
         this.weddinglist.visible = false;
         this.myconsort.visible = false;
         this.myconsort.hideZanWen();
         this.seekingsearch.visible = false;
      }
      
      public function setOtherPlayerList(param1:XML, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.oPlayer.setPlayerList(param1,param2,param3,param4,param5);
      }
      
      public function showWeddingList() : void
      {
         this.myTeam.visible = false;
         this.oTeam.visible = false;
         this.oPlayer.visible = false;
         this.weddinglist.visible = true;
         this.myconsort.visible = false;
         this.myconsort.hideZanWen();
         this.seekingsearch.visible = false;
      }
      
      public function setInitialize(param1:Array) : void
      {
         this.weddinglist.setInitialize(param1);
      }
      
      public function setPage(param1:int, param2:int) : void
      {
         this.weddinglist.setPage(param1,param2);
      }
      
      public function showMyConsort(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("我的配偶"));
         }
         this.myTeam.visible = false;
         this.oTeam.visible = false;
         this.oPlayer.visible = false;
         this.weddinglist.visible = false;
         this.myconsort.visible = true;
         this.myconsort.hideZanWen();
         this.seekingsearch.visible = false;
      }
      
      public function setBaseAttribute(param1:String, param2:String, param3:Number, param4:Number, param5:int, param6:String, param7:String, param8:String, param9:Number = -1, param10:int = 0, param11:int = -1, param12:int = -1, param13:int = -1) : void
      {
         this.myconsort.setBaseAttribute(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function setZhenQi(param1:int, param2:int) : void
      {
         this.myconsort.setZhenQi(param1,param2);
      }
      
      public function setHPMP(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.myconsort.setHPMP(param1,param2,param3,param4,param5,param6);
      }
      
      public function setSkillValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:int, param6:int, param7:Number, param8:Number, param9:Number) : void
      {
         this.myconsort.setSkillValue(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setPoint(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.myconsort.setPoint(param1,param2,param3,param4,param5);
      }
      
      public function setJingjie(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.myconsort.setJingjie(param1,param2,param3,param4,param5,param6);
      }
      
      public function setShowItem(param1:Array, param2:int = 0) : void
      {
         this.myconsort.setShowItem(param1,param2);
      }
      
      public function setAvatar(param1:BitmapData) : void
      {
         this.myconsort.avatar = param1;
      }
      
      public function setFlag(param1:int) : void
      {
         this.myconsort.setFlag(param1);
      }
      
      public function setICOState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.myconsort.ico.setState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setSiShengShouState(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.myconsort.ico.setSiShengShouState(param1,param2,param3,param4);
      }
      
      public function setICOXiantian(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         this.myconsort.ico.setXiantian(param1,param2,param3,param4);
      }
      
      public function setICORouti(param1:Boolean) : void
      {
         this.myconsort.ico.setRouti(param1);
      }
      
      public function setICOWuhun(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:Boolean, param9:int) : void
      {
         this.myconsort.ico.setWuhun(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setICOHuXinYao(param1:Boolean) : void
      {
         this.myconsort.ico.setHuXinYao(param1);
      }
      
      public function setICONiXi(param1:Boolean) : void
      {
         this.myconsort.ico.setNiXi(param1);
      }
      
      public function setICOFengHuang(param1:Boolean) : void
      {
         this.myconsort.ico.setFengHuang(param1);
      }
      
      public function setYupei(param1:Goods = null) : void
      {
         this.myconsort.setYupei(param1);
      }
      
      public function setFuwiwuxueFun(param1:Array) : void
      {
         this.myconsort.setFuwiwuxueFun(param1);
      }
      
      public function setYupeiFun(param1:Array) : void
      {
         this.myconsort.setYupeiFun(param1);
      }
      
      public function setChatContent(param1:Array) : void
      {
         this.myconsort.setChatContent(param1);
      }
      
      public function showXinzenqingyuFun() : void
      {
         this.myconsort.showXinzenqingyuFun();
      }
      
      public function showYupeiSwapPanelFun() : void
      {
         this.myconsort.showYupeiSwapPanelFun();
      }
      
      public function setDangqianyupei(param1:Array) : void
      {
         this.myconsort.setDangqianyupei(param1);
      }
      
      public function setSwapyupei(param1:Array) : void
      {
         this.myconsort.setSwapyupei(param1);
      }
      
      public function showLihunxiushuPanelFun() : void
      {
         this.myconsort.showLihunxiushuPanelFun();
      }
      
      public function showYupeiShopPanel(param1:Array) : void
      {
         if(!this.yupeishopPanel)
         {
            YupeiListRender.$parent = this;
            this.yupeishopPanel = new YupeiShopPanel();
            this.yupeishopPanel.$parent = this;
         }
         this.yupeishopPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.yupeishopPanel);
         this.yupeishopPanel.x = (GameConfig.sceneWidth - this.yupeishopPanel.width) / 2;
         this.yupeishopPanel.y = (GameConfig.sceneHeight - this.yupeishopPanel.height) / 2;
         this.yupeishopPanel.setInitialize(param1);
      }
      
      public function showBuyPanel(param1:int, param2:String, param3:String, param4:int) : void
      {
         var _loc5_:BuyGoodsPanel = new BuyGoodsPanel();
         _loc5_.$parent = this;
         _loc5_.setItem(param1,param2,param3,param4);
         POPWindowManager.showWindow(_loc5_);
      }
      
      public function noOnlineFun() : void
      {
         this.myconsort.noOnlineFun();
      }
      
      public function isMarriageFun(param1:Boolean) : void
      {
         this.myconsort.isMarriageFun(param1);
      }
      
      public function close() : void
      {
         if(this.myconsort.xinzengxinyuPanel != null && this.myconsort.xinzengxinyuPanel.parent != null)
         {
            this.myconsort.xinzengxinyuPanel.parent.removeChild(this.myconsort.xinzengxinyuPanel);
         }
         if(this.myconsort.yupeiswapPanel != null && this.myconsort.yupeiswapPanel.parent != null)
         {
            this.myconsort.yupeiswapPanel.parent.removeChild(this.myconsort.yupeiswapPanel);
         }
         if(this.myconsort.lihunxiushuPanel != null && this.myconsort.lihunxiushuPanel.parent != null)
         {
            this.myconsort.lihunxiushuPanel.parent.removeChild(this.myconsort.lihunxiushuPanel);
         }
         this.myconsort.setChatContent([]);
         this.setYupei();
         this.setYupeiFun([]);
      }
      
      public function setZanWenValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.myconsort.setZanWenValue(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public function set9JianJianCheng(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number) : void
      {
         this.myconsort.set9JianJianCheng(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public function showSeekingSearch() : void
      {
         this.myTeam.visible = false;
         this.oTeam.visible = false;
         this.oPlayer.visible = false;
         this.weddinglist.visible = false;
         this.myconsort.visible = false;
         this.myconsort.hideZanWen();
         this.seekingsearch.visible = true;
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         this.myconsort.setAvaterXY(param1,param2,param3);
      }
      
      public function setStarSta(param1:int) : void
      {
         this.myconsort.setStarSta(param1);
      }
      
      public function setStatusByString(param1:String) : void
      {
         this.myconsort.setStatusByString(param1);
      }
   }
}

