package com.tgame.moudels.zhongQiuJie.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhongQiuJie.ZhongQiuJie_ApplicationFacade;
   import com.tgame.moudels.zhongQiuJie.model.ZhongQiuJie_MsgSendProxy;
   import com.tgame.shell.view.components.zhongQiuJie.YuanXiaoJiePanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YuanXiaoJie_Mediator extends Mediator
   {
      
      public static const NAME:String = "YuanXiaoJie_Mediator";
      
      private var _senderProxy:ZhongQiuJie_MsgSendProxy;
      
      public function YuanXiaoJie_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZhongQiuJie_ApplicationFacade.SHOW_YUANXIAOJIE_PANEL,ZhongQiuJie_ApplicationFacade.GOODS_CHANGED,ZhongQiuJie_ApplicationFacade.YUANXIAOJIE_CHOUJIANG];
      }
      
      private function get senderProxy() : ZhongQiuJie_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ZhongQiuJie_MsgSendProxy.NAME) as ZhongQiuJie_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZhongQiuJie_ApplicationFacade.SHOW_YUANXIAOJIE_PANEL:
               if(!Fun.isVisible(this.panel))
               {
                  this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
                  this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
                  GameInstance.uiInstance.uiContainer.addChild(this.panel);
               }
               else
               {
                  this.panel.parent.removeChild(this.panel);
               }
               break;
            case ZhongQiuJie_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.panel))
               {
                  this.setDuiHuanShenQiGoods();
               }
               break;
            case ZhongQiuJie_ApplicationFacade.YUANXIAOJIE_CHOUJIANG:
               this.senderProxy.send_78957();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YuanXiaoJiePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yuanXiaoJiePanel);
         }
         return viewComponent as YuanXiaoJiePanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YuanXiaoJiePanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(YuanXiaoJiePanel.UI_YUANXIAOJIE_DUIHUANSHENQI,onHandle);
            panel.addEventListener(YuanXiaoJiePanel.UI_YUANXIAOJIE_ZHONGJIANGMINGDAN,onHandle);
            panel.addEventListener(YuanXiaoJiePanel.UI_RANK_JIANGLI_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YuanXiaoJiePanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(YuanXiaoJiePanel.UI_YUANXIAOJIE_DUIHUANSHENQI,onHandle);
            panel.removeEventListener(YuanXiaoJiePanel.UI_YUANXIAOJIE_ZHONGJIANGMINGDAN,onHandle);
            panel.removeEventListener(YuanXiaoJiePanel.UI_RANK_JIANGLI_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case YuanXiaoJiePanel.UI_YUANXIAOJIE_DUIHUANSHENQI:
               this.senderProxy.send_78955();
               break;
            case YuanXiaoJiePanel.UI_YUANXIAOJIE_ZHONGJIANGMINGDAN:
               this.senderProxy.send_78951(param1.data as int);
               break;
            case YuanXiaoJiePanel.UI_RANK_JIANGLI_CLICK:
               this.senderProxy.send_78953(param1.data as int);
         }
      }
      
      public function setRankPanel(param1:int, param2:Array) : void
      {
         this.panel.setRank(param1,param2);
      }
      
      private function setDuiHuanShenQiGoods() : void
      {
         var _loc1_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(44419,true);
         this.panel.setItem2(_loc1_);
      }
   }
}

