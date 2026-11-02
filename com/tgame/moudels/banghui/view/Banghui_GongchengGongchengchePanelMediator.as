package com.tgame.moudels.banghui.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.vo.character.NPC;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.shell.view.components.GongchengPaoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_GongchengGongchengchePanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_GongchengGongchengchePanelMediator";
      
      private var _gongchengcheNpcID:int;
      
      private var _gongchengcheNpcName:String;
      
      private var _gongchengchePaodanID:int;
      
      private var _gongchengchePaodanDanjia:int;
      
      private var _senderProxy:Banghui_MsgSenderProxy;
      
      public function Banghui_GongchengGongchengchePanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Banghui_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Banghui_MsgSenderProxy.NAME) as Banghui_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(GongchengPaoPanel,function():void
         {
            GameInstance.uiInstance.gongchengGongchengchePanel.addEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.gongchengGongchengchePanel.addEventListener(GongchengPaoPanel.UI_AMMOBUYPANEL_MAP_CLICK,uiHandle);
            GameInstance.uiInstance.gongchengGongchengchePanel.addEventListener(GongchengPaoPanel.UI_AMMOBUYPANEL_ADDBTN_CLICK,uiHandle);
            GameInstance.uiInstance.gongchengGongchengchePanel.addEventListener(GongchengPaoPanel.UI_AMMOBUYPANEL_OKCLICK,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(GongchengPaoPanel,function():void
         {
            GameInstance.uiInstance.gongchengGongchengchePanel.removeEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.gongchengGongchengchePanel.removeEventListener(GongchengPaoPanel.UI_AMMOBUYPANEL_MAP_CLICK,uiHandle);
            GameInstance.uiInstance.gongchengGongchengchePanel.removeEventListener(GongchengPaoPanel.UI_AMMOBUYPANEL_ADDBTN_CLICK,uiHandle);
            GameInstance.uiInstance.gongchengGongchengchePanel.removeEventListener(GongchengPaoPanel.UI_AMMOBUYPANEL_OKCLICK,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc5_:Object = null;
         var _loc6_:NpcRes = null;
         var _loc7_:Array = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:BanghuiInfo = _loc2_.banghuiInfo;
         var _loc4_:String = param1.type;
         if(param1 is BaseEvent)
         {
            _loc5_ = (param1 as BaseEvent).data;
         }
         switch(_loc4_)
         {
            case Event.ADDED_TO_STAGE:
               this._gongchengcheNpcID = 0;
               this._gongchengcheNpcName = "";
               this._gongchengchePaodanID = 0;
               this._gongchengchePaodanDanjia = 0;
               GameInstance.uiInstance.gongchengGongchengchePanel.reset();
               _loc6_ = NPC(GameInstance.lockOnChar.data).res;
               _loc7_ = NpcResManager.getFunctionIDListByNpcID(_loc6_.id_kind);
               if(_loc7_.length == 1 && _loc7_[0] >= NpcFunctionType.PAODAN_FANWEI.x && _loc7_[0] <= NpcFunctionType.PAODAN_FANWEI.y)
               {
                  this._gongchengcheNpcID = GameInstance.lockOnChar.id;
                  this._gongchengcheNpcName = GameInstance.lockOnChar.name;
                  this._gongchengchePaodanID = _loc7_[0];
                  this.senderProxy.send_51115([this._gongchengcheNpcID,this._gongchengchePaodanID]);
               }
               break;
            case GongchengPaoPanel.UI_AMMOBUYPANEL_MAP_CLICK:
               if(this._gongchengcheNpcID > 0 && this._gongchengchePaodanID > 0)
               {
                  this.senderProxy.send_51119([this._gongchengcheNpcID,this._gongchengchePaodanID,_loc5_[0],_loc5_[1]]);
               }
               break;
            case GongchengPaoPanel.UI_AMMOBUYPANEL_ADDBTN_CLICK:
               if(this._gongchengchePaodanDanjia > 0)
               {
                  GameInstance.uiInstance.gongchengGongchengchePanel.setPandanInitialize(this._gongchengchePaodanDanjia,this._gongchengcheNpcName,this._gongchengchePaodanID);
               }
               break;
            case GongchengPaoPanel.UI_AMMOBUYPANEL_OKCLICK:
               if(this._gongchengcheNpcID > 0 && this._gongchengchePaodanID > 0)
               {
                  this.senderProxy.send_51117([this._gongchengcheNpcID,this._gongchengchePaodanID,_loc5_ as int]);
               }
         }
      }
      
      public function f5() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._gongchengGongchengchePanel))
         {
            if(this._gongchengcheNpcID > 0 && this._gongchengchePaodanID > 0)
            {
               this.senderProxy.send_51115([this._gongchengcheNpcID,this._gongchengchePaodanID]);
            }
         }
      }
      
      public function receive_gongchengche(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         if(param2 != this._gongchengchePaodanID)
         {
            return;
         }
         var _loc8_:NpcRes = NpcResManager.getNpcRes(param1);
         if(_loc8_ == null)
         {
            return;
         }
         var _loc9_:int = _loc8_.sceneid;
         var _loc10_:MapRes = MapTransManager.getMapRes(_loc9_);
         if(_loc10_ == null)
         {
            return;
         }
         this._gongchengchePaodanDanjia = param7;
         GameInstance.uiInstance.gongchengGongchengchePanel.setInitialize(_loc10_.pathName,this._gongchengcheNpcName,LanResManager.getLanTextWords(this,"减生命",[param3]),param4,param5,param6,this._gongchengchePaodanID);
         if(_loc10_.id == 20241)
         {
            GameInstance.uiInstance.gongchengGongchengchePanel.setInitializeTitle();
         }
      }
      
      public function receive_paodanBaozha(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(param1 != this._gongchengchePaodanID)
         {
            return;
         }
         GameInstance.uiInstance.gongchengGongchengchePanel.setPlayMovie(param2,param3);
      }
   }
}

