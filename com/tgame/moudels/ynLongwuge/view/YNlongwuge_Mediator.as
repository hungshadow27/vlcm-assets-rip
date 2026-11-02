package com.tgame.moudels.ynLongwuge.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynLongwuge.YNlongwuge_ApplicationFacade;
   import com.tgame.moudels.ynLongwuge.model.YNlongwuge_MsgSendProxy;
   import com.tgame.moudels.ynLongwuge.model.info.YNlongwugeVO;
   import com.tgame.shell.view.components.ynLongwuge.YNlongwugePanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNlongwuge_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNlongwuge_Mediator";
      
      private var nowPage:int;
      
      private var _senderProxy:YNlongwuge_MsgSendProxy;
      
      public function YNlongwuge_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNlongwuge_ApplicationFacade.YN_REQUEST_LONGWUGE];
      }
      
      private function get senderProxy() : YNlongwuge_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNlongwuge_MsgSendProxy.NAME) as YNlongwuge_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:int = _loc2_ as int;
         switch(param1.getName())
         {
            case YNlongwuge_ApplicationFacade.YN_REQUEST_LONGWUGE:
               this.senderProxy.send_79881(_loc3_);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNlongwugePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynLongwugePanel);
         }
         return viewComponent as YNlongwugePanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNlongwugePanel,function():void
         {
            panel.addEventListener(YNlongwugePanel.UI_YN_LONGWUGE_QIANJIAN_ADDNONGMIN_CLICK,onHandle);
            panel.addEventListener(YNlongwugePanel.UI_YN_LONGWUGE_QIANJIAN_SHOUYI_CLICK,onHandle);
            panel.addEventListener(YNlongwugePanel.UI_YN_LONGWUGE_SHENGJI_CLICK,onHandle);
            panel.addEventListener(YNlongwugePanel.UI_YN_LONGWUGE_SISHENGSHOU_PAGE_CLICK,onHandle);
            panel.addEventListener(YNlongwugePanel.UI_YN_LONGWUGE_TABBTN_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNlongwugePanel,function():void
         {
            panel.removeEventListener(YNlongwugePanel.UI_YN_LONGWUGE_QIANJIAN_ADDNONGMIN_CLICK,onHandle);
            panel.removeEventListener(YNlongwugePanel.UI_YN_LONGWUGE_QIANJIAN_SHOUYI_CLICK,onHandle);
            panel.removeEventListener(YNlongwugePanel.UI_YN_LONGWUGE_SHENGJI_CLICK,onHandle);
            panel.removeEventListener(YNlongwugePanel.UI_YN_LONGWUGE_SISHENGSHOU_PAGE_CLICK,onHandle);
            panel.removeEventListener(YNlongwugePanel.UI_YN_LONGWUGE_TABBTN_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         switch(param1.type)
         {
            case YNlongwugePanel.UI_YN_LONGWUGE_QIANJIAN_ADDNONGMIN_CLICK:
               this.senderProxy.send_79887(param1.data);
               break;
            case YNlongwugePanel.UI_YN_LONGWUGE_QIANJIAN_SHOUYI_CLICK:
               this.senderProxy.send_79885();
               break;
            case YNlongwugePanel.UI_YN_LONGWUGE_SHENGJI_CLICK:
               this.senderProxy.send_79883(param1.data);
               break;
            case YNlongwugePanel.UI_YN_LONGWUGE_SISHENGSHOU_PAGE_CLICK:
               _loc2_ = param1.data as Array;
               _loc3_ = [];
               _loc4_ = int(_loc2_[1]);
               if(_loc3_[2])
               {
                  _loc3_[2] = -1;
               }
               else
               {
                  _loc3_[2] = GameInstance.lookPlayerID;
               }
               if(_loc4_ == 1)
               {
                  _loc3_[0] = _loc2_[0];
                  if(this.nowPage - 1 < 0)
                  {
                     _loc3_[1] = 1;
                  }
                  else
                  {
                     _loc3_[1] = this.nowPage - 1;
                  }
                  this.senderProxy.send_79889(_loc3_);
               }
               else
               {
                  _loc3_[0] = _loc2_[0];
                  if(this.nowPage + 1 > 5)
                  {
                     _loc3_[1] = 5;
                  }
                  else
                  {
                     _loc3_[1] = this.nowPage + 1;
                  }
                  this.senderProxy.send_79889(_loc3_);
               }
               break;
            case YNlongwugePanel.UI_YN_LONGWUGE_TABBTN_CLICK:
               _loc2_ = param1.data as Array;
               _loc5_ = int(_loc2_[0]);
               _loc6_ = int(_loc2_[1]);
               if(_loc5_ == 1)
               {
                  this.senderProxy.send_79881(_loc6_);
               }
               else
               {
                  this.senderProxy.send_79889([_loc5_,-1,_loc6_]);
               }
         }
      }
      
      public function setQianjianData(param1:YNlongwugeVO) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            PipeManager.sendMsg(PipeConstants.YN_SHOW_LONGWUGEPANEL);
         }
         this.panel.setQianjianData(param1);
      }
      
      public function setSishengshouData(param1:YNlongwugeVO) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            PipeManager.sendMsg(PipeConstants.YN_SHOW_LONGWUGEPANEL);
         }
         this.nowPage = param1.level;
         this.panel.setSishengshouData(param1);
      }
      
      public function updateFarmer(param1:int) : void
      {
         this.panel.updateFarmer(param1);
      }
   }
}

