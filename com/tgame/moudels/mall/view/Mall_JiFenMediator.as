package com.tgame.moudels.mall.view
{
   import com.fireice.alert.FAlert;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.item.MallGoods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mall.Mall_ApplicationFacade;
   import com.tgame.moudels.mall.model.Mall_MsgSenderProxy;
   import com.tgame.shell.view.components.MaillJiFenPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mall_JiFenMediator extends Mediator
   {
      
      public static const NAME:String = "Mall_JiFenMediator";
      
      private var load:LoadBuffer;
      
      private var myJiFen:int;
      
      private var _msgSenderProxy:Mall_MsgSenderProxy;
      
      private var tab_type:int;
      
      private var MallItemList:Object = new Object();
      
      public var Money:int;
      
      public function Mall_JiFenMediator(param1:String = null, param2:Object = null)
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
      
      public function get mallPanel() : MaillJiFenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.mallJiFenPanel);
         }
         return viewComponent as MaillJiFenPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Mall_ApplicationFacade.BUY_MALL_GOODS];
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
      
      private function initEvents() : void
      {
         EventDispatchCenter.getInstance().addEventListener(MaillJiFenPanel.UI_MALLPANEL_BUY_JIFEN,this.mallPanelHandel);
         UIEventsRegisterManager.addUIRegisterEvent(MaillJiFenPanel,function():void
         {
            mallPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            mallPanel.addEventListener(MaillJiFenPanel.UI_MALLPANEL_PANEL_SHOW,mallPanelHandel);
            mallPanel.addEventListener(MaillJiFenPanel.UI_MALLPANEL_BUYBTN_CLICK,mallPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MaillJiFenPanel,function():void
         {
            mallPanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            mallPanel.removeEventListener(MaillJiFenPanel.UI_MALLPANEL_PANEL_SHOW,mallPanelHandel);
            mallPanel.removeEventListener(MaillJiFenPanel.UI_MALLPANEL_BUYBTN_CLICK,mallPanelHandel);
         });
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.mallPanel.reset();
      }
      
      private function mallPanelHandel(param1:Event) : void
      {
         var _loc5_:BaseEvent = null;
         var _loc7_:Array = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:SceneCharacter = GameInstance.mainChar;
         var _loc4_:String = param1.type;
         _loc5_ = param1 as BaseEvent;
         var _loc6_:int = 0;
         switch(_loc4_)
         {
            case MaillJiFenPanel.UI_MALLPANEL_PANEL_SHOW:
               this.tab_type = _loc5_.data as int;
               this.load = LoadBuffer.show(this.mallPanel);
               this.msgSenderProxy.send_12121(this.tab_type);
               break;
            case MaillJiFenPanel.UI_MALLPANEL_BUYBTN_CLICK:
               this.showBuy(_loc5_.data as int);
               break;
            case MaillJiFenPanel.UI_MALLPANEL_BUY_JIFEN:
               _loc7_ = _loc5_.data as Array;
               this.msgSenderProxy.send_12123(_loc7_[0],_loc7_[1]);
         }
      }
      
      public function updateMallPanel(param1:int, param2:int, param3:Array) : void
      {
         var _loc5_:MallGoods = null;
         var _loc6_:XML = null;
         this.load.close();
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
         this.mallPanel.showPanel(_loc4_,1);
         this.mallPanel.setSilver(param2,0);
         this.MallItemList["type_" + param1] = param3;
         this.myJiFen = param2;
      }
      
      public function setSilver(param1:int) : void
      {
         this.myJiFen = param1;
         this.mallPanel.setSilver(param1,0);
      }
      
      private function showBuy(param1:int) : void
      {
         var _loc2_:MallGoods = this.getGoodsByID(param1);
         if(_loc2_)
         {
            this.mallPanel.showBuyPanel(_loc2_.f_id,_loc2_.getBigICOPath(),_loc2_.res.name,_loc2_.f_goods_price,_loc2_.res.use_desc,this.myJiFen,0);
         }
         else
         {
            FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("不存在的商城道具!") + "</font></textformat>");
         }
      }
      
      public function getGoodsByID(param1:int) : MallGoods
      {
         var _loc2_:Array = null;
         var _loc3_:MallGoods = null;
         loop0:
         for each(_loc2_ in this.MallItemList)
         {
            var _loc6_:int = 0;
            var _loc7_:* = _loc2_;
            do
            {
               for each(_loc3_ in _loc7_)
               {
               }
               continue loop0;
            }
            while(_loc3_.f_id != param1);
            return _loc3_;
         }
         return null;
      }
   }
}

