package com.tgame.moudels.ynAojianzhizao.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynAojianzhizao.YNAojianzhizao_ApplicationFacade;
   import com.tgame.moudels.ynAojianzhizao.model.YNAojianzhizao_MsgSendProxy;
   import com.tgame.shell.view.components.YNAojianzhizaoPanel2;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNAojianzhizao_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNAojianzhizao_Mediator";
      
      private var _senderProxy:YNAojianzhizao_MsgSendProxy;
      
      public function YNAojianzhizao_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNAojianzhizao_ApplicationFacade.SHOW_YUENANAOJIANZHIZAOPANEL1,YNAojianzhizao_ApplicationFacade.SHOW_YUENANAOJIANZHIZAOPANEL2];
      }
      
      private function get senderProxy() : YNAojianzhizao_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNAojianzhizao_MsgSendProxy.NAME) as YNAojianzhizao_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Goods = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YNAojianzhizao_ApplicationFacade.SHOW_YUENANAOJIANZHIZAOPANEL1:
               if(!Fun.isVisible(this.panel))
               {
                  GameInstance.uiInstance.ynaojianzhizaoPanel1.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynaojianzhizaoPanel1.width / 2;
                  GameInstance.uiInstance.ynaojianzhizaoPanel1.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynaojianzhizaoPanel1.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynaojianzhizaoPanel1);
                  _loc3_ = _loc2_ as Goods;
                  GameInstance.uiInstance.ynaojianzhizaoPanel1.setData(_loc3_.id,_loc3_.res.attack);
               }
               break;
            case YNAojianzhizao_ApplicationFacade.SHOW_YUENANAOJIANZHIZAOPANEL2:
               this.senderProxy.send_74051(_loc2_);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNAojianzhizaoPanel2
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynaojianzhizaoPanel2);
         }
         return viewComponent as YNAojianzhizaoPanel2;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNAojianzhizaoPanel2,function():void
         {
            panel.addEventListener(YNAojianzhizaoPanel2.UI_YUENANAOJIANZHIZAO_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNAojianzhizaoPanel2,function():void
         {
            panel.removeEventListener(YNAojianzhizaoPanel2.UI_YUENANAOJIANZHIZAO_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNAojianzhizaoPanel2.UI_YUENANAOJIANZHIZAO_CLICK:
               this.senderProxy.send_74053(param1.data);
               this.panel.onClose();
               if(Fun.isVisible(GameInstance.uiInstance.ynaojianzhizaoPanel1))
               {
                  GameInstance.uiInstance.ynaojianzhizaoPanel1.onClose();
               }
         }
      }
      
      public function showAojianzhizao2(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:Goods = null;
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
            POPWindowManager.showWindow(this.panel);
            if(SpecialGoodsID.YNAOJIANARR.indexOf(param1) != -1)
            {
               this.panel.setData1(param1,String(param2),param3,String(param4));
            }
            else
            {
               _loc5_ = new Goods(param1);
               _loc6_ = new Goods(param3);
               this.panel.setData1(param1,_loc5_.res.name,param3,_loc6_.res.name);
            }
         }
      }
   }
}

