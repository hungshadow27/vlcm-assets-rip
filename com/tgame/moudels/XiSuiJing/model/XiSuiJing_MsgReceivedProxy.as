package com.tgame.moudels.XiSuiJing.model
{
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.XiSuiJing.model.info.XiSuiJingVO;
   import com.tgame.moudels.XiSuiJing.view.XiSuiJing_Mediator;
   import com.tgame.moudels.XiSuiJing.view.XiSuiJing_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiSuiJing_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XiSuiJing_MsgReceivedProxy";
      
      private var mainCharXiSuiJingVO:XiSuiJingVO;
      
      private var targetCharXiSuiJingVO:XiSuiJingVO;
      
      private var _XiSuiJing_Mediator:XiSuiJing_Mediator;
      
      private var _targetMediator:XiSuiJing_TargetPanelMediator;
      
      public function XiSuiJing_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get xiSuiJing_Mediator() : XiSuiJing_Mediator
      {
         if(!this._XiSuiJing_Mediator)
         {
            this._XiSuiJing_Mediator = facade.retrieveMediator(XiSuiJing_Mediator.NAME) as XiSuiJing_Mediator;
         }
         return this._XiSuiJing_Mediator;
      }
      
      private function get targetPlaneMediator() : XiSuiJing_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XiSuiJing_TargetPanelMediator.NAME) as XiSuiJing_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([51992,51994,51996,51998],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([51992,51994,51996,51998],NAME);
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
      
      public function received_51992(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("51992：洗髓经面板信息接收");
         if(!this.mainCharXiSuiJingVO)
         {
            this.mainCharXiSuiJingVO = new XiSuiJingVO();
         }
         this.mainCharXiSuiJingVO.nowID = param1.readInt();
         this.mainCharXiSuiJingVO.nowLookingID = param1.readInt();
         this.mainCharXiSuiJingVO.nowLookingName = param1.readUTF();
         this.mainCharXiSuiJingVO.isKnow = param1.readByte() == 0 ? false : true;
         this.mainCharXiSuiJingVO.act = param1.readInt();
         this.mainCharXiSuiJingVO.def = param1.readInt();
         this.mainCharXiSuiJingVO.hp = param1.readInt();
         this.mainCharXiSuiJingVO.mp = param1.readInt();
         this.mainCharXiSuiJingVO.cp = param1.readInt();
         var _loc2_:int = param1.readByte();
         this.mainCharXiSuiJingVO.otherSkillNameArr = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            this.mainCharXiSuiJingVO.otherSkillNameArr.push([new Skill(_loc4_),_loc5_]);
            _loc3_++;
         }
         this.mainCharXiSuiJingVO.miaoshu = param1.readUTF();
         this.mainCharXiSuiJingVO.jihuoJindu = param1.readInt();
         this.mainCharXiSuiJingVO.addJihuoGongji = param1.readInt();
         this.mainCharXiSuiJingVO.addJihuoFangyu = param1.readInt();
         this.mainCharXiSuiJingVO.addJihuoShengming = param1.readInt();
         this.mainCharXiSuiJingVO.isUseDan = Boolean(param1.readByte() == 1);
         this.mainCharXiSuiJingVO.isDouble = Boolean(param1.readByte() == 1);
         this.mainCharXiSuiJingVO.isDamo = Boolean(param1.readByte() == 1);
         this.mainCharXiSuiJingVO.isZuoQi = Boolean(param1.readByte() == 1);
         this.mainCharXiSuiJingVO.isDanTian = Boolean(param1.readByte() == 1);
         this.xiSuiJing_Mediator.upDataPanel(this.mainCharXiSuiJingVO);
         this.xiSuiJing_Mediator.upDataXisuijingJindu(this.mainCharXiSuiJingVO);
      }
      
      public function received_51994(param1:ByteArray) : void
      {
         ZLog.add("51994：洗髓经升级查询返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:String = param1.readUTF();
         var _loc9_:String = param1.readUTF();
         this.xiSuiJing_Mediator.upDataYiJinJignLV(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_51996(param1:ByteArray) : void
      {
         ZLog.add("51996：洗髓经成功失败");
         var _loc2_:int = param1.readByte();
         this.xiSuiJing_Mediator.upDataYiJinJignLVComplete(_loc2_);
      }
      
      public function received_51998(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         ZLog.add("51998：他人洗髓经面板信息接收");
         var _loc2_:int = param1.readInt();
         if(!this.targetCharXiSuiJingVO)
         {
            this.targetCharXiSuiJingVO = new XiSuiJingVO();
         }
         this.targetCharXiSuiJingVO.nowID = param1.readInt();
         this.targetCharXiSuiJingVO.nowLookingID = this.targetCharXiSuiJingVO.nowID;
         this.targetCharXiSuiJingVO.nowLookingName = param1.readUTF();
         this.targetCharXiSuiJingVO.isKnow = true;
         this.targetCharXiSuiJingVO.act = param1.readInt();
         this.targetCharXiSuiJingVO.def = param1.readInt();
         this.targetCharXiSuiJingVO.hp = param1.readInt();
         this.targetCharXiSuiJingVO.mp = param1.readInt();
         this.targetCharXiSuiJingVO.cp = param1.readInt();
         var _loc3_:int = param1.readByte();
         this.targetCharXiSuiJingVO.otherSkillNameArr = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            this.targetCharXiSuiJingVO.otherSkillNameArr.push([new Skill(_loc5_),_loc6_]);
            _loc4_++;
         }
         this.targetCharXiSuiJingVO.miaoshu = param1.readUTF();
         this.targetCharXiSuiJingVO.jihuoJindu = param1.readInt();
         this.targetCharXiSuiJingVO.addJihuoGongji = param1.readInt();
         this.targetCharXiSuiJingVO.addJihuoFangyu = param1.readInt();
         this.targetCharXiSuiJingVO.addJihuoShengming = param1.readInt();
         this.targetCharXiSuiJingVO.isUseDan = Boolean(param1.readByte() == 1);
         this.targetCharXiSuiJingVO.isDouble = Boolean(param1.readByte() == 1);
         this.targetCharXiSuiJingVO.isDamo = Boolean(param1.readByte() == 1);
         this.targetCharXiSuiJingVO.isZuoQi = Boolean(param1.readByte() == 1);
         this.targetCharXiSuiJingVO.isDanTian = Boolean(param1.readByte() == 1);
         this.targetPlaneMediator.upDataPanel(_loc2_,this.targetCharXiSuiJingVO);
         this.targetPlaneMediator.upDataXisuijingJindu(this.targetCharXiSuiJingVO);
      }
   }
}

