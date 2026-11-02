package com.tgame.moudels.xunzhangduanzao.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xunzhangduanzao.XunZhangDuanZao_ApplicationFacade;
   import com.tgame.moudels.xunzhangduanzao.model.XunZhangDuanZao_MsgSenderProxy;
   import com.tgame.shell.view.components.ShenQiJinHuaPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JinHua_PlaneMediator extends Mediator
   {
      
      public static const NAME:String = "JinHua_PlaneMediator";
      
      private var _goods:Goods;
      
      private var _senderProxy:XunZhangDuanZao_MsgSenderProxy;
      
      public function JinHua_PlaneMediator(param1:String = null, param2:Object = null)
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
      
      protected function get panel() : ShenQiJinHuaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shenQiJinHuaPanel);
         }
         return viewComponent as ShenQiJinHuaPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XunZhangDuanZao_ApplicationFacade.SHENQI_JINHUA];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XunZhangDuanZao_ApplicationFacade.SHENQI_JINHUA:
               this._goods = _loc2_ as Goods;
               this.senderProxy.send_53579([0,this._goods.position]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShenQiJinHuaPanel,function():void
         {
            panel.addEventListener(ShenQiJinHuaPanel.UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK,requestXunZhangInfoHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShenQiJinHuaPanel,function():void
         {
            panel.removeEventListener(ShenQiJinHuaPanel.UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK,requestXunZhangInfoHandler);
         });
      }
      
      private function requestXunZhangInfoHandler(param1:BaseEvent) : void
      {
         this.senderProxy.send_53579([1,this._goods.position]);
         this.closePanel();
      }
      
      public function InitializePanel(param1:Goods, param2:Goods, param3:Goods, param4:int, param5:String) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.shenQiJinHuaPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
         }
         this.panel.setUpdataDate(this._goods,param2,param3,param4,param5);
      }
      
      public function closePanel() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance.shenQiJinHuaPanel))
         {
            GameInstance.uiInstance.shenQiJinHuaPanel.parent.removeChild(GameInstance.uiInstance.shenQiJinHuaPanel);
         }
      }
   }
}

