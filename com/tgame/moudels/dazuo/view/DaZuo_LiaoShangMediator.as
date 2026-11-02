package com.tgame.moudels.dazuo.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dazuo.model.DaZuo_MsgSenderProxy;
   import com.tgame.shell.view.components.Liaoshang_SearchPlayerPanel;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DaZuo_LiaoShangMediator extends Mediator
   {
      
      public static const NAME:String = "DaZuo_LiaoShangMediator";
      
      private var _msgSenderProxy:DaZuo_MsgSenderProxy;
      
      private var nowPage:int = 1;
      
      private var playerName:String = "";
      
      private var isOpenShuangXiuInfoPanel:Boolean = false;
      
      public function DaZuo_LiaoShangMediator()
      {
         super(NAME);
      }
      
      protected function get shuangXiu_SearchPlayerPanel() : Liaoshang_SearchPlayerPanel
      {
         return GameInstance.uiInstance.liaoshang_SearchPlayerPanel;
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
         EventDispatchCenter.getInstance().addEventListener(Liaoshang_SearchPlayerPanel.UI_LIAOSHANG_LOOK_INFO_BTN_CLICK,this.mainCharEquipPuddingHandle);
         EventDispatchCenter.getInstance().addEventListener(Liaoshang_SearchPlayerPanel.UI_LIAOSHANG_OK_BTN_CLICK,this.mainCharEquipPuddingHandle);
         EventDispatchCenter.getInstance().addEventListener(Liaoshang_SearchPlayerPanel.UI_LIAOSHANG_CANCEL_BTN_CLICK,this.mainCharEquipPuddingHandle);
         UIEventsRegisterManager.addUIRegisterEvent(Liaoshang_SearchPlayerPanel,function():void
         {
            shuangXiu_SearchPlayerPanel.addEventListener(Event.ADDED_TO_STAGE,addToStage);
            shuangXiu_SearchPlayerPanel.addEventListener(Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_SEARCH_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_PAGE_PRE_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_PAGE_NEXT_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_INTRO_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_START_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.addEventListener(Liaoshang_SearchPlayerPanel.UI_INTRO_CLOSE_BTN_CLICK,panelClose);
            shuangXiu_SearchPlayerPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Liaoshang_SearchPlayerPanel,function():void
         {
            shuangXiu_SearchPlayerPanel.removeEventListener(Event.ADDED_TO_STAGE,addToStage);
            shuangXiu_SearchPlayerPanel.removeEventListener(Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_SEARCH_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_PAGE_PRE_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_PAGE_NEXT_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_INTRO_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_START_BTN_CLICK,mainCharEquipPuddingHandle);
            shuangXiu_SearchPlayerPanel.removeEventListener(Liaoshang_SearchPlayerPanel.UI_INTRO_CLOSE_BTN_CLICK,panelClose);
            shuangXiu_SearchPlayerPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
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
               _loc4_ = [LanResManager.getLanCommonTextWords("少林"),LanResManager.getLanCommonTextWords("全真"),LanResManager.getLanCommonTextWords("古墓"),LanResManager.getLanCommonTextWords("桃花")];
               _loc5_ = 0;
               while(_loc5_ < param2.length)
               {
                  _loc3_.appendChild(<node label={param2[_loc5_][0]} number={(this.nowPage - 1) * 5 + _loc5_ + 1} playerName={param2[_loc5_][1]} level={param2[_loc5_][2]} party={_loc4_[param2[_loc5_][3] - 1]}/>);
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
            var data:Object = param1;
            FAlert.okLabel = LanResManager.getLanCommonTextWords("同意治疗");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("拒绝");
            FAlert.show(data.name + " " + LanResManager.getLanCommonTextWords("玩家希望为您治疗您的经脉重伤状态，您同意接受治疗吗？"),"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  shuangXiu_SearchPlayerPanel.showShuangXiuPanel(data.id,data.head,data.name,data.lv,data.bangpai,data.party);
               }
               else
               {
                  msgSenderProxy.send_50511({
                     "type":2,
                     "ID":data.id,
                     "isShuangXiu":0
                  });
               }
            },true);
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
         GameInstance.uiInstance.mainUI.showICOTip(MainUI.TYPE_LIAOSHANG_TIP,showShuangXiuPanel,data);
      }
      
      private function addToStage(param1:Event) : void
      {
         this.isOpenShuangXiuInfoPanel = true;
         this.shuangXiu_SearchPlayerPanel.showIntroPanel();
         this.msgSenderProxy.send_50507({
            "type":2,
            "name":this.playerName,
            "pageNum":this.nowPage
         });
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
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:String = param1.type;
         switch(_loc3_)
         {
            case Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_INTRO_BTN_CLICK:
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
            case Liaoshang_SearchPlayerPanel.UI_LIAOSHANG_CANCEL_BTN_CLICK:
               _loc4_ = _loc2_.data as int;
               this.msgSenderProxy.send_50511({
                  "type":2,
                  "ID":_loc4_,
                  "isShuangXiu":0
               });
               break;
            case Liaoshang_SearchPlayerPanel.UI_LIAOSHANG_LOOK_INFO_BTN_CLICK:
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
            case Liaoshang_SearchPlayerPanel.UI_LIAOSHANG_OK_BTN_CLICK:
               _loc4_ = _loc2_.data as int;
               this.msgSenderProxy.send_50511({
                  "type":2,
                  "ID":_loc4_,
                  "isShuangXiu":1
               });
               break;
            case Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_PAGE_NEXT_BTN_CLICK:
               ++this.nowPage;
               this.msgSenderProxy.send_50507({
                  "type":2,
                  "name":this.playerName,
                  "pageNum":this.nowPage
               });
               break;
            case Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_PAGE_PRE_BTN_CLICK:
               if(this.nowPage > 1)
               {
                  --this.nowPage;
               }
               this.msgSenderProxy.send_50507({
                  "type":2,
                  "name":this.playerName,
                  "pageNum":this.nowPage
               });
               break;
            case Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_SEARCH_BTN_CLICK:
               this.playerName = _loc2_.data as String;
               this.nowPage = 1;
               this.msgSenderProxy.send_50507({
                  "type":2,
                  "name":this.playerName,
                  "pageNum":this.nowPage
               });
               break;
            case Liaoshang_SearchPlayerPanel.UI_SHUANGXIU_START_BTN_CLICK:
               _loc4_ = _loc2_.data as int;
               if(_loc4_ == 0)
               {
                  return;
               }
               this.msgSenderProxy.send_50509({
                  "type":2,
                  "targetID":_loc4_
               });
         }
      }
   }
}

