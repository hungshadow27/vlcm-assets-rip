package com.tgame.moudels.mall.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.item.MallGoods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mall.model.Mall_MsgSenderProxy;
   import com.tgame.shell.view.components.huodong.MallHuodongPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mall_FreeCadeMediator extends Mediator
   {
      
      public static const NAME:String = "Mall_FreeCadeMediator";
      
      private var loaderBuff:LoadBuffer;
      
      private var _msgSenderProxy:Mall_MsgSenderProxy;
      
      public function Mall_FreeCadeMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Mall_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Mall_MsgSenderProxy.NAME) as Mall_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      public function get panel() : MallHuodongPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.freeMallCadePanel);
         }
         return viewComponent as MallHuodongPanel;
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
         UIEventsRegisterManager.addUIRegisterEvent(MallHuodongPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            panel.addEventListener(MallHuodongPanel.UI_MALLPANEL_BUYBTN_CLICK,mallPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MallHuodongPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            panel.removeEventListener(MallHuodongPanel.UI_MALLPANEL_BUYBTN_CLICK,mallPanelHandel);
         });
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.addLoadBuffer();
         this.msgSenderProxy.send_12101(100);
      }
      
      private function mallPanelHandel(param1:Event) : void
      {
         var _loc5_:BaseEvent = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:SceneCharacter = GameInstance.mainChar;
         var _loc4_:String = param1.type;
         _loc5_ = param1 as BaseEvent;
         var _loc6_:int = 0;
         switch(_loc4_)
         {
            case MallHuodongPanel.UI_MALLPANEL_BUYBTN_CLICK:
               _loc8_ = _loc5_.data as int;
               this.msgSenderProxy.send_12117(_loc8_,100);
         }
      }
      
      public function updateMallPanel(param1:int, param2:Number, param3:Array) : void
      {
         var _loc5_:MallGoods = null;
         var _loc6_:XML = null;
         this.removeLoaderBuff();
         var _loc4_:XML = <list/>;
         for each(_loc5_ in param3)
         {
            _loc6_ = <node label="商品id" bigRes="大图标地址" goodsName="商品名称" price="价格" price0="原价" type="0元宝|1礼金" isHot="是否热卖0|1" isOff="是否折扣0|1" effect="效果描述最多15字" describe="物品描述最多25字"/>;
            _loc6_.@label = _loc5_.f_id;
            _loc6_.@bigRes = _loc5_.getBigICOPath();
            _loc6_.@goodsName = _loc5_.res.name;
            _loc6_.@price = _loc5_.f_goods_price;
            _loc6_.@type = param1 == 5 ? "1" : "0";
            _loc6_.@price0 = _loc5_.f_abate_mark ? _loc5_.f_goods_price_org : 0;
            _loc6_.@isHot = _loc5_.f_hot_mark;
            _loc6_.@isOff = _loc5_.f_abate_mark;
            _loc6_.@effect = _loc5_.res.use_desc;
            _loc6_.@describe = _loc5_.res.desc;
            _loc4_.appendChild(_loc6_);
         }
         this.panel.showPanel(_loc4_);
      }
      
      public function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(GameInstance.uiInstance.freeMallCadePanel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
   }
}

