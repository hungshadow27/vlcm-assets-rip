package com.tgame.moudels.longwenkehua.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.longwenkehua.LongWenKeHua_ApplicationFacade;
   import com.tgame.moudels.longwenkehua.model.LongWenKeHua_MsgSenderProxy;
   import com.tgame.shell.view.components.LongWenKeHuaPanel;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class LongWenKeHua_Mediator extends Mediator
   {
      
      public static const NAME:String = "LongWenKeHua_Mediator";
      
      public function LongWenKeHua_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get longwenkehuaPanel() : LongWenKeHuaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.longwenkehua);
         }
         return viewComponent as LongWenKeHuaPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [LongWenKeHua_ApplicationFacade.LONGWENKEHUA_PANEL,LongWenKeHua_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc2_:Object = param1.getBody();
         var _loc3_:int = _loc2_ as int;
         switch(param1.getName())
         {
            case LongWenKeHua_ApplicationFacade.LONGWENKEHUA_PANEL:
               if(_loc3_ == -1)
               {
                  if(GameInstance.mainCharData.goodsInfo.hasGoodsInBody200() == false)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("当前未穿戴200级装备，无法打开龙纹刻画界面"));
                     return;
                  }
                  GameInstance.uiInstance.uiContainer.addChild(this.longwenkehuaPanel);
                  this.longwenkehuaPanel.visible = true;
                  _loc4_ = viewComponent as DisplayObject;
                  _loc4_.x = GameConfig.sceneWidth / 2 - _loc4_.width / 2;
                  _loc4_.y = GameConfig.sceneHeight / 2 - _loc4_.height / 2;
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(_loc4_);
                  this.longwenkehuaPanel.showItem(0);
               }
               break;
            case LongWenKeHua_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(GameInstance.uiInstance._longwenkehua))
               {
                  this.longwenkehuaPanel.showItem(1);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(LongWenKeHuaPanel,function():void
         {
            longwenkehuaPanel.addEventListener(LongWenKeHuaPanel.UI_LONGWENKEHUA_CLICK,onHandle);
            longwenkehuaPanel.addEventListener(LongWenKeHuaPanel.UI_QINGCHULONGWEN_CLICK,onHandle);
            longwenkehuaPanel.addEventListener(LongWenKeHuaPanel.UI_GETZHUANGBEIINFO,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(LongWenKeHuaPanel,function():void
         {
            longwenkehuaPanel.removeEventListener(LongWenKeHuaPanel.UI_LONGWENKEHUA_CLICK,onHandle);
            longwenkehuaPanel.removeEventListener(LongWenKeHuaPanel.UI_QINGCHULONGWEN_CLICK,onHandle);
            longwenkehuaPanel.removeEventListener(LongWenKeHuaPanel.UI_GETZHUANGBEIINFO,onHandle);
         });
      }
      
      private function get MsgSend() : LongWenKeHua_MsgSenderProxy
      {
         return facade.retrieveProxy(LongWenKeHua_MsgSenderProxy.NAME) as LongWenKeHua_MsgSenderProxy;
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:Object = param1.data as Object;
         switch(param1.type)
         {
            case LongWenKeHuaPanel.UI_GETZHUANGBEIINFO:
               this.MsgSend.send_72451([_loc2_.id]);
               break;
            case LongWenKeHuaPanel.UI_LONGWENKEHUA_CLICK:
               this.MsgSend.send_72454([_loc2_.id,_loc2_.biaoshi,_loc2_.shifoukuaijie,_loc2_.kuaijieID]);
               break;
            case LongWenKeHuaPanel.UI_QINGCHULONGWEN_CLICK:
               this.MsgSend.send_72453([_loc2_.id,_loc2_.biaoshi]);
         }
      }
      
      public function setPanel(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:Number, param7:int, param8:int, param9:int, param10:int, param11:int) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._longwenkehua))
         {
            this.longwenkehuaPanel.updateInfo(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         }
      }
      
      public function showJinDu(param1:int, param2:int, param3:int) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._longwenkehua))
         {
            this.longwenkehuaPanel.showJinDu(param1,param2,param3);
         }
      }
   }
}

