package com.tgame.moudels.tushidahui.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.tushidahui.view.Tushidahui_Mediator;
   import com.tgame.moudels.tushidahui.view.Tushidahui_TargetPanelMediator;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiChuangGuanVO;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiVO;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Tushidahui_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Tushidahui_MsgReceivedProxy";
      
      private var _mainPanelMediator:Tushidahui_Mediator;
      
      private var _targetMediator:Tushidahui_TargetPanelMediator;
      
      public function Tushidahui_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : Tushidahui_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(Tushidahui_Mediator.NAME) as Tushidahui_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : Tushidahui_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(Tushidahui_TargetPanelMediator.NAME) as Tushidahui_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71652,71654,71658],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71652,71654,71658],NAME);
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
      
      public function received_71652(param1:ByteArray) : void
      {
         ZLog.add("71652\t\t返回玩家屠狮大会详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:TushidahuiVO = new TushidahuiVO();
         _loc3_.name = param1.readUTF();
         _loc3_.des = param1.readUTF();
         _loc3_.lookLv = param1.readByte();
         _loc3_.nowLv = param1.readByte();
         _loc3_.goodsID = param1.readInt();
         _loc3_.goodsCnt = param1.readInt();
         _loc3_.actTotal = param1.readDouble();
         _loc3_.defTotal = param1.readDouble();
         _loc3_.hpTotal = param1.readDouble();
         _loc3_.lvTotal = param1.readInt();
         _loc3_.act = param1.readDouble();
         _loc3_.actMax = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.defMax = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.hpMax = param1.readDouble();
         _loc3_.lv = param1.readInt();
         _loc3_.lvMax = param1.readInt();
         _loc3_.allowChuangGuan = param1.readByte();
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.upDataPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_71654(param1:ByteArray) : void
      {
         ZLog.add("71654\t\t返回屠狮大会突破数据");
         var _loc2_:TushidahuiChuangGuanVO = new TushidahuiChuangGuanVO();
         _loc2_.des = param1.readUTF();
         _loc2_.condition = param1.readUTF();
         _loc2_.goodsID = param1.readInt();
         _loc2_.goodsCnt = param1.readInt();
         _loc2_.blessCurt = param1.readInt();
         _loc2_.blessMax = param1.readInt();
         _loc2_.successPercent = param1.readInt();
         this.mainPanelMediator.upDateLV(_loc2_);
      }
      
      public function received_71658(param1:ByteArray) : void
      {
         ZLog.add("71658\t\t返回突破屠狮大会结果");
         var _loc2_:int = param1.readByte();
         ZLog.add("isOK:" + _loc2_);
         this.mainPanelMediator.upDateLVComplete(_loc2_);
      }
   }
}

