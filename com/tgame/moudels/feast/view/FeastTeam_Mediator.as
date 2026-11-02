package com.tgame.moudels.feast.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.feast.model.Feast_MsgSenderProxy;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FeastTeam_Mediator extends Mediator
   {
      
      public static const NAME:String = "FeastTeam_Mediator";
      
      private var _currentPage:int = 1;
      
      private var _tatolPage:int = 1;
      
      private var _msgSenderProxy:Feast_MsgSenderProxy;
      
      public function FeastTeam_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Feast_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Feast_MsgSenderProxy.NAME) as Feast_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get teamPanel() : TeamPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.teamPanel);
         }
         return viewComponent as TeamPanel;
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
         UIEventsRegisterManager.addUIRegisterEvent(TeamPanel,function():void
         {
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_JUBANHUNYAN_CLICK,initEventsListener);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_HUNYAN_SHOW,initEventsListener);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_HUNYAN_GET_PAGE,initEventsListener);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_HUNYANBANGZHU_CLICK,initEventsListener);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_SONGSHANGHONGBAO_CLICK,initEventsListener);
            teamPanel.addEventListener(TeamPanel.UI_TEAMPANEL_LINGQUHONGBAO_CLICK,initEventsListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TeamPanel,function():void
         {
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_JUBANHUNYAN_CLICK,initEventsListener);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_HUNYAN_SHOW,initEventsListener);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_HUNYAN_GET_PAGE,initEventsListener);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_HUNYANBANGZHU_CLICK,initEventsListener);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_SONGSHANGHONGBAO_CLICK,initEventsListener);
            teamPanel.removeEventListener(TeamPanel.UI_TEAMPANEL_LINGQUHONGBAO_CLICK,initEventsListener);
         });
      }
      
      private function initEventsListener(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(_loc2_.type)
         {
            case TeamPanel.UI_TEAMPANEL_MYCONSORT_JUBANHUNYAN_CLICK:
               if(!Fun.isVisible(GameInstance.uiInstance._marriageWeddingPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_WEDDING_PLANE);
               }
               if(!Fun.isVisible(GameInstance.uiInstance._marriageCashGiftListPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE);
               }
               ResizeManager.showDoublePanel(GameInstance.uiInstance.marriageWeddingPanel,GameInstance.uiInstance.marriageCashGiftListPanel);
               GameInstance.uiInstance.marriageWeddingPanel.isShowBtn(true);
               break;
            case TeamPanel.UI_TEAMPANEL_HUNYAN_SHOW:
               GameInstance.uiInstance.teamPanel.showWeddingList();
               this._currentPage = 1;
               this._tatolPage = 1;
               GameInstance.uiInstance.teamPanel.setPage(this._currentPage,this._tatolPage);
               GameInstance.uiInstance.teamPanel.setInitialize([]);
               this.msgSenderProxy.send_52261(this._currentPage);
               break;
            case TeamPanel.UI_TEAMPANEL_HUNYAN_GET_PAGE:
               if(_loc2_.data == 1)
               {
                  if(this._currentPage > 1)
                  {
                     --this._currentPage;
                     this.msgSenderProxy.send_52261(this._currentPage);
                  }
               }
               else if(this._currentPage < this._tatolPage)
               {
                  ++this._currentPage;
                  this.msgSenderProxy.send_52261(this._currentPage);
               }
               break;
            case TeamPanel.UI_TEAMPANEL_HUNYANBANGZHU_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_WEDDING_PLANE);
               GameInstance.uiInstance.marriageWeddingPanel.isShowBtn(false);
               break;
            case TeamPanel.UI_TEAMPANEL_SONGSHANGHONGBAO_CLICK:
               _loc3_ = _loc2_.data as int;
               ZLog.add("婚宴编号intID:" + _loc3_);
               if(_loc2_.data != null)
               {
                  this.msgSenderProxy.send_52253([_loc3_,-1]);
               }
               break;
            case TeamPanel.UI_TEAMPANEL_LINGQUHONGBAO_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE);
         }
      }
      
      public function updateHunyanList(param1:int, param2:int, param3:Array) : void
      {
         if(param1 != this._currentPage)
         {
            return;
         }
         this._tatolPage = param2;
         this.teamPanel.setPage(param1,param2);
         this.teamPanel.setInitialize(param3);
      }
   }
}

