package com.tgame.moudels.yuanwu.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yuanwu.view.YuanwuHeXin_Mediator;
   import com.tgame.moudels.yuanwu.view.Yuanwu_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Yuanwu_ReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Yuanwu_ReceivedProxy";
      
      private var _mediator:Yuanwu_Mediator;
      
      private var _mediator2:YuanwuHeXin_Mediator;
      
      public function Yuanwu_ReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([83060,83034,83036,83038,83040,83052,83054,83058],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([83060,83034,83036,83038,83040,83052,83054,83058],NAME);
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
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_83060(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         ZLog.add("83060:返回元武主界面信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Object = {};
         _loc3_.len = _loc2_.readInt();
         _loc3_.arr = [];
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_.len)
         {
            _loc4_ = [];
            _loc4_.push(_loc2_.readInt());
            _loc4_.push(_loc2_.readInt());
            _loc4_.push(_loc2_.readInt());
            _loc4_.push(_loc2_.readInt());
            _loc3_.arr.push(_loc4_);
            _loc5_++;
         }
         _loc3_.len = _loc2_.readInt();
         _loc3_.arrSkill = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_.len)
         {
            _loc3_.arrSkill.push([_loc2_.readInt(),_loc2_.readInt()]);
            _loc5_++;
         }
         _loc3_.juexingLv = _loc2_.readInt();
         _loc3_.juexingMin = _loc2_.readInt();
         _loc3_.juexingMax = _loc2_.readInt();
         _loc3_.juexingStr = _loc2_.readUTF();
         _loc3_.zongShuxing = [];
         var _loc6_:Number = 0;
         _loc3_.len = _loc2_.readInt();
         _loc5_ = 0;
         while(_loc5_ < 8)
         {
            _loc6_ = 0;
            _loc6_ = _loc2_.readDouble();
            _loc3_.zongShuxing.push(_loc6_);
            _loc5_++;
         }
         _loc3_.yeshu = _loc2_.readInt();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:String = _loc2_.readUTF();
         _loc3_.hexinDJ = _loc2_.readInt();
         _loc3_.vip_level = _loc2_.readInt();
         if(_loc7_ == GameInstance.mainChar.id)
         {
            this.mediator.setData(_loc3_);
         }
         else
         {
            this.mediator.setTargetData(_loc3_);
         }
      }
      
      public function received_83034(param1:ByteArray) : void
      {
         ZLog.add("83034:返回元武培养信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Object = {};
         _loc3_.id = _loc2_.readInt();
         _loc3_.post = _loc2_.readInt();
         _loc3_.lv = _loc2_.readInt();
         _loc3_.len = _loc2_.readInt();
         _loc3_.arr = [];
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.len)
         {
            _loc4_ = _loc2_.readDouble();
            _loc3_.arr.push(_loc4_);
            _loc5_++;
         }
         _loc3_.min = _loc2_.readInt();
         _loc3_.max = _loc2_.readInt();
         _loc3_.corMin = _loc2_.readInt();
         _loc3_.corMax = _loc2_.readInt();
         _loc3_.goodsId = _loc2_.readInt();
         _loc3_.count = _loc2_.readInt();
         _loc3_.chongshengshuliang = _loc2_.readInt();
         _loc3_.quality = _loc2_.readInt();
         this.mediator.showPeiyangPanel(_loc3_);
      }
      
      private function get mediator() : Yuanwu_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(Yuanwu_Mediator.NAME) as Yuanwu_Mediator;
         }
         return this._mediator;
      }
      
      private function get mediator2() : YuanwuHeXin_Mediator
      {
         if(!this._mediator2)
         {
            this._mediator2 = facade.retrieveMediator(YuanwuHeXin_Mediator.NAME) as YuanwuHeXin_Mediator;
         }
         return this._mediator2;
      }
      
      public function received_83036(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("83036:返回元武重生结果||元武附加技能信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Array = [];
         _loc5_ = {};
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc5_ = {};
            _loc5_.skillId = _loc2_.readInt();
            _loc5_.skillMin = _loc2_.readInt();
            _loc5_.skillMax = _loc2_.readInt();
            _loc5_.skillType = _loc2_.readInt();
            _loc5_.type = _loc2_.readInt();
            if(_loc3_ < 3)
            {
               _loc5_.visible = false;
            }
            else
            {
               _loc5_.visible = true;
            }
            _loc5_.suoding = _loc2_.readBoolean();
            _loc4_.push(_loc5_);
            _loc6_++;
         }
         this.mediator.chongshengUpdata(_loc4_);
      }
      
      public function received_83038(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         ZLog.add("83038:返回装备信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Array = [];
         _loc5_ = {};
         _loc5_.arr = [];
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = [];
            _loc4_.push(_loc2_.readInt());
            _loc4_.push(_loc2_.readInt());
            _loc4_.push(_loc2_.readInt());
            _loc4_.push(_loc2_.readInt());
            _loc5_.arr.push(_loc4_);
            _loc6_++;
         }
         _loc5_.yeshu = _loc2_.readInt();
         _loc5_.juexingType = _loc2_.readInt();
         _loc5_.juexingStr = _loc2_.readUTF();
         _loc5_.zongShuxing = [];
         var _loc7_:Number = 0;
         _loc5_.len = _loc2_.readInt();
         _loc6_ = 0;
         while(_loc6_ < 8)
         {
            _loc7_ = 0;
            _loc7_ = _loc2_.readDouble();
            _loc5_.zongShuxing.push(_loc7_);
            _loc6_++;
         }
         this.mediator.setZhuangbei(_loc5_);
      }
      
      public function received_83040(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Buff = null;
         ZLog.add("元武觉醒BUFF特效，//其他玩家视野");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = _loc2_.readInt();
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         if(_loc5_ != null)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc8_ = new Buff(_loc5_[_loc6_]);
               _loc6_++;
            }
         }
      }
      
      public function received_83052(param1:ByteArray) : void
      {
         var _loc6_:Number = NaN;
         ZLog.add("返回核心面板信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Object = {};
         _loc3_.type = _loc2_.readInt();
         _loc3_.lv = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            _loc6_ = _loc2_.readDouble();
            _loc5_.push(_loc6_);
            _loc7_++;
         }
         _loc3_.arr = _loc5_;
         this.mediator2.setData(_loc3_);
      }
      
      public function received_83054(param1:ByteArray) : void
      {
         ZLog.add("返回突破信息");
         var _loc2_:Object = {};
         var _loc3_:ByteArray = param1;
         _loc2_.type = _loc3_.readInt();
         _loc2_.isTupo = _loc3_.readBoolean();
         _loc2_.isTupoChenggong = _loc3_.readBoolean();
         if(_loc2_.isTupo)
         {
            _loc2_.goods = _loc3_.readInt();
            _loc2_.count = _loc3_.readInt();
            _loc2_.chenggonglv = _loc3_.readInt();
            _loc2_.time = _loc3_.readDouble();
            _loc2_.cur = _loc3_.readInt();
            _loc2_.max = _loc3_.readInt();
         }
         else
         {
            _loc2_.goods = _loc3_.readInt();
            _loc2_.count = _loc3_.readInt();
            _loc2_.curCor = _loc3_.readInt();
            _loc2_.maxCor = _loc3_.readInt();
         }
         this.mediator2.setDataInfo(_loc2_);
      }
      
      public function received_83058(param1:ByteArray) : void
      {
         var _loc10_:int = 0;
         ZLog.add("83058:元武装备介绍属性");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:Array = ["攻击：","防御：","暴伤：","闪避：","生命：","暴抗：","暴击：","威压："];
         var _loc7_:Array = [];
         var _loc8_:String = "";
         var _loc9_:int = 0;
         while(_loc9_ < _loc5_)
         {
            _loc8_ = "";
            _loc10_ = 0;
            while(_loc10_ < 5)
            {
               _loc8_ += _loc6_[_loc10_] + _loc2_.readDouble() + "\n";
               _loc10_++;
            }
            _loc7_.push(_loc8_);
            _loc9_++;
         }
         this.mediator.shuxingsetDataPanel(_loc3_,_loc4_,_loc7_);
      }
   }
}

