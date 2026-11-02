package com.tgame.moudels.equipPudding.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.equipPudding.EquipPudding_ApplicationFacade;
   import com.tgame.moudels.equipPudding.model.EquipPudding_MsgSendProxy;
   import com.tgame.shell.view.components.DestroyTiShiCanvas;
   import com.tgame.shell.view.components.huodong.HuoDongZhuangbeiTilianPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Equip2BaoShiMediator extends Mediator
   {
      
      public static const NAME:String = "Equip2BaoShiMediator";
      
      private var _msgSenderProxy:EquipPudding_MsgSendProxy;
      
      public var _id:int = 0;
      
      public var _position:int = 0;
      
      private var _huoDongZhuangbeiTilianPanel:HuoDongZhuangbeiTilianPanel;
      
      private var tishiCanvas:DestroyTiShiCanvas;
      
      public function Equip2BaoShiMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : EquipPudding_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(EquipPudding_MsgSendProxy.NAME) as EquipPudding_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [EquipPudding_ApplicationFacade.CLICK_EUQIP2BAOSHI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case EquipPudding_ApplicationFacade.CLICK_EUQIP2BAOSHI:
               _loc3_ = _loc2_ as Goods;
               if(_loc3_.isShowDestroyPanel)
               {
                  if(!this.tishiCanvas)
                  {
                     this.tishiCanvas = new DestroyTiShiCanvas();
                  }
                  POPWindowManager.showWindow(this.tishiCanvas);
                  return;
               }
               if(this._huoDongZhuangbeiTilianPanel == null)
               {
                  this._huoDongZhuangbeiTilianPanel = new HuoDongZhuangbeiTilianPanel();
                  UIEventsRegisterManager.registerUI(this._huoDongZhuangbeiTilianPanel,HuoDongZhuangbeiTilianPanel);
               }
               GameInstance.uiInstance.uiContainer.addChild(this._huoDongZhuangbeiTilianPanel);
               this._id = _loc3_.id;
               this._position = _loc3_.position;
               this._huoDongZhuangbeiTilianPanel.setGoods1(_loc3_);
               this._huoDongZhuangbeiTilianPanel.setGoods2();
               this._huoDongZhuangbeiTilianPanel.setBtnEnable(true);
               this.setGoodsHui1(true);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(HuoDongZhuangbeiTilianPanel,function():void
         {
            _huoDongZhuangbeiTilianPanel.addEventListener(HuoDongZhuangbeiTilianPanel.UI_ZHUANGBEITILIAN_CLICK,huoDongZhuangbeiTilianPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(HuoDongZhuangbeiTilianPanel,function():void
         {
            _huoDongZhuangbeiTilianPanel.removeEventListener(HuoDongZhuangbeiTilianPanel.UI_ZHUANGBEITILIAN_CLICK,huoDongZhuangbeiTilianPanelHandel);
         });
      }
      
      private function huoDongZhuangbeiTilianPanelHandel(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case HuoDongZhuangbeiTilianPanel.UI_ZHUANGBEITILIAN_CLICK:
               this.msgSenderProxy.send_53057([this._id,this._position]);
         }
      }
      
      public function setBtnEnable(param1:Boolean) : void
      {
         this._huoDongZhuangbeiTilianPanel.setBtnEnable(param1);
      }
      
      public function setGoodsHui1(param1:Boolean) : void
      {
         this._huoDongZhuangbeiTilianPanel.setGoodsHui1(param1);
      }
      
      public function setGood2(param1:Goods) : void
      {
         this._huoDongZhuangbeiTilianPanel.setGoods2(param1);
      }
   }
}

