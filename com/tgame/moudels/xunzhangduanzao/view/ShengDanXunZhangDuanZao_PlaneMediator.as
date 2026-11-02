package com.tgame.moudels.xunzhangduanzao.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xunzhangduanzao.XunZhangDuanZao_ApplicationFacade;
   import com.tgame.moudels.xunzhangduanzao.model.XunZhangDuanZao_MsgSenderProxy;
   import com.tgame.shell.view.components.ShengDanXunZhangPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShengDanXunZhangDuanZao_PlaneMediator extends Mediator
   {
      
      public static const NAME:String = "DiWangJianDuanZao_PlaneMediator";
      
      private var _goods:Goods;
      
      private var _senderProxy:XunZhangDuanZao_MsgSenderProxy;
      
      public function ShengDanXunZhangDuanZao_PlaneMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XunZhangDuanZao_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XunZhangDuanZao_MsgSenderProxy.NAME) as XunZhangDuanZao_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get diwangPanel() : ShengDanXunZhangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.diwangjian);
         }
         return viewComponent as ShengDanXunZhangPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XunZhangDuanZao_ApplicationFacade.PACK_SHOW_SHENGDAN_XUNZHANG_SHENGJI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XunZhangDuanZao_ApplicationFacade.PACK_SHOW_SHENGDAN_XUNZHANG_SHENGJI:
               this._goods = _loc2_ as Goods;
               this.senderProxy.send_53565([3,this._goods.position,-1]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShengDanXunZhangPanel,function():void
         {
            diwangPanel.addEventListener(ShengDanXunZhangPanel.OK_BTN_CLICK,requestXunZhangInfoHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShengDanXunZhangPanel,function():void
         {
            diwangPanel.removeEventListener(ShengDanXunZhangPanel.OK_BTN_CLICK,requestXunZhangInfoHandler);
         });
      }
      
      private function requestXunZhangInfoHandler(param1:BaseEvent) : void
      {
         this.senderProxy.send_53567([3,this._goods.position,0,0]);
      }
      
      public function InitializePanel(param1:String, param2:Goods, param3:Goods, param4:String, param5:String) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.diwangjian))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_SHENGDAN_PANEL_DUANZAO);
         }
         this.diwangPanel.setUpdataDate(param1,param2,param3,param4,param5);
      }
      
      public function closePanel() : void
      {
         var _loc1_:DisplayObject = GameInstance.uiInstance._diwangjian;
         if(Fun.isVisible(_loc1_))
         {
            _loc1_.parent.removeChild(_loc1_);
         }
      }
   }
}

