package com.tgame.moudels.mall.view
{
   import com.fireice.alert.FAlert;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.MallGoods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mall.Mall_ApplicationFacade;
   import com.tgame.moudels.mall.model.Mall_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.MallPanel;
   import com.tgame.shell.view.components.MysteryMallPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mall_Mediator extends Mediator
   {
      
      public static const NAME:String = "Team_Mediator";
      
      private var load:LoadBuffer;
      
      private var _msgSenderProxy:Mall_MsgSenderProxy;
      
      private var mysteryGoods:Array;
      
      private var tab_type:int;
      
      private var MallItemList:Object = new Object();
      
      public var Money:int;
      
      public function Mall_Mediator()
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
      
      public function get mallPanel() : MallPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.mallPanel);
         }
         return viewComponent as MallPanel;
      }
      
      private function get mysteryMallPanel() : MysteryMallPanel
      {
         return GameInstance.uiInstance.mysteryMallPanel;
      }
      
      private function get mainUI() : MainUI
      {
         return GameInstance.uiInstance.mainUI;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Mall_ApplicationFacade.BUY_MALL_GOODS,Mall_ApplicationFacade.SHOW_GOODS_BUY];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Mall_ApplicationFacade.BUY_MALL_GOODS:
               _loc3_ = _loc2_ as Array;
               if(_loc3_.length > 2)
               {
                  _loc4_ = int(_loc3_[2]);
               }
               else
               {
                  _loc4_ = -1;
               }
               this.msgSenderProxy.send_12107(_loc3_[0],_loc3_[1],_loc4_);
               break;
            case Mall_ApplicationFacade.SHOW_GOODS_BUY:
               _loc5_ = _loc2_ as Array;
               _loc6_ = int(_loc5_[0]);
               _loc7_ = new Goods(_loc6_);
               this.mallPanel.showBuyPanel(_loc6_,_loc7_.getBigICOPath(),_loc7_.res.name,int(_loc5_[1]),_loc7_.res.use_desc,GameInstance.mainCharData.moneyInfo.gold,GameInstance.mainCharData.moneyInfo.jinpiao,null,null,int(_loc5_[2]),int(_loc5_[3]));
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         EventDispatchCenter.getInstance().addEventListener(MallPanel.UI_MALLPANEL_BUY,this.mallPanelHandel);
         UIEventsRegisterManager.addUIRegisterEvent(MallPanel,function():void
         {
            mallPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            mallPanel.addEventListener(MallPanel.UI_MALLPANEL_PANEL_SHOW,mallPanelHandel);
            mallPanel.addEventListener(MallPanel.UI_MALLPANEL_BUYBTN_CLICK,mallPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MallPanel,function():void
         {
            mallPanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            mallPanel.removeEventListener(MallPanel.UI_MALLPANEL_PANEL_SHOW,mallPanelHandel);
            mallPanel.removeEventListener(MallPanel.UI_MALLPANEL_BUYBTN_CLICK,mallPanelHandel);
         });
         UIEventsRegisterManager.addUIRegisterEvent(MysteryMallPanel,function():void
         {
            mysteryMallPanel.addEventListener(MysteryMallPanel.UI_MALLPANEL_PANEL_SHOW,mysteryMallPanelHandel);
            mysteryMallPanel.addEventListener(MysteryMallPanel.UI_MALLPANEL_COUNTDOWN_CLICK,mysteryMallPanelHandel);
            mysteryMallPanel.addEventListener(MysteryMallPanel.UI_MALLPANEL_BUYBTN_CLICK,mysteryMallPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MysteryMallPanel,function():void
         {
            mysteryMallPanel.removeEventListener(MysteryMallPanel.UI_MALLPANEL_PANEL_SHOW,mysteryMallPanelHandel);
            mysteryMallPanel.removeEventListener(MysteryMallPanel.UI_MALLPANEL_COUNTDOWN_CLICK,mysteryMallPanelHandel);
            mysteryMallPanel.removeEventListener(MysteryMallPanel.UI_MALLPANEL_BUYBTN_CLICK,mysteryMallPanelHandel);
         });
      }
      
      private function mysteryMallPanelHandel(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc2_:String = param1.type;
         _loc3_ = param1 as BaseEvent;
         switch(_loc2_)
         {
            case MysteryMallPanel.UI_MALLPANEL_PANEL_SHOW:
               break;
            case MysteryMallPanel.UI_MALLPANEL_COUNTDOWN_CLICK:
               this.msgSenderProxy.send_12109();
               break;
            case MysteryMallPanel.UI_MALLPANEL_BUYBTN_CLICK:
               _loc4_ = _loc3_.data as Array;
               this.showBuy_12112(_loc4_);
               break;
            case MysteryMallPanel.UI_MALLPANEL_BUY:
               _loc5_ = _loc3_.data as Array;
               this.msgSenderProxy.send_12103(_loc5_[0],_loc5_[1],_loc5_[2]);
         }
      }
      
      public function closeMysteryMallPanel() : void
      {
         this.mysteryMallPanel.countDownLbClose();
         this.msgSenderProxy.send_12109();
      }
      
      public function showMysteryMallPanel(param1:int, param2:Number, param3:Array, param4:int) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:DisplayObject = null;
         var _loc7_:Rectangle = null;
         var _loc8_:Rectangle = null;
         var _loc9_:Rectangle = null;
         var _loc10_:XML = null;
         var _loc11_:MallGoods = null;
         var _loc12_:XML = null;
         this.mysteryGoods = param3;
         this.MallItemList["type_" + param1] = param3;
         if(!Fun.isVisible(this.mysteryMallPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.mysteryMallPanel);
            this.mysteryMallPanel.visible = true;
            _loc5_ = 50;
            _loc6_ = this.mysteryMallPanel as DisplayObject;
            _loc7_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
            _loc8_ = _loc6_.getBounds(GameInstance.stage);
            _loc9_ = _loc7_.intersection(_loc8_);
            if(_loc9_.width < _loc5_ || _loc9_.height < _loc5_)
            {
               _loc6_.x = GameConfig.sceneWidth / 2 - _loc6_.width / 2;
               _loc6_.y = GameConfig.sceneHeight / 2 - this.mysteryMallPanel.panelHeight / 2;
            }
            this.mysteryMallPanel.setTime(param4);
            _loc10_ = <list/>;
            for each(_loc11_ in this.mysteryGoods)
            {
               _loc12_ = <node label="商品id" bigRes="大图标地址" goodsName="商品名称" price="价格" price0="原价" type="0元宝|1礼金" isHot="是否热卖0|1" isOff="是否折扣0|1" effect="效果描述最多15字" describe="物品描述最多25字"/>;
               _loc12_.@label = _loc11_.f_id;
               _loc12_.@bigRes = _loc11_.getBigICOPath();
               _loc12_.@goodsName = _loc11_.res.name;
               _loc12_.@price = _loc11_.f_goods_price;
               _loc12_.@type = _loc11_.f_type;
               _loc12_.@price0 = _loc11_.f_abate_mark ? _loc11_.f_goods_price_org : 0;
               _loc12_.@isHot = _loc11_.f_hot_mark;
               _loc12_.@isOff = _loc11_.f_abate_mark;
               _loc12_.@effect = _loc11_.res.use_desc;
               _loc12_.@describe = _loc11_.res.desc;
               _loc10_.appendChild(_loc12_);
            }
            this.mysteryMallPanel.showPanel(_loc10_);
         }
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
            case MallPanel.UI_MALLPANEL_PANEL_SHOW:
               this.tab_type = _loc5_.data as int;
               this.load = LoadBuffer.show(this.mallPanel);
               this.msgSenderProxy.send_12101(this.tab_type);
               break;
            case MallPanel.UI_MALLPANEL_BUYBTN_CLICK:
               this.showBuy(_loc5_.data as int);
               break;
            case MallPanel.UI_MALLPANEL_BUY:
               _loc7_ = _loc5_.data as Array;
               this.msgSenderProxy.send_12103(_loc7_[0],_loc7_[1],_loc7_[2]);
         }
      }
      
      public function updateMallPanel(param1:int, param2:Number, param3:Array) : void
      {
         var _loc5_:MallGoods = null;
         var _loc6_:XML = null;
         if(this.load)
         {
            this.load.close();
         }
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
         this.mallPanel.showPanel(_loc4_);
         if(param1 != 5)
         {
            this.mallPanel.setSilver(GameInstance.mainCharData.moneyInfo.gold,GameInstance.mainCharData.moneyInfo.jinpiao);
         }
         else
         {
            this.mallPanel.setLiJin(GameInstance.mainCharData.moneyInfo.gifts);
         }
         this.MallItemList["type_" + param1] = param3;
      }
      
      private function showBuy(param1:int) : void
      {
         var _loc2_:MallGoods = this.getGoodsByID(param1);
         if(_loc2_)
         {
            if(this.tab_type == 5)
            {
               this.mallPanel.showLiJingBuyPanel(_loc2_.f_id,_loc2_.getBigICOPath(),_loc2_.res.name,_loc2_.f_goods_price,_loc2_.res.use_desc,GameInstance.mainCharData.moneyInfo.gifts);
            }
            else if(this.tab_type == 11)
            {
               this.mallPanel.showLeiJiZhiBuyPanel(_loc2_.f_id,_loc2_.getBigICOPath(),_loc2_.res.name,_loc2_.f_goods_price,_loc2_.res.use_desc,GameInstance.mainCharData.moneyInfo.gold,GameInstance.mainCharData.moneyInfo.jinpiao);
            }
            else
            {
               this.mallPanel.showBuyPanel(_loc2_.f_id,_loc2_.getBigICOPath(),_loc2_.res.name,_loc2_.f_goods_price,_loc2_.res.use_desc,GameInstance.mainCharData.moneyInfo.gold,GameInstance.mainCharData.moneyInfo.jinpiao);
            }
         }
         else
         {
            FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("不存在的商城道具!") + "</font></textformat>");
         }
      }
      
      private function showBuy_12112(param1:Array) : void
      {
         var _loc2_:int = int(param1[0]);
         var _loc3_:MallGoods = this.getGoodsByID(_loc2_);
         if(_loc3_)
         {
            if(param1[1] == 5)
            {
               this.mallPanel.showLiJingBuyPanel(_loc3_.f_id,_loc3_.getBigICOPath(),_loc3_.res.name,_loc3_.f_goods_price,_loc3_.res.use_desc,GameInstance.mainCharData.moneyInfo.gifts);
            }
            else if(param1[1] == 4)
            {
               this.mallPanel.showTongbiBuyPanel(_loc3_.f_id,_loc3_.getBigICOPath(),_loc3_.res.name,_loc3_.f_goods_price,_loc3_.res.use_desc,GameInstance.mainCharData.moneyInfo.copper,GameInstance.mainCharData.moneyInfo.jinpiao);
            }
            else
            {
               this.mallPanel.showBuyPanel(_loc3_.f_id,_loc3_.getBigICOPath(),_loc3_.res.name,_loc3_.f_goods_price,_loc3_.res.use_desc,GameInstance.mainCharData.moneyInfo.gold,GameInstance.mainCharData.moneyInfo.jinpiao);
            }
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

