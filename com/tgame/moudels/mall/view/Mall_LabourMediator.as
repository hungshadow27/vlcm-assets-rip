package com.tgame.moudels.mall.view
{
   import com.fireice.alert.FAlert;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.MallGoods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mall.Mall_ApplicationFacade;
   import com.tgame.moudels.mall.model.Mall_MsgSenderProxy;
   import com.tgame.shell.view.components.MallFestivalPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mall_LabourMediator extends Mediator
   {
      
      public static const NAME:String = "Labour_Mediator";
      
      private var load:LoadBuffer;
      
      private var _msgSenderProxy:Mall_MsgSenderProxy;
      
      private var MallItemList:Object = new Object();
      
      public var Money:int;
      
      private var tab_type:int;
      
      public function Mall_LabourMediator()
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
      
      public function get labourPanel() : MallFestivalPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.labourPanel);
         }
         return viewComponent as MallFestivalPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Mall_ApplicationFacade.SHOW_GOODS_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Mall_ApplicationFacade.SHOW_GOODS_PANEL:
               _loc3_ = _loc2_ as Goods;
               if(Boolean(_loc3_) && _loc3_.id == SpecialGoodsID.JIERI_51)
               {
                  if(!Fun.isVisible(this.labourPanel))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_LABOUR_PANEL);
                  }
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MallFestivalPanel,function():void
         {
            labourPanel.addEventListener(MallFestivalPanel.UI_MALLPANEL_PANEL_SHOW,mallPanelHandel);
            labourPanel.addEventListener(MallFestivalPanel.UI_MALLPANEL_BUYBTN_CLICK,mallPanelHandel);
            labourPanel.addEventListener(MallFestivalPanel.UI_MALLPANEL_BUY,mallPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MallFestivalPanel,function():void
         {
            labourPanel.removeEventListener(MallFestivalPanel.UI_MALLPANEL_PANEL_SHOW,mallPanelHandel);
            labourPanel.removeEventListener(MallFestivalPanel.UI_MALLPANEL_BUYBTN_CLICK,mallPanelHandel);
         });
      }
      
      private function mallPanelHandel(param1:Event) : void
      {
         var _loc5_:BaseEvent = null;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:SceneCharacter = GameInstance.mainChar;
         var _loc4_:String = param1.type;
         _loc5_ = param1 as BaseEvent;
         var _loc6_:int = 0;
         switch(_loc4_)
         {
            case MallFestivalPanel.UI_MALLPANEL_PANEL_SHOW:
               _loc7_ = _loc5_.data as int;
               this.load = LoadBuffer.show(this.labourPanel);
               this.msgSenderProxy.send_12113(_loc7_);
               break;
            case MallFestivalPanel.UI_MALLPANEL_BUYBTN_CLICK:
               this.showBuy(_loc5_.data as int);
               break;
            case MallFestivalPanel.UI_MALLPANEL_BUY:
               _loc8_ = _loc5_.data as Array;
               this.msgSenderProxy.send_12115(_loc8_[0],_loc8_[1]);
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
      
      public function updateMallPanel(param1:int, param2:Number, param3:Array) : void
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
         this.labourPanel.showPanel(_loc4_);
         if(param1 != 5)
         {
            this.labourPanel.setSilver(GameInstance.mainCharData.moneyInfo.gold);
         }
         else
         {
            this.labourPanel.setLiJin(GameInstance.mainCharData.moneyInfo.gifts);
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
               this.labourPanel.showLiJingBuyPanel(_loc2_.f_id,_loc2_.getBigICOPath(),_loc2_.res.name,_loc2_.f_goods_price,_loc2_.res.use_desc,GameInstance.mainCharData.moneyInfo.gifts);
            }
            else
            {
               this.labourPanel.showBuyPanel(_loc2_.f_id,_loc2_.getBigICOPath(),_loc2_.res.name,_loc2_.f_goods_price,_loc2_.res.use_desc,GameInstance.mainCharData.moneyInfo.gold);
            }
         }
         else
         {
            FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("不存在的商城道具!") + "</font></textformat>");
         }
      }
   }
}

