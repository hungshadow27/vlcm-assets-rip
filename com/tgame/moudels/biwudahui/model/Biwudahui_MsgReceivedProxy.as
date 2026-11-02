package com.tgame.moudels.biwudahui.model
{
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.biwudahui.view.Biwudahui_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Biwudahui_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Biwudahui_MsgReceivedProxy";
      
      private var _biwudahuiMediator:Biwudahui_Mediator;
      
      private var _msgSender:Biwudahui_MsgSenderProxy;
      
      public function Biwudahui_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53862,53874,53876,53878,53880],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53862,53874,53876,53878,53880],NAME);
      }
      
      private function get biwudahuiMediator() : Biwudahui_Mediator
      {
         if(this._biwudahuiMediator == null)
         {
            this._biwudahuiMediator = facade.retrieveMediator(Biwudahui_Mediator.NAME) as Biwudahui_Mediator;
         }
         return this._biwudahuiMediator;
      }
      
      private function get msgSender() : Biwudahui_MsgSenderProxy
      {
         if(this._msgSender == null)
         {
            this._msgSender = facade.retrieveProxy(Biwudahui_MsgSenderProxy.NAME) as Biwudahui_MsgSenderProxy;
         }
         return this._msgSender;
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
      
      public function received_53874(param1:ByteArray) : void
      {
         ZLog.add("53874：隐藏或者显示 自动挂机 按钮");
         var _loc2_:int = param1.readByte();
         this.biwudahuiMediator.showAutoBtn(Boolean(_loc2_));
      }
      
      public function received_53876(param1:ByteArray) : void
      {
         ZLog.add("53876：倒计时同步");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         this.biwudahuiMediator.downTimeFun(_loc2_,_loc3_);
      }
      
      public function received_53862(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         ZLog.add("53862：請求對陣圖返回");
         var _loc2_:Object = {};
         _loc2_.beat32 = [];
         _loc2_.beat16 = [];
         _loc2_.beat8 = [];
         _loc2_.beat4 = [];
         _loc2_.beat2 = [];
         var _loc3_:int = 0;
         var _loc4_:int = param1.readByte();
         _loc2_.time16 = param1.readUTF().replace(/^201[0-9]-/ig,"");
         _loc2_.time8 = param1.readUTF().replace(/^201[0-9]-/ig,"");
         _loc2_.time4 = param1.readUTF().replace(/^201[0-9]-/ig,"");
         _loc2_.time3_4 = param1.readUTF().replace(/^201[0-9]-/ig,"");
         _loc2_.time1_2 = param1.readUTF().replace(/^201[0-9]-/ig,"");
         _loc3_ = 6;
         while(_loc3_ <= _loc4_)
         {
            param1.readUTF();
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < 32)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readUTF();
            _loc7_ = param1.readUTF();
            _loc8_ = param1.readByte();
            _loc9_ = param1.readInt();
            if(_loc7_ == "")
            {
               _loc2_.beat32.push([_loc7_,false,32,_loc5_,_loc6_,_loc9_]);
            }
            else
            {
               _loc2_.beat32.push([_loc7_,false,_loc8_,_loc5_,_loc6_,_loc9_]);
            }
            if((_loc3_ + 1) % 2 == 0)
            {
               this.compareIt(32,_loc2_.beat32[_loc3_ - 1],_loc2_.beat32[_loc3_],_loc2_.beat16);
            }
            if((_loc3_ + 1) % 4 == 0)
            {
               this.compareIt(16,_loc2_.beat16[(_loc3_ + 1) / 2 - 2],_loc2_.beat16[(_loc3_ + 1) / 2 - 1],_loc2_.beat8);
            }
            if((_loc3_ + 1) % 8 == 0)
            {
               this.compareIt(8,_loc2_.beat8[(_loc3_ + 1) / 4 - 2],_loc2_.beat8[(_loc3_ + 1) / 4 - 1],_loc2_.beat4);
            }
            if((_loc3_ + 1) % 16 == 0)
            {
               this.compareIt(4,_loc2_.beat4[(_loc3_ + 1) / 8 - 2],_loc2_.beat4[(_loc3_ + 1) / 8 - 1],_loc2_.beat2);
            }
            _loc3_++;
         }
         _loc2_.no1 = ["",false,2,0,"0"];
         _loc2_.no2 = ["",false,2,0,"0"];
         if(_loc2_.beat2[1][2] == 1)
         {
            _loc2_.beat2[1][1] = true;
            _loc2_.no1 = _loc2_.beat2[1];
            _loc2_.no2 = _loc2_.beat2[0];
         }
         else if(_loc2_.beat2[0][2] == 1)
         {
            _loc2_.beat2[0][1] = true;
            _loc2_.no1 = _loc2_.beat2[0];
            _loc2_.no2 = _loc2_.beat2[1];
         }
         _loc2_.no3 = ["",false,3,0,"0"];
         _loc3_ = 0;
         while(_loc3_ < 4)
         {
            if(_loc2_.beat4[_loc3_][2] == 3)
            {
               _loc2_.no3 = _loc2_.beat4[_loc3_];
               break;
            }
            _loc3_++;
         }
         _loc2_.guanjunYuanbao = param1.readInt();
         _loc2_.yajunYuanbao = param1.readInt();
         this.biwudahuiMediator.setDatas(_loc2_);
      }
      
      private function compareIt(param1:int, param2:Array, param3:Array, param4:Array) : void
      {
         if(param2[2] < param3[2])
         {
            param3[1] = false;
            param2[1] = true;
            if(param2[2] <= param1)
            {
               param4.push(this.clone(param2));
               param4[param4.length - 1][1] = false;
            }
         }
         else if(param2[2] > param3[2])
         {
            param2[1] = false;
            param3[1] = true;
            if(param3[2] <= param1)
            {
               param4.push(this.clone(param3));
               param4[param4.length - 1][1] = false;
            }
         }
         else
         {
            param4.push(["",false,param1 / 2,0,"0"]);
         }
      }
      
      private function clone(param1:Object) : *
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      public function received_53878(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         ZLog.add("53878:比武大会结束 消息 返回");
         var _loc2_:Array = new Array();
         _loc2_.push(new Object());
         _loc2_.push(new Object());
         var _loc3_:int = param1.readByte();
         var _loc4_:Boolean = _loc3_ == 0 ? false : true;
         var _loc5_:int = -1;
         var _loc6_:String = "";
         if(_loc4_)
         {
            _loc5_ = param1.readShort();
            _loc6_ = param1.readUTF();
         }
         else
         {
            _loc6_ = param1.readUTF();
         }
         var _loc7_:int = param1.readInt();
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc9_ = _loc2_[_loc8_] as Object;
            _loc9_.id = param1.readInt();
            if(_loc4_)
            {
               _loc9_.pingtaiID = param1.readShort();
            }
            _loc9_.name = param1.readUTF();
            _loc9_.dengji = param1.readInt();
            _loc9_.zhandouli = param1.readDouble();
            _loc9_.xueliang = param1.readDouble();
            _loc9_.xueliangmax = param1.readDouble();
            _loc9_.fenshu = param1.readInt();
            _loc9_.xing = param1.readInt();
            _loc9_.isonline = param1.readByte();
            _loc10_ = param1.readInt();
            _loc9_.equipArr = [];
            _loc11_ = 0;
            _loc12_ = 0;
            while(_loc12_ < _loc10_)
            {
               _loc13_ = param1.readInt();
               _loc9_.equipArr[_loc9_.equipArr.length] = _loc13_;
               if(SpecialGoodsID.getSpecialAvatarType(_loc13_) > 0)
               {
                  _loc11_ = SpecialGoodsID.getSpecialAvatarType(_loc13_);
               }
               _loc12_++;
            }
            _loc9_.usingFashion = _loc11_;
            _loc9_.isOnMount = param1.readByte();
            if(_loc9_.isOnMount)
            {
               _loc9_.mountID = param1.readInt();
            }
            else
            {
               param1.readInt();
            }
            _loc9_.useAvatarType = param1.readInt();
            _loc9_.isFeixing = param1.readByte() == 1;
            _loc9_.isFeixing_huanzhuang_Id = param1.readByte();
            _loc9_.isFeixing_wuhun_Id = param1.readInt();
            _loc8_++;
         }
         this.biwudahuiMediator.showResultPanel(_loc2_[0] as Object,_loc2_[1] as Object,_loc6_,_loc5_);
      }
      
      public function received_53880(param1:ByteArray) : void
      {
         ZLog.add("53880:比武大会比分信息");
         var _loc2_:String = "";
         var _loc3_:int = 0;
         var _loc4_:String = "";
         var _loc5_:int = 0;
         var _loc6_:int = param1.readInt();
         if(_loc6_ == 0)
         {
            this.biwudahuiMediator.setScore(_loc2_,_loc3_,_loc4_,_loc5_);
            return;
         }
         _loc2_ = param1.readUTF();
         _loc3_ = param1.readInt();
         if(_loc6_ == 2)
         {
            _loc4_ = param1.readUTF();
            _loc5_ = param1.readInt();
         }
         this.biwudahuiMediator.setScore(_loc2_,_loc3_,_loc4_,_loc5_);
      }
   }
}

