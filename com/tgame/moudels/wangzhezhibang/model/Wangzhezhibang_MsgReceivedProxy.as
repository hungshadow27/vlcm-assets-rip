package com.tgame.moudels.wangzhezhibang.model
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.wangzhezhibang.model.info.WangzhezhibangVO;
   import com.tgame.moudels.wangzhezhibang.view.Wangzhezhibang_Mediator;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Wangzhezhibang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Wangzhezhibang_MsgReceivedProxy";
      
      private var _mediator:Wangzhezhibang_Mediator;
      
      public function Wangzhezhibang_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mediator() : Wangzhezhibang_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(Wangzhezhibang_Mediator.NAME) as Wangzhezhibang_Mediator;
         }
         return this._mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74542,74544,74546,74550,74552,74554,74556,74558,74560,74562,74564,74566,74568,74574,74576],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74542,74544,74546,74550,74552,74554,74556,74558,74560,74562,74564,74566,74568,74574,74576],NAME);
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
      
      public function received_74542(param1:ByteArray) : void
      {
         var _loc2_:WangzhezhibangVO = null;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         ZLog.add("74542: 返回王者之帮面板信息");
         _loc2_ = new WangzhezhibangVO();
         _loc2_.baomingBtn = param1.readByte();
         _loc2_.baomingTip = param1.readByte();
         _loc2_.bisaiBtn = param1.readByte();
         _loc2_.changci = param1.readByte();
         _loc2_.zhuweiTime = param1.readUTF();
         _loc2_.isHaveGuanjun = param1.readByte();
         if(_loc2_.isHaveGuanjun == 1)
         {
            _loc2_.name = param1.readUTF();
            _loc2_.count = param1.readInt();
            _loc2_.num = param1.readInt();
            _loc2_.zhan = param1.readDouble();
            _loc3_ = 0;
            while(_loc3_ < 5)
            {
               _loc4_ = new Object();
               _loc4_.name = param1.readUTF();
               _loc5_ = param1.readInt();
               _loc4_.equipArr = [];
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc4_.equipArr.push(param1.readInt());
                  _loc6_++;
               }
               _loc4_.zhiwu = param1.readByte();
               _loc4_.partyID = param1.readByte();
               _loc2_.playerArr.push(_loc4_);
               _loc3_++;
            }
            _loc2_.pingtaiID = param1.readInt();
         }
         this.mediator.setMainPanel(_loc2_);
      }
      
      public function received_74544(param1:ByteArray) : void
      {
         ZLog.add("74544: 返回报名结果");
         var _loc2_:int = param1.readByte();
         this.mediator.setMainBaomingSta(_loc2_);
      }
      
      public function received_74546(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc8_:Object = null;
         ZLog.add("74546: 返回对决流程图");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc8_ = new Object();
            _loc8_.riqi = param1.readUTF();
            _loc8_.kaishi = param1.readUTF();
            _loc8_.jieshu = param1.readUTF();
            _loc3_.push(_loc8_);
            _loc4_++;
         }
         var _loc5_:int = param1.readByte();
         var _loc6_:Array = [];
         var _loc7_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc8_ = new Object();
            _loc8_.isCanyu = Boolean(param1.readByte());
            if(_loc8_.isCanyu)
            {
               _loc8_.name = param1.readUTF();
               _loc8_.qufu = param1.readInt();
               _loc8_.pingtaiID = param1.readInt();
               _loc8_.shengli = Boolean(param1.readByte());
               _loc8_.guanjun = Boolean(param1.readByte());
            }
            else
            {
               _loc8_.name = "";
               _loc8_.qufu = 0;
               _loc8_.pingtaiID = 0;
               _loc8_.shengli = false;
               _loc8_.guanjun = false;
            }
            _loc6_.push(_loc8_);
            _loc4_++;
         }
         this._mediator.liucheng(_loc3_,_loc6_);
      }
      
      public function received_74550(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         var _loc9_:Object = null;
         ZLog.add("74550: 返回助威面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         if(_loc2_ != 0 && _loc3_ != 0)
         {
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = 0;
            while(_loc8_ < _loc3_)
            {
               _loc9_ = new Object();
               _loc9_.no = param1.readInt();
               _loc9_.partyName = param1.readUTF();
               _loc9_.id = param1.readInt();
               _loc9_.serverID = param1.readInt();
               _loc9_.pingtaiID = param1.readInt();
               _loc9_.name = param1.readUTF();
               _loc9_.allCount = param1.readInt();
               _loc9_.count = param1.readInt();
               _loc9_.value = param1.readInt();
               _loc6_.push(_loc9_);
               _loc8_++;
            }
         }
         this.mediator.setZhuweiData(_loc6_,_loc5_,_loc7_,_loc4_,_loc2_);
      }
      
      public function received_74552(param1:ByteArray) : void
      {
         ZLog.add("74552: 返回比赛时间");
         var _loc2_:String = param1.readUTF();
         this.mediator.setGuizeTime(_loc2_);
      }
      
      public function received_74554(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("74554: 返回历届霸主面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = new Object();
            _loc7_.index = param1.readInt();
            _loc7_.time = param1.readUTF();
            _loc7_.name = param1.readUTF();
            _loc7_.playerName = param1.readUTF();
            _loc7_.pingtaiID = param1.readInt();
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.mediator.setBazhuData(_loc2_,_loc3_,_loc5_);
      }
      
      public function received_74556(param1:ByteArray) : void
      {
         ZLog.add("74556: 弹出领奖按钮");
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_WANGZHEZHIBANG);
      }
      
      public function received_74558(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("74558: 返回领奖面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:Array = [LanResManager.getLanCommonTextWords("冠军帮会参赛人员奖励"),LanResManager.getLanCommonTextWords("四强帮会参赛人员奖励"),LanResManager.getLanCommonTextWords("16强帮会参赛人员奖励"),LanResManager.getLanCommonTextWords("64强帮会参赛人员奖励"),LanResManager.getLanCommonTextWords("冠军帮会非参赛人员奖励"),LanResManager.getLanCommonTextWords("四强帮会非参赛人员奖励"),LanResManager.getLanCommonTextWords("16强帮会非参赛人员奖励"),LanResManager.getLanCommonTextWords("64强帮会非参赛人员奖励"),LanResManager.getLanCommonTextWords("参与帮战活动人员奖励"),LanResManager.getLanCommonTextWords("争霸战助威金票返利（根据您的助威数冠军3倍，4强2倍，16强1倍）")];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc6_ = new Object();
            _loc6_.desc = _loc4_[_loc5_];
            _loc6_.gid = param1.readInt();
            _loc6_.state = param1.readByte();
            _loc6_.type = _loc5_ + 1;
            _loc3_.push(_loc6_);
            _loc5_++;
         }
         _loc6_ = new Object();
         _loc6_.desc = _loc4_[9];
         _loc6_.gid = 0;
         _loc6_.state = param1.readByte();
         _loc6_.type = 10;
         _loc3_.push(_loc6_);
         this.mediator.setLingjiang(_loc3_);
      }
      
      public function received_74560(param1:ByteArray) : void
      {
         ZLog.add("74560: 返回活动开启提示信息");
         this.mediator.showAllTip(1,1);
      }
      
      public function received_74562(param1:ByteArray) : void
      {
         ZLog.add("74562: 返回比赛开始提示信息");
         this.mediator.showAllTip(2,1);
      }
      
      public function received_74564(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         ZLog.add("74564: 返回积分提示信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         if(_loc2_ == 1)
         {
            _loc5_ = param1.readInt();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = new Object();
               _loc7_.index = param1.readInt();
               _loc7_.name = param1.readUTF();
               _loc7_.count = param1.readInt();
               _loc7_.pingtaiID = param1.readInt();
               _loc3_.push(_loc7_);
               _loc6_++;
            }
            _loc4_ = param1.readInt();
         }
         this.mediator.showJifen(_loc3_,_loc4_,_loc2_);
      }
      
      public function received_74566(param1:ByteArray) : void
      {
         ZLog.add("74566: 返回胜利提示信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         this.mediator.showAllTip(3,_loc2_,_loc3_);
      }
      
      public function received_74568(param1:ByteArray) : void
      {
         ZLog.add("74568: 失败提示");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         this.mediator.showAllTip(4,_loc2_,_loc3_);
      }
      
      public function received_74574(param1:ByteArray) : void
      {
         ZLog.add("74574: 返回助威结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.mediator.requestZhuweiRefresh();
         }
      }
      
      public function received_74576(param1:ByteArray) : void
      {
         ZLog.add("74576: 进入战场后返回协议，弹出规则面板");
         var _loc2_:int = param1.readByte();
         this.mediator.showZhanchangGuize(_loc2_);
      }
   }
}

