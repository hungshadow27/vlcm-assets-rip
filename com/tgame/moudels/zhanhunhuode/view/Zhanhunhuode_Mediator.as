package com.tgame.moudels.zhanhunhuode.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhanhunhuode.ZhanHunHuoDe_ApplicationFacade;
   import com.tgame.moudels.zhanhunhuode.model.Zhanhunhuode_MsgSenderProxy;
   import com.tgame.shell.view.components.ZhanHunPanel;
   import com.tgame.shell.view.components.zhanhun.ZhanHunQianKunTipCanvas;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Zhanhunhuode_Mediator extends Mediator
   {
      
      public static const NAME:String = "Zhanhunhuode_Mediator";
      
      public var tishiCanvas:ZhanHunQianKunTipCanvas;
      
      private var _msgSender:Zhanhunhuode_MsgSenderProxy;
      
      public function Zhanhunhuode_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZhanHunHuoDe_ApplicationFacade.SHOW_ZHANHUNHUODE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZhanHunHuoDe_ApplicationFacade.SHOW_ZHANHUNHUODE:
               this.msgSender.send_55801();
         }
      }
      
      private function get zhanhunhuodePanel() : ZhanHunPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhanhunhuodePanel);
         }
         return viewComponent as ZhanHunPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhanHunPanel,function():void
         {
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUN_DUIHUAN_CLICK,onZhanhunDuihuanClick);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUN_MAICHU_CLICK,onMaichuClick);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUN_NPC_CLICK,onNpcClick);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUN_SHIQU_CLICK,onShouquClick);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUN_XIANGQIAN_CLICK,onXiangqianClick);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUN_YIJIANMAICHU_CLICK,onYijianmaichuClick);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUN_YIJIANSHIQU_CLICK,onYijianShouQuClick);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUN_YIJIANZHANHUI_CLICK,onYijianZhanhunClick);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUN_QIANKUNYIZHI_CLICK,onQiankunYizhiClick);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUNDUIHUAN_DUIHUANBAOSHICANVAS,handler);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_SHANGYIYE,handler);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_XIAYIYE,handler);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_DUIHUAN,handler);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUNDUIHUAN_DUIHUANZHANHUNCANVAS,handler);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_DUIHUANZHANHUNCANVAS_DUIHUAN,handler);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUNQIANKUNYIZHITIPSHOW,handler);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUNQIANKUNYIZHITIPSHOW_OK,handler);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_ZHANHUNQIANKUNYIZHITIPSHOW_CANCLE,handler);
            zhanhunhuodePanel.addEventListener(ZhanHunPanel.UI_CHENGSEZHANHUN_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhanHunPanel,function():void
         {
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUN_DUIHUAN_CLICK,onZhanhunDuihuanClick);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUN_MAICHU_CLICK,onMaichuClick);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUN_NPC_CLICK,onNpcClick);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUN_SHIQU_CLICK,onShouquClick);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUN_XIANGQIAN_CLICK,onXiangqianClick);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUN_YIJIANMAICHU_CLICK,onYijianmaichuClick);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUN_YIJIANSHIQU_CLICK,onYijianShouQuClick);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUN_YIJIANZHANHUI_CLICK,onYijianZhanhunClick);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUN_QIANKUNYIZHI_CLICK,onQiankunYizhiClick);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUNDUIHUAN_DUIHUANBAOSHICANVAS,handler);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_SHANGYIYE,handler);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_XIAYIYE,handler);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_DUIHUAN,handler);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUNDUIHUAN_DUIHUANZHANHUNCANVAS,handler);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_DUIHUANZHANHUNCANVAS_DUIHUAN,handler);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUNQIANKUNYIZHITIPSHOW,handler);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUNQIANKUNYIZHITIPSHOW_OK,handler);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_ZHANHUNQIANKUNYIZHITIPSHOW_CANCLE,handler);
            zhanhunhuodePanel.removeEventListener(ZhanHunPanel.UI_CHENGSEZHANHUN_CLICK,handler);
         });
      }
      
      private function get msgSender() : Zhanhunhuode_MsgSenderProxy
      {
         if(!this._msgSender)
         {
            this._msgSender = facade.retrieveProxy(Zhanhunhuode_MsgSenderProxy.NAME) as Zhanhunhuode_MsgSenderProxy;
         }
         return this._msgSender;
      }
      
      public function showZhanHunPanel() : void
      {
         if(this.zhanhunhuodePanel.parent == null)
         {
            GameInstance.uiInstance.uiContainer.addChild(this.zhanhunhuodePanel);
            this.zhanhunhuodePanel.x = (GameConfig.sceneWidth - this.zhanhunhuodePanel.width) / 2;
            this.zhanhunhuodePanel.y = (GameConfig.sceneHeight - this.zhanhunhuodePanel.height) / 2;
         }
      }
      
      public function setBaoshi(param1:int) : void
      {
         this.zhanhunhuodePanel.setBaoShi(param1);
      }
      
      public function setZhanHunData(param1:int, param2:Array, param3:Array) : void
      {
         this.zhanhunhuodePanel.setData(param2,param3,param1,GameInstance.mainCharData.moneyInfo.copper);
      }
      
      public function shiquZhanHun(param1:Array) : void
      {
         this.zhanhunhuodePanel.deleteZhanHun(param1);
      }
      
      public function maichuZhanhun(param1:Array) : void
      {
         this.zhanhunhuodePanel.deleteZhanHun(param1);
      }
      
      public function AppendZhanhun(param1:Array, param2:Array, param3:int) : void
      {
         this.zhanhunhuodePanel.addZhanHun(param1,param2,param3);
      }
      
      public function setNPC(param1:Array) : void
      {
         this.zhanhunhuodePanel.setNpcBtnStatus(param1);
      }
      
      public function setjifen(param1:int) : void
      {
         this.zhanhunhuodePanel.setJiFen(param1);
      }
      
      public function settongbi(param1:Number) : void
      {
         this.zhanhunhuodePanel.setTongBi(param1);
      }
      
      private function onYijianZhanhunClick(param1:BaseEvent) : void
      {
         this.msgSender.send_55809(param1.data as int);
      }
      
      private function onYijianShouQuClick(param1:BaseEvent) : void
      {
         this.msgSender.send_55803(-1);
      }
      
      private function onYijianmaichuClick(param1:BaseEvent) : void
      {
         this.msgSender.send_55805(-1);
      }
      
      private function onXiangqianClick(param1:BaseEvent) : void
      {
         if(ReloginManager.isInKuafu)
         {
            NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
            return;
         }
         if(!Fun.isVisible(GameInstance.uiInstance.zhanhundai))
         {
            if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
            }
            else
            {
               GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance._charAttribute);
            }
            GameInstance.uiInstance._charAttribute.showZhanhun();
            ResizeManager.showDoublePanel(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.zhanhundai);
         }
         else if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
         }
         PipeManager.sendMsg(PipeConstants.SHOW_ZHANHUNDAI_BAOGUO);
      }
      
      private function onShouquClick(param1:BaseEvent) : void
      {
         var _loc2_:int = param1.data as int;
         this.msgSender.send_55803(_loc2_);
      }
      
      private function onNpcClick(param1:BaseEvent) : void
      {
         var _loc2_:Array = param1.data as Array;
         this.msgSender.send_55807(_loc2_);
      }
      
      private function onMaichuClick(param1:BaseEvent) : void
      {
         var _loc2_:int = param1.data as int;
         this.msgSender.send_55805(_loc2_);
      }
      
      private function onZhanhunDuihuanClick(param1:BaseEvent) : void
      {
         this.msgSender.send_55811();
      }
      
      private function onQiankunYizhiClick(param1:BaseEvent) : void
      {
         this.showQianKunYiZhiTiShiCanvas();
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case ZhanHunPanel.UI_ZHANHUNDUIHUAN_DUIHUANBAOSHICANVAS:
               this.msgSender.send_55843([0,1]);
               this.zhanhunhuodePanel.showBaoshiCanvas0();
               break;
            case ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_SHANGYIYE:
               this.msgSender.send_55843([0,_loc2_.data]);
               break;
            case ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_XIAYIYE:
               this.msgSender.send_55843([0,_loc2_.data]);
               break;
            case ZhanHunPanel.UI_DUIHUANBAOSHICANVAS_DUIHUAN:
               _loc3_ = _loc2_.data as Array;
               this.msgSender.send_55845(_loc3_);
               this.msgSender.send_55843([0,1]);
               break;
            case ZhanHunPanel.UI_ZHANHUNDUIHUAN_DUIHUANZHANHUNCANVAS:
               this.msgSender.send_55843([1]);
               this.zhanhunhuodePanel.showZhanhunCanvas0();
               break;
            case ZhanHunPanel.UI_DUIHUANZHANHUNCANVAS_DUIHUAN:
               this.msgSender.send_55847(_loc2_.data);
               break;
            case ZhanHunPanel.UI_ZHANHUNQIANKUNYIZHITIPSHOW_OK:
               this.msgSender.send_55841();
            case ZhanHunPanel.UI_ZHANHUNQIANKUNYIZHITIPSHOW_CANCLE:
               if(!this.tishiCanvas)
               {
                  this.tishiCanvas = new ZhanHunQianKunTipCanvas();
                  this.tishiCanvas.$parent = this.zhanhunhuodePanel;
               }
               this.tishiCanvas.onClose();
               break;
            case ZhanHunPanel.UI_CHENGSEZHANHUN_CLICK:
               this.msgSender.send_55907();
         }
      }
      
      public function setZhanhun1(param1:Array, param2:int) : void
      {
         this.zhanhunhuodePanel.setDuiHuanbaoshi0(param1,param2);
      }
      
      public function setYeshu(param1:int, param2:int) : void
      {
         this.zhanhunhuodePanel.setYeShu(param1,param2);
      }
      
      public function setZhanhun2(param1:Array, param2:int) : void
      {
         this.zhanhunhuodePanel.setDuiHuanzhanhun0(param1,param2);
      }
      
      public function setDuihuanBaoshi(param1:int) : void
      {
         if(param1 == 1)
         {
            this.msgSender.send_55843([0,0]);
         }
         if(param1 == 0)
         {
         }
      }
      
      public function setDuihuanZhanhun(param1:int) : void
      {
         if(param1 == 1)
         {
            this.msgSender.send_55843([1]);
         }
         if(param1 == 0)
         {
         }
      }
      
      private function showQianKunYiZhiTiShiCanvas() : void
      {
         if(!this.tishiCanvas)
         {
            this.tishiCanvas = new ZhanHunQianKunTipCanvas();
            this.tishiCanvas.$parent = this.zhanhunhuodePanel;
         }
         if(!this.tishiCanvas.getCheckSta())
         {
            POPWindowManager.showWindow(this.tishiCanvas);
         }
         else
         {
            this.msgSender.send_55841();
         }
      }
   }
}

