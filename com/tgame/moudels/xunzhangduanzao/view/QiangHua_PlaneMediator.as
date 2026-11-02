package com.tgame.moudels.xunzhangduanzao.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xunzhangduanzao.XunZhangDuanZao_ApplicationFacade;
   import com.tgame.moudels.xunzhangduanzao.model.XunZhangDuanZao_MsgSenderProxy;
   import com.tgame.shell.view.components.huodong.QiangHuaPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QiangHua_PlaneMediator extends Mediator
   {
      
      public static const NAME:String = "QiangHua_PlaneMediator";
      
      private var _goods:Goods;
      
      private var _senderProxy:XunZhangDuanZao_MsgSenderProxy;
      
      public function QiangHua_PlaneMediator(param1:String = null, param2:Object = null)
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
      
      protected function get panel() : QiangHuaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.qiangHuaPanel);
         }
         return viewComponent as QiangHuaPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XunZhangDuanZao_ApplicationFacade.GOODS_CHANGED,XunZhangDuanZao_ApplicationFacade.DUOXUAN_QIANGHUA];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XunZhangDuanZao_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.panel))
               {
                  this.senderProxy.send_53575(this._goods.position);
               }
               break;
            case XunZhangDuanZao_ApplicationFacade.DUOXUAN_QIANGHUA:
               this._goods = _loc2_ as Goods;
               this.senderProxy.send_53575(this._goods.position);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(QiangHuaPanel,function():void
         {
            panel.addEventListener(QiangHuaPanel.UI_QIANGHUA_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(QiangHuaPanel,function():void
         {
            panel.removeEventListener(QiangHuaPanel.UI_QIANGHUA_CLICK,handler);
         });
      }
      
      private function handler(param1:BaseEvent) : void
      {
         this.senderProxy.send_53577([this._goods.position,param1.data]);
      }
      
      public function requestQiangHua() : void
      {
         this.senderProxy.send_53575(this._goods.position);
      }
      
      public function setQiangHuaPanel(param1:int, param2:int, param3:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.qiangHuaPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
         }
         this.panel.setData(param1,param2,param3);
      }
      
      public function closePanel() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance.qiangHuaPanel))
         {
            GameInstance.uiInstance.qiangHuaPanel.parent.removeChild(GameInstance.uiInstance.qiangHuaPanel);
         }
      }
   }
}

