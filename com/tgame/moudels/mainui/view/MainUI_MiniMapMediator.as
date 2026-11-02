package com.tgame.moudels.mainui.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.monster.MonsterRes;
   import com.tgame.common.res.monster.MonsterResManager;
   import com.tgame.common.res.sceneMonster.MonsterPointRes;
   import com.tgame.common.res.sceneMonster.SceneMonsterPointRes;
   import com.tgame.common.res.sceneMonster.SceneMonsterPointResManager;
   import com.tgame.common.staticdata.NpcType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialMapID;
   import com.tgame.common.staticdata.SpecialNPCID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.NPC;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.Telport;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mainui.MainUI_ApplicationFacade;
   import com.tgame.moudels.mainui.model.MainUI_MsgSendProxy;
   import com.tgame.shell.view.components.PopMapPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.utils.Transformer;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MainUI_MiniMapMediator extends Mediator
   {
      
      public static const NAME:String = "MainUI_MiniMapMediator";
      
      private var timer:Timer;
      
      private var miniMapBitmapData:BitmapData;
      
      private var isMenuNPCOpen:Boolean = true;
      
      private var isTaskNPCOpen:Boolean = true;
      
      private var isBusinessNPCOpen:Boolean = true;
      
      private var isPortalOpen:Boolean = true;
      
      private var isMonsterPointOpen:Boolean = true;
      
      private var setTaskNPCStatus:Array;
      
      private var isSetTaskNPC:Boolean = false;
      
      private var _msgSenderProxy:MainUI_MsgSendProxy;
      
      public function MainUI_MiniMapMediator()
      {
         super(NAME);
      }
      
      protected function get mapPlane() : PopMapPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.popMapPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as PopMapPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [MainUI_ApplicationFacade.INIT_MINI_MAP,MainUI_ApplicationFacade.SET_SMALL_MAP_STATIC_DATA,MainUI_ApplicationFacade.TASK_UPDATE_ALL_NPC_STATUS,MainUI_ApplicationFacade.SET_SMALL_MAP_BANGQI,MainUI_ApplicationFacade.SET_SMALL_MAP_SHENLONGZHIREN,MainUI_ApplicationFacade.SET_SMALL_MAP_NB_ZHUANGBEI,MainUI_ApplicationFacade.SET_SMALL_MAP_NB_ZHUANGBEI3V3,MainUI_ApplicationFacade.SET_SMALL_MAP_XIUQIU];
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         var _loc10_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case MainUI_ApplicationFacade.INIT_MINI_MAP:
               this.miniMapBitmapData = param1.getBody() as BitmapData;
               if(this.mapPlane.parent)
               {
                  this.stopTime();
                  this.updataMapDynamicData();
               }
               this.updataMapStaticData();
               break;
            case MainUI_ApplicationFacade.SET_SMALL_MAP_STATIC_DATA:
               _loc4_ = Boolean((_loc2_ as Array)[0]);
               _loc5_ = Boolean((_loc2_ as Array)[1]);
               _loc6_ = Boolean((_loc2_ as Array)[2]);
               this.showTelePortAndNPCAndMonsterPoint(_loc4_,_loc5_,_loc6_);
               break;
            case MainUI_ApplicationFacade.TASK_UPDATE_ALL_NPC_STATUS:
               this.setTaskNPCStatus = _loc2_ as Array;
               if(this.isSetTaskNPC)
               {
                  this.mapPlane.setTaskNPCState(this.setTaskNPCStatus[0],this.setTaskNPCStatus[1].concat(this.setTaskNPCStatus[3]),this.setTaskNPCStatus[2]);
               }
               break;
            case MainUI_ApplicationFacade.SET_SMALL_MAP_BANGQI:
               _loc3_ = _loc2_ as Array;
               if(_loc3_[0] == OtherConst.BANGQI_ADD)
               {
                  this.mapPlane.addBangQi(_loc3_[2],_loc3_[1],_loc3_[3],_loc3_[4]);
               }
               if(_loc3_[0] == OtherConst.BANGQI_REMOVE)
               {
                  this.mapPlane.removeBangQi(_loc3_[1]);
               }
               if(_loc3_[0] == OtherConst.BANGQI_ALL_REMOVE)
               {
                  this.mapPlane.removeAllBangQi();
               }
               break;
            case MainUI_ApplicationFacade.SET_SMALL_MAP_SHENLONGZHIREN:
               _loc3_ = _loc2_ as Array;
               if(_loc3_[0] == OtherConst.SHENLONGZHIREN_ADD)
               {
                  _loc9_ = {
                     "name":LanResManager.getLanTextWords(this,"游龙之刃"),
                     "xy":_loc3_[1],
                     "dec":""
                  };
                  this.mapPlane.setWuQi(_loc9_);
                  GameInstance.uiInstance.mainUI.setWuQi(_loc9_);
               }
               if(_loc3_[0] == OtherConst.SHENLONGZHIREN_REMOVE)
               {
                  this.mapPlane.setWuQi();
                  GameInstance.uiInstance.mainUI.setWuQi();
               }
               break;
            case MainUI_ApplicationFacade.SET_SMALL_MAP_XIUQIU:
               _loc3_ = _loc2_ as Array;
               if(_loc3_[0] == OtherConst.XIUQIU_ADD)
               {
                  _loc9_ = {
                     "name":LanResManager.getLanCommonTextWords("绣球"),
                     "xy":_loc3_[1],
                     "dec":""
                  };
                  this.mapPlane.setXiuQiu(_loc9_);
                  GameInstance.uiInstance.mainUI.setXiuQiu(_loc9_);
               }
               if(_loc3_[0] == OtherConst.XIUQIU_REMOVE)
               {
                  this.mapPlane.setXiuQiu();
                  GameInstance.uiInstance.mainUI.setXiuQiu();
               }
               break;
            case MainUI_ApplicationFacade.SET_SMALL_MAP_NB_ZHUANGBEI:
               _loc3_ = _loc2_ as Array;
               _loc7_ = [];
               _loc8_ = [LanResManager.getLanCommonTextWords("轩辕人剑"),LanResManager.getLanCommonTextWords("轩辕神剑"),LanResManager.getLanCommonTextWords("轩辕天剑"),LanResManager.getLanCommonTextWords("轩辕地剑")];
               if(_loc3_[0] == OtherConst.NB_ZHUANGBEI_ADD)
               {
                  _loc10_ = 0;
                  while(_loc10_ < _loc8_.length)
                  {
                     _loc9_ = {
                        "name":_loc8_[_loc10_],
                        "xy":_loc3_[_loc10_ + 1],
                        "dec":""
                     };
                     _loc7_[_loc7_.length] = _loc9_;
                     _loc10_++;
                  }
                  this.mapPlane.setRenShenTianDi(_loc7_);
                  GameInstance.uiInstance.mainUI.setRenShenTianDi(_loc7_);
               }
               else if(_loc3_[0] == OtherConst.NB_ZHUANGBEI_REMOVE)
               {
                  this.mapPlane.setRenShenTianDi([null,null,null,null]);
                  GameInstance.uiInstance.mainUI.setRenShenTianDi([null,null,null,null]);
               }
               break;
            case MainUI_ApplicationFacade.SET_SMALL_MAP_NB_ZHUANGBEI3V3:
               _loc3_ = _loc2_ as Array;
               _loc7_ = [];
               if(_loc3_[0] == OtherConst.NB_ZHUANGBEI_ADD3V3)
               {
                  _loc10_ = 0;
                  while(_loc10_ < _loc3_[1].length)
                  {
                     _loc9_ = {
                        "id":_loc3_[1][_loc10_][0],
                        "name":_loc3_[1][_loc10_][1],
                        "type":_loc3_[1][_loc10_][2],
                        "xy":new Point(_loc3_[1][_loc10_][3],_loc3_[1][_loc10_][4]),
                        "dec":""
                     };
                     _loc7_[_loc7_.length] = _loc9_;
                     _loc10_++;
                  }
                  this.mapPlane.setRenShenTianDi3v3(_loc7_);
                  GameInstance.uiInstance.mainUI.setRenShenTianDi3v3(_loc7_);
               }
               else if(_loc3_[0] == OtherConst.NB_ZHUANGBEI_REMOVE3V3)
               {
                  this.mapPlane.setRenShenTianDi3v3(null);
                  GameInstance.uiInstance.mainUI.setRenShenTianDi3v3(null);
               }
         }
      }
      
      public function addMap() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Rectangle = null;
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         if(GameInstance.scene.mapConfig.mapID == OtherConst.TUNSHITIANDI_MAP_ID)
         {
            NoticeManager.notify(NoticeManager.FOOT,"该地图不能查看地图面板");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"该地图不能查看地图面板");
            return;
         }
         if(!Fun.isVisible(this.mapPlane))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.mapPlane);
            _loc1_ = 50;
            _loc2_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
            _loc3_ = this.mapPlane.getBounds(GameInstance.stage);
            _loc4_ = _loc2_.intersection(_loc3_);
            if(_loc4_.width < _loc1_ || _loc4_.height < _loc1_)
            {
               this.mapPlane.x = GameConfig.sceneWidth / 2 - this.mapPlane.width / 2;
               this.mapPlane.y = GameConfig.sceneHeight / 2 - this.mapPlane.height / 2;
            }
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
            TSoundManager.addPanelCloseSound(this.mapPlane);
            this.mapPlane.visible = true;
            this.updataMapDynamicData();
         }
         else
         {
            this.stopTime();
            if(this.mapPlane.parent)
            {
               this.mapPlane.parent.removeChild(this.mapPlane);
            }
            this.mapPlane.visible = false;
         }
      }
      
      public function showMapPortalPanel(param1:Object) : void
      {
         param1.restrict = "" + param1.restrict;
         this.mapPlane.showMapPortalPanel(param1.id,param1.name,param1.restrict,param1.monst,param1.level,param1.boss,param1.time,param1.item,param1.expand);
      }
      
      private function get msgSenderProxy() : MainUI_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(MainUI_MsgSendProxy.NAME) as MainUI_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(PopMapPanel,function():void
         {
            mapPlane.addEventListener(FCloseEvent.CLOSE,stopTime);
            mapPlane.addEventListener(PopMapPanel.BUSINESS_NPC_CLICK,miniMapClick);
            mapPlane.addEventListener(PopMapPanel.MENU_NPC_CLICK,miniMapClick);
            mapPlane.addEventListener(PopMapPanel.TASK_NPC_CLICK,miniMapClick);
            mapPlane.addEventListener(PopMapPanel.MONSTER_POINT_CLICK,miniMapClick);
            mapPlane.addEventListener(PopMapPanel.GOTO_POINT_CLICK,miniMapClick);
            mapPlane.addEventListener(PopMapPanel.UI_MAP_WORLDMAP_MAP_NAME_BTN_CLICK,worldMapClick);
            mapPlane.addEventListener(PopMapPanel.UI_MAP_WORLDMAP_PORTAL_OK,worldMapClick);
            mapPlane.addEventListener(PopMapPanel.UI_MAP_WORLDMAP_WALK_OK,worldMapClick);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PopMapPanel,function():void
         {
            mapPlane.removeEventListener(FCloseEvent.CLOSE,stopTime);
            mapPlane.removeEventListener(PopMapPanel.BUSINESS_NPC_CLICK,miniMapClick);
            mapPlane.removeEventListener(PopMapPanel.MENU_NPC_CLICK,miniMapClick);
            mapPlane.removeEventListener(PopMapPanel.TASK_NPC_CLICK,miniMapClick);
            mapPlane.removeEventListener(PopMapPanel.MONSTER_POINT_CLICK,miniMapClick);
            mapPlane.removeEventListener(PopMapPanel.GOTO_POINT_CLICK,miniMapClick);
            mapPlane.removeEventListener(PopMapPanel.UI_MAP_WORLDMAP_MAP_NAME_BTN_CLICK,worldMapClick);
            mapPlane.removeEventListener(PopMapPanel.UI_MAP_WORLDMAP_PORTAL_OK,worldMapClick);
            mapPlane.removeEventListener(PopMapPanel.UI_MAP_WORLDMAP_WALK_OK,worldMapClick);
         });
      }
      
      private function updataMapDynamicData() : void
      {
         this.timeListener();
         this.time();
      }
      
      private function updataMapStaticData() : void
      {
         this.setMap();
         var _loc1_:MapRes = MapTransManager.getMapRes(GameInstance.scene.mapConfig.mapID);
         var _loc2_:String = GameConfig.wantEnterMapRes.allowPvp ? LanResManager.getLanTextWords(this,"战争区域") : LanResManager.getLanTextWords(this,"和平区域");
         var _loc3_:String = GameConfig.wantEnterMapRes.allowPvp ? StaticValue.RED_HTML : StaticValue.GREEN_HTML;
         this.mapPlane.setMapName(_loc1_.name + "<font color=\'" + _loc3_ + "\'>【" + _loc2_ + "】</font>");
         this.mapPlane.setCharOnWorldMap(_loc1_.name);
      }
      
      private function worldMapClick(param1:BaseEvent) : void
      {
         var _loc2_:String = null;
         var _loc4_:int = 0;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case PopMapPanel.UI_MAP_WORLDMAP_MAP_NAME_BTN_CLICK:
               _loc2_ = param1.data as String;
               _loc4_ = MapTransManager.getSceneIdBySceneName(_loc2_);
               _loc3_["id"] = _loc4_;
               this.msgSenderProxy.send_10131(_loc3_);
               break;
            case PopMapPanel.UI_MAP_WORLDMAP_PORTAL_OK:
               _loc4_ = param1.data as int;
               _loc3_["id"] = _loc4_;
               this.msgSenderProxy.send_10133(_loc3_);
               break;
            case PopMapPanel.UI_MAP_WORLDMAP_WALK_OK:
               _loc4_ = param1.data as int;
               if(_loc4_ == GameInstance.scene.mapConfig.mapID)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"您已经在这个场景中");
               }
               else if(MainCharSeachPathManager.hasPath(GameInstance.scene.mapConfig.mapID,_loc4_))
               {
                  MainCharSeachPathManager.mainCharWalk(_loc4_ + ",-1,-1,0");
               }
               else if(_loc4_ == SpecialMapID.YYSZ_ID)
               {
                  MainCharSeachPathManager.mainCharWalk(SpecialNPCID.FUBEN_NPC_ID_WITH_XIANGYANGCHENG);
               }
               else if(_loc4_ == SpecialMapID.XYC_ID)
               {
                  MainCharSeachPathManager.mainCharWalk(SpecialNPCID.YYSC_CHUANSONG);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"无法徒步前往该场景");
               }
         }
      }
      
      private function miniMapClick(param1:*) : void
      {
         switch(param1.type)
         {
            case PopMapPanel.BUSINESS_NPC_CLICK:
               this.isBusinessNPCOpen = param1.data as Boolean;
               this.showTelePortAndNPCAndMonsterPoint(false,true,false);
               break;
            case PopMapPanel.TASK_NPC_CLICK:
               this.isTaskNPCOpen = param1.data as Boolean;
               this.showTelePortAndNPCAndMonsterPoint(false,true,false);
               break;
            case PopMapPanel.MENU_NPC_CLICK:
               this.isMenuNPCOpen = param1.data as Boolean;
               this.showTelePortAndNPCAndMonsterPoint(false,true,false);
               break;
            case PopMapPanel.MONSTER_POINT_CLICK:
               this.isMonsterPointOpen = param1.data as Boolean;
               this.showTelePortAndNPCAndMonsterPoint(false,false,true);
               break;
            case PopMapPanel.GOTO_POINT_CLICK:
               this.isPortalOpen = param1.data as Boolean;
               this.showTelePortAndNPCAndMonsterPoint(true,false,false);
         }
      }
      
      private function time() : void
      {
         this.timer = new Timer(OtherConst.MINI_MAP_MAP_REFRESH_TIME);
         this.timer.start();
         this.timer.addEventListener(TimerEvent.TIMER,this.timeListener);
      }
      
      private function setMap() : void
      {
         this.mapPlane.setMap(this.miniMapBitmapData);
         var _loc1_:int = GameConfig.wantEnterMapRes.id;
         var _loc2_:MapRes = MapTransManager.getMapRes(GameInstance.scene.mapConfig.mapID);
         var _loc3_:String = GameConfig.wantEnterMapRes.allowPvp ? LanResManager.getLanTextWords(this,"战争区域") : LanResManager.getLanTextWords(this,"和平区域");
         var _loc4_:String = GameConfig.wantEnterMapRes.allowPvp ? StaticValue.RED_HTML : StaticValue.GREEN_HTML;
         this.mapPlane.setMapName(_loc2_.name + "<font color=\'" + _loc4_ + "\'>【" + _loc3_ + "】</font>");
      }
      
      private function timeListener(param1:TimerEvent = null) : void
      {
         var _loc5_:PurePlayer = null;
         var _loc6_:Object = null;
         this.mapPlane.setTeamMebmer([]);
         var _loc2_:Array = GameInstance.mainCharData.teamInfo.teamPlayers;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = _loc2_[_loc4_] as PurePlayer;
            _loc6_ = GameInstance.mainCharData.teamInfo.tempPlayerXYObj;
            if(Boolean(_loc5_) && Boolean(_loc6_) && Boolean(_loc6_[_loc5_.id]))
            {
               _loc3_.push({
                  "name":_loc5_.name,
                  "xy":new Point(_loc6_[_loc5_.id].x,_loc6_[_loc5_.id].y),
                  "dec":LanResManager.getLanTextWords(this,"队伍成员")
               });
            }
            _loc4_++;
         }
         this.mapPlane.setTeamMebmer(_loc3_);
      }
      
      private function stopTime(param1:* = null) : void
      {
         if(this.timer)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.timeListener);
            this.timer = null;
         }
      }
      
      private function showTelePortAndNPCAndMonsterPoint(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc10_:NPC = null;
         var _loc11_:SceneCharacter = null;
         var _loc13_:int = 0;
         var _loc14_:Telport = null;
         var _loc15_:MapRes = null;
         var _loc16_:Object = null;
         var _loc17_:SceneMonsterPointRes = null;
         var _loc18_:MonsterPointRes = null;
         var _loc19_:MonsterRes = null;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:XML = <list></list>;
         var _loc12_:int = int(GameInstance.scene.sceneCharacters.length);
         _loc13_ = 0;
         while(_loc13_ < _loc12_)
         {
            _loc11_ = GameInstance.scene.sceneCharacters[_loc13_];
            if(_loc11_.type == SceneCharacterType.TRANSPORT && param1 && this.isPortalOpen)
            {
               _loc14_ = _loc11_.data as Telport;
               _loc15_ = _loc14_.targetMapRes;
               _loc16_ = {};
               _loc16_.name = _loc11_.headFace != null ? _loc11_.headFace.nickName : _loc11_.name;
               _loc16_.xy = new Point(_loc11_.piexl_x,_loc11_.piexl_y);
               _loc16_.dec = _loc15_.exercise_desc;
               _loc16_.id = _loc11_.id;
               _loc4_.push(_loc16_);
            }
            if(_loc11_.type == SceneCharacterType.NPC && param2)
            {
               _loc10_ = _loc11_.data as NPC;
               if(this.isMenuNPCOpen && _loc10_.res.npctype == NpcType.FUNCTION)
               {
                  _loc16_ = {};
                  _loc16_.name = _loc11_.headFace != null ? _loc11_.headFace.nickName : _loc11_.name;
                  _loc16_.xy = new Point(_loc11_.piexl_x,_loc11_.piexl_y);
                  _loc16_.dec = _loc10_.res.nickname;
                  _loc16_.id = _loc11_.id;
                  _loc16_.xmlName = NPC(_loc11_.data).res.name;
                  _loc16_.xmlNickName = NPC(_loc11_.data).res.nickname;
                  _loc5_.push(_loc16_);
               }
            }
            if(_loc11_.type == SceneCharacterType.NPC && param2)
            {
               _loc10_ = _loc11_.data as NPC;
               if(this.isBusinessNPCOpen && _loc10_.res.npctype == NpcType.BUSINESS)
               {
                  _loc16_ = {};
                  _loc16_.name = _loc11_.headFace != null ? _loc11_.headFace.nickName : _loc11_.name;
                  _loc16_.xy = new Point(_loc11_.piexl_x,_loc11_.piexl_y);
                  _loc16_.dec = _loc10_.res.nickname;
                  _loc16_.id = _loc11_.id;
                  _loc16_.xmlName = NPC(_loc11_.data).res.name;
                  _loc16_.xmlNickName = NPC(_loc11_.data).res.nickname;
                  _loc7_.push(_loc16_);
               }
            }
            if(_loc11_.type == SceneCharacterType.NPC && param2)
            {
               _loc10_ = _loc11_.data as NPC;
               if(this.isTaskNPCOpen && _loc10_.res.npctype == NpcType.TASK)
               {
                  _loc16_ = {};
                  _loc16_.name = _loc11_.headFace != null ? _loc11_.headFace.nickName : _loc11_.name;
                  _loc16_.xy = new Point(_loc11_.piexl_x,_loc11_.piexl_y);
                  _loc16_.dec = _loc10_.res.nickname;
                  _loc16_.id = _loc11_.id;
                  _loc16_.xmlName = NPC(_loc11_.data).res.name;
                  _loc16_.xmlNickName = NPC(_loc11_.data).res.nickname;
                  _loc6_.push(_loc16_);
               }
            }
            _loc13_++;
         }
         _loc5_.sortOn("id");
         _loc13_ = 0;
         while(_loc13_ < _loc5_.length)
         {
            _loc9_.appendChild(<node label={_loc5_[_loc13_].xmlName} dsc={_loc5_[_loc13_].xmlNickName} id={_loc5_[_loc13_].id}/>);
            _loc13_++;
         }
         _loc7_.sortOn("id");
         _loc13_ = 0;
         while(_loc13_ < _loc7_.length)
         {
            _loc9_.appendChild(<node label={_loc7_[_loc13_].xmlName} dsc={_loc7_[_loc13_].xmlNickName} id={_loc7_[_loc13_].id}/>);
            _loc13_++;
         }
         _loc6_.sortOn("id");
         _loc13_ = 0;
         while(_loc13_ < _loc6_.length)
         {
            _loc9_.appendChild(<node label={_loc6_[_loc13_].xmlName} dsc={_loc6_[_loc13_].xmlNickName} id={_loc6_[_loc13_].id}/>);
            _loc13_++;
         }
         if(param3 && this.isMonsterPointOpen)
         {
            _loc17_ = SceneMonsterPointResManager.getSceneMonsterPointRes(GameInstance.scene.mapConfig.mapID);
            if(_loc17_ != null)
            {
               _loc12_ = int(_loc17_.monsterPoints.length);
               _loc13_ = 0;
               while(_loc13_ < _loc12_)
               {
                  _loc18_ = _loc17_.monsterPoints[_loc13_];
                  _loc19_ = MonsterResManager.getMonsterRes(_loc18_.id);
                  _loc16_ = {};
                  _loc16_.name = _loc19_.name;
                  _loc16_.xy = Transformer.transTilePoint2PixelPoint(new Point(_loc18_.tileX,_loc18_.tileY));
                  _loc16_.dec = "";
                  _loc16_.id = _loc18_.id;
                  _loc8_.push(_loc16_);
                  _loc13_++;
               }
            }
         }
         if(param1)
         {
            this.mapPlane.setPortal(_loc4_);
         }
         if(param2)
         {
            this.mapPlane.setFunctionNPC(_loc5_);
            this.mapPlane.setBusinessNPC(_loc7_);
            this.mapPlane.setTaskNPC(_loc6_);
            this.mapPlane.setNpcList(_loc9_);
            if(this.setTaskNPCStatus != null)
            {
               this.mapPlane.setTaskNPCState(this.setTaskNPCStatus[0],this.setTaskNPCStatus[1].concat(this.setTaskNPCStatus[3]),this.setTaskNPCStatus[2]);
            }
            this.isSetTaskNPC = true;
         }
         if(param3)
         {
            this.mapPlane.setMonster(_loc8_);
         }
      }
   }
}

