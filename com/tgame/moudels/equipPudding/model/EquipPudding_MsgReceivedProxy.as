package com.tgame.moudels.equipPudding.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.equipPudding.view.Equip2BaoShiMediator;
   import com.tgame.moudels.equipPudding.view.EquipKuaisushengjieMediator;
   import com.tgame.moudels.equipPudding.view.EquipZhuangBeiYangChengMediator;
   import com.tgame.moudels.equipPudding.view.Equip_CopyMediator;
   import com.tgame.moudels.equipPudding.view.Equip_KeWenMediator;
   import com.tgame.moudels.equipPudding.view.UI_MainCharEquipPuddingPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class EquipPudding_MsgReceivedProxy extends Proxy
   {
      
      public static var index_50192:int;
      
      public static const NAME:String = "EquipPudding_MsgReceivedProxy";
      
      private var _equipPuddingPanelMediator:UI_MainCharEquipPuddingPanelMediator;
      
      private var _equip2BaoShiMediator:Equip2BaoShiMediator;
      
      private var _equipKuaisushengjieMediator:EquipKuaisushengjieMediator;
      
      private var _equipZhuangbeiYangchengMediator:EquipZhuangBeiYangChengMediator;
      
      private var _equipKeHuaMediator:Equip_KeWenMediator;
      
      private var _equipCopyMediator:Equip_CopyMediator;
      
      public function EquipPudding_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      private function get equipPuddingPanelMediator() : UI_MainCharEquipPuddingPanelMediator
      {
         if(this._equipPuddingPanelMediator == null)
         {
            this._equipPuddingPanelMediator = facade.retrieveMediator(UI_MainCharEquipPuddingPanelMediator.NAME) as UI_MainCharEquipPuddingPanelMediator;
         }
         return this._equipPuddingPanelMediator;
      }
      
      private function get equip2BaoShiMediator() : Equip2BaoShiMediator
      {
         if(this._equip2BaoShiMediator == null)
         {
            this._equip2BaoShiMediator = facade.retrieveMediator(Equip2BaoShiMediator.NAME) as Equip2BaoShiMediator;
         }
         return this._equip2BaoShiMediator;
      }
      
      private function get equipKuaisushengjieMediator() : EquipKuaisushengjieMediator
      {
         if(this._equipKuaisushengjieMediator == null)
         {
            this._equipKuaisushengjieMediator = facade.retrieveMediator(EquipKuaisushengjieMediator.NAME) as EquipKuaisushengjieMediator;
         }
         return this._equipKuaisushengjieMediator;
      }
      
      private function get equipZhuangbeiYangchengMediator() : EquipZhuangBeiYangChengMediator
      {
         if(this._equipZhuangbeiYangchengMediator == null)
         {
            this._equipZhuangbeiYangchengMediator = facade.retrieveMediator(EquipZhuangBeiYangChengMediator.NAME) as EquipZhuangBeiYangChengMediator;
         }
         return this._equipZhuangbeiYangchengMediator;
      }
      
      private function get equipKeHuaMediator() : Equip_KeWenMediator
      {
         if(this._equipKeHuaMediator == null)
         {
            this._equipKeHuaMediator = facade.retrieveMediator(Equip_KeWenMediator.NAME) as Equip_KeWenMediator;
         }
         return this._equipKeHuaMediator;
      }
      
      private function get equipCopyMediator() : Equip_CopyMediator
      {
         if(this._equipCopyMediator == null)
         {
            this._equipCopyMediator = facade.retrieveMediator(Equip_CopyMediator.NAME) as Equip_CopyMediator;
         }
         return this._equipCopyMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50104,50106,50108,50110,50112,50114,50126,50128,50150,50192,50172,53058,53540,53542,53562,57102,57104,57106,57108,57152,57154,57156,57158],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50104,50106,50108,50110,50112,50114,50126,50128,50150,50192,50172,53058,53540,53542,53562,57102,57104,57106,57108,57152,57154,57156,57158],NAME);
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
      
      public function received_50104(param1:ByteArray) : void
      {
         ZLog.add("50104：强化成功/失败 ");
         SmallLoadingBar.close();
         var _loc2_:int = param1.readByte();
         this.equipPuddingPanelMediator.upDataItem(1,_loc2_);
      }
      
      public function received_50106(param1:ByteArray) : void
      {
         ZLog.add("50106：强化重置时物品破碎 ");
         SmallLoadingBar.close();
         this.equipPuddingPanelMediator.upDataItem(2,3);
      }
      
      public function received_50108(param1:ByteArray) : void
      {
         ZLog.add("50108：重置等级成功/失败 ");
         SmallLoadingBar.close();
         var _loc2_:int = param1.readByte();
         this.equipPuddingPanelMediator.upDataItem(2,_loc2_);
      }
      
      public function received_50110(param1:ByteArray) : void
      {
         ZLog.add("50110：装备附加属性重置成功/失败 ");
         SmallLoadingBar.close();
         var _loc2_:int = param1.readByte();
         this.equipPuddingPanelMediator.upDataItem(3,_loc2_);
      }
      
      public function received_50112(param1:ByteArray) : void
      {
         ZLog.add("50112：宝石融入装备成功/失败 ");
         SmallLoadingBar.close();
         var _loc2_:int = param1.readByte();
         this.equipPuddingPanelMediator.upDataItem(4,_loc2_);
      }
      
      public function received_50114(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Goods = null;
         SmallLoadingBar.close();
         ZLog.add("50114：弹出确认融合界面");
         var _loc2_:Array = [];
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = new Goods(_loc5_);
            _loc2_.push(_loc6_);
            _loc4_++;
         }
         this.equipPuddingPanelMediator.stoneSelete(_loc2_);
      }
      
      public function received_50172(param1:ByteArray) : void
      {
         ZLog.add("50172：强化装备附加属性成功/失败 ");
         SmallLoadingBar.close();
         var _loc2_:int = param1.readByte();
         this.equipPuddingPanelMediator.upDataItem(5,_loc2_);
      }
      
      public function received_50150(param1:ByteArray) : void
      {
         ZLog.add("50150：不能强化合成");
         var _loc2_:Timer = new Timer(550,1);
         _loc2_.start();
         _loc2_.addEventListener(TimerEvent.TIMER_COMPLETE,this.timeComplete);
      }
      
      public function received_50126(param1:ByteArray) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         ZLog.add("50126：强化合成查询消耗返回");
         PipeManager.sendMsg(PipeConstants.ITEMTIP_CLEAR);
         var _loc2_:int = param1.readByte();
         var _loc3_:Object = {};
         var _loc4_:Boolean = param1.readByte() == 0 ? false : true;
         if(!_loc4_)
         {
            if(_loc2_ == 12)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"无法增删附加属性"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"无法增删附加属性"),false);
            }
            else if(_loc2_ == 13)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"无法重置附加属性条目数值"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"无法重置附加属性条目数值"),false);
            }
            _loc3_.type = _loc2_;
            PipeManager.sendMsg(PipeConstants.SYNTHESIZE_NOT_ITEM,_loc3_);
            if(_loc2_ <= 4)
            {
               this.equipPuddingPanelMediator.panelClose();
            }
            return;
         }
         _loc3_.zhenQi = param1.readInt();
         _loc3_.gaiLv = param1.readInt() / 100;
         if(_loc2_ <= 5)
         {
            _loc3_.zhenQi = param1.readInt();
         }
         if(_loc2_ != 4 && _loc2_ <= 5)
         {
            _loc3_.useItemNum = param1.readInt();
         }
         if(_loc2_ < 5 || _loc2_ == 15)
         {
            if(_loc2_ == 15)
            {
               _loc3_.zhenQi = param1.readInt();
               _loc3_.useItemNum = param1.readInt();
               _loc3_.addNum = param1.readInt() / 100;
            }
            this.equipPuddingPanelMediator.setExpendGasAndProbability(_loc3_);
         }
         if(_loc2_ == 5)
         {
            _loc3_.nextLevelData = param1.readInt();
            _loc5_ = new Goods(_loc3_.nextLevelData);
            if((Boolean(_loc5_)) && Boolean(_loc5_.res) && _loc5_.res.limit_grade >= 120)
            {
               _loc3_.nextLevelData = 1;
            }
            PipeManager.sendMsg(PipeConstants.EXPENDGAS_AND_PROBABILITY,_loc3_);
         }
         if(_loc2_ == 6 || _loc2_ == 7 || _loc2_ == 17)
         {
            _loc3_.id1 = param1.readInt();
            _loc3_.id1Num = param1.readByte();
            _loc3_.id2 = param1.readInt();
            _loc3_.id2Num = param1.readByte();
            _loc3_.id3 = param1.readInt();
            _loc3_.id3Num = param1.readByte();
            _loc3_.nextLevelData = param1.readInt();
            PipeManager.sendMsg(PipeConstants.EXPENDGAS_AND_PROBABILITY,_loc3_);
         }
         if(_loc2_ == 8)
         {
            _loc3_.type = 8;
            _loc6_ = param1.readInt();
            _loc3_.nextLevelItem = new Goods(_loc6_);
            PipeManager.sendMsg(PipeConstants.STONE_EXPENDGAS_AND_PROBABILITY,_loc3_);
         }
         if(_loc2_ == 9)
         {
            _loc3_.type = 9;
            PipeManager.sendMsg(PipeConstants.STONE_EXPENDGAS_AND_PROBABILITY,_loc3_);
         }
         if(_loc2_ == 10 || _loc2_ == 11 || _loc2_ == 22 || _loc2_ == 23)
         {
            _loc3_.type = _loc2_;
            _loc3_.kill = param1.readInt() / 100;
            _loc7_ = param1.readByte();
            _loc3_.idArr = [];
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc9_ = param1.readInt();
               _loc5_ = new Goods(_loc9_);
               _loc10_ = param1.readByte();
               _loc3_.idArr.push([_loc5_,_loc10_]);
               _loc8_++;
            }
            if(_loc2_ == 10)
            {
               PipeManager.sendMsg(PipeConstants.STONE_EXPENDGAS_AND_PROBABILITY,_loc3_);
            }
            if(_loc2_ == 11 || _loc2_ == 23)
            {
               PipeManager.sendMsg(PipeConstants.EASY_EQUIP_ADD_STONE,_loc3_);
            }
            if(_loc2_ == 22)
            {
               PipeManager.sendMsg(PipeConstants.MENU_XIANGQIAN_FANHUI,_loc3_);
            }
         }
         if(_loc2_ == 12 || _loc2_ == 13 || _loc2_ == 14)
         {
            _loc3_.copper = param1.readInt();
            _loc3_.useItemNum = param1.readInt();
            _loc3_.type = _loc2_;
            PipeManager.sendMsg(PipeConstants.ZHAN_WEN_KE_HUA_EXPENDGAS_AND_PROBABILITY,_loc3_);
         }
         if(_loc2_ == 18)
         {
            _loc3_.type = _loc2_;
            _loc3_.caiLiao = param1.readInt();
            _loc3_.caiLiaoNum = param1.readShort();
            _loc3_.nextStoneID = param1.readInt();
            _loc3_.thisSstoneID = param1.readInt();
            PipeManager.sendMsg(PipeConstants.SIX_STONE_TO_SEVEN_STONE_PROBABILITY,_loc3_);
         }
         if(_loc2_ == 19)
         {
            _loc3_.type = 19;
            _loc3_.useCopper = param1.readInt();
            _loc3_.nextLevelData = param1.readInt();
            PipeManager.sendMsg(PipeConstants.EXPENDGAS_AND_PROBABILITY,_loc3_);
         }
         if(_loc2_ == 20)
         {
            param1.readInt();
            _loc3_.type = 20;
            _loc11_ = param1.readInt();
            _loc3_.nextLevelItem = new Goods(_loc11_);
            PipeManager.sendMsg(PipeConstants.STONE_EXPENDGAS_AND_PROBABILITY,_loc3_);
         }
         if(_loc2_ == 21)
         {
            param1.readInt();
            _loc3_.type = 21;
            _loc11_ = param1.readInt();
            _loc3_.nextLevelItem = new Goods(_loc11_);
            _loc11_ = param1.readInt();
            _loc3_.dazaoshi = new Goods(_loc11_);
            _loc3_.dazaoshi.count = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc11_,true).count;
            PipeManager.sendMsg(PipeConstants.STONE_EXPENDGAS_AND_PROBABILITY,_loc3_);
         }
      }
      
      public function received_50128(param1:ByteArray) : void
      {
         ZLog.add("50128：延时动画 ");
         SmallLoadingBar.showLoading(SynthesizeMsg.SynthesizeSmallLoadingBarMsg,OtherConst.EQUIP_UPDATA_USE_LOAD_BUFF_TIME);
      }
      
      public function received_50192(param1:ByteArray) : void
      {
         ZLog.add("50192：重置附加属性选择 ");
         index_50192 = param1.readShort();
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         this.equipPuddingPanelMediator.isResetStrengthenLevel(_loc2_,_loc3_);
      }
      
      public function received_53058(param1:ByteArray) : void
      {
         var _loc8_:Goods = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readShort();
         var _loc7_:int = _loc2_.readInt();
         if(_loc3_ == this.equip2BaoShiMediator._id && _loc4_ == this.equip2BaoShiMediator._position)
         {
            _loc8_ = new Goods(_loc5_);
            _loc8_.count = _loc6_;
            _loc8_.position = _loc7_;
            this.equip2BaoShiMediator.setGood2(_loc8_);
            this.equip2BaoShiMediator.setBtnEnable(false);
            this.equip2BaoShiMediator.setGoodsHui1(false);
         }
      }
      
      private function timeComplete(param1:TimerEvent) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
         {
            this.equipPuddingPanelMediator.upDataItem(0,2);
         }
         if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
         {
            PipeManager.sendMsg(PipeConstants.CLOSE_SYNTHESIZE_LOAD_BUFF);
         }
         PipeManager.sendMsg(PipeConstants.CLOSE_ZHAN_WEN_KE_HUA_LOAD_BUFF);
         PipeManager.sendMsg(PipeConstants.CLOSE_STONE_LOAD_BUFF);
      }
      
      public function received_53540(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         this.equipKuaisushengjieMediator.setData(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_53542(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readByte();
         this.equipKuaisushengjieMediator.setResult(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_53562(param1:ByteArray) : void
      {
         ZLog.add("53562： 返回装备养成结果 ");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readShort();
         var _loc7_:int = _loc2_.readDouble();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:Number = _loc2_.readDouble();
         var _loc10_:String = _loc2_.readUTF();
         var _loc11_:String = _loc2_.readUTF();
         var _loc12_:String = _loc2_.readUTF();
         this.equipZhuangbeiYangchengMediator.setDataYC(_loc4_,_loc3_,_loc5_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc6_,_loc12_);
      }
      
      public function received_57102(param1:ByteArray) : void
      {
         ZLog.add("57102：四圣兽刻纹 面板返回 ");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = new Array();
         var _loc5_:* = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_[_loc5_] = param1.readInt();
            _loc5_++;
         }
         this.equipKeHuaMediator.setArr(_loc4_);
      }
      
      public function received_57104(param1:ByteArray) : void
      {
         ZLog.add("57104：四圣兽刻纹 装备返回");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         this.equipKeHuaMediator.SetGoods(_loc3_,_loc4_);
      }
      
      public function received_57106(param1:ByteArray) : void
      {
         ZLog.add("57106：四圣兽刻纹 打造返回 ");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         this.equipKeHuaMediator.Result(_loc3_);
      }
      
      public function received_57108(param1:ByteArray) : void
      {
         ZLog.add("57108：四圣兽刻纹 去除返回 ");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         this.equipKeHuaMediator.Result(_loc3_);
      }
      
      public function received_57152(param1:ByteArray) : void
      {
         ZLog.add("57152：请求装备复制面板返回");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = param1.readInt();
         this.equipCopyMediator.setNeedGoods(_loc3_);
      }
      
      public function received_57154(param1:ByteArray) : void
      {
         ZLog.add("57154：装备复制放入装备返回");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = param1.readInt();
         this.equipCopyMediator.setGoods1(_loc3_);
      }
      
      public function received_57156(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         ZLog.add("57156：装备复制 结果返回  ");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            _loc4_ = param1.readShort();
            this.equipCopyMediator.setResult(_loc3_,_loc4_);
         }
      }
      
      public function received_57158(param1:ByteArray) : void
      {
         ZLog.add("57158：最终勋章 孔数返回  ");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         OtherConst.xunzhang_dakong = _loc3_;
      }
   }
}

