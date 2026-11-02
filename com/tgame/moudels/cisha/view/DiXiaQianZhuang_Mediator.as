package com.tgame.moudels.cisha.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.MallGoods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.cisha.CiSha_ApplicationFacade;
   import com.tgame.moudels.cisha.model.CiSha_MsgSenderProxy;
   import com.tgame.shell.view.components.cisha.CiShaQianZhuangPanel;
   import com.tgame.shell.view.components.cisha.DiXiaQianZhuangPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DiXiaQianZhuang_Mediator extends Mediator
   {
      
      public static const NAME:String = "DiXiaQianZhuang_Mediator";
      
      private var load:LoadBuffer;
      
      private var myJiFen:int;
      
      private var _msgSenderProxy:CiSha_MsgSenderProxy;
      
      private var MallItemList:Object = new Object();
      
      public var Money:int;
      
      public function DiXiaQianZhuang_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get dixiaQianZhuang_Panel() : DiXiaQianZhuangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.dixiaQianZhuangPanel);
         }
         return viewComponent as DiXiaQianZhuangPanel;
      }
      
      public function get qianzhuangPanel() : CiShaQianZhuangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.cishaQianZhuangPanel);
         }
         return viewComponent as CiShaQianZhuangPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [CiSha_ApplicationFacade.SHOW_DIXIAQIANZHUANG_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case CiSha_ApplicationFacade.SHOW_DIXIAQIANZHUANG_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance._cishaQianZhuangPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_DIXIAQIANZHUANG_PANEL);
               }
               this.msgSenderProxy.send_57419(1);
         }
      }
      
      private function get msgSenderProxy() : CiSha_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(CiSha_MsgSenderProxy.NAME) as CiSha_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CiShaQianZhuangPanel,function():void
         {
            qianzhuangPanel.addEventListener(Event.ADDED_TO_STAGE,qianzhuangHandle);
            qianzhuangPanel.addEventListener(CiShaQianZhuangPanel.UI_MALLPANEL_DUIHUAN_CLICK,qianzhuangHandle);
            qianzhuangPanel.addEventListener(CiShaQianZhuangPanel.UI_MALLPANEL_BUYBTN_CLICK,qianzhuangHandle);
            qianzhuangPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CiShaQianZhuangPanel,function():void
         {
            qianzhuangPanel.removeEventListener(Event.ADDED_TO_STAGE,qianzhuangHandle);
            qianzhuangPanel.removeEventListener(CiShaQianZhuangPanel.UI_MALLPANEL_DUIHUAN_CLICK,qianzhuangHandle);
            qianzhuangPanel.removeEventListener(CiShaQianZhuangPanel.UI_MALLPANEL_BUYBTN_CLICK,qianzhuangHandle);
            qianzhuangPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
      }
      
      private function qianzhuangHandle(param1:*) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.qianzhuangPanel.reset();
               break;
            case CiShaQianZhuangPanel.UI_MALLPANEL_DUIHUAN_CLICK:
               _loc3_ = (param1 as BaseEvent).data as Array;
               this.msgSenderProxy.send_57421(_loc3_[0],_loc3_[1]);
               break;
            case CiShaQianZhuangPanel.UI_MALLPANEL_BUYBTN_CLICK:
               _loc4_ = int((param1 as BaseEvent).data);
               this.showBuy(_loc4_);
         }
      }
      
      public function refreshPanel(param1:Array) : void
      {
         this.dixiaQianZhuang_Panel.setArr(param1);
      }
      
      private function showBuy(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:MallGoods = this.getGoodsByID(param1);
         if(_loc2_)
         {
            _loc3_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(9708,true);
            this.qianzhuangPanel.showBuyPanel(_loc2_.f_id,_loc2_.getBigICOPath(),_loc2_.res.name,_loc2_.f_goods_price,_loc2_.res.use_desc,_loc3_,0);
         }
         else
         {
            FAlert.show("<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("不存在的商城道具!") + "</font></textformat>");
         }
      }
      
      public function updateMallPanel(param1:int, param2:int, param3:Array) : void
      {
         var _loc5_:MallGoods = null;
         var _loc6_:XML = null;
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
         this.qianzhuangPanel.showPanel(_loc4_);
         this.MallItemList["type_" + param1] = param3;
         this.myJiFen = param2;
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
      
      private function panelClose(param1:FCloseEvent = null) : void
      {
      }
   }
}

