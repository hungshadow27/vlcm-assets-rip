package com.tgame.moudels.mainui.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.skill.BuffRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.MonsterType;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.staticdata.NpcType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SettingKey;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Girl;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.NPC;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.ConfirmManager;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mainui.MainUI_ApplicationFacade;
   import com.tgame.moudels.mainui.model.MainUI_MsgSendProxy;
   import com.tgame.moudels.newyear.NewYear_ApplicationFacade;
   import com.tgame.moudels.newyear.model.NewYear_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MainUI_MainUIMediator extends Mediator
   {
      
      public static const NAME:String = "MainUI_MainUIMediator";
      
      private var timer:Timer;
      
      private var tempMainCharData:Object;
      
      private var tempLockOnTargetPlayerData:Object;
      
      private var setTaskNPCStatus:Array;
      
      private var isSetTaskNPC:Boolean = false;
      
      private var mapChangeLineBaseEvent:MouseEvent;
      
      private var lineArr:Array;
      
      private var lineMenu:Menu;
      
      private var _mainUI_miniMapMediator:MainUI_MiniMapMediator;
      
      private var _msgSenderProxy:MainUI_MsgSendProxy;
      
      private var _newYear_MsgSenderProxy:NewYear_MsgSenderProxy;
      
      public function MainUI_MainUIMediator()
      {
         super(NAME);
      }
      
      protected function get mainUI() : MainUI
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.mainUI);
         }
         return viewComponent as MainUI;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [MainUI_ApplicationFacade.REF_MAINCHAR_HEAD,MainUI_ApplicationFacade.REF_LOCKEDCHAR_HEAD,MainUI_ApplicationFacade.INIT_MINI_MAP,MainUI_ApplicationFacade.SET_SMALL_MAP_STATIC_DATA,MainUI_ApplicationFacade.TASK_UPDATE_ALL_NPC_STATUS,MainUI_ApplicationFacade.UPDATA_MOUNT_SKILL,MainUI_ApplicationFacade.CHANGE_LINE,MainUI_ApplicationFacade.SHOW_MAP,MainUI_ApplicationFacade.CHANGE_CHAT_SIZE,MainUI_ApplicationFacade.HIDE_GUIDE_BAR,MainUI_ApplicationFacade.SHOW_LOCK_CHAR,MainUI_ApplicationFacade.JINYAN,MainUI_ApplicationFacade.GET_BAGUAZHENMAINUI_SHOW_HIDE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case MainUI_ApplicationFacade.INIT_MINI_MAP:
               this.initMiniMap(_loc2_ as BitmapData);
               break;
            case MainUI_ApplicationFacade.SET_SMALL_MAP_STATIC_DATA:
               _loc3_ = Boolean((_loc2_ as Array)[0]);
               _loc4_ = Boolean((_loc2_ as Array)[1]);
               _loc5_ = Boolean((_loc2_ as Array)[2]);
               this.updateMiniMap(_loc3_,_loc4_,_loc5_);
               break;
            case MainUI_ApplicationFacade.REF_MAINCHAR_HEAD:
               this.updataMainUIChar();
               break;
            case MainUI_ApplicationFacade.REF_LOCKEDCHAR_HEAD:
               this.updataMainUIOtherPlayer(_loc2_ as SceneCharacter);
               break;
            case MainUI_ApplicationFacade.TASK_UPDATE_ALL_NPC_STATUS:
               this.setTaskNPCStatus = _loc2_ as Array;
               if(this.isSetTaskNPC)
               {
                  this.mainUI.setTaskNPCState(this.setTaskNPCStatus[0],this.setTaskNPCStatus[1].concat(this.setTaskNPCStatus[3]),this.setTaskNPCStatus[2]);
               }
               break;
            case MainUI_ApplicationFacade.UPDATA_MOUNT_SKILL:
               this.updataMountSkill(_loc2_ as Array);
               break;
            case MainUI_ApplicationFacade.CHANGE_LINE:
               this.showSelectLine(_loc2_ as Array);
               break;
            case MainUI_ApplicationFacade.SHOW_MAP:
               this.mainUI_miniMapMediator.addMap();
               break;
            case MainUI_ApplicationFacade.CHANGE_CHAT_SIZE:
               this.mainUI.changeChatSize();
               break;
            case MainUI_ApplicationFacade.HIDE_GUIDE_BAR:
               _loc6_ = _loc2_ as Boolean;
               this.mainUI.showguidbar(_loc6_);
               break;
            case MainUI_ApplicationFacade.SHOW_LOCK_CHAR:
               this.showLockChar(_loc2_ as Array);
               break;
            case MainUI_ApplicationFacade.JINYAN:
               this.msgSenderProxy.send_30201(_loc2_ as int);
               break;
            case MainUI_ApplicationFacade.GET_BAGUAZHENMAINUI_SHOW_HIDE:
               this.mainUI.setBaGuaZhenMainUIDiBanType(_loc2_ as Boolean);
         }
      }
      
      private function showTelePortAndNPC(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc11_:SceneCharacter = null;
         var _loc12_:Object = null;
         var _loc13_:NPC = null;
         if(param1)
         {
            this.mainUI.setPortal([]);
         }
         this.mainUI.setNPC([]);
         var _loc4_:MapRes = MapTransManager.getMapRes(GameInstance.scene.mapConfig.mapID);
         this.mainUI.setMapName(_loc4_.name);
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:Array = [];
         var _loc10_:int = 0;
         while(_loc10_ < GameInstance.scene.sceneCharacters.length)
         {
            _loc11_ = GameInstance.scene.sceneCharacters[_loc10_];
            _loc12_ = {};
            if(_loc11_.type == SceneCharacterType.TRANSPORT && param1)
            {
               _loc12_.name = _loc11_.headFace != null ? _loc11_.headFace.nickName : _loc11_.name;
               _loc12_.xy = new Point(_loc11_.piexl_x,_loc11_.piexl_y);
               _loc12_.dec = _loc11_.name;
               _loc12_.id = _loc11_.id;
               _loc5_.push(_loc12_);
            }
            if(_loc11_.type == SceneCharacterType.NPC && param2)
            {
               _loc13_ = _loc11_.data as NPC;
               if(_loc13_.res.npctype == NpcType.FUNCTION)
               {
                  _loc12_.name = _loc11_.headFace != null ? _loc11_.headFace.nickName : _loc11_.name;
                  _loc12_.xy = new Point(_loc11_.piexl_x,_loc11_.piexl_y);
                  _loc12_.dec = _loc11_.name;
                  _loc12_.id = _loc11_.id;
                  _loc7_.push(_loc12_);
               }
               if(_loc13_.res.npctype == NpcType.TASK)
               {
                  _loc12_.name = _loc11_.name;
                  _loc12_.xy = new Point(_loc11_.piexl_x,_loc11_.piexl_y);
                  _loc12_.dec = _loc11_.headFace != null ? _loc11_.headFace.nickName : _loc11_.name;
                  _loc12_.id = _loc11_.id;
                  _loc8_.push(_loc12_);
               }
               if(_loc13_.res.npctype == NpcType.BUSINESS)
               {
                  _loc12_.name = _loc11_.headFace != null ? _loc11_.headFace.nickName : _loc11_.name;
                  _loc12_.xy = new Point(_loc11_.piexl_x,_loc11_.piexl_y);
                  _loc12_.dec = _loc11_.name;
                  _loc12_.id = _loc11_.id;
                  _loc9_.push(_loc12_);
               }
            }
            _loc10_++;
         }
         if(param1)
         {
            this.mainUI.setPortal(_loc5_);
         }
         if(param2)
         {
            this.mainUI.setTaskNPC(_loc8_);
            this.mainUI.setFunctionNPC(_loc7_);
            this.mainUI.setBusinessNPC(_loc9_);
            if(this.setTaskNPCStatus != null)
            {
               this.mainUI.setTaskNPCState(this.setTaskNPCStatus[0],this.setTaskNPCStatus[1].concat(this.setTaskNPCStatus[3]),this.setTaskNPCStatus[2]);
            }
            this.isSetTaskNPC = true;
         }
      }
      
      private function initMiniMap(param1:BitmapData) : void
      {
         this.mainUI.setMap(param1);
         this.miniMapTimerListener();
         this.addMiniMapShowTimer();
      }
      
      private function updateMiniMap(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true) : void
      {
         this.showTelePortAndNPC(param1,param2,param3);
      }
      
      private function addMiniMapShowTimer() : void
      {
         if(this.timer)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.miniMapTimerListener);
            this.timer = null;
         }
         this.miniMapTimerListener();
         this.timer = new Timer(OtherConst.MINI_MAP_REFRESH_TIME);
         this.timer.addEventListener(TimerEvent.TIMER,this.miniMapTimerListener);
         this.timer.start();
      }
      
      private function miniMapTimerListener(param1:TimerEvent = null) : void
      {
         var _loc7_:Object = null;
         var _loc8_:PurePlayer = null;
         var _loc9_:Object = null;
         this.mainUI.setMonster([]);
         var _loc2_:SceneCharacter = GameInstance.mainChar;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < GameInstance.scene.sceneCharacters.length)
         {
            _loc2_ = GameInstance.scene.sceneCharacters[_loc5_];
            _loc7_ = {};
            if(_loc2_.type == SceneCharacterType.MONSTER)
            {
               _loc7_.name = _loc2_.name;
               _loc7_.xy = new Point(_loc2_.piexl_x,_loc2_.piexl_y);
               _loc7_.dec = _loc7_.name;
               _loc7_.id = _loc2_.id;
               _loc7_.zhenyingID = (_loc2_.data as Monster).attributeInfo.zhenyingID;
               if(!((_loc2_.data as Monster).res.type == MonsterType.JIGUANGUAI || (_loc2_.data as Monster).res.type == MonsterType.BIWUZHAOQIN_XIUQIU_MONSTER))
               {
                  _loc3_.push(_loc7_);
               }
            }
            _loc5_++;
         }
         this.mainUI.setMonster(_loc3_);
         var _loc6_:Array = GameInstance.mainCharData.teamInfo.teamPlayers;
         _loc3_ = [];
         _loc5_ = 0;
         while(_loc5_ < _loc6_.length)
         {
            _loc8_ = _loc6_[_loc5_] as PurePlayer;
            _loc9_ = GameInstance.mainCharData.teamInfo.tempPlayerXYObj;
            if(Boolean(_loc8_) && Boolean(_loc9_) && Boolean(_loc9_[_loc8_.id]))
            {
               _loc3_.push({
                  "name":_loc8_.name,
                  "xy":new Point(_loc9_[_loc8_.id].x,_loc9_[_loc8_.id].y),
                  "dec":""
               });
            }
            _loc5_++;
         }
         this.mainUI.setTeamMebmer(_loc3_);
      }
      
      private function initEvents() : void
      {
         this.mainUI.targetVisable = false;
         EventDispatchCenter.getInstance().addEventListener(MainUI.MAINUI_TIMEGIFT_BTN_CLICK,this.mainUIHandle);
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            mainUI.addEventListener(MainUI.FUNCTION_CHARBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_BACKPACKBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_SKLLBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_TASKBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_TEAMBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_MEIREN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_RIDEBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAP_OPTIONBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAP_LINEBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAP_MAPBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_MALLBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_STEUPBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAP_TOPBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_FRIENDBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAP_CHANGEOTHERCHARNAMESHOWBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAP_HUODONG_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAP_INFO_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAP_ZHENGFU_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_STUDYBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCITON_JUMP_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCITON_SIT_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_OPTION_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_BIWU_CROSSPLATFORM_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_RIDE_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCITON_AUTO_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_GIFT_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_JUBAOPEN_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_MAINCHAR_AUTO_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_MAINCHAR_AUTO_VALUE_CHANGE,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_VIEWBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_TRADINGBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_FRIENDBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_TEAMBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_CHATBTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_PARTY_INVITE_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_LARGESS_FLOWER_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_COURTSHIP_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_LOOK_SHOP_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_SHUANGXIU_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_CHENGJIU_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_CHARHEAD_HEAD_IMG_CHANGE,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_LIAOSHANG_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_JINYAN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_KUAFU_GUIZHE_QUERY,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_PARTY_TASK_HUBIAO_CANCEL,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_ZHANDOULI_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_KUAFU_LIKAI_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_SHISHIZHANKUANG_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_FEIXING_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_QIANLIDIAN_GUIDE,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_SHUANG_GUIDE,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_JINENG_GUIDE,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_JIANG_GUIDE,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_CISHA_GUIDE,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_FUCHOU_GUIDE,mainUIHandle);
            mainUI.addEventListener(MainUI.UI_FUQIJINGJI_XIAZHU_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.UI_RETURN_FUQIJINGJI_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_WANBAOGE_YABAO_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_TIAOYUE_DIGUN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_NEWYEAR_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_YURENJIE_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_FENGZHENGJIE_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_DOUDIZHU_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_DUANWUJIE_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_QIXIJIE_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_NEWYEAR_YASUIQIAN_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.WOHUCANGLONG_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.MAINUI_XUNZHANG_ITEM_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.TARGET_QICHENG_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_XIAOZHUKUAIPAO_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_DUIXUEREN_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.DUIXUEREN_BTN_TIJIAO_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_LONGFENGDANGPU_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_MOXUEZHANCHANG_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_FULIHUODONG_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_DUANWUJIE2015_BTN_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.BAGUAZHENMAINUI_PANEL_REQ,mainUIHandle);
            mainUI.addEventListener(MainUI.YITIANTULONG_SHARENBANG_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.YITIANTULONG_TUICHU_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.HUASHANZHIDIANJIANGLI_CLOSE_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_XIANMOZHILU_BTN_CLICK,mainUIHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            mainUI.removeEventListener(MainUI.FUNCTION_CHARBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_BACKPACKBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_SKLLBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_TASKBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_MEIREN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_TEAMBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_RIDEBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAP_OPTIONBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAP_LINEBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAP_MAPBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_MALLBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_STEUPBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAP_TOPBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_FRIENDBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAP_CHANGEOTHERCHARNAMESHOWBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAP_HUODONG_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAP_INFO_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAP_ZHENGFU_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_STUDYBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCITON_JUMP_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCITON_SIT_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_OPTION_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_BIWU_CROSSPLATFORM_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_RIDE_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCITON_AUTO_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_GIFT_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_JUBAOPEN_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_MAINCHAR_AUTO_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_MAINCHAR_AUTO_VALUE_CHANGE,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_CHARHEAD_HEAD_IMG_CHANGE,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_VIEWBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_TRADINGBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_FRIENDBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_TEAMBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_CHATBTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_PARTY_INVITE_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_LARGESS_FLOWER_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_COURTSHIP_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_LOOK_SHOP_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_SHUANGXIU_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_CHENGJIU_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_LIAOSHANG_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_JINYAN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_KUAFU_GUIZHE_QUERY,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_PARTY_TASK_HUBIAO_CANCEL,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_ZHANDOULI_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_KUAFU_LIKAI_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_SHISHIZHANKUANG_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_FEIXING_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_QIANLIDIAN_GUIDE,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_SHUANG_GUIDE,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_JINENG_GUIDE,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_JIANG_GUIDE,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_CISHA_GUIDE,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_FUCHOU_GUIDE,mainUIHandle);
            mainUI.removeEventListener(MainUI.UI_FUQIJINGJI_XIAZHU_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.UI_RETURN_FUQIJINGJI_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_WANBAOGE_YABAO_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_TIAOYUE_DIGUN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_NEWYEAR_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_YURENJIE_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_FENGZHENGJIE_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_DOUDIZHU_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_DUANWUJIE_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_QIXIJIE_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_NEWYEAR_YASUIQIAN_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.WOHUCANGLONG_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.MAINUI_XUNZHANG_ITEM_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.TARGET_QICHENG_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_XIAOZHUKUAIPAO_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_DUIXUEREN_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.DUIXUEREN_BTN_TIJIAO_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_LONGFENGDANGPU_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_MOXUEZHANCHANG_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_FULIHUODONG_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_DUANWUJIE2015_BTN_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.BAGUAZHENMAINUI_PANEL_REQ,mainUIHandle);
            mainUI.removeEventListener(MainUI.YITIANTULONG_SHARENBANG_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.YITIANTULONG_TUICHU_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.HUASHANZHIDIANJIANGLI_CLOSE_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_XIANMOZHILU_BTN_CLICK,mainUIHandle);
         });
      }
      
      private function mainUIHandle(param1:Event) : void
      {
         var b:BaseEvent = null;
         var isOpen:Boolean = false;
         var doLeave:Function = null;
         var n:int = 0;
         var id:int = 0;
         var type:int = 0;
         var e:Event = param1;
         doLeave = function(param1:FAlertEvent):*
         {
            if(param1.eventData == FAlert.OK)
            {
               msgSenderProxy.send_53871();
            }
         };
         switch(e.type)
         {
            case MainUI.FUNCTION_CHARBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               break;
            case MainUI.FUNCTION_BACKPACKBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide9);
               if(NewPlayerGuideStaticFun.getNewPlayerGuideVO(NewPlayerGuideType.Guide9).getIsComplete)
               {
                  NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide10);
               }
               break;
            case MainUI.FUNCTION_SKLLBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUNGFU);
               break;
            case MainUI.FUNCTION_RIDEBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDEBTN_PLANE);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide18);
               break;
            case MainUI.FUNCTION_MEIREN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_MEIREN_PANEL);
               break;
            case MainUI.FUNCTION_TASKBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide5);
               break;
            case MainUI.FUNCTION_TEAMBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_TEAM_ATTRIBUTE_PLANE);
               break;
            case MainUI.FUNCTION_FRIENDBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_FRIEND_PLANE);
               break;
            case MainUI.FUNCTION_STEUPBTN_CLICK:
               if(GameInstance.mainCharData.banghuiInfo.banghuiId > 0)
               {
                  GameInstance.lookBanghuiID = GameInstance.mainCharData.banghuiInfo.banghuiId;
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_INFO_PANEL);
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_LIST_PANEL);
               }
               break;
            case MainUI.FUNCTION_MALLBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_MALL_PLANE);
               break;
            case MainUI.FUNCTION_STUDYBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_SETTINGS_PANEL_TAB);
               break;
            case MainUI.TARGET_VIEWBTN_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  GameInstance.lookPlayerID = GameInstance.lockOnChar.id;
                  if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
                  }
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               break;
            case MainUI.TARGET_TRADINGBTN_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  PipeManager.sendMsg(PipeConstants.START_TRADE,GameInstance.lockOnChar.id);
               }
               break;
            case MainUI.TARGET_FRIENDBTN_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_ADD_FRIEND,GameInstance.lockOnChar.id);
               }
               break;
            case MainUI.TARGET_TEAMBTN_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_TEAM_INVITE,GameInstance.lockOnChar.id);
               }
               break;
            case MainUI.TARGET_CHATBTN_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  this.mainUI.setPrivateChat(GameInstance.lockOnChar.name);
               }
               break;
            case MainUI.TARGET_PARTY_INVITE_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_BANGYAO,GameInstance.lockOnChar.id);
               }
               break;
            case MainUI.TARGET_LARGESS_FLOWER_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance._backpack))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
                  }
                  PipeManager.sendMsg(PipeConstants.SHOW_SEND_FLOWER_PANEL,[GameInstance.lockOnChar.id,GameInstance.lockOnChar.name,Player(GameInstance.lockOnChar.data).attributeInfo.lv]);
               }
               break;
            case MainUI.TARGET_COURTSHIP_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  if(Player(GameInstance.lockOnChar.data).attributeInfo.getSex() == GameInstance.mainCharData.attributeInfo.getSex())
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"同性之间暂时不能求婚"),false);
                     return;
                  }
                  GameInstance.readyJieHunID = GameInstance.lockOnChar.id;
                  PipeManager.sendMsg(PipeConstants.SEND_QIUHUN);
               }
               break;
            case MainUI.TARGET_LOOK_SHOP_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  PipeManager.sendMsg(PipeConstants.LOOK_OTHERCHAR_SHOP_PANEL,GameInstance.lockOnChar.id);
               }
               break;
            case MainUI.TARGET_SHUANGXIU_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_SHUANGXIU,GameInstance.lockOnChar.id);
               }
               break;
            case MainUI.TARGET_CHENGJIU_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_CHENGJIU_PANEL,[GameInstance.lockOnChar.id,GameInstance.lockOnChar.name]);
               }
               break;
            case MainUI.TARGET_LIAOSHANG_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_LIAOSHANG,GameInstance.lockOnChar.id);
               }
               break;
            case MainUI.TARGET_JINYAN_CLICK:
               if(GameInstance.lockOnChar != null)
               {
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("确定禁言");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("容我想想");
                  FAlert.show(LanResManager.getLanCommonTextWords("您确定要将") + GameInstance.lockOnChar.name + LanResManager.getLanCommonTextWords("禁言吗？"),"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        msgSenderProxy.send_30201(GameInstance.lockOnChar.id);
                     }
                  },true);
               }
               break;
            case MainUI.MAP_OPTIONBTN_CLICK:
               b = e as BaseEvent;
               isOpen = Boolean(b.data as int);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您可以使用《系统设置》面板设置声音"),false);
               PipeManager.sendMsg(PipeConstants.SETTING_DATA,[SettingKey.K6,!isOpen,true]);
               PipeManager.sendMsg(PipeConstants.SETTING_DATA,[SettingKey.K7,!isOpen,true]);
               break;
            case MainUI.MAP_HUODONG_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
               break;
            case MainUI.MAP_INFO_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_INFOQUERY_PANEL);
               break;
            case MainUI.MAP_ZHENGFU_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_BOSS_REFURBISH_PANEL);
               break;
            case MainUI.MAP_CHANGEOTHERCHARNAMESHOWBTN_CLICK:
               b = e as BaseEvent;
               isOpen = Boolean(b.data as int);
               PipeManager.sendMsg(PipeConstants.SETTING_DATA,[SettingKey.K0,!isOpen,true]);
               PipeManager.sendMsg(PipeConstants.SETTING_DATA,[SettingKey.K1,!isOpen,true]);
               break;
            case MainUI.MAINUI_GIFT_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
               break;
            case MainUI.MAP_MAPBTN_CLICK:
               this.mainUI_miniMapMediator.addMap();
               break;
            case MainUI.MAP_TOPBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_RANK_PLANE);
               break;
            case MainUI.MAP_LINEBTN_CLICK:
               if(ReloginManager.isInKuafu)
               {
                  NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
                  return;
               }
               b = e as BaseEvent;
               this.mapChangeLineBaseEvent = b.data as MouseEvent;
               this.msgSenderProxy.send_40209();
               break;
            case MainUI.MAINUI_TIMEGIFT_BTN_CLICK:
               break;
            case MainUI.FUNCITON_JUMP_BTN_CLICK:
               if(TCursorManager.getCurruntStatus() != TCursorManager.CURSOR_TIAOYUE)
               {
                  KeyboardManager.tiaoyue_down = true;
                  TCursorManager.showCursor(TCursorManager.CURSOR_TIAOYUE);
                  TCursorManager.lockOnMouseStatus();
                  NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide12);
               }
               else
               {
                  KeyboardManager.tiaoyue_down = false;
                  TCursorManager.resumFullMouse();
               }
               break;
            case MainUI.FUNCITON_SIT_BTN_CLICK:
               if(GameInstance.mainChar.isJumping())
               {
                  return;
               }
               PipeManager.sendMsg(PipeConstants.SEND_DAZUO);
               break;
            case MainUI.FUNCTION_RIDE_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.UP_DOWN_HORSE);
               break;
            case MainUI.FUNCTION_OPTION_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_BIGUAN_PANEL);
               break;
            case MainUI.FUNCITON_AUTO_BTN_CLICK:
               if(GameInstance.mainCharData.afkInfo2.isStart)
               {
                  PipeManager.sendMsg(PipeConstants.AFK_START,0);
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.AFK_START,1);
               }
               break;
            case MainUI.MAINUI_MAINCHAR_AUTO_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_AFK_PANEL);
               break;
            case MainUI.MAINUI_MAINCHAR_AUTO_VALUE_CHANGE:
               b = e as BaseEvent;
               this.msgSenderProxy.send_54701(b.data);
               break;
            case MainUI.MAINUI_CHARHEAD_HEAD_IMG_CHANGE:
               b = e as BaseEvent;
               n = HeadResChange.headResChangeToInt(b.data as String);
               this.msgSenderProxy.send_10049({"num":n});
               break;
            case MainUI.MAINUI_KUAFU_GUIZHE_QUERY:
               b = e as BaseEvent;
               PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,b.data);
               break;
            case MainUI.MAINUI_PARTY_TASK_HUBIAO_CANCEL:
               FAlert.show(LanResManager.getLanCommonTextWords("确定放弃该押镖任务？"),"",2,function(param1:FAlertEvent):void
               {
                  var _loc2_:int = 0;
                  if(param1.eventData == FAlert.OK)
                  {
                     _loc2_ = GameInstance.mainCharData.yabiaoInfo.haveSelfYabiao() ? -1 : -2;
                     PipeManager.sendMsg(PipeConstants.FANGQI_YABIAO_TASK,_loc2_);
                  }
               },false);
               break;
            case MainUI.MAINUI_ZHANDOULI_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.LOOK_PLAYER_ZHAN_DOU_LI,GameInstance.mainChar.id);
               break;
            case MainUI.MAINUI_KUAFU_LIKAI_CLICK:
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show("    " + LanResManager.getLanCommonTextWords("确定要离开吗?") + "    ","",2,doLeave);
               break;
            case MainUI.MAINUI_SHISHIZHANKUANG_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_SHI_SHI_ZHAN_KUANG);
               break;
            case MainUI.MAINUI_FEIXING_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.UP_DOWN_FEIXING,0);
               break;
            case MainUI.FUNCTION_BIWU_CROSSPLATFORM_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_BIWU_CROSSPLATFORM_PANEL);
               break;
            case MainUI.MAINUI_QIANLIDIAN_GUIDE:
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               break;
            case MainUI.MAINUI_JINENG_GUIDE:
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUNGFU);
               break;
            case MainUI.MAINUI_JIANG_GUIDE:
               PipeManager.sendMsg(PipeConstants.SHOW_LEIJIDENGLU);
               break;
            case MainUI.MAINUI_CISHA_GUIDE:
               PipeManager.sendMsg(PipeConstants.SHOW_CISHA_OK_PANEL);
               break;
            case MainUI.MAINUI_FUCHOU_GUIDE:
               PipeManager.sendMsg(PipeConstants.SHOW_FUCHOU_OK_PANEL);
               break;
            case MainUI.MAINUI_JUBAOPEN_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_JUBAOPEN_PANEL);
               break;
            case MainUI.UI_FUQIJINGJI_XIAZHU_CLICK:
               b = e as BaseEvent;
               id = int(b.data);
               this.msgSenderProxy.send_20511(id);
               break;
            case MainUI.UI_RETURN_FUQIJINGJI_CLICK:
               this.msgSenderProxy.send_20513();
               break;
            case MainUI.FUNCTION_FENGZHENGJIE_BTN_CLICK:
               b = e as BaseEvent;
               PipeManager.sendMsg(PipeConstants.GET_FENGZHENGJIE_PANEL,b.data);
               break;
            case MainUI.MAINUI_WANBAOGE_YABAO_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_WANBAOGE_BAOSHIJIANSHANG_PANEL);
               break;
            case MainUI.MAINUI_TIAOYUE_DIGUN_CLICK:
               b = e as BaseEvent;
               type = b.data as int;
               this.msgSenderProxy.send_71835(type);
               break;
            case MainUI.FUNCTION_NEWYEAR_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_NEWYEARNEIRONG_PANEL);
               break;
            case MainUI.FUNCTION_YURENJIE_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.GET_YURENJIE_PANEL);
               break;
            case MainUI.FUNCTION_NEWYEAR_YASUIQIAN_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.NEWYEAR_YASUIQIAN_CLICK);
               break;
            case MainUI.WOHUCANGLONG_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_WOHUCANGLONG_PANEL);
               break;
            case MainUI.FUNCTION_DOUDIZHU_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.GET_DOUDIZHU_PANEL);
               break;
            case MainUI.MAINUI_XUNZHANG_ITEM_CLICK:
               b = e as BaseEvent;
               id = b.data as int;
               this.msgSenderProxy.send_11219(id);
               break;
            case MainUI.FUNCTION_DUANWUJIE_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.GET_DUANWUJIE_PANEL);
               break;
            case MainUI.FUNCTION_QIXIJIE_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.GET_QIXIJIE_PANEL);
               break;
            case MainUI.TARGET_QICHENG_CLICK:
               PipeManager.sendMsg(PipeConstants.TARGET_FUNCTION_QICHENG);
               break;
            case MainUI.FUNCTION_XIAOZHUKUAIPAO_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.GET_XIAOZHUKUAIPAO_PANEL);
               break;
            case MainUI.FUNCTION_DUIXUEREN_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.GET_DUIXUEREN_PANEL);
               break;
            case MainUI.DUIXUEREN_BTN_TIJIAO_CLICK:
               b = e as BaseEvent;
               this.msgSenderProxy.send_80341(b.data as Object);
               break;
            case MainUI.FUNCTION_LONGFENGDANGPU_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_LONGFENGDANGPU_PANEL);
               break;
            case MainUI.FUNCTION_MOXUEZHANCHANG_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.GET_MOXUEZHANCHANG_PANEL);
               break;
            case MainUI.FUNCTION_FULIHUODONG_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.GET_FULIHUODONG_PANEL);
               break;
            case MainUI.FUNCTION_DUANWUJIE2015_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.GET_DUANWUJIE2015_PANEL);
               break;
            case MainUI.BAGUAZHENMAINUI_PANEL_REQ:
               this.msgSenderProxy.send_81837();
               break;
            case MainUI.YITIANTULONG_SHARENBANG_CLICK:
               b = e as BaseEvent;
               type = b.data.idBoss as int;
               this.msgSenderProxy.send_79493(type);
               break;
            case MainUI.YITIANTULONG_TUICHU_CLICK:
               this.msgSenderProxy.send_79491();
               break;
            case MainUI.HUASHANZHIDIANJIANGLI_CLOSE_CLICK:
               this.removeHuaShanZhiDianJiangliView();
               break;
            case MainUI.FUNCTION_XIANMOZHILU_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.GET_XIANMOZHILU_PANEL);
         }
      }
      
      private function showSelectLine(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:uint = 0;
         if(this.lineMenu)
         {
            this.lineMenu.removeEventListener(Menu.MENUITEM_CLICK,this.tryChangeLine);
            this.lineMenu = null;
         }
         this.lineArr = param1;
         var _loc2_:Array = [];
         _loc2_.push({
            "name":"[" + GameConfig.yunying_serverID + LanResManager.getLanCommonTextWords("服") + "]",
            "state":0,
            "color":StaticValue.ORANGE
         });
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_].id == GameConfig.lineID ? 0 : 1;
            _loc5_ = 16777215;
            if(_loc4_ == 0)
            {
               _loc5_ = uint(StaticValue.ORANGE);
            }
            else if(param1[_loc3_].status == 1)
            {
               _loc5_ = uint(StaticValue.GREEN);
            }
            else if(param1[_loc3_].status == 2)
            {
               _loc5_ = uint(StaticValue.YELLOW);
            }
            else if(param1[_loc3_].status == 3)
            {
               _loc5_ = uint(StaticValue.RED);
            }
            _loc2_.push({
               "name":param1[_loc3_].serverName,
               "state":_loc4_,
               "color":_loc5_
            });
            _loc3_++;
         }
         this.lineMenu = Menu.addMenuItem(_loc2_,this.mapChangeLineBaseEvent);
         this.lineMenu.addEventListener(Menu.MENUITEM_CLICK,this.tryChangeLine);
      }
      
      private function tryChangeLine(param1:BaseEvent) : void
      {
         var lineName:String = null;
         var e:BaseEvent = param1;
         lineName = e.data as String;
         if(ReloginManager.isKuafu3v3Baominging)
         {
            ConfirmManager.confirmBreak3v3Baoming(function():void
            {
               changeLine(lineName);
            },null);
         }
         else
         {
            this.changeLine(lineName);
         }
      }
      
      private function changeLine(param1:String) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.lineArr.length)
         {
            if(param1 == this.lineArr[_loc2_].serverName)
            {
               _loc3_ = this.lineArr[_loc2_];
               if(GameConfig.lineID == _loc3_.id)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已经在此分线"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"正在准备切线...");
                  this.msgSenderProxy.send_10111(_loc3_.id);
               }
               return;
            }
            _loc2_++;
         }
      }
      
      private function mainUIChatHandle(param1:BaseEvent) : void
      {
      }
      
      private function updataMainUIChar() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Player = GameInstance.mainChar.data as Player;
         var _loc2_:AttributeInfo = _loc1_.attributeInfo;
         if(GameState.enableHeartEffect)
         {
            if(_loc2_.hpNow <= _loc2_.hpMax * TSoundManager.MAX_HEART_PER)
            {
               TSoundManager.playHeartSound(_loc2_.hpNow / _loc2_.hpMax);
            }
            else
            {
               TSoundManager.stopHeartSound();
            }
         }
         if(!this.tempMainCharData)
         {
            this.tempMainCharData = {};
            this.mainUI.setCharHP(this.tempMainCharData.hpNow = _loc2_.hpNow,this.tempMainCharData.hpMax = _loc2_.hpMax);
            this.mainUI.setCharMP(this.tempMainCharData.mpNow = _loc2_.mpNow,this.tempMainCharData.mpMax = _loc2_.mpMax);
            this.mainUI.setPhysical(this.tempMainCharData.ppNow = _loc2_.ppNow,this.tempMainCharData.ppMax = _loc2_.ppMax);
            this.mainUI.setCharLevel(this.tempMainCharData.lv = String(_loc2_.lv));
            this.mainUI.setCharHead(this.tempMainCharData.headImg = _loc2_.headImg);
            this.mainUI.setCharName(this.tempMainCharData.name = GameInstance.mainChar.name);
            this.mainUI.setExp(this.tempMainCharData.expNow = _loc2_.expNow,this.tempMainCharData.expMax = _loc2_.expMax);
            this.mainUI.setPhysical(_loc2_.ppNow,_loc2_.ppMax);
            this.mainUI.setNuQi(_loc2_.gqNow,_loc2_.gqMax);
            this.mainUI.setMoxueValue(_loc2_.moxueNow,_loc2_.moxueMax);
            _loc3_ = int(Number(_loc2_.fabaoNow / (_loc2_.fabaoMax / 50)));
            this.mainUI.setFabaoHp(_loc3_,this.tempMainCharData.fabaoNow = _loc2_.fabaoNow,this.tempMainCharData.fabaoMax = _loc2_.fabaoMax);
            _loc4_ = int(Number(_loc2_.lingliNow / (_loc2_.lingliMax / 100)) * 100);
            this.mainUI.setLingli(_loc4_,this.tempMainCharData.lingliNow = _loc2_.lingliNow,this.tempMainCharData.lingliMax = _loc2_.lingliMax);
         }
         else
         {
            this.mainUI.setCharName(GameInstance.mainChar.name);
            if(this.tempMainCharData.hpNow != _loc2_.hpNow || this.tempMainCharData.hpMax != _loc2_.hpMax)
            {
               this.mainUI.setCharHP(this.tempMainCharData.hpNow = _loc2_.hpNow,this.tempMainCharData.hpMow = _loc2_.hpMax);
            }
            if(this.tempMainCharData.mpNow != _loc2_.mpNow || this.tempMainCharData.mpMax != _loc2_.mpMax)
            {
               this.mainUI.setCharMP(this.tempMainCharData.mpNow = _loc2_.mpNow,this.tempMainCharData.mpMow = _loc2_.mpMax);
            }
            if(this.tempMainCharData.ppNow != _loc2_.ppNow || this.tempMainCharData.ppMax != _loc2_.ppMax)
            {
               this.mainUI.setPhysical(this.tempMainCharData.ppNow = _loc2_.ppNow,this.tempMainCharData.ppMow = _loc2_.ppMax);
            }
            if(this.tempMainCharData.fabaoNow != _loc2_.fabaoNow || this.tempMainCharData.fabaoMax != _loc2_.fabaoMax)
            {
               _loc3_ = int(Number(_loc2_.fabaoNow / (_loc2_.fabaoMax / 50)));
               this.mainUI.setFabaoHp(_loc3_,this.tempMainCharData.fabaoNow = _loc2_.fabaoNow,this.tempMainCharData.fabaoMax = _loc2_.fabaoMax);
            }
            if(this.tempMainCharData.lingliNow != _loc2_.lingliNow || this.tempMainCharData.fabaoNow != _loc2_.lingliMax)
            {
               _loc4_ = int(Number(_loc2_.lingliNow / (_loc2_.lingliMax / 100)) * 100);
               this.mainUI.setLingli(_loc4_,this.tempMainCharData.lingliNow = _loc2_.lingliNow,this.tempMainCharData.lingliMax = _loc2_.lingliMax);
            }
            if(this.tempMainCharData.lv != _loc2_.lv)
            {
               this.mainUI.setCharLevel(this.tempMainCharData.lv = String(_loc2_.lv));
            }
            if(this.tempMainCharData.name != GameInstance.mainChar.name)
            {
               this.mainUI.setCharName(this.tempMainCharData.name = GameInstance.mainChar.name);
            }
            if(this.tempMainCharData.headImg != _loc2_.headImg)
            {
               this.mainUI.setCharHead(this.tempMainCharData.headImg = _loc2_.headImg);
            }
            if(this.tempMainCharData.expNow != _loc2_.expNow || this.tempMainCharData.expMax != _loc2_.expMax)
            {
               this.mainUI.setExp(this.tempMainCharData.expNow = _loc2_.expNow,this.tempMainCharData.expMax = _loc2_.expMax);
            }
            this.mainUI.setPhysical(_loc2_.ppNow,_loc2_.ppMax);
            this.mainUI.setNuQi(_loc2_.gqNow,_loc2_.gqMax);
            this.mainUI.setMoxueValue(_loc2_.moxueNow,_loc2_.moxueMax);
         }
         this.mainUI.setLayout(_loc1_.isDiZi);
      }
      
      private function updataMainUIOtherPlayer(param1:SceneCharacter) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:String = null;
         var _loc12_:* = undefined;
         var _loc2_:SceneCharacter = GameInstance.lockOnChar;
         GameInstance.lockOnChar = param1;
         var _loc3_:Array = [];
         if(_loc2_ != null && _loc2_.usable && _loc2_.type == SceneCharacterType.PLAYER)
         {
            _loc3_.push(_loc2_.id);
         }
         if(param1 != null && param1.usable && param1.type == SceneCharacterType.PLAYER)
         {
            _loc3_.push(param1.id);
         }
         HeadFaceManager.updatePlayersName(_loc3_);
         if(param1 == null)
         {
            this.mainUI.targetVisable = false;
            if(GameInstance.uiInstance._npcDialogPanel != null)
            {
               PipeManager.sendMsg(PipeConstants.HIDE_NPC_DIALOG_PLANE);
            }
            return;
         }
         var _loc4_:SceneCharacter = GameInstance.lockOnChar;
         this.mainUI.targetVisable = true;
         if(_loc4_.type == SceneCharacterType.PLAYER || _loc4_.type == SceneCharacterType.FENSHEN)
         {
            this.mainUI.isPlayer = true;
            _loc5_ = Player(_loc4_.data).attributeInfo.hpNow;
            _loc6_ = Player(_loc4_.data).attributeInfo.hpMax;
            _loc7_ = Player(_loc4_.data).attributeInfo.mpNow;
            _loc8_ = Player(_loc4_.data).attributeInfo.mpMax;
            _loc9_ = Player(_loc4_.data).attributeInfo.ppNow;
            _loc10_ = Player(_loc4_.data).attributeInfo.ppMax;
            if(Player(_loc4_.data).avatarInfo.isCiKe)
            {
               _loc11_ = "?";
               _loc12_ = Player(_loc4_.data).attributeInfo.getSex() == 1 ? OtherConst.CIKE_HEADIMG_ID_0 : OtherConst.CIKE_HEADIMG_ID_1;
               this.mainUI.setTargetButtonVisble(false);
            }
            else
            {
               _loc11_ = "" + Player(_loc4_.data).attributeInfo.lv;
               _loc12_ = Player(_loc4_.data).attributeInfo.headImg;
            }
            this.mainUI.setMonstrTypeTip("");
            this.mainUI.setTargetBtnStatus(Player(_loc4_.data).isDiZi || GameInstance.mainCharData.isDiZi);
            this.mainUI.setTargetBtnMoreList(_loc4_.id == GameInstance.peioPlayerID);
         }
         else if(_loc4_.type == SceneCharacterType.MONSTER)
         {
            this.mainUI.isPlayer = false;
            _loc5_ = Monster(_loc4_.data).attributeInfo.hpNow;
            _loc6_ = Monster(_loc4_.data).attributeInfo.hpMax;
            if(Monster(_loc4_.data).res.headFaceStr != "" && Boolean(Monster(_loc4_.data).res.headFaceStr))
            {
               _loc12_ = Monster(_loc4_.data).res.headFaceStr;
            }
            else
            {
               _loc12_ = Monster(_loc4_.data).res.id_ico;
            }
            _loc11_ = "" + Monster(_loc4_.data).attributeInfo.lv;
            _loc7_ = _loc8_ = _loc9_ = _loc10_ = 1;
            this.mainUI.setMonstrTypeTip(Monster(param1.data).attributeInfo.btStr);
         }
         else if(_loc4_.type == SceneCharacterType.GIRL)
         {
            this.mainUI.isPlayer = false;
            _loc5_ = Girl(_loc4_.data).attributeInfo.hpNow;
            _loc6_ = Girl(_loc4_.data).attributeInfo.hpMax;
            _loc12_ = Girl(_loc4_.data).res.id_ico;
            _loc11_ = "" + Girl(_loc4_.data).attributeInfo.lv;
            _loc7_ = _loc8_ = _loc9_ = _loc10_ = 1;
            this.mainUI.setMonstrTypeTip("");
         }
         else
         {
            if(_loc4_.type != SceneCharacterType.NPC)
            {
               this.mainUI.targetVisable = false;
               return;
            }
            this.mainUI.isPlayer = false;
            _loc5_ = _loc6_ = _loc7_ = _loc8_ = _loc9_ = _loc10_ = -100;
            _loc11_ = "?";
            _loc12_ = NPC(_loc4_.data).res.id_ico;
            this.mainUI.setMonstrTypeTip("");
         }
         if(!this.tempLockOnTargetPlayerData)
         {
            this.tempLockOnTargetPlayerData = {};
            this.mainUI.setTargetHead(this.tempLockOnTargetPlayerData.handImage = _loc12_);
            this.mainUI.setTargetLevel(this.tempLockOnTargetPlayerData.lv = _loc11_);
            if(_loc4_.type == SceneCharacterType.PLAYER && Player(_loc4_.data).avatarInfo.isCiKe)
            {
               this.mainUI.setTargetName(this.tempLockOnTargetPlayerData.name = LanResManager.getLanCommonTextWords("刺客"));
            }
            else if(GameInstance.scene.mapConfig.mapID == OtherConst.FUQIJINGJICHANG_MAP_ID && _loc4_.type == SceneCharacterType.PLAYER)
            {
               if(GameInstance.mainCharData.teamInfo.getPlayerByID(_loc4_.id) != null)
               {
                  this.mainUI.setTargetName(this.tempLockOnTargetPlayerData.name = _loc4_.name);
               }
               else
               {
                  this.mainUI.setTargetName(this.tempLockOnTargetPlayerData.name = LanResManager.getLanCommonTextWords("敌方"));
               }
            }
            else
            {
               this.mainUI.setTargetName(this.tempLockOnTargetPlayerData.name = _loc4_.name);
            }
            this.mainUI.setTaretHP(this.tempLockOnTargetPlayerData.hpNow = _loc5_,this.tempLockOnTargetPlayerData.hpMax = _loc6_);
            this.mainUI.setTargetMP(this.tempLockOnTargetPlayerData.mpNow = _loc7_,this.tempLockOnTargetPlayerData.mpMax = _loc8_);
            this.mainUI.setTargetPhysical(this.tempLockOnTargetPlayerData.ppNow = _loc9_,this.tempLockOnTargetPlayerData.ppMax = _loc10_);
         }
         else
         {
            if(this.tempLockOnTargetPlayerData.handImage != _loc12_)
            {
               this.mainUI.setTargetHead(this.tempLockOnTargetPlayerData.handImage = _loc12_);
            }
            if(this.tempLockOnTargetPlayerData.lv != _loc11_)
            {
               this.mainUI.setTargetLevel(this.tempLockOnTargetPlayerData.lv = _loc11_);
            }
            if(this.tempLockOnTargetPlayerData.name != _loc4_.name)
            {
               this.mainUI.setTargetName(this.tempLockOnTargetPlayerData.name = _loc4_.name);
            }
            if(_loc4_.type == SceneCharacterType.PLAYER && Player(_loc4_.data).avatarInfo.isCiKe)
            {
               this.mainUI.setTargetName(this.tempLockOnTargetPlayerData.name = LanResManager.getLanCommonTextWords("刺客"));
            }
            else if(GameInstance.scene.mapConfig.mapID == OtherConst.FUQIJINGJICHANG_MAP_ID && _loc4_.type == SceneCharacterType.PLAYER)
            {
               if(GameInstance.mainCharData.teamInfo.getPlayerByID(_loc4_.id) != null)
               {
                  this.mainUI.setTargetName(this.tempLockOnTargetPlayerData.name = _loc4_.name);
               }
               else
               {
                  this.mainUI.setTargetName(this.tempLockOnTargetPlayerData.name = LanResManager.getLanCommonTextWords("敌方"));
               }
            }
            if(this.tempLockOnTargetPlayerData.hpNow != _loc5_ || this.tempLockOnTargetPlayerData.hpMax != _loc6_)
            {
               this.mainUI.setTaretHP(this.tempLockOnTargetPlayerData.hpNow = _loc5_,this.tempLockOnTargetPlayerData.hpMax = _loc6_);
            }
            if(this.tempLockOnTargetPlayerData.mpNow != _loc7_ || this.tempLockOnTargetPlayerData.mpMax != _loc8_)
            {
               this.mainUI.setTargetMP(this.tempLockOnTargetPlayerData.mpNow = _loc7_,this.tempLockOnTargetPlayerData.mpMax = _loc8_);
            }
            if(this.tempLockOnTargetPlayerData.ppNow != _loc9_ || this.tempLockOnTargetPlayerData.ppMax != _loc10_)
            {
               this.mainUI.setTargetPhysical(this.tempLockOnTargetPlayerData.ppNow = _loc9_,this.tempLockOnTargetPlayerData.ppMax = _loc10_);
            }
         }
      }
      
      private function updataMountSkill(param1:Array) : void
      {
         this.mainUI.setRideSkillShortCut(param1);
      }
      
      public function setLineName(param1:String) : void
      {
         this.mainUI.setLineName(param1);
      }
      
      public function setCharHead(param1:String) : void
      {
         this.mainUI.setCharHead(param1);
         if(this.tempMainCharData)
         {
            this.tempMainCharData.headImg = param1;
         }
      }
      
      public function showLockChar(param1:Array) : void
      {
         var _loc2_:BuffRes = null;
         if(param1 == null || param1.length == 0)
         {
            this.mainUI.targetVisable = false;
            this.tempLockOnTargetPlayerData = null;
         }
         else if(param1[1] == 2)
         {
            this.mainUI.targetVisable = true;
            _loc2_ = SkillResManager.getBuffRes(param1[0]);
            this.mainUI.setMonstrTypeTip("");
            this.mainUI.setTargetHead(_loc2_.id_ico);
            this.mainUI.setTargetLevel("?");
            this.mainUI.setTargetName(_loc2_.name);
            this.mainUI.setTaretHP(1,1);
            this.mainUI.setTargetMP(1,1);
            this.mainUI.setTargetPhysical(1,1);
            this.mainUI.setTargetButtonVisble(false);
         }
      }
      
      private function get mainUI_miniMapMediator() : MainUI_MiniMapMediator
      {
         if(this._mainUI_miniMapMediator == null)
         {
            this._mainUI_miniMapMediator = facade.retrieveMediator(MainUI_MiniMapMediator.NAME) as MainUI_MiniMapMediator;
         }
         return this._mainUI_miniMapMediator;
      }
      
      private function get msgSenderProxy() : MainUI_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(MainUI_MsgSendProxy.NAME) as MainUI_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get newYear_MsgSenderProxy() : NewYear_MsgSenderProxy
      {
         if(this._newYear_MsgSenderProxy == null)
         {
            this._newYear_MsgSenderProxy = NewYear_ApplicationFacade.getInstance().retrieveProxy(NewYear_MsgSenderProxy.NAME) as NewYear_MsgSenderProxy;
         }
         return this._newYear_MsgSenderProxy;
      }
      
      public function setTime(param1:int) : void
      {
         this.mainUI.setTime(param1);
      }
      
      public function setChenmiTips(param1:int) : void
      {
         this.mainUI.setChenmiTips(param1);
      }
      
      public function setBtnEnabled(param1:Boolean) : void
      {
         this.mainUI.setBtnEnabled(param1);
         this.mainUI.zhengfuYincang(param1);
         if(param1)
         {
            KeyboardManager.enable = true;
            (GameInstance.mainChar.data as Player).attributeInfo.isChenmi = true;
         }
         else
         {
            KeyboardManager.enable = false;
            (GameInstance.mainChar.data as Player).attributeInfo.isChenmi = false;
         }
      }
      
      public function setFuqiJingjiTouzhuPanelInitialize(param1:int, param2:Array) : void
      {
         this.mainUI.setFuqiJingjiTouzhuPanelInitialize(param1,param2);
      }
      
      public function removeFuqiJingjiTouzhuPanel() : void
      {
         this.mainUI.removeFuqiJingjiTouzhuPanel();
      }
      
      public function setFuqiJingjiResultPanelInitialize(param1:Array, param2:int, param3:int, param4:Boolean, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int) : void
      {
         this.mainUI.setFuqiJingjiResultPanelInitialize(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function removeFuqiJingjiResultPanel() : void
      {
         this.mainUI.removeFuqiJingjiResultPanel();
      }
      
      public function setTeamChatChannel(param1:Boolean = true) : void
      {
         this.mainUI.setTeamChatChannel(param1);
      }
      
      public function setFuQiJingJiVSPanelInitialize(param1:int, param2:int) : void
      {
         this.mainUI.setFuQiJingJiVSPanelInitialize(param1,param2);
      }
      
      public function removeFuQiJingJiVSPanel() : void
      {
         this.mainUI.removeFuQiJingJiVSPanel();
      }
      
      public function receivedPlayerJumpDigun(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param2,param1);
         _loc4_.moveData.onDigun = param3;
         AvatarManager.updateMainAvatar(_loc4_);
      }
      
      public function setDuiXueRenMapData(param1:Object, param2:int, param3:String) : void
      {
         this.mainUI.initDuiXueRenMapUI();
         this.mainUI.setDuiXueRenMapData(param1,param2,param3);
      }
      
      public function duiXueRenGoodsChangeHandler() : void
      {
         this.mainUI.duiXueRenGoodsChangeHandler();
      }
      
      public function setBaGuaZhenMainUIData(param1:Object) : void
      {
         this.mainUI.setBaGuaZhenMainUIData(param1);
      }
      
      public function showShiJianShaLouPanel(param1:int, param2:Boolean) : void
      {
         this.mainUI.showShiJianShaLouPanel(param1,param2);
      }
      
      public function showYiTianTuLong(param1:Boolean, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:Array = null, param7:int = 0) : void
      {
         this.mainUI.showYiTianTuLong(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function showLianZhan(param1:int) : void
      {
         this.mainUI.showLianZhan(param1);
      }
      
      public function showZhunBei(param1:int) : void
      {
         this.mainUI.showZhunBei(param1);
      }
      
      public function setYiTianTuLongJiangLi(param1:int, param2:int, param3:Array) : void
      {
         this.mainUI.setYiTianTuLongJiangLi(param1,param2,param3);
      }
      
      public function removeHuaShanZhiDianJiangliView() : void
      {
         this.mainUI.removeHuaShanZhiDianJiangLi();
      }
      
      public function setMoShouZhanChangJiangLiData(param1:Object) : void
      {
         this.mainUI.setMoShouZhanChangJiangLiData(param1);
      }
      
      public function setMoShouZhanChangFuHuoData() : void
      {
         this.mainUI.setMoShouZhanChangFuHuoData();
      }
      
      public function setMoShouZhanChangYanShiData() : void
      {
         this.mainUI.setMoShouZhanChangYanShiData();
      }
   }
}

