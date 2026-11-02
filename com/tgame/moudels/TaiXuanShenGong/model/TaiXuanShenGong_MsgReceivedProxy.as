package com.tgame.moudels.TaiXuanShenGong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.TaiXuanShenGong.model.info.TaiXuanShenGongVO;
   import com.tgame.moudels.TaiXuanShenGong.view.TaiXuanShenGong_Mediator;
   import com.tgame.moudels.TaiXuanShenGong.view.TaiXuanShenGong_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TaiXuanShenGong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TaiXuanShenGong_MsgReceivedProxy";
      
      private var mainCharTaiXuanShenGongVO:TaiXuanShenGongVO;
      
      private var targetCharTaiXuanShenGongVO:TaiXuanShenGongVO;
      
      private var _TaiXuanShenGong_Mediator:TaiXuanShenGong_Mediator;
      
      private var _targetMediator:TaiXuanShenGong_TargetPanelMediator;
      
      public function TaiXuanShenGong_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get taiXuanShenGong_Mediator() : TaiXuanShenGong_Mediator
      {
         if(!this._TaiXuanShenGong_Mediator)
         {
            this._TaiXuanShenGong_Mediator = facade.retrieveMediator(TaiXuanShenGong_Mediator.NAME) as TaiXuanShenGong_Mediator;
         }
         return this._TaiXuanShenGong_Mediator;
      }
      
      private function get targetPlaneMediator() : TaiXuanShenGong_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(TaiXuanShenGong_TargetPanelMediator.NAME) as TaiXuanShenGong_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([52192,52194,52196,52198],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([52192,52194,52196,52198],NAME);
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
      
      public function received_52192(param1:ByteArray) : void
      {
         ZLog.add("52192：太玄神功面板信息接收");
         if(!this.mainCharTaiXuanShenGongVO)
         {
            this.mainCharTaiXuanShenGongVO = new TaiXuanShenGongVO();
         }
         this.mainCharTaiXuanShenGongVO.nowID = param1.readInt();
         this.mainCharTaiXuanShenGongVO.nowLookingID = param1.readInt();
         this.mainCharTaiXuanShenGongVO.nowLookingName = param1.readUTF();
         this.mainCharTaiXuanShenGongVO.isKnow = param1.readByte() == 0 ? false : true;
         this.mainCharTaiXuanShenGongVO.act = param1.readInt();
         this.mainCharTaiXuanShenGongVO.def = param1.readInt();
         this.mainCharTaiXuanShenGongVO.hp = param1.readInt();
         this.mainCharTaiXuanShenGongVO.mp = param1.readInt();
         this.mainCharTaiXuanShenGongVO.cp = param1.readInt();
         this.mainCharTaiXuanShenGongVO.miaoshu = param1.readUTF();
         this.mainCharTaiXuanShenGongVO.dingJi = param1.readByte() == 0 ? false : true;
         this.mainCharTaiXuanShenGongVO.isZuoQi = param1.readByte() == 0 ? false : true;
         this.taiXuanShenGong_Mediator.upDataPanel(this.mainCharTaiXuanShenGongVO);
      }
      
      public function received_52194(param1:ByteArray) : void
      {
         ZLog.add("52194：太玄神功升级查询返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:String = param1.readUTF();
         var _loc9_:String = param1.readUTF();
         this.taiXuanShenGong_Mediator.upDateTaiXuanShenGongLV(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_52196(param1:ByteArray) : void
      {
         ZLog.add("52196：太玄神功成功失败");
         var _loc2_:int = param1.readByte();
         this.taiXuanShenGong_Mediator.upDateTaiXuanShenGongLVComplete(_loc2_);
      }
      
      public function received_52198(param1:ByteArray) : void
      {
         ZLog.add("52198：他人太玄神功面板信息接收");
         var _loc2_:int = param1.readInt();
         if(!this.targetCharTaiXuanShenGongVO)
         {
            this.targetCharTaiXuanShenGongVO = new TaiXuanShenGongVO();
         }
         this.targetCharTaiXuanShenGongVO.nowID = param1.readInt();
         this.targetCharTaiXuanShenGongVO.nowLookingName = param1.readUTF();
         this.targetCharTaiXuanShenGongVO.isKnow = true;
         this.targetCharTaiXuanShenGongVO.act = param1.readInt();
         this.targetCharTaiXuanShenGongVO.def = param1.readInt();
         this.targetCharTaiXuanShenGongVO.hp = param1.readInt();
         this.targetCharTaiXuanShenGongVO.mp = param1.readInt();
         this.targetCharTaiXuanShenGongVO.cp = param1.readInt();
         this.targetCharTaiXuanShenGongVO.miaoshu = param1.readUTF();
         this.targetCharTaiXuanShenGongVO.dingJi = param1.readByte() == 0 ? false : true;
         this.targetCharTaiXuanShenGongVO.isZuoQi = param1.readByte() == 0 ? false : true;
         this.targetPlaneMediator.upDataPanel(_loc2_,this.targetCharTaiXuanShenGongVO);
      }
   }
}

