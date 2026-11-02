package com.tgame.moudels.qinggongyan.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.qinggongyan.view.QingGongYanOver_PanelMediator;
   import com.tgame.moudels.qinggongyan.view.QingGongYan_PanelMediator;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QingGongYan_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "QingGongYan_MsgReceivedProxy";
      
      private var _qinggongyanMediator:QingGongYan_PanelMediator;
      
      private var _qinggongyanOverMediator:QingGongYanOver_PanelMediator;
      
      public function QingGongYan_MsgReceivedProxy()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([55502,55504,55506,55508],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([55502,55504,55506,55508],NAME);
      }
      
      public function get qinggongyanMediator() : QingGongYan_PanelMediator
      {
         if(this._qinggongyanMediator == null)
         {
            this._qinggongyanMediator = facade.retrieveMediator(QingGongYan_PanelMediator.NAME) as QingGongYan_PanelMediator;
         }
         return this._qinggongyanMediator;
      }
      
      public function get qinggongyanOverMediator() : QingGongYanOver_PanelMediator
      {
         if(this._qinggongyanOverMediator == null)
         {
            this._qinggongyanOverMediator = facade.retrieveMediator(QingGongYanOver_PanelMediator.NAME) as QingGongYanOver_PanelMediator;
         }
         return this._qinggongyanOverMediator;
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号 " + _loc2_ + "不存在");
         }
      }
      
      public function received_55502(param1:ByteArray) : void
      {
         ZLog.add("55502：返回庆功宴餐桌信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         this.qinggongyanMediator.showQingGongYanPanel();
         this.qinggongyanMediator.setQingGongYanData(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_55504(param1:ByteArray) : void
      {
         ZLog.add("55504：返回庆功宴结束信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         this.qinggongyanOverMediator.setPanel(_loc3_);
         this.qinggongyanOverMediator.setPlayerAndNumber(_loc2_);
         PipeManager.sendMsg(PipeConstants.SHOW_QINGGONGYAN_OVER);
      }
      
      public function received_55506(param1:ByteArray) : void
      {
         ZLog.add("55506：庆功宴开始公告面板显示");
         var _loc2_:String = "" + param1.readByte();
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.QINGGONGYAN_BEIGIN,_loc2_);
      }
      
      public function received_55508(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readInt();
         this.qinggongyanOverMediator.setNumber(_loc2_);
         ZLog.add("55508：食用婚宴人数");
      }
   }
}

