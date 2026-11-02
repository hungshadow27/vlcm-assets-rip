package com.tgame.moudels.chiBang.model
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.chiBang.model.info.ChiBangVo;
   import com.tgame.moudels.chiBang.view.ChiBang_MainMediator;
   import com.tgame.moudels.chiBang.view.ChiBang_TargetMediator;
   import com.tgame.moudels.chiBang.view.ChiBang_changjingMediator;
   import com.tgame.moudels.chiBang.view.XinMo_mediator;
   import com.tgame.moudels.chiBang.view.YuLingHeCheng_mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChiBang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ChiBang_MsgReceivedProxy";
      
      private var _main_Mediator:ChiBang_MainMediator;
      
      private var _target_Mediator:ChiBang_TargetMediator;
      
      private var _heCheng_Mediator:YuLingHeCheng_mediator;
      
      private var _chiBang_changjingMediator:ChiBang_changjingMediator;
      
      private var _xinMo_mediator:XinMo_mediator;
      
      public function ChiBang_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61702,61704,61706,61732,61734,61782,61784,61786,61788,61752],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61702,61704,61706,61732,61734,61782,61784,61786,61788,61752],NAME);
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
      
      public function get main_Mediator() : ChiBang_MainMediator
      {
         if(!this._main_Mediator)
         {
            this._main_Mediator = facade.retrieveMediator(ChiBang_MainMediator.NAME) as ChiBang_MainMediator;
         }
         return this._main_Mediator;
      }
      
      public function get target_Mediator() : ChiBang_TargetMediator
      {
         if(!this._target_Mediator)
         {
            this._target_Mediator = facade.retrieveMediator(ChiBang_TargetMediator.NAME) as ChiBang_TargetMediator;
         }
         return this._target_Mediator;
      }
      
      public function get heCheng_Mediator() : YuLingHeCheng_mediator
      {
         if(!this._heCheng_Mediator)
         {
            this._heCheng_Mediator = facade.retrieveMediator(YuLingHeCheng_mediator.NAME) as YuLingHeCheng_mediator;
         }
         return this._heCheng_Mediator;
      }
      
      public function get chiBang_changjingMediator() : ChiBang_changjingMediator
      {
         if(!this._chiBang_changjingMediator)
         {
            this._chiBang_changjingMediator = facade.retrieveMediator(ChiBang_changjingMediator.NAME) as ChiBang_changjingMediator;
         }
         return this._chiBang_changjingMediator;
      }
      
      public function get xinMo_mediator() : XinMo_mediator
      {
         if(!this._xinMo_mediator)
         {
            this._xinMo_mediator = facade.retrieveMediator(XinMo_mediator.NAME) as XinMo_mediator;
         }
         return this._xinMo_mediator;
      }
      
      public function received_61702(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("61702: 返回玩家翅膀详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:ChiBangVo = new ChiBangVo();
         _loc3_.userID = _loc2_;
         _loc3_.lookId = param1.readByte();
         _loc3_.nowId = param1.readByte();
         _loc3_.goodsName = param1.readUTF();
         _loc3_.sum = param1.readByte();
         _loc3_.nameArr = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.sum)
         {
            _loc5_ = new Object();
            _loc5_.name = param1.readUTF();
            _loc5_.miaoshu = param1.readUTF();
            _loc3_.nameArr.push(_loc5_);
            _loc4_++;
         }
         _loc3_.shengMing = param1.readInt();
         _loc3_.maxShengMing = param1.readInt();
         _loc3_.tiLi = param1.readInt();
         _loc3_.maxTiLi = param1.readInt();
         _loc3_.gongJi = param1.readInt();
         _loc3_.maxGongJi = param1.readInt();
         _loc3_.fangYu = param1.readInt();
         _loc3_.maxFangYu = param1.readInt();
         _loc3_.baoJi = param1.readInt();
         _loc3_.maxBaoJi = param1.readInt();
         _loc3_.shanBi = param1.readInt();
         _loc3_.maxShanBi = param1.readInt();
         _loc3_.skillId = param1.readInt();
         _loc3_.isLearned = param1.readByte() == 1;
         _loc3_.skillId2 = param1.readInt();
         _loc3_.isLearned2 = param1.readByte() == 1;
         _loc3_.isShow = param1.readByte() == 1;
         if(_loc2_ == -1)
         {
            this.main_Mediator.setChiBang(_loc3_);
         }
         else
         {
            this.target_Mediator.setChiBang(_loc3_);
         }
      }
      
      public function received_61704(param1:ByteArray) : void
      {
         ZLog.add("61704: 返回翅膀突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.main_Mediator.setTupoPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_61706(param1:ByteArray) : void
      {
         ZLog.add("61706: 返回突破翅膀结果");
         var _loc2_:int = param1.readByte();
         this.main_Mediator.setTupoResult(_loc2_);
      }
      
      public function received_61732(param1:ByteArray) : void
      {
         ZLog.add("61732\t\t羽灵合成信息返回");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         this.heCheng_Mediator.setPanel(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_61734(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         ZLog.add("61734\t\t羽灵合成结果");
         SmallLoadingBar.close();
         this.heCheng_Mediator.removeLoaderBuff();
         var _loc2_:int = param1.readByte();
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < 3)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            if(_loc6_ == 0 || _loc7_ == 0)
            {
               _loc3_[_loc4_] = null;
            }
            else
            {
               _loc8_ = new Goods(_loc6_);
               _loc8_.count = _loc7_;
               _loc3_[_loc4_] = _loc8_;
            }
            _loc4_++;
         }
         var _loc5_:int = param1.readShort();
         _loc3_[_loc3_.length] = _loc5_;
         this.heCheng_Mediator.upDataItem(_loc2_,_loc3_);
      }
      
      public function received_61782(param1:ByteArray) : void
      {
         ZLog.add("61782\t\t上飞延迟");
         var _loc2_:int = param1.readByte();
         SmallLoadingBar.showLoading(LanResManager.getLanCommonTextWords("正在飞行"),_loc2_ * 1000);
      }
      
      public function received_61784(param1:ByteArray) : void
      {
         ZLog.add("61784\t\t上飞是否成功");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         if(!_loc3_)
         {
         }
      }
      
      public function received_61786(param1:ByteArray) : void
      {
         ZLog.add("61786\t\t飞行换装");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:int = param1.readInt();
         this.chiBang_changjingMediator.feixingHuanzhuang(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_61788(param1:ByteArray) : void
      {
         ZLog.add("61788\t\t下飞是否成功");
         var _loc2_:int = param1.readByte();
         if(!_loc2_)
         {
         }
      }
      
      public function received_61752(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("61752\t\t返回心魔数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = new Object();
            _loc6_.shijian = param1.readUTF();
            _loc6_.didian = param1.readUTF();
            _loc6_.name = param1.readUTF();
            _loc6_.jisha = param1.readUTF();
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         this.xinMo_mediator.setInitialize(_loc3_,_loc5_);
      }
   }
}

