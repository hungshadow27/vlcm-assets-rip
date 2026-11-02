package com.tgame.moudels.mount.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mount.Mount_ApplicationFacade;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.ride.DianFengShouPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_DianFengPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_DianFengPlaneMediator";
      
      private var _selectMountID:int = 0;
      
      private var avatar_zizeng:int = 0;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      public function Mount_DianFengPlaneMediator()
      {
         super(NAME);
      }
      
      protected function get panel() : DianFengShouPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.dianFengShouPanel);
         }
         return viewComponent as DianFengShouPanel;
      }
      
      private function get msgSenderProxy() : Mount_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Mount_MsgSenderProxy.NAME) as Mount_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Mount_ApplicationFacade.SHOW_DIANFENGSHOU_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Mount_ApplicationFacade.SHOW_DIANFENGSHOU_PANEL:
               this.msgSenderProxy.send_74151([-1,-1]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(DianFengShouPanel,function():void
         {
            panel.addEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_CHAKAN_CLICK,uiHandle);
            panel.addEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_JIHUO_CLICK,uiHandle);
            panel.addEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_SHOW_CLICK,uiHandle);
            panel.addEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_QICHENG_CLICK,uiHandle);
            panel.addEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_WEISHI_CLICK,uiHandle);
            panel.addEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_DRAG_UP,uiHandle);
            panel.addEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_DRAG_DOWN,uiHandle);
            panel.addEventListener(DianFengShouPanel.UI_DINGCHANJUE_SKILL_DRAG,uiHandle);
            panel.addEventListener(DianFengShouPanel.UI_YNJIHUOXUNZHANG,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DianFengShouPanel,function():void
         {
            panel.removeEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_CHAKAN_CLICK,uiHandle);
            panel.removeEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_JIHUO_CLICK,uiHandle);
            panel.removeEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_SHOW_CLICK,uiHandle);
            panel.removeEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_QICHENG_CLICK,uiHandle);
            panel.removeEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_WEISHI_CLICK,uiHandle);
            panel.removeEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_DRAG_UP,uiHandle);
            panel.removeEventListener(DianFengShouPanel.UI_DIANFENGSHOUPANEL_DRAG_DOWN,uiHandle);
            panel.removeEventListener(DianFengShouPanel.UI_DINGCHANJUE_SKILL_DRAG,uiHandle);
            panel.removeEventListener(DianFengShouPanel.UI_YNJIHUOXUNZHANG,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:ItemFace = null;
         var _loc6_:Goods = null;
         var _loc2_:String = param1.type;
         _loc3_ = param1 as BaseEvent;
         switch(_loc2_)
         {
            case DianFengShouPanel.UI_DIANFENGSHOUPANEL_CHAKAN_CLICK:
               this.msgSenderProxy.send_74151([-1,int(_loc3_.data)]);
               break;
            case DianFengShouPanel.UI_DIANFENGSHOUPANEL_JIHUO_CLICK:
               this.msgSenderProxy.send_74153(_loc3_.data as Array);
               break;
            case DianFengShouPanel.UI_DIANFENGSHOUPANEL_SHOW_CLICK:
               this.msgSenderProxy.send_74155(_loc3_.data as Array);
               break;
            case DianFengShouPanel.UI_DIANFENGSHOUPANEL_QICHENG_CLICK:
               this.msgSenderProxy.send_74157(_loc3_.data as Array);
               break;
            case DianFengShouPanel.UI_DIANFENGSHOUPANEL_WEISHI_CLICK:
               if(this.panel.getFood() == null)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入物品"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入物品"));
                  return;
               }
               this.msgSenderProxy.send_74159(this.panel.getFood().position);
               break;
            case DianFengShouPanel.UI_DIANFENGSHOUPANEL_DRAG_UP:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  if(TCursorManager.currentItemFace.getBaseItem() is McBaseItem)
                  {
                     return;
                  }
                  _loc6_ = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this.panel.JinHuaSetFood(_loc6_);
               }
               break;
            case DianFengShouPanel.UI_DIANFENGSHOUPANEL_DRAG_DOWN:
               this.panel.JinHuaSetFood(null);
               break;
            case DianFengShouPanel.UI_DINGCHANJUE_SKILL_DRAG:
               _loc5_ = _loc3_.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc5_;
                  TCursorManager.showItem(_loc5_.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case DianFengShouPanel.UI_YNJIHUOXUNZHANG:
               PipeManager.sendMsg(PipeConstants.SEND_53095,[50,_loc3_.data]);
         }
      }
      
      public function showPanel() : void
      {
         if(!Fun.isVisible(this.panel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
            this.panel._$parent = GameInstance.uiInstance.charAttribute;
         }
      }
      
      public function setResult(param1:Boolean) : void
      {
         if(param1)
         {
            this.panel.closeJiHuoPanel();
         }
      }
      
      public function setData(param1:int, param2:Array, param3:PureMount, param4:int) : void
      {
         this.showPanel();
         this.panel.setPanelData(param1,param2,param3,param4);
         this.panel.JinHuaSetFood(null);
      }
      
      private function setAvatar(param1:PureMount) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $pMount:PureMount = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pMount.id + "_" + avatar_zizeng)
            {
               return;
            }
            panel.avatar = param2;
         };
         this.panel.avatar = null;
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
   }
}

