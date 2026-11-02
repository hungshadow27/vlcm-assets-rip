package com.tgame.moudels.mall.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mall.Mall_ApplicationFacade;
   import com.tgame.moudels.mall.model.Mall_MsgSenderProxy;
   import com.tgame.moudels.mall.model.vo.MallLunJianGoodsVO;
   import com.tgame.shell.view.components.MallLunjianPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mall_LunJianMediator extends Mediator
   {
      
      public static const NAME:String = "Mall_LunJianMediator";
      
      private var _mallArr:Array;
      
      private var _currentType:int;
      
      private var _shopType:int;
      
      private var _msgSenderProxy:Mall_MsgSenderProxy;
      
      public function Mall_LunJianMediator()
      {
         super(NAME);
      }
      
      private function get sender() : Mall_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Mall_MsgSenderProxy.NAME) as Mall_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get mallPanel() : MallLunjianPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.lunjianMall);
         }
         return viewComponent as MallLunjianPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Mall_ApplicationFacade.NPC_REQ_FUNCTION,Mall_ApplicationFacade.SET_MAINCHAR_MALL,Mall_ApplicationFacade.BUY_MALL_SHENGWANG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Mall_ApplicationFacade.NPC_REQ_FUNCTION:
               _loc3_ = Number(_loc2_);
               if(_loc3_ == NpcFunctionType.LUNJIAN_MALL)
               {
                  this._shopType = 2;
                  PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,2);
               }
               else if(_loc3_ == NpcFunctionType.CHEGNZHAN_MALL)
               {
                  this._shopType = 1;
                  PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,1);
               }
               break;
            case Mall_ApplicationFacade.SET_MAINCHAR_MALL:
               this._shopType = Number(_loc2_);
               if(!Fun.isVisible(GameInstance.uiInstance._lunjianMall))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_MALL);
               }
               break;
            case Mall_ApplicationFacade.BUY_MALL_SHENGWANG:
               this.buyMallGoods(_loc2_ as MallLunJianGoodsVO);
         }
      }
      
      override public function onRegister() : void
      {
         EventDispatchCenter.getInstance().addEventListener(MallLunjianPanel.UI_MALLPANEL_LUNJIAN_BUY,this.mallPanelHandel);
         UIEventsRegisterManager.addUIRegisterEvent(MallLunjianPanel,function():void
         {
            mallPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            mallPanel.addEventListener(MallLunjianPanel.UI_MALLPANEL_PANEL_SHOW,mallPanelHandel);
            mallPanel.addEventListener(MallLunjianPanel.UI_MALLPANEL_BUYBTN_CLICK,mallPanelHandel);
            mallPanel.addEventListener(MallLunjianPanel.UI_MALLLUNJIAN_SHENGWANGDIAN_CLICK,mallPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MallLunjianPanel,function():void
         {
            mallPanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            mallPanel.removeEventListener(MallLunjianPanel.UI_MALLPANEL_PANEL_SHOW,mallPanelHandel);
            mallPanel.removeEventListener(MallLunjianPanel.UI_MALLPANEL_BUYBTN_CLICK,mallPanelHandel);
            mallPanel.removeEventListener(MallLunjianPanel.UI_MALLLUNJIAN_SHENGWANGDIAN_CLICK,mallPanelHandel);
         });
      }
      
      private function onAddToStage(param1:Event) : void
      {
         var _loc2_:Goods = null;
         if(this._shopType == 1)
         {
            this.mallPanel.setShengwang(GameInstance.mainCharData.attributeInfo.prestige_chengzhan,1);
         }
         else if(this._shopType == 2)
         {
            this.mallPanel.setShengwang(GameInstance.mainCharData.attributeInfo.prestige_lunjian,2);
         }
         else if(this._shopType == 4)
         {
            this.mallPanel.setShengwang(GameInstance.mainCharData.attributeInfo.prestige_shitu,3);
         }
         else if(this._shopType == 5)
         {
            this.mallPanel.setShengwang(GameInstance.mainCharData.attributeInfo.prestige_fuQi,5);
         }
         else if(this._shopType == 6)
         {
            this.mallPanel.setShengwang(GameInstance.mainCharData.attributeInfo.prestige_gongXunZhi,6);
         }
         else if(this._shopType == 7)
         {
            this.mallPanel.setShengwang(GameInstance.mainCharData.attributeInfo.prestige_jiFenZhi,7);
         }
         else if(this._shopType == 8)
         {
            this.mallPanel.setShengwang(GameInstance.mainCharData.attributeInfo.prestige_WuHunZhi,8);
         }
         else if(this._shopType == 9)
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(45948,true);
            this.mallPanel.setShengwang(_loc2_.count,9);
         }
      }
      
      private function mallPanelHandel(param1:Event) : void
      {
         var _loc4_:MallLunJianGoodsVO = null;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case MallLunjianPanel.UI_MALLPANEL_PANEL_SHOW:
               this._currentType = int(_loc3_.data);
               this.sender.send_53251([this._currentType,this._shopType]);
               break;
            case MallLunjianPanel.UI_MALLPANEL_BUYBTN_CLICK:
               _loc4_ = this.getMallGoods(int(_loc3_.data));
               this.buyMallGoods(_loc4_);
               break;
            case MallLunjianPanel.UI_MALLPANEL_LUNJIAN_BUY:
               this.sender.send_53253(_loc3_.data);
         }
      }
      
      private function buyMallGoods(param1:MallLunJianGoodsVO) : void
      {
         var _loc2_:Goods = null;
         if(param1.shengWangType == 1)
         {
            this.mallPanel.showBuyPanel(param1.mallID,param1.goods.getBigICOPath(),param1.goods.res.name,param1.shengWangType,param1.shengWang,param1.use_desc,GameInstance.mainCharData.attributeInfo.prestige_chengzhan);
         }
         else if(param1.shengWangType == 2)
         {
            this.mallPanel.showBuyPanel(param1.mallID,param1.goods.getBigICOPath(),param1.goods.res.name,param1.shengWangType,param1.shengWang,param1.use_desc,GameInstance.mainCharData.attributeInfo.prestige_lunjian);
         }
         else if(param1.shengWangType == 5)
         {
            this.mallPanel.showBuyPanel(param1.mallID,param1.goods.getBigICOPath(),param1.goods.res.name,param1.shengWangType,param1.shengWang,param1.use_desc,GameInstance.mainCharData.attributeInfo.prestige_fuQi);
         }
         else if(param1.shengWangType == 6)
         {
            this.mallPanel.showBuyPanel(param1.mallID,param1.goods.getBigICOPath(),param1.goods.res.name,param1.shengWangType,param1.shengWang,param1.use_desc,GameInstance.mainCharData.attributeInfo.prestige_gongXunZhi);
         }
         else if(param1.shengWangType == 7)
         {
            this.mallPanel.showBuyPanel(param1.mallID,param1.goods.getBigICOPath(),param1.goods.res.name,param1.shengWangType,param1.shengWang,param1.use_desc,GameInstance.mainCharData.attributeInfo.prestige_jiFenZhi);
         }
         else if(param1.shengWangType == 8)
         {
            this.mallPanel.showBuyPanel(param1.mallID,param1.goods.getBigICOPath(),param1.goods.res.name,param1.shengWangType,param1.shengWang,param1.use_desc,GameInstance.mainCharData.attributeInfo.prestige_WuHunZhi);
         }
         else if(param1.shengWangType == 9)
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(45948,true);
            this.mallPanel.showBuyPanel(param1.mallID,param1.goods.getBigICOPath(),param1.goods.res.name,param1.shengWangType,param1.shengWang,param1.use_desc,_loc2_.count);
         }
         else
         {
            this.mallPanel.showBuyPanel(param1.mallID,param1.goods.getBigICOPath(),param1.goods.res.name,param1.shengWangType,param1.shengWang,param1.use_desc,GameInstance.mainCharData.attributeInfo.prestige_shitu);
         }
      }
      
      private function getMallGoods(param1:int) : MallLunJianGoodsVO
      {
         var _loc2_:MallLunJianGoodsVO = null;
         for each(_loc2_ in this._mallArr)
         {
            if(_loc2_.mallID == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function setMallGoodsArr(param1:Array) : void
      {
         var _loc3_:MallLunJianGoodsVO = null;
         var _loc4_:XML = null;
         this._mallArr = param1;
         var _loc2_:XML = <list/>;
         for each(_loc3_ in param1)
         {
            _loc4_ = <node label="商品id" bigRes="大图标地址" goodsName="商品名称" price="价格" price0="原价" type="0元宝|1礼金" isHot="是否热卖0|1" isOff="是否折扣0|1" effect="效果描述最多15字" describe="物品描述最多25字"/>;
            _loc4_.@label = _loc3_.mallID;
            _loc4_.@bigRes = _loc3_.goods.getBigICOPath();
            _loc4_.@goodsName = _loc3_.goods.res.name;
            _loc4_.@describe = _loc3_.desc;
            _loc4_.@describe2 = _loc3_.use_desc;
            _loc4_.@type = _loc3_.shengWangType;
            _loc4_.@price = _loc3_.shengWang;
            _loc2_.appendChild(_loc4_);
         }
         this.mallPanel.showPanel(_loc2_);
      }
      
      public function updateShengWangZhi() : void
      {
         this.onAddToStage(null);
      }
   }
}

