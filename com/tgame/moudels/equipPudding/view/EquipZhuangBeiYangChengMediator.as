package com.tgame.moudels.equipPudding.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.equipPudding.EquipPudding_ApplicationFacade;
   import com.tgame.moudels.equipPudding.model.EquipPudding_MsgSendProxy;
   import com.tgame.shell.view.components.YangChengTiShiCanvas;
   import com.tgame.shell.view.components.ZhuangBeiYangChengPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class EquipZhuangBeiYangChengMediator extends Mediator
   {
      
      public static const NAME:String = "EquipZhuangBeiYangChengMediator";
      
      private var _msgSenderProxy:EquipPudding_MsgSendProxy;
      
      private var _zhuangbeiYangchengPanel:ZhuangBeiYangChengPanel;
      
      private var tishi:YangChengTiShiCanvas;
      
      private var _goods:Goods;
      
      private var tip1:String = "";
      
      private var tip2:String = "";
      
      private var tipYJYC:String = "";
      
      private var miaoshu:String;
      
      private var zt1:Boolean = true;
      
      private var zt2:Boolean = true;
      
      private var types:int;
      
      public function EquipZhuangBeiYangChengMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : EquipPudding_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(EquipPudding_MsgSendProxy.NAME) as EquipPudding_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [EquipPudding_ApplicationFacade.ZHUANGBEI_YANGCHENG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case EquipPudding_ApplicationFacade.ZHUANGBEI_YANGCHENG:
               this._goods = _loc2_ as Goods;
               this.zt1 = true;
               this.zt2 = true;
               this.msgSenderProxy.send_53561([this._goods.id,this._goods.position]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhuangBeiYangChengPanel,function():void
         {
            _zhuangbeiYangchengPanel.addEventListener(ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CLICK,ZhuangBeiYangChengPanelHandel);
            _zhuangbeiYangchengPanel.addEventListener(ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CANVAS_CLICK,ZhuangBeiYangchengQuedingiHandel);
            _zhuangbeiYangchengPanel.addEventListener(ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CANVAS_NEXT_IS_SHOW,ZhuangBeiYangchengQuedingiHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhuangBeiYangChengPanel,function():void
         {
            _zhuangbeiYangchengPanel.removeEventListener(ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CLICK,ZhuangBeiYangChengPanelHandel);
            _zhuangbeiYangchengPanel.removeEventListener(ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CANVAS_CLICK,ZhuangBeiYangchengQuedingiHandel);
            _zhuangbeiYangchengPanel.removeEventListener(ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CANVAS_NEXT_IS_SHOW,ZhuangBeiYangchengQuedingiHandel);
         });
      }
      
      private function ZhuangBeiYangChengPanelHandel(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc2_:String = param1.type;
         _loc3_ = param1 as BaseEvent;
         switch(_loc2_)
         {
            case ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CLICK:
               _loc4_ = int(_loc3_.data[0]);
               _loc5_ = _loc3_.data[1];
               this.types = _loc4_;
               if(this._goods.id != _loc5_.id)
               {
                  this._goods = _loc5_;
               }
               if(_loc4_ == 2)
               {
                  if(this.zt1)
                  {
                     this._zhuangbeiYangchengPanel.showYangChengCanves(this.tip1,this.tip2,false);
                  }
                  else
                  {
                     this.msgSenderProxy.send_53563([this.types,this._goods.id,this._goods.position]);
                  }
               }
               else if(_loc4_ == 3)
               {
                  if(this.zt2)
                  {
                     this._zhuangbeiYangchengPanel.showYangChengCanves(this.tipYJYC,this.tip2,false);
                  }
                  else
                  {
                     this.msgSenderProxy.send_53563([this.types,this._goods.id,this._goods.position]);
                  }
               }
               else
               {
                  this.msgSenderProxy.send_53563([this.types,this._goods.id,this._goods.position]);
               }
         }
      }
      
      private function ZhuangBeiYangchengTishiHandel(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:Boolean = false;
         var _loc2_:String = param1.type;
         _loc3_ = param1 as BaseEvent;
         switch(_loc2_)
         {
            case ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CANVAS_NEXT_IS_SHOW:
               _loc4_ = Boolean(_loc3_.data[0]);
               if(this.types == 2)
               {
                  this.zt1 = !_loc4_;
               }
               else if(this.types == 3)
               {
                  this.zt2 = !_loc4_;
               }
         }
      }
      
      private function ZhuangBeiYangchengQuedingiHandel(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:Boolean = false;
         var _loc2_:String = param1.type;
         _loc3_ = param1 as BaseEvent;
         switch(_loc2_)
         {
            case ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CANVAS_CLICK:
               _loc4_ = Boolean(_loc3_.data[0]);
               if(_loc4_)
               {
                  this.msgSenderProxy.send_53563([this.types,this._goods.id,this._goods.position]);
               }
               break;
            case ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CANVAS_NEXT_IS_SHOW:
               _loc4_ = Boolean(_loc3_.data[0]);
               if(this.types == 2)
               {
                  this.zt1 = !_loc4_;
               }
               else if(this.types == 3)
               {
                  this.zt2 = !_loc4_;
               }
         }
      }
      
      public function setDataYC(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Number, param7:String, param8:String, param9:int, param10:String) : void
      {
         if(this._goods.id != param2 || this._goods.position != param9)
         {
            return;
         }
         if(this._zhuangbeiYangchengPanel == null)
         {
            this._zhuangbeiYangchengPanel = new ZhuangBeiYangChengPanel();
            UIEventsRegisterManager.registerUI(this._zhuangbeiYangchengPanel,ZhuangBeiYangChengPanel);
         }
         if(!Fun.isVisible(this._zhuangbeiYangchengPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this._zhuangbeiYangchengPanel);
            this._zhuangbeiYangchengPanel.x = GameInstance.stage.stageWidth / 2 - this._zhuangbeiYangchengPanel.width / 2;
            this._zhuangbeiYangchengPanel.y = GameInstance.stage.stageHeight / 2 - this._zhuangbeiYangchengPanel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(this._zhuangbeiYangchengPanel);
         }
         if(param3 == 0)
         {
            param3 = SpecialGoodsID.SMQLJS;
         }
         var _loc11_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3);
         var _loc12_:Goods = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param9);
         this.tip1 = param7;
         this.tip2 = param8;
         this.tipYJYC = param10;
         this._zhuangbeiYangchengPanel.setDate(param1,_loc12_,_loc11_,param4,param5,param6,param8,_loc11_.count);
      }
   }
}

