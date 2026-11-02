package com.tgame.moudels.banghui.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.BangzhongZhiwu;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.shell.view.components.Party_createPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_BanghuiCreatPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_BanghuiCreatPanelMediator";
      
      private var _senderProxy:Banghui_MsgSenderProxy;
      
      public function Banghui_BanghuiCreatPanelMediator()
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
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(Party_createPanel,function():void
         {
            GameInstance.uiInstance.banghuiCreatPanel.addEventListener(Party_createPanel.UI_PARTYPANEL_CREATE_PARTY_CHECK_NAME,uiHandle);
            GameInstance.uiInstance.banghuiCreatPanel.addEventListener(Party_createPanel.UI_PARTYPANEL_CREATE_PARTY_CREATE,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Party_createPanel,function():void
         {
            GameInstance.uiInstance.banghuiCreatPanel.removeEventListener(Party_createPanel.UI_PARTYPANEL_CREATE_PARTY_CHECK_NAME,uiHandle);
            GameInstance.uiInstance.banghuiCreatPanel.removeEventListener(Party_createPanel.UI_PARTYPANEL_CREATE_PARTY_CREATE,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:BanghuiInfo = _loc2_.banghuiInfo;
         var _loc4_:String = param1.type;
         _loc5_ = (param1 as BaseEvent).data;
         switch(_loc4_)
         {
            case Party_createPanel.UI_PARTYPANEL_CREATE_PARTY_CHECK_NAME:
               this.senderProxy.send_51069(_loc5_ as String);
               break;
            case Party_createPanel.UI_PARTYPANEL_CREATE_PARTY_CREATE:
               _loc6_ = _loc5_ as Array;
               _loc7_ = _loc6_[4] + "," + _loc6_[5] + "," + _loc6_[6];
               this.senderProxy.send_51037([_loc6_[0],_loc6_[1],_loc6_[2],_loc6_[3],_loc7_]);
         }
      }
      
      public function receive_checkName(param1:String, param2:Boolean, param3:String) : void
      {
         if(param2)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"帮会名可以使用",[param1]));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"帮会名可以使用",[param1]));
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,param3);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,param3);
         }
      }
      
      public function receive_creatBanghuiSucc(param1:int, param2:String, param3:int, param4:String, param5:int, param6:String) : void
      {
         var $banghuiID:int = param1;
         var $banghuiName:String = param2;
         var $bangqiLv:int = param3;
         var $bangqiName:String = param4;
         var $bangqiImgID:int = param5;
         var $bangqiStyle:String = param6;
         var banghuiInfo:BanghuiInfo = GameInstance.mainCharData.banghuiInfo;
         banghuiInfo.banghuiId = $banghuiID;
         banghuiInfo.banghuiName = $banghuiName;
         banghuiInfo.zhiwu = BangzhongZhiwu.ZW1;
         banghuiInfo.bangqiLv = $bangqiLv;
         banghuiInfo.bangqiName = $bangqiName;
         banghuiInfo.bangqiImgID = $bangqiImgID;
         banghuiInfo.bangqiImgColor = $bangqiStyle.split(",").map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         if(Fun.isVisible(GameInstance.uiInstance._banghuiCreatPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_CREAT_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._banghuiListPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_LIST_PANEL);
         }
         if(!Fun.isVisible(GameInstance.uiInstance._banghuiInfoPanel))
         {
            GameInstance.lookBanghuiID = GameInstance.mainCharData.banghuiInfo.banghuiId;
            PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_INFO_PANEL);
         }
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"帮会创建成功"));
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"帮会创建成功"));
      }
      
      public function receive_creatBanghuiFail(param1:String) : void
      {
         NoticeManager.notify(NoticeManager.ALERT,param1);
      }
   }
}

