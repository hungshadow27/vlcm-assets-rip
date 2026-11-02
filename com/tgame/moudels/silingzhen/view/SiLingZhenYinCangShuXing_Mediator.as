package com.tgame.moudels.silingzhen.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.silingzhen.model.SiLingZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.huodong.MenghuanSishengshouPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class SiLingZhenYinCangShuXing_Mediator extends Mediator
   {
      
      public static const NAME:String = "SiLingZhenYinCangShuXing_Mediator";
      
      private var _msgSenderProxy:SiLingZhen_MsgSenderProxy;
      
      public function SiLingZhenYinCangShuXing_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : MenghuanSishengshouPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.siLingZhenYinCangShuXingPanel);
         }
         return viewComponent as MenghuanSishengshouPanel;
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
      
      public function upData(param1:int) : void
      {
         var _loc2_:Goods = null;
         if(!Fun.isVisible(GameInstance.uiInstance._siLingZhenYinCangShuXingPanel))
         {
            return;
         }
         if(param1 == 1)
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JU_LING_ZHU,true);
            this.panel.setInitialize(_loc2_,3000);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MenghuanSishengshouPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,addPanel);
            panel.addEventListener(MenghuanSishengshouPanel.UI_MENGHUANSISHENGSHOU_JIHUO_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MenghuanSishengshouPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,addPanel);
            panel.removeEventListener(MenghuanSishengshouPanel.UI_MENGHUANSISHENGSHOU_JIHUO_CLICK,panelHandle);
         });
      }
      
      private function addPanel(param1:Event) : void
      {
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JU_LING_ZHU,true);
         this.panel.setInitialize(_loc2_,3000);
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:Object = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case MenghuanSishengshouPanel.UI_MENGHUANSISHENGSHOU_JIHUO_CLICK:
               this.msgSenderProxy.send_53407();
               PipeManager.sendMsg(PipeConstants.SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING);
         }
      }
      
      private function get msgSenderProxy() : SiLingZhen_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(SiLingZhen_MsgSenderProxy.NAME) as SiLingZhen_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
   }
}

