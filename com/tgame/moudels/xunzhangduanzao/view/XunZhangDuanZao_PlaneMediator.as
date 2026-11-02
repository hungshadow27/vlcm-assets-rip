package com.tgame.moudels.xunzhangduanzao.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xunzhangduanzao.XunZhangDuanZao_ApplicationFacade;
   import com.tgame.moudels.xunzhangduanzao.model.XunZhangDuanZao_MsgSenderProxy;
   import com.tgame.shell.view.components.XunZhangAndZhanQiDuanZhaoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XunZhangDuanZao_PlaneMediator extends Mediator
   {
      
      public static const NAME:String = "XunZhangDuanZao_PlaneMediator";
      
      private var _goods:Goods;
      
      private var _senderProxy:XunZhangDuanZao_MsgSenderProxy;
      
      public var currType:int = 0;
      
      public function XunZhangDuanZao_PlaneMediator(param1:String = null, param2:Object = null)
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
      
      protected function get XunzhangDuanzaoPlane() : XunZhangAndZhanQiDuanZhaoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xunzhangDuanzao);
         }
         return viewComponent as XunZhangAndZhanQiDuanZhaoPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XunZhangDuanZao_ApplicationFacade.GOODS_CHANGED,XunZhangDuanZao_ApplicationFacade.XUNZHANGDUANZAO,XunZhangDuanZao_ApplicationFacade.ZUOQI_ZHUANGBEI_DAZAO,XunZhangDuanZao_ApplicationFacade.SHOW_WUFANGQIANGHUA_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XunZhangDuanZao_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.XunzhangDuanzaoPlane) && this.currType == 0)
               {
                  if(this._goods != null)
                  {
                     if(ItemPositionRange.YUENAN_ZHAOYUANWUHUJIANGARR.indexOf(this._goods.id) != -1)
                     {
                        this.senderProxy.send_53565([4,this._goods.position,-1]);
                     }
                     else
                     {
                        this.senderProxy.send_53565([1,this._goods.position,-1]);
                     }
                  }
               }
               break;
            case XunZhangDuanZao_ApplicationFacade.XUNZHANGDUANZAO:
               this._goods = _loc2_ as Goods;
               if(ItemPositionRange.YUENAN_ZHAOYUANWUHUJIANGARR.indexOf(this._goods.id) != -1)
               {
                  this.senderProxy.send_53565([4,this._goods.position,-1]);
               }
               else
               {
                  this.senderProxy.send_53565([1,this._goods.position,-1]);
               }
               break;
            case XunZhangDuanZao_ApplicationFacade.ZUOQI_ZHUANGBEI_DAZAO:
               if(_loc2_.type == 1)
               {
                  this.senderProxy.send_53565(_loc2_.ar);
               }
               else if(_loc2_.type == 2)
               {
                  this.senderProxy.send_53567(_loc2_.ar);
               }
               break;
            case XunZhangDuanZao_ApplicationFacade.SHOW_WUFANGQIANGHUA_PANEL:
               this._goods = _loc2_ as Goods;
               this.senderProxy.send_82701(this._goods.position);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XunZhangAndZhanQiDuanZhaoPanel,function():void
         {
            XunzhangDuanzaoPlane.addEventListener(XunZhangAndZhanQiDuanZhaoPanel.UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK,requestXunZhangInfoHandler);
            XunzhangDuanzaoPlane.addEventListener(XunZhangAndZhanQiDuanZhaoPanel.UI_WUFANGFUJIA_SHENGJIBTN_CLICK,requestXunZhangInfoHandler);
            XunzhangDuanzaoPlane.addEventListener(Event.REMOVED_FROM_STAGE,requestXunZhangInfoHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XunZhangAndZhanQiDuanZhaoPanel,function():void
         {
            XunzhangDuanzaoPlane.removeEventListener(XunZhangAndZhanQiDuanZhaoPanel.UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK,requestXunZhangInfoHandler);
            XunzhangDuanzaoPlane.removeEventListener(XunZhangAndZhanQiDuanZhaoPanel.UI_WUFANGFUJIA_SHENGJIBTN_CLICK,requestXunZhangInfoHandler);
            XunzhangDuanzaoPlane.removeEventListener(Event.REMOVED_FROM_STAGE,requestXunZhangInfoHandler);
         });
      }
      
      private function requestXunZhangInfoHandler(param1:BaseEvent) : void
      {
         var _loc2_:Array = null;
         switch(param1.type)
         {
            case XunZhangAndZhanQiDuanZhaoPanel.UI_ZHANQIXUNZHANG_SHENGJIBTN_CLICK:
               _loc2_ = param1.data as Array;
               this.senderProxy.send_53567([_loc2_[0],this._goods.position,_loc2_[1],0,_loc2_[2]]);
               break;
            case XunZhangAndZhanQiDuanZhaoPanel.UI_WUFANGFUJIA_SHENGJIBTN_CLICK:
               this.senderProxy.send_82703(this._goods.position);
               break;
            case Event.REMOVED_FROM_STAGE:
               this.stopzdupdate(2);
         }
      }
      
      public function reRequestXunZhangInfo(param1:Goods) : void
      {
         if(ItemPositionRange.YUENAN_ZHAOYUANWUHUJIANGARR.indexOf(param1.id) != -1)
         {
            this.senderProxy.send_53565([4,param1.position,-1]);
         }
         else
         {
            this.senderProxy.send_53565([1,param1.position,-1]);
         }
      }
      
      public function dakaiZuoqiQianghua(param1:int, param2:int, param3:int, param4:String, param5:String) : void
      {
         var _loc6_:Object = new Object();
         _loc6_.id = param1;
         _loc6_.clid = param2;
         _loc6_.count = param3;
         _loc6_.text1 = param4;
         _loc6_.text2 = param5;
         PipeManager.sendMsg(PipeConstants.DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN,_loc6_);
      }
      
      public function InitializePanel(param1:Goods, param2:Goods, param3:Goods, param4:int, param5:String, param6:String, param7:String, param8:String, param9:int, param10:int, param11:int = 0) : void
      {
         this.currType = param11;
         if(!Fun.isVisible(GameInstance.uiInstance._xunzhangduanzao))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_XUNZHANG_DUANZAO);
         }
         this.XunzhangDuanzaoPlane.setUpdataDate(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public function closePanel() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._xunzhangduanzao))
         {
            GameInstance.uiInstance._xunzhangduanzao.parent.removeChild(GameInstance.uiInstance._xunzhangduanzao);
         }
      }
      
      public function send_80701(param1:int) : void
      {
         this.senderProxy.send_82701(param1);
      }
      
      public function stopzdupdate(param1:int) : void
      {
         this.XunzhangDuanzaoPlane.stopzdupdate(param1);
      }
   }
}

