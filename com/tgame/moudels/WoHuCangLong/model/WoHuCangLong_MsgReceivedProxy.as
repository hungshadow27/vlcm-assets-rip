package com.tgame.moudels.WoHuCangLong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.WoHuCangLong.view.WoHuCangLongResult_Mediator;
   import com.tgame.moudels.WoHuCangLong.view.WoHuCangLong_Mediator;
   import com.tgame.moudels.WoHuCangLong.view.info.WoHuCangLongVo;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WoHuCangLong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "WoHuCangLong_MsgReceivedProxy";
      
      private var _woHuCangLongMeditor:WoHuCangLong_Mediator;
      
      private var _resultMeditor:WoHuCangLongResult_Mediator;
      
      public function WoHuCangLong_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72752,72762,72772,72782],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72752,72762,72772,72782],NAME);
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
      
      private function get woHuCangLongMeditor() : WoHuCangLong_Mediator
      {
         if(!this._woHuCangLongMeditor)
         {
            this._woHuCangLongMeditor = facade.retrieveMediator(WoHuCangLong_Mediator.NAME) as WoHuCangLong_Mediator;
         }
         return this._woHuCangLongMeditor;
      }
      
      private function get resultMeditor() : WoHuCangLongResult_Mediator
      {
         if(!this._resultMeditor)
         {
            this._resultMeditor = facade.retrieveMediator(WoHuCangLongResult_Mediator.NAME) as WoHuCangLongResult_Mediator;
         }
         return this._resultMeditor;
      }
      
      public function received_72752(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("72752\t\t返回卧虎藏龙信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:WoHuCangLongVo = new WoHuCangLongVo();
         _loc3_.playerArr = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.index = param1.readByte();
            _loc5_.name = param1.readUTF();
            _loc5_.pingTai = param1.readInt();
            _loc5_.quFu = param1.readInt();
            _loc6_ = param1.readByte();
            _loc5_.equipArr = [];
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc5_.equipArr.push(param1.readInt());
               _loc7_++;
            }
            _loc5_.partyID = param1.readByte();
            _loc3_.playerArr.push(_loc5_);
            _loc4_++;
         }
         _loc3_.touXian = param1.readUTF();
         _loc3_.paiMing = param1.readInt();
         _loc3_.weiWang = param1.readInt();
         _loc3_.shengLv = param1.readInt();
         _loc3_.gongXun = param1.readInt();
         _loc3_.winCount = param1.readInt();
         _loc3_.sumCount = param1.readInt();
         _loc3_.jiangLiCount = param1.readInt();
         _loc3_.sumJiangLiCount = param1.readInt();
         _loc3_.haveSkill1 = param1.readByte() == 1;
         _loc3_.skillId1 = param1.readInt();
         _loc3_.skillLevel1 = param1.readInt();
         _loc3_.skillNeed1 = param1.readInt();
         _loc3_.haveSkill2 = param1.readByte() == 1;
         _loc3_.skillId2 = param1.readInt();
         _loc3_.skillLevel2 = param1.readInt();
         _loc3_.skillNeed2 = param1.readInt();
         _loc3_.isWaiting = param1.readByte();
         this.woHuCangLongMeditor.setWoHuCangLongPanel(_loc3_);
      }
      
      public function received_72762(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("72762\t\t返回头衔数据信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:Array = [];
         var _loc7_:int = param1.readByte();
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc9_ = new Object();
            _loc9_.touxian = param1.readUTF();
            _loc9_.weiwang = param1.readInt();
            _loc9_.jinpiao = param1.readInt();
            _loc6_.push(_loc9_);
            _loc8_++;
         }
         this.woHuCangLongMeditor.setTouXianPanel(_loc6_,_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_72772(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("72772\t\t返回排行榜信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = param1.readByte();
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = new Object();
            _loc8_.paiming = param1.readInt();
            _loc8_.name = param1.readUTF();
            _loc8_.pingtai = param1.readInt();
            _loc8_.touxian = param1.readUTF();
            _loc8_.weiwang = param1.readInt();
            _loc8_.shenglv = param1.readInt();
            _loc5_.push(_loc8_);
            _loc7_++;
         }
         this.woHuCangLongMeditor.setPaiHangBangPanel(_loc2_,_loc3_,_loc5_,_loc4_);
      }
      
      public function received_72782(param1:ByteArray) : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:Object = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         ZLog.add("72782\t\t返回卧虎藏龙对战结果");
         var _loc2_:Boolean = param1.readByte() == 1;
         if(_loc2_)
         {
            _loc3_ = param1.readUTF();
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            _loc6_ = param1.readByte();
            _loc7_ = [];
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc9_ = new Object();
               _loc9_.name = param1.readUTF();
               _loc9_.level = param1.readInt();
               _loc9_.weiWang = param1.readInt();
               _loc9_.gongXun = param1.readInt();
               _loc9_.chouHenZhi = param1.readInt();
               _loc9_.menPai = param1.readByte();
               _loc9_.goodsArr = [];
               _loc10_ = param1.readByte();
               _loc11_ = 0;
               while(_loc11_ < _loc10_)
               {
                  _loc9_.goodsArr.push(param1.readInt());
                  _loc11_++;
               }
               _loc7_.push(_loc9_);
               _loc8_++;
            }
         }
         if(_loc2_)
         {
            this.resultMeditor.showResultPanel(_loc3_,_loc4_,_loc5_,_loc7_);
         }
         else
         {
            this.resultMeditor.hidePanel();
         }
      }
   }
}

