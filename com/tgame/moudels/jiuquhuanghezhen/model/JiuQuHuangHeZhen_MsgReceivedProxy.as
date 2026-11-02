package com.tgame.moudels.jiuquhuanghezhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jiuquhuanghezhen.model.info.JiuQuHuangHeZhenVO;
   import com.tgame.moudels.jiuquhuanghezhen.view.JiuQuHuangHeZhen_Mediator;
   import com.tgame.moudels.jiuquhuanghezhen.view.JiuQuHuangHeZhen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JiuQuHuangHeZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "JiuQuHuangHeZhen_MsgReceivedProxy";
      
      private var mainCharJiuQuHuangHeVO:JiuQuHuangHeZhenVO;
      
      private var _jiuquhuanghezhen_Mediator:JiuQuHuangHeZhen_Mediator;
      
      private var _targetMediator:JiuQuHuangHeZhen_TargetPanelMediator;
      
      public function JiuQuHuangHeZhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get jiuquhuanghezhen_Mediator() : JiuQuHuangHeZhen_Mediator
      {
         if(!this._jiuquhuanghezhen_Mediator)
         {
            this._jiuquhuanghezhen_Mediator = facade.retrieveMediator(JiuQuHuangHeZhen_Mediator.NAME) as JiuQuHuangHeZhen_Mediator;
         }
         return this._jiuquhuanghezhen_Mediator;
      }
      
      private function get targetPlaneMediator() : JiuQuHuangHeZhen_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(JiuQuHuangHeZhen_TargetPanelMediator.NAME) as JiuQuHuangHeZhen_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([60852,60854,60856],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([60852,60854,60856],NAME);
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
      
      public function received_60852(param1:ByteArray) : void
      {
         ZLog.add("60852：返回请求玩家九曲黄河详细数据");
         if(!this.mainCharJiuQuHuangHeVO)
         {
            this.mainCharJiuQuHuangHeVO = new JiuQuHuangHeZhenVO();
         }
         var _loc2_:int = param1.readInt();
         this.mainCharJiuQuHuangHeVO.miaoshu = param1.readUTF();
         this.mainCharJiuQuHuangHeVO.nowLookingID = param1.readByte();
         this.mainCharJiuQuHuangHeVO.nowLookingName = param1.readUTF();
         this.mainCharJiuQuHuangHeVO.nowID = param1.readByte();
         this.mainCharJiuQuHuangHeVO.act = param1.readInt();
         this.mainCharJiuQuHuangHeVO.def = param1.readInt();
         this.mainCharJiuQuHuangHeVO.hp = param1.readInt();
         this.mainCharJiuQuHuangHeVO.mp = param1.readInt();
         this.mainCharJiuQuHuangHeVO.cp = param1.readInt();
         this.mainCharJiuQuHuangHeVO.isShuxingFanbei = Boolean(param1.readByte() == 1);
         this.mainCharJiuQuHuangHeVO.isHuanZhuang = Boolean(param1.readByte() == 1);
         this.mainCharJiuQuHuangHeVO.isZuoQi = Boolean(param1.readByte() == 1);
         this.mainCharJiuQuHuangHeVO.isDanTian = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.jiuquhuanghezhen_Mediator.upDataPanel(this.mainCharJiuQuHuangHeVO);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,this.mainCharJiuQuHuangHeVO);
         }
      }
      
      public function received_60854(param1:ByteArray) : void
      {
         ZLog.add("60854：九曲黄河阵升级查询返回");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.jiuquhuanghezhen_Mediator.upDateJiuQuHuangHeZhenLV(_loc6_,_loc7_,_loc4_,_loc5_,_loc8_,_loc3_,_loc2_);
      }
      
      public function received_60856(param1:ByteArray) : void
      {
         ZLog.add("60856：九曲黄河阵领悟成功失败");
         var _loc2_:int = param1.readByte();
         this.jiuquhuanghezhen_Mediator.upDateJiuQuHuangHeZhenLVComplete(_loc2_);
      }
   }
}

