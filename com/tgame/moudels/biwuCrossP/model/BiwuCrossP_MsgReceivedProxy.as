package com.tgame.moudels.biwuCrossP.model
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.biwuCrossP.view.BiwuCrossP_Mediator;
   import com.tgame.moudels.biwuCrossP.view.YNXiangyangzhanchangRank_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BiwuCrossP_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "BiwuCrossP_MsgReceivedProxy";
      
      private static const pingtaiArr:Array = [[106,LanResManager.getLanCommonTextWords("越南正式服")],[108,LanResManager.getLanCommonTextWords("越南-绿色版")],[110,LanResManager.getLanCommonTextWords("越南szm")],[111,LanResManager.getLanCommonTextWords("越南zp")],[112,LanResManager.getLanCommonTextWords("越南yahoo")]];
      
      private var strUnknown:String = LanResManager.getLanCommonTextWords("未知");
      
      private var _biwuCrossPMediator:BiwuCrossP_Mediator;
      
      private var _ynXiangyangRankMediator:YNXiangyangzhanchangRank_Mediator;
      
      private var _msgSender:BiwuCrossP_MsgSenderProxy;
      
      public function BiwuCrossP_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([55552,55556,55558,55562,55564,55580,55582],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([55552,55556,55558,55562,55564,55580,55582],NAME);
      }
      
      private function get biwuCrossPMediator() : BiwuCrossP_Mediator
      {
         if(this._biwuCrossPMediator == null)
         {
            this._biwuCrossPMediator = facade.retrieveMediator(BiwuCrossP_Mediator.NAME) as BiwuCrossP_Mediator;
         }
         return this._biwuCrossPMediator;
      }
      
      private function get ynXiangyangRankMediator() : YNXiangyangzhanchangRank_Mediator
      {
         if(this._ynXiangyangRankMediator == null)
         {
            this._ynXiangyangRankMediator = facade.retrieveMediator(YNXiangyangzhanchangRank_Mediator.NAME) as YNXiangyangzhanchangRank_Mediator;
         }
         return this._ynXiangyangRankMediator;
      }
      
      private function get msgSender() : BiwuCrossP_MsgSenderProxy
      {
         if(this._msgSender == null)
         {
            this._msgSender = facade.retrieveProxy(BiwuCrossP_MsgSenderProxy.NAME) as BiwuCrossP_MsgSenderProxy;
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
      
      public function received_55576(param1:ByteArray) : void
      {
         ZLog.add("55576：倒计时同步");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         this.biwuCrossPMediator.downTimeFun(_loc2_,_loc3_);
      }
      
      public function received_55552(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         ZLog.add("55552：请求32强列表返回");
         var _loc2_:Array = [LanResManager.getLanCommonTextWords("天闲组"),LanResManager.getLanCommonTextWords("天勇组"),LanResManager.getLanCommonTextWords("天雄组"),LanResManager.getLanCommonTextWords("天猛组"),LanResManager.getLanCommonTextWords("天威组"),LanResManager.getLanCommonTextWords("天英组"),LanResManager.getLanCommonTextWords("天贵组"),LanResManager.getLanCommonTextWords("天富组"),LanResManager.getLanCommonTextWords("天满组"),LanResManager.getLanCommonTextWords("天孤组"),LanResManager.getLanCommonTextWords("天伤组"),LanResManager.getLanCommonTextWords("天立组"),LanResManager.getLanCommonTextWords("天捷组"),LanResManager.getLanCommonTextWords("天暗组"),LanResManager.getLanCommonTextWords("天佑组"),LanResManager.getLanCommonTextWords("天空组"),LanResManager.getLanCommonTextWords("天速组"),LanResManager.getLanCommonTextWords("天异组"),LanResManager.getLanCommonTextWords("天杀组"),LanResManager.getLanCommonTextWords("天微组"),LanResManager.getLanCommonTextWords("天究组"),LanResManager.getLanCommonTextWords("天退组"),LanResManager.getLanCommonTextWords("天寿组")
         ,LanResManager.getLanCommonTextWords("天剑组"),LanResManager.getLanCommonTextWords("天平组"),LanResManager.getLanCommonTextWords("天罪组"),LanResManager.getLanCommonTextWords("天巧组"),LanResManager.getLanCommonTextWords("天牢组"),LanResManager.getLanCommonTextWords("天慧组"),LanResManager.getLanCommonTextWords("天暴组"),LanResManager.getLanCommonTextWords("天魁组"),LanResManager.getLanCommonTextWords("天罡组")];
         var _loc3_:Object = {};
         _loc3_.count = param1.readByte();
         if(_loc3_.count == 0)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            return;
         }
         _loc3_.shangbang = param1.readByte() < 1 ? 0 : 1;
         _loc3_.lingjiang = param1.readByte();
         var _loc4_:int = param1.readByte();
         _loc3_.r = [];
         if(_loc4_ == 0)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            return;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = {};
            _loc6_.pingtai = param1.readInt();
            _loc6_.qufu = param1.readUTF();
            _loc6_.id = param1.readInt();
            _loc7_ = param1.readByte();
            _loc6_.xiaozu = _loc2_[_loc7_ - 1];
            _loc6_.pingtaiCN = "";
            _loc8_ = 0;
            while(_loc8_ < pingtaiArr.length)
            {
               if(pingtaiArr[_loc8_][0] == _loc6_.pingtai)
               {
                  _loc6_.pingtaiCN = pingtaiArr[_loc8_][1];
               }
               _loc8_++;
            }
            if(_loc6_.pingtaiCN == "")
            {
               _loc6_.pingtaiCN = this.strUnknown;
            }
            if(_loc6_.xiaozu == undefined)
            {
               _loc6_.xiaozu = LanResManager.getLanCommonTextWords("无此组");
            }
            _loc6_.name = param1.readUTF();
            _loc9_ = param1.readInt();
            _loc6_.zhanchang = _loc9_ == 0 ? LanResManager.getLanCommonTextWords("无地图") : MapTransManager.getMapRes(_loc9_).name;
            _loc6_.shijian = param1.readUTF();
            _loc6_.zhuangtai = param1.readByte();
            _loc6_.dengji = param1.readShort();
            _loc6_.zhandouli = param1.readDouble();
            _loc6_.zhuweicishu = param1.readShort();
            _loc6_.isLiang = param1.readByte();
            _loc3_.r.push(_loc6_);
            _loc5_++;
         }
         this.biwuCrossPMediator.setBiWuDaHuiList32(_loc3_);
      }
      
      public function received_55556(param1:ByteArray) : void
      {
         ZLog.add("55556：助威返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         this.biwuCrossPMediator.setBiWuDaHuiZhuWeiComplete(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_55558(param1:ByteArray) : void
      {
         ZLog.add("55558：领奖返回");
         var _loc2_:int = param1.readByte();
         this.biwuCrossPMediator.setBiWuDaHuiGiftComplete(_loc2_);
      }
      
      public function received_55564(param1:ByteArray) : void
      {
         ZLog.add("55564：比赛日期返回");
         var _loc2_:Object = {};
         _loc2_.rule = param1.readUTF();
         _loc2_.goodId = param1.readInt();
         _loc2_.time = param1.readUTF();
         _loc2_.pingtai = param1.readUTF();
         this.biwuCrossPMediator.setData(_loc2_);
      }
      
      public function received_55580(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         ZLog.add("55580：请求历史战况列表返回");
         var _loc2_:Object = {};
         _loc2_.count = param1.readByte();
         if(_loc2_.count == 0)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            return;
         }
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         _loc2_.panelNo = _loc3_;
         _loc2_.r = [];
         if(_loc4_ == 0)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            return;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = {};
            _loc6_.time = param1.readUTF();
            _loc6_.join = param1.readUTF();
            _loc7_ = "";
            if(_loc6_.join != "")
            {
               _loc9_ = _loc6_.join.split(",");
               _loc10_ = 0;
               while(_loc10_ < _loc9_.length)
               {
                  _loc8_ = 0;
                  while(_loc8_ < pingtaiArr.length)
                  {
                     if(pingtaiArr[_loc8_][0] == _loc9_[_loc10_])
                     {
                        _loc7_ += "【" + pingtaiArr[_loc8_][1] + "】VS";
                     }
                     _loc8_++;
                  }
                  if(_loc7_.indexOf("VS") == 0)
                  {
                     _loc7_ = "【" + this.strUnknown + "】";
                  }
                  _loc10_++;
               }
            }
            if(_loc7_.indexOf("VS") != -1)
            {
               _loc7_ = _loc7_.substr(0,_loc7_.length - 2);
            }
            _loc6_.joinCN = _loc7_;
            _loc6_.winCN = "";
            _loc6_.win = param1.readInt();
            _loc8_ = 0;
            while(_loc8_ < pingtaiArr.length)
            {
               if(pingtaiArr[_loc8_][0] == _loc6_.win)
               {
                  _loc6_.winCN += pingtaiArr[_loc8_][1];
               }
               _loc8_++;
            }
            if(_loc6_.winCN == "")
            {
               _loc6_.winCN = this.strUnknown;
            }
            _loc6_.name = param1.readUTF();
            _loc2_.r.push(_loc6_);
            _loc5_++;
         }
         this.biwuCrossPMediator.setBiWuDaHuiHistoryList(_loc2_);
      }
      
      public function received_55562(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         ZLog.add("55562：請求對陣圖返回");
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
            _loc6_ = param1.readInt();
            _loc7_ = param1.readUTF();
            _loc8_ = param1.readUTF();
            _loc9_ = param1.readByte();
            _loc10_ = param1.readInt();
            if(_loc8_ == "")
            {
               _loc2_.beat32.push([_loc8_,false,32,_loc6_,_loc7_,_loc10_,0]);
            }
            else
            {
               _loc2_.beat32.push([_loc8_,false,_loc9_,_loc6_,_loc7_,_loc10_,_loc5_]);
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
         _loc2_.no1 = ["",false,2,0,"0",0];
         _loc2_.no2 = ["",false,2,0,"0",0];
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
         _loc2_.no3 = ["",false,3,0,"0",0];
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
         this.biwuCrossPMediator.setDatas(_loc2_);
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
            param4.push(["",false,param1 / 2,0,"0",0]);
         }
      }
      
      private function clone(param1:Object) : *
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      public function received_55582(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("55582：越南返回 襄阳战场排行榜 信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc8_ = new Object();
            _loc8_.index = _loc4_ + 1;
            _loc8_.type = 1;
            _loc8_.name = param1.readUTF();
            _loc8_.count = param1.readInt();
            _loc3_.push(_loc8_);
            _loc4_++;
         }
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readByte();
         this.ynXiangyangRankMediator.setData(_loc3_,_loc5_,_loc6_,_loc7_);
      }
   }
}

