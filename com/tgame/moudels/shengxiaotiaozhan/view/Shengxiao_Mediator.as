package com.tgame.moudels.shengxiaotiaozhan.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shengxiaotiaozhan.Shengxiao_ApplicationFacade;
   import com.tgame.moudels.shengxiaotiaozhan.model.Shengxiao_MsgSendProxy;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShengXiaoTiaoZhanPanel;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShengxiaotiaozhanFail;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShengxiaotiaozhanRelive;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShengxiaotiaozhanSuccess;
   import com.tgame.shell.view.components.shengxiaotiaozhan.ShenqiDuanzaoPanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Shengxiao_Mediator extends Mediator
   {
      
      public static const NAME:String = "Shengxiao_Mediator";
      
      private var nowPage:int = 1;
      
      private var nowLV:int = 1;
      
      private var duanzao:ShenqiDuanzaoPanel = new ShenqiDuanzaoPanel();
      
      private var _senderProxy:Shengxiao_MsgSendProxy;
      
      public function Shengxiao_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Shengxiao_ApplicationFacade.SEND_SHENGXIAOFUBENTIAOZHAN_CLICK,Shengxiao_ApplicationFacade.SEND_SHENGXIAOTIAOZHAN_LEAVE,Shengxiao_ApplicationFacade.SEND_SHENGXIAOTIAOZHAN_RELIVE,Shengxiao_ApplicationFacade.SHENGXIAOWUQIDUANZAO_CLICK,Shengxiao_ApplicationFacade.NPC_REQ_FUNCTION];
      }
      
      private function get senderProxy() : Shengxiao_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Shengxiao_MsgSendProxy.NAME) as Shengxiao_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Shengxiao_ApplicationFacade.SEND_SHENGXIAOFUBENTIAOZHAN_CLICK:
               this.senderProxy.send_73877(this.nowLV);
               break;
            case Shengxiao_ApplicationFacade.SEND_SHENGXIAOTIAOZHAN_LEAVE:
               this.senderProxy.send_73883();
               if(Fun.isVisible(GameInstance.uiInstance.shengxiaoRightSpr))
               {
                  GameInstance.uiInstance.shengxiaoRightSpr.onclose();
                  GameInstance.uiInstance.mainUI.setTrackVisible(true);
                  GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(true);
               }
               break;
            case Shengxiao_ApplicationFacade.SEND_SHENGXIAOTIAOZHAN_RELIVE:
               this.senderProxy.send_73889();
               break;
            case Shengxiao_ApplicationFacade.SHENGXIAOWUQIDUANZAO_CLICK:
               this.senderProxy.send_73893();
               break;
            case Shengxiao_ApplicationFacade.NPC_REQ_FUNCTION:
               if(_loc2_ == NpcFunctionType.SHENGXIAOSHENQI_DUANZAO)
               {
                  if(!Fun.isVisible(this.duanzao))
                  {
                     this.duanzao.x = GameConfig.sceneWidth / 2 - this.duanzao.width / 2;
                     this.duanzao.y = GameConfig.sceneHeight / 2 - this.duanzao.height / 2;
                     GameInstance.uiInstance.uiContainer.addChild(this.duanzao);
                  }
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : ShengXiaoTiaoZhanPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shengxiaotiaozhanPanel);
         }
         return viewComponent as ShengXiaoTiaoZhanPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShengXiaoTiaoZhanPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,onHandle);
            panel.addEventListener(ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_CENGSHU_CLICK,onHandle);
            panel.addEventListener(ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_KAISHITIAOZHANTIP_CLICK,onHandle);
            panel.addEventListener(ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_FANYE_CLICK,onHandle);
            panel.addEventListener(ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_LINGQU_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShengXiaoTiaoZhanPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,onHandle);
            panel.removeEventListener(ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_CENGSHU_CLICK,onHandle);
            panel.removeEventListener(ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_KAISHITIAOZHANTIP_CLICK,onHandle);
            panel.removeEventListener(ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_FANYE_CLICK,onHandle);
            panel.addEventListener(ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_LINGQU_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_73871(0);
               break;
            case ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_CENGSHU_CLICK:
               this.senderProxy.send_73873(param1.data);
               break;
            case ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_FANYE_CLICK:
               _loc2_ = int(param1.data);
               if(_loc2_ == 1)
               {
                  this.senderProxy.send_73871(this.nowPage - 1);
               }
               else
               {
                  this.senderProxy.send_73871(this.nowPage + 1);
               }
               break;
            case ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_KAISHITIAOZHANTIP_CLICK:
               this.nowLV = int(param1.data);
               this.senderProxy.send_73875(param1.data);
               break;
            case ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_KAISHI_CLICK:
               this.senderProxy.send_73877(param1.data);
               break;
            case ShengXiaoTiaoZhanPanel.UI_SHENGXIAOTIAOZHAN_LINGQU_CLICK:
               this.senderProxy.send_73879(param1.data);
         }
      }
      
      public function setData(param1:int, param2:int, param3:Array) : void
      {
         this.nowPage = param1;
         this.panel.setData(param1,param2,param3);
      }
      
      public function setlv(param1:int, param2:Array, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.panel.setlv(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public function setTipPanel(param1:int, param2:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.shengxiaoTipPanel))
         {
            GameInstance.uiInstance.shengxiaoTipPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.shengxiaoTipPanel.width / 2;
            GameInstance.uiInstance.shengxiaoTipPanel.y = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.shengxiaoTipPanel.height / 2;
            POPWindowManager.showWindow(GameInstance.uiInstance.shengxiaoTipPanel);
         }
         var _loc3_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(42350,true);
         GameInstance.uiInstance.shengxiaoTipPanel.setData(_loc3_,param1,param2);
      }
      
      public function setRightSpr(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.nowLV = param1;
         GameInstance.uiInstance.mainUI.setTrackVisible(false);
         GameInstance.uiInstance.mainUI.imageLeadContainer.visible = false;
         if(!Fun.isVisible(GameInstance.uiInstance.shengxiaoRightSpr))
         {
            GameInstance.uiInstance.mainUI.initShengxiaofubenRight();
         }
         GameInstance.uiInstance.shengxiaoRightSpr.setData(param1,param2,param3,param4,param5,param6);
         PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI,2);
      }
      
      public function setSuccessPanel(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:ShengxiaotiaozhanSuccess = new ShengxiaotiaozhanSuccess();
         POPWindowManager.showWindow(_loc4_);
         _loc4_.setData(param1,param2,param3);
         GameInstance.uiInstance.mainUI.setTrackVisible(true);
         GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(true);
      }
      
      public function setFailPanel() : void
      {
         var _loc2_:ShengxiaotiaozhanFail = null;
         var _loc1_:int = GameInstance.scene.mapConfig.mapID;
         if(_loc1_ == 20303)
         {
            _loc2_ = new ShengxiaotiaozhanFail();
            POPWindowManager.showWindow(_loc2_);
            GameInstance.uiInstance.mainUI.setTrackVisible(true);
            GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(true);
         }
      }
      
      public function setRelivePanel(param1:int) : void
      {
         var _loc2_:ShengxiaotiaozhanRelive = new ShengxiaotiaozhanRelive();
         POPWindowManager.showWindow(_loc2_);
         _loc2_.setData(param1);
      }
   }
}

