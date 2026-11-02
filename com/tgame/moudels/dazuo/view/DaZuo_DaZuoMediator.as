package com.tgame.moudels.dazuo.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.SitManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dazuo.DaZuo_ApplicationFacade;
   import com.tgame.moudels.dazuo.model.DaZuo_MsgSenderProxy;
   import com.tgame.shell.view.components.ButtonContainer;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.ShuangXiu_SearchPlayerPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.config.SceneConfig;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DaZuo_DaZuoMediator extends Mediator
   {
      
      public static const NAME:String = "DaZuo_DaZuoMediator";
      
      private var _msgSenderProxy:DaZuo_MsgSenderProxy;
      
      private var nowPage:int = 1;
      
      private var playerName:String = "";
      
      private var isOpenShuangXiuInfoPanel:Boolean = false;
      
      public function DaZuo_DaZuoMediator()
      {
         super(NAME);
      }
      
      protected function get buttonContainer() : ButtonContainer
      {
         return GameInstance.uiInstance.buttonContainer;
      }
      
      protected function get shuangXiu_SearchPlayerPanel() : ShuangXiu_SearchPlayerPanel
      {
         return GameInstance.uiInstance.shuangXiu_SearchPlayerPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function get msgSenderProxy() : DaZuo_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(DaZuo_MsgSenderProxy.NAME) as DaZuo_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ButtonContainer,function():void
         {
            buttonContainer.shuanxiu.addEventListener(MouseEvent.CLICK,openShuangXiu);
            buttonContainer.guaji.addEventListener(MouseEvent.CLICK,openGuaJiPanel);
            buttonContainer.biguan.addEventListener(MouseEvent.CLICK,openBiGuanPanel);
            buttonContainer.liaoshang.addEventListener(MouseEvent.CLICK,openLiaoShangPanel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ButtonContainer,function():void
         {
            buttonContainer.shuanxiu.removeEventListener(MouseEvent.CLICK,openShuangXiu);
            buttonContainer.guaji.removeEventListener(MouseEvent.CLICK,openGuaJiPanel);
            buttonContainer.biguan.removeEventListener(MouseEvent.CLICK,openBiGuanPanel);
            buttonContainer.liaoshang.removeEventListener(MouseEvent.CLICK,openLiaoShangPanel);
         });
         EventDispatchCenter.getInstance().addEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_LOOK_INFO_BTN_CLICK,this.mainCharEquipPuddingHandle);
         EventDispatchCenter.getInstance().addEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_OK_BTN_CLICK,this.mainCharEquipPuddingHandle);
         EventDispatchCenter.getInstance().addEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_CANCEL_BTN_CLICK,this.mainCharEquipPuddingHandle);
         UIEventsRegisterManager.addUIRegisterEvent(ShuangXiu_SearchPlayerPanel,function():void
         {
            shuangXiu_SearchPlayerPanel.addEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_SEARCH_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_PAGE_PRE_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_PAGE_NEXT_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_INTRO_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_START_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(ShuangXiu_SearchPlayerPanel.UI_INTRO_CLOSE_BTN_CLICK,panelClose);
            shuangXiu_SearchPlayerPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShuangXiu_SearchPlayerPanel,function():void
         {
            shuangXiu_SearchPlayerPanel.removeEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_SEARCH_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_PAGE_PRE_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_PAGE_NEXT_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_INTRO_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_START_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(ShuangXiu_SearchPlayerPanel.UI_INTRO_CLOSE_BTN_CLICK,panelClose);
            shuangXiu_SearchPlayerPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DaZuo_ApplicationFacade.SEND_DAZUO,DaZuo_ApplicationFacade.SEND_SHUANGXIU,DaZuo_ApplicationFacade.CHAR_DAZUO_SHUANGXIU_STATUS,DaZuo_ApplicationFacade.CHAR_LIAOSHANG_STATUS,DaZuo_ApplicationFacade.SEND_LIAOSHANG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:SceneCharacter = null;
         var _loc4_:Array = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case DaZuo_ApplicationFacade.SEND_DAZUO:
               if((GameInstance.mainChar.data as BaseCharacter).avatarInfo.isYouyong)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("在水中禁止此操作！"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("在水中禁止此操作！"));
               }
               else
               {
                  this.msgSenderProxy.send_50503();
               }
               break;
            case DaZuo_ApplicationFacade.SEND_SHUANGXIU:
               _loc3_ = GameInstance.scene.getCharByID(_loc2_ as int);
               if(_loc3_ != null && _loc3_.usable)
               {
                  this.requestHeti(_loc3_,1,2 * SceneConfig.TILE_WIDTH,true);
               }
               break;
            case DaZuo_ApplicationFacade.SEND_LIAOSHANG:
               _loc3_ = GameInstance.scene.getCharByID(_loc2_ as int);
               if(_loc3_ != null && _loc3_.usable)
               {
                  this.requestHeti(_loc3_,2,2 * SceneConfig.TILE_WIDTH,true);
               }
               break;
            case DaZuo_ApplicationFacade.CHAR_DAZUO_SHUANGXIU_STATUS:
               _loc4_ = _loc2_ as Array;
               SitManager.setCharSitStatus(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8]);
               break;
            case DaZuo_ApplicationFacade.CHAR_LIAOSHANG_STATUS:
               _loc4_ = _loc2_ as Array;
               SitManager.setCharLiaoshangStatus(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6]);
         }
      }
      
      private function requestHeti(param1:SceneCharacter, param2:int, param3:int, param4:Boolean = true) : void
      {
         var catchTarget:Function = null;
         var send_heti:Function = null;
         var targetPoint:Point = null;
         var callBack:MoveCallBack = null;
         var $targetSc:SceneCharacter = param1;
         var $type:int = param2;
         var $distance:int = param3;
         var $catch:Boolean = param4;
         catchTarget = function(param1:SceneCharacter, param2:MapTile):void
         {
            if(!$targetSc.usable)
            {
               return;
            }
            if(targetPoint.x != $targetSc.tile_x || targetPoint.y != $targetSc.tile_y)
            {
               requestHeti($targetSc,$type,$distance,$catch);
            }
         };
         send_heti = function(param1:SceneCharacter = null, param2:MapTile = null):void
         {
            if(!$targetSc.usable)
            {
               return;
            }
            msgSenderProxy.send_50509({
               "type":$type,
               "targetID":$targetSc.id
            });
         };
         if($targetSc == null)
         {
            return;
         }
         if(Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point($targetSc.piexl_x,$targetSc.piexl_y)) <= $distance)
         {
            send_heti();
         }
         else if($catch)
         {
            targetPoint = new Point($targetSc.tile_x,$targetSc.tile_y);
            callBack = new MoveCallBack();
            callBack.onMoveThrough = catchTarget;
            callBack.onMoveArrived = send_heti;
            MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + $targetSc.tile_x + "," + $targetSc.tile_y + "," + $distance,false,callBack,true,true,false);
         }
      }
      
      public function received_shuangxiu_query(param1:int, param2:Array) : void
      {
         var _loc3_:XML = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(!(param1 == 1 && param2.length == 0))
         {
            if(param2.length == 0)
            {
               this.nowPage = param1 - 1;
            }
            else
            {
               _loc3_ = <list></list>;
               _loc4_ = [LanResManager.getLanCommonTextWords("少林"),LanResManager.getLanCommonTextWords("全真"),LanResManager.getLanCommonTextWords("古墓"),LanResManager.getLanCommonTextWords("桃花"),LanResManager.getLanCommonTextWords("古墓"),LanResManager.getLanCommonTextWords("桃花"),LanResManager.getLanCommonTextWords("古墓"),LanResManager.getLanCommonTextWords("桃花")];
               _loc5_ = 0;
               while(_loc5_ < param2.length)
               {
                  _loc3_.appendChild(<node label={param2[_loc5_][0]} number={(this.nowPage - 1) * 5 + _loc5_ + 1} playerName={param2[_loc5_][1]} level={param2[_loc5_][2]} party={PartyType.getName(param2[_loc5_][3])}/>);
                  _loc5_++;
               }
               this.shuangXiu_SearchPlayerPanel.setList(_loc3_,this.nowPage);
            }
         }
      }
      
      public function received_shuangxiu_request(param1:Object) : void
      {
         var showShuangXiuPanel:Function = null;
         var player:Player = null;
         var attrInfo:AttributeInfo = null;
         var data:Object = param1;
         showShuangXiuPanel = function(param1:Object):void
         {
            shuangXiu_SearchPlayerPanel.showShuangXiuPanel(param1.id,param1.head,param1.name,param1.lv,param1.bangpai,param1.party);
         };
         var sc:SceneCharacter = GameInstance.scene.getCharByID(data.id,SceneCharacterType.PLAYER);
         if(sc)
         {
            player = sc.data as Player;
            attrInfo = player.attributeInfo;
            data.head = attrInfo.headImg;
         }
         else
         {
            data.head = "";
         }
         data.party = PartyType.getName(data.party);
         GameInstance.uiInstance.mainUI.showICOTip(MainUI.TYPE_DAZUO_TIP,showShuangXiuPanel,data);
      }
      
      private function panelClose(param1:*) : void
      {
         if(!(param1 is FCloseEvent))
         {
            this.isOpenShuangXiuInfoPanel = false;
         }
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         var _loc4_:int = 0;
         var _loc5_:SceneCharacter = null;
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:String = param1.type;
         switch(_loc3_)
         {
            case Event.ADDED_TO_STAGE:
               this.shuangXiu_SearchPlayerPanel.removeEventListener(Event.ADDED_TO_STAGE,this.mainCharEquipPuddingHandle);
            case ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_INTRO_BTN_CLICK:
               if(this.isOpenShuangXiuInfoPanel)
               {
                  this.shuangXiu_SearchPlayerPanel.hideIntroPanel();
                  this.isOpenShuangXiuInfoPanel = false;
               }
               else
               {
                  this.shuangXiu_SearchPlayerPanel.showIntroPanel();
                  this.isOpenShuangXiuInfoPanel = true;
               }
               break;
            case ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_CANCEL_BTN_CLICK:
               _loc4_ = _loc2_.data as int;
               this.msgSenderProxy.send_50511({
                  "type":1,
                  "ID":_loc4_,
                  "isShuangXiu":0
               });
               break;
            case ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_LOOK_INFO_BTN_CLICK:
               _loc4_ = _loc2_.data as int;
               if(_loc4_ == 0)
               {
                  return;
               }
               GameInstance.lookPlayerID = _loc4_;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_OK_BTN_CLICK:
               _loc4_ = _loc2_.data as int;
               this.msgSenderProxy.send_50511({
                  "type":1,
                  "ID":_loc4_,
                  "isShuangXiu":1
               });
               break;
            case ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_PAGE_NEXT_BTN_CLICK:
               ++this.nowPage;
               this.msgSenderProxy.send_50507({
                  "type":1,
                  "name":this.playerName,
                  "pageNum":this.nowPage
               });
               break;
            case ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_PAGE_PRE_BTN_CLICK:
               if(this.nowPage > 1)
               {
                  --this.nowPage;
               }
               this.msgSenderProxy.send_50507({
                  "type":1,
                  "name":this.playerName,
                  "pageNum":this.nowPage
               });
               break;
            case ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_SEARCH_BTN_CLICK:
               this.playerName = _loc2_.data as String;
               this.nowPage = 1;
               this.msgSenderProxy.send_50507({
                  "type":1,
                  "name":this.playerName,
                  "pageNum":this.nowPage
               });
               break;
            case ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_START_BTN_CLICK:
               _loc4_ = _loc2_.data as int;
               if(_loc4_ == 0)
               {
                  return;
               }
               _loc5_ = GameInstance.scene.getCharByID(_loc4_ as int);
               if(_loc5_ != null && _loc5_.usable)
               {
                  this.requestHeti(_loc5_,1,2 * SceneConfig.TILE_WIDTH,true);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"很抱歉，对方距离您过远");
                  NoticeManager.notify(NoticeManager.FOOT,"很抱歉，对方距离您过远");
               }
         }
      }
      
      private function openShuangXiu(param1:MouseEvent) : void
      {
         if(!Fun.isVisible(this.shuangXiu_SearchPlayerPanel))
         {
            this.isOpenShuangXiuInfoPanel = true;
            this.msgSenderProxy.send_50507({
               "type":1,
               "name":this.playerName,
               "pageNum":this.nowPage
            });
         }
         PipeManager.sendMsg(PipeConstants.SHOW_SHUANGXIU_PANEL);
      }
      
      private function openBiGuanPanel(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_BIGUAN_PANEL);
      }
      
      private function openGuaJiPanel(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_AFK_PANEL);
      }
      
      private function openLiaoShangPanel(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_LIAOSHANG_PANEL);
      }
   }
}

