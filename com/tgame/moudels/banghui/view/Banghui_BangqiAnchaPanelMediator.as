package com.tgame.moudels.banghui.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.banghui.Banghui_ApplicationFacade;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.shell.view.components.PartyFlagInstallPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_BangqiAnchaPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_BangqiAnchaPanelMediator";
      
      private var _showCondition:int = 0;
      
      private var _pageCount:int = 10;
      
      private var _currentPage:int = 1;
      
      private var _maxPage:int = 1;
      
      private var _senderProxy:Banghui_MsgSenderProxy;
      
      public function Banghui_BangqiAnchaPanelMediator()
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
         return [Banghui_ApplicationFacade.BANGQI_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Banghui_ApplicationFacade.BANGQI_CHANGED:
               this.f5();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(PartyFlagInstallPanel,function():void
         {
            GameInstance.uiInstance.bangqiAnchaPanel.addEventListener(PartyFlagInstallPanel.UI_PARTYFLAGINSTALLPANEL_PARTYLIST_SHOW_QUALIFICATION,uiHandle);
            GameInstance.uiInstance.bangqiAnchaPanel.addEventListener(PartyFlagInstallPanel.UI_PARTYFLAGINSTALLPANEL_FIX_FLAG,uiHandle);
            GameInstance.uiInstance.bangqiAnchaPanel.addEventListener(PartyFlagInstallPanel.UI_PARTYFLAGINSTALLPANEL_RENOVATE,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PartyFlagInstallPanel,function():void
         {
            GameInstance.uiInstance.bangqiAnchaPanel.removeEventListener(PartyFlagInstallPanel.UI_PARTYFLAGINSTALLPANEL_PARTYLIST_SHOW_QUALIFICATION,uiHandle);
            GameInstance.uiInstance.bangqiAnchaPanel.removeEventListener(PartyFlagInstallPanel.UI_PARTYFLAGINSTALLPANEL_FIX_FLAG,uiHandle);
            GameInstance.uiInstance.bangqiAnchaPanel.removeEventListener(PartyFlagInstallPanel.UI_PARTYFLAGINSTALLPANEL_RENOVATE,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:BanghuiInfo = _loc2_.banghuiInfo;
         var _loc4_:String = param1.type;
         if(param1 is BaseEvent)
         {
            _loc5_ = (param1 as BaseEvent).data;
         }
         switch(_loc4_)
         {
            case PartyFlagInstallPanel.UI_PARTYFLAGINSTALLPANEL_PARTYLIST_SHOW_QUALIFICATION:
               _loc6_ = _loc5_ as Array;
               this._pageCount = _loc6_[0];
               this._showCondition = _loc6_[1];
               _loc7_ = int(_loc6_[2]);
               if(_loc7_ == 0)
               {
                  _loc8_ = 1;
               }
               else if(_loc7_ == 1)
               {
                  _loc8_ = this._currentPage - 1;
                  if(_loc8_ <= 0)
                  {
                     _loc8_ = 1;
                  }
               }
               else if(_loc7_ == 2)
               {
                  _loc8_ = this._currentPage + 1;
                  if(_loc8_ >= this._maxPage)
                  {
                     _loc8_ = this._maxPage;
                  }
               }
               else if(_loc7_ == 3)
               {
                  _loc8_ = this._maxPage;
               }
               this.senderProxy.send_51083([this._showCondition,this._pageCount,_loc8_]);
               break;
            case PartyFlagInstallPanel.UI_PARTYFLAGINSTALLPANEL_FIX_FLAG:
               this.senderProxy.send_51095(_loc5_);
               break;
            case PartyFlagInstallPanel.UI_PARTYFLAGINSTALLPANEL_RENOVATE:
               this.senderProxy.send_51097(_loc5_);
         }
      }
      
      public function f5() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._bangqiAnchaPanel))
         {
            this.senderProxy.send_51083([this._showCondition,this._pageCount,this._currentPage]);
         }
      }
      
      public function receive_bangqiAnchaList(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int) : void
      {
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:String = null;
         var _loc23_:XML = null;
         if(this._showCondition != param1)
         {
            return;
         }
         if(this._pageCount != param2)
         {
            return;
         }
         this._currentPage = param3;
         this._maxPage = param4;
         var _loc7_:XML = <list/>;
         for each(_loc8_ in param5)
         {
            _loc9_ = int(_loc8_[0]);
            _loc10_ = int(_loc8_[1]);
            _loc11_ = _loc8_[2];
            _loc12_ = int(_loc8_[3]);
            _loc13_ = int(_loc8_[4]);
            _loc14_ = int(_loc8_[5]);
            _loc15_ = "";
            _loc16_ = "";
            _loc17_ = "";
            _loc18_ = "";
            _loc19_ = "";
            _loc20_ = 0;
            _loc21_ = 0;
            if(_loc14_ == 1)
            {
               _loc15_ = String(_loc8_[6]);
               _loc16_ = _loc8_[7];
               _loc17_ = String(_loc8_[8]);
               _loc18_ = _loc8_[9];
               _loc19_ = _loc8_[10];
               _loc20_ = int(_loc8_[11]);
               _loc21_ = int(_loc8_[12]);
            }
            _loc22_ = _loc12_ + "," + _loc13_;
            _loc23_ = <node label={_loc11_} flagID={_loc17_} coordinateID={_loc9_} coordinate={_loc22_} flagName={_loc16_} flagLv={_loc15_} party={_loc19_} lifeNow={_loc20_} lifeMax={_loc21_}/>;
            _loc7_.appendChild(_loc23_);
         }
         GameInstance.uiInstance.bangqiAnchaPanel.setDataProvider(_loc7_,this._maxPage,this._currentPage);
         GameInstance.uiInstance.bangqiAnchaPanel.fixPoint(param6.toString());
         GameInstance.uiInstance.bangqiAnchaPanel.setFlagID(GameInstance.mainCharData.banghuiInfo.bangqiImgID);
      }
   }
}

