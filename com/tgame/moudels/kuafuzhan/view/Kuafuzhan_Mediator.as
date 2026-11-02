package com.tgame.moudels.kuafuzhan.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.kuafuzhan.Kuafuzhan_ApplicationFacade;
   import com.tgame.moudels.kuafuzhan.model.Kuafuzhan_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Kuafuzhan_Mediator extends Mediator
   {
      
      public static const NAME:String = "Kuafuzhan_XuanxianPlaneMediator";
      
      private var _msg_sender:Kuafuzhan_MsgSenderProxy;
      
      public function Kuafuzhan_Mediator()
      {
         super(NAME);
      }
      
      private function get msg_sender() : Kuafuzhan_MsgSenderProxy
      {
         if(!this._msg_sender)
         {
            this._msg_sender = facade.retrieveProxy(Kuafuzhan_MsgSenderProxy.NAME) as Kuafuzhan_MsgSenderProxy;
         }
         return this._msg_sender;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Kuafuzhan_ApplicationFacade.ENTER_SCENE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Kuafuzhan_ApplicationFacade.ENTER_SCENE:
               if(GameConfig.wantEnterMapRes.isFuben != 3)
               {
                  GameInstance.uiInstance.mainUI.isShowKuaFuLunJian(false);
                  if(GameInstance.uiInstance._popMapPanel != null)
                  {
                     PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_NB_ZHUANGBEI,[OtherConst.NB_ZHUANGBEI_REMOVE]);
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
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.addEventListener(MainUI.MAINUI_KUAFU_LINE_SELECT,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.removeEventListener(MainUI.MAINUI_KUAFU_LINE_SELECT,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc3_:Object = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case MainUI.MAINUI_KUAFU_LINE_SELECT:
               _loc3_ = (param1 as BaseEvent).data as Object;
               this.msg_sender.send_10113(_loc3_.id);
         }
      }
      
      public function showKuafuLineList(param1:XML) : void
      {
         GameInstance.uiInstance.mainUI.showKuaFuLineSelectPanel(param1);
      }
      
      public function receive_time(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int) : void
      {
         GameInstance.uiInstance.mainUI.isShowKuaFuLunJian(true);
         GameInstance.uiInstance.mainUI.setKuaFuValue(param1,param3,param2,GameInstance.mainCharData.attributeInfo.lv,param5);
         PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_NB_ZHUANGBEI,[OtherConst.NB_ZHUANGBEI_ADD,new Point(param12 * 25,param13 * 25),new Point(param6 * 25,param7 * 25),new Point(param8 * 25,param9 * 25),new Point(param10 * 25,param11 * 25)]);
      }
   }
}

