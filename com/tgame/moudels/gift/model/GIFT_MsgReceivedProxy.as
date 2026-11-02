package com.tgame.moudels.gift.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.gift.view.Gift_GiftMediator;
   import com.tgame.moudels.gift.view.Gift_HuodongMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class GIFT_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "GIFT_MsgReceivedProxy";
      
      private var _giftMediator:Gift_GiftMediator;
      
      private var _huodongMediator:Gift_HuodongMediator;
      
      private var _msgSender:GIFT_MsgSenderProxy;
      
      public var tianShuMcArr:Array = [];
      
      public var tianShuTimer:Timer = new Timer(8000);
      
      public function GIFT_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50702,50704,50712,50714,50716,50722,50732,50734,50736,50742,50744,50752,50756,50798,53062,52056,52054,52058,40042,40044,50758,50796,40022,53782,53786,53788,53094,56032,56036,58552,58554,58556,58558,72610,78802,81422,81462,81522,81632,81662,81712,81742,81752,81762,81766,81822,81842,81892,82040,82102,82112,82132,82142,82144,82146,82148,82150,82202,82184,82186,82242,82262,82152,82302,82312,82362,82382,82402,82432,82434,82462,82482,82484,82492,82522,82572,82612,82716,83024,83032,83042,83072,83074,83078,83092,83094,83098,83182,83188,83230],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50702,50704,50712,50714,50716,50722,50732,50734,50736,50742,50744,50752,50756,50798,53062,52056,52054,52058,40042,40044,50796,50758,40022,53782,53786,53788,53094,56032,56036,58552,58554,58556,58558,72610,78802,81422,81462,81522,81632,81662,81712,81742,81752,81762,81766,81822,81842,81892,82040,82102,82112,82132,82142,82144,82146,82148,82150,82202,82184,82186,82242,82262,82152,82302,82312,82362,82382,82402,82432,82434,82462,82482,82484,82492,82522,82572,82612,82716,83024,83032,83042,83072,83074,83078,83092,83094,83098,83182,83188,83230],NAME);
      }
      
      private function get giftMediator() : Gift_GiftMediator
      {
         if(this._giftMediator == null)
         {
            this._giftMediator = facade.retrieveMediator(Gift_GiftMediator.NAME) as Gift_GiftMediator;
         }
         return this._giftMediator;
      }
      
      private function get huodongMediator() : Gift_HuodongMediator
      {
         if(this._huodongMediator == null)
         {
            this._huodongMediator = facade.retrieveMediator(Gift_HuodongMediator.NAME) as Gift_HuodongMediator;
         }
         return this._huodongMediator;
      }
      
      private function get msgSender() : GIFT_MsgSenderProxy
      {
         if(this._msgSender == null)
         {
            this._msgSender = facade.retrieveProxy(GIFT_MsgSenderProxy.NAME) as GIFT_MsgSenderProxy;
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
      
      public function received_50702(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Goods = null;
         ZLog.add("50702：升级有礼使用礼包返回");
         var _loc2_:Object = {};
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         _loc2_.lv = param1.readShort();
         _loc2_.tq = param1.readInt();
         _loc2_.yb = param1.readInt();
         var _loc5_:int = param1.readByte();
         _loc2_.r = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = new Goods(_loc7_);
            _loc9_.count = _loc8_;
            _loc9_.is_use = 0;
            _loc2_.r.push(_loc9_);
            _loc6_++;
         }
         this.giftMediator.showUseGiftPack(_loc3_,_loc2_,_loc4_);
      }
      
      public function received_50704(param1:ByteArray) : void
      {
         ZLog.add("50704：领取升级礼包内物品返回");
         var _loc2_:Boolean = param1.readByte() == 0 ? false : true;
         var _loc3_:String = "";
         if(_loc2_)
         {
            _loc3_ = param1.readUTF();
         }
         this.giftMediator.getGiftInPack(_loc2_,_loc3_);
      }
      
      public function received_50712(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:Goods = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Goods = null;
         ZLog.add("50712：升级有礼所有奖品查询返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = {};
            _loc6_ = param1.readInt();
            _loc7_ = new Goods(_loc6_);
            _loc5_.bigImg = _loc7_.getBigICOPath();
            _loc5_.lv = param1.readShort();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readInt();
            _loc10_ = param1.readByte();
            _loc5_.items = [];
            _loc11_ = 0;
            while(_loc11_ < _loc10_)
            {
               _loc6_ = param1.readInt();
               _loc12_ = new Goods(_loc6_);
               _loc12_.count = param1.readInt();
               _loc5_.items.push(_loc12_);
               _loc11_++;
            }
            if(_loc8_ != 0)
            {
               _loc5_.items.push(new Goods(SpecialGoodsID.TONGQIAN_ID));
            }
            if(_loc9_ != 0)
            {
               _loc5_.items.push(new Goods(SpecialGoodsID.YUANBAO_ID));
            }
            _loc5_.isOpen = param1.readByte() == 0 ? false : true;
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.giftMediator.getAllGift(_loc3_);
      }
      
      public function received_50714(param1:ByteArray) : void
      {
         ZLog.add("50714：见面计时开始");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         this.giftMediator.watchingFaceGiftStartTime(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_50716(param1:ByteArray) : void
      {
         ZLog.add("50716：见面计时结束 可以领取");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         this.giftMediator.watchingFaceGiftStopTime(_loc2_,_loc3_);
      }
      
      public function received_50722(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         ZLog.add("50722：见面有礼列表所有奖品查询返回");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = {};
            _loc7_ = param1.readInt();
            _loc8_ = new Goods(_loc7_);
            _loc6_.bigImg = _loc8_.getBigICOPath();
            _loc6_.des = param1.readUTF();
            _loc6_.time = param1.readInt();
            _loc6_.isOpen = param1.readByte() == 0 ? false : true;
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.giftMediator.showJianMian(_loc2_,_loc4_);
      }
      
      public function received_50732(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Goods = null;
         ZLog.add("50732：邀请有礼列表返回");
         var _loc2_:Object = {};
         _loc2_.url = GameConfig.gotoAdd;
         _loc2_.invitePlayersNum = param1.readShort();
         var _loc3_:int = param1.readByte();
         _loc2_.r = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readShort();
            _loc7_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readByte();
            _loc10_ = [];
            _loc11_ = 0;
            while(_loc11_ < _loc9_)
            {
               _loc13_ = param1.readInt();
               _loc14_ = param1.readInt();
               _loc15_ = new Goods(_loc13_);
               _loc15_.count = _loc14_;
               _loc10_.push(_loc15_);
               _loc11_++;
            }
            if(_loc7_ != 0)
            {
               _loc10_.push(new Goods(SpecialGoodsID.TONGQIAN_ID));
            }
            if(_loc8_ != 0)
            {
               _loc10_.push(new Goods(SpecialGoodsID.YUANBAO_ID));
            }
            _loc12_ = param1.readByte() == 0 ? false : true;
            _loc2_.r.push({
               "id":_loc5_,
               "count":_loc6_,
               "items":_loc10_,
               "isOpen":_loc12_
            });
            _loc4_++;
         }
         this.giftMediator.showInvite(_loc2_);
      }
      
      public function received_50734(param1:ByteArray) : void
      {
         this.giftMediator.getInviteGift(param1.readByte(),param1.readInt());
         ZLog.add("50734：领取邀请有礼奖品返回");
      }
      
      public function received_50736(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:Boolean = false;
         ZLog.add("50736：邀请有礼最近10玩家列表");
         var _loc2_:Array = [];
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readUTF();
            _loc7_ = param1.readShort();
            _loc8_ = PartyType.getName(param1.readByte());
            _loc9_ = param1.readUTF();
            _loc10_ = param1.readByte() == 0 ? false : true;
            _loc2_.push({
               "id":_loc5_,
               "playerName":_loc6_,
               "lv":_loc7_,
               "party":_loc8_,
               "setup":_loc9_,
               "state":_loc10_
            });
            _loc4_++;
         }
         this.giftMediator.inviteTenPlayer(_loc2_);
      }
      
      public function received_50742(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:Boolean = false;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Goods = null;
         ZLog.add("50742：登录有礼列表返回");
         var _loc2_:Object = {};
         _loc2_.day = param1.readByte();
         var _loc3_:int = param1.readByte();
         _loc2_.r = [];
         var _loc4_:Array = [2,4,7];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = param1.readByte();
            _loc7_ = param1.readInt();
            _loc8_ = param1.readByte();
            _loc9_ = [];
            _loc10_ = 0;
            while(_loc10_ < _loc8_)
            {
               _loc12_ = param1.readInt();
               _loc13_ = param1.readInt();
               _loc14_ = new Goods(_loc12_);
               _loc14_.count = _loc13_;
               _loc9_.push(_loc14_);
               _loc10_++;
            }
            _loc11_ = param1.readByte() == 1 ? true : false;
            _loc2_.r.push({
               "id":_loc7_,
               "count":(_loc2_.day > _loc4_[_loc5_] ? _loc4_[_loc5_] : _loc2_.day),
               "items":_loc9_,
               "isOpen":_loc11_,
               "day":_loc4_[_loc5_]
            });
            _loc5_++;
         }
         this.giftMediator.showLoingGift(_loc2_);
      }
      
      public function received_50744(param1:ByteArray) : void
      {
         ZLog.add("50744：领取邀请有礼奖品返回");
         this.giftMediator.getLoginGift(param1.readInt());
      }
      
      public function received_50752(param1:ByteArray) : void
      {
         ZLog.add("50752：在线有礼列表返回");
         var _loc2_:Object = {};
         _loc2_.preTime = param1.readInt();
         _loc2_.yb = param1.readInt();
         var _loc3_:Boolean = param1.readByte() == 1 ? true : false;
         _loc2_.time = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.push({
               "time":param1.readInt(),
               "prize":param1.readInt()
            });
            _loc6_++;
         }
         _loc2_.r = _loc5_;
         this.giftMediator.getGiftBtnEndabled(_loc3_);
         this.giftMediator.showOnLineGift(_loc2_);
      }
      
      public function received_50756(param1:ByteArray) : void
      {
         ZLog.add("50756：在线有礼登录时间返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 0)
         {
            this.giftMediator.getOnLineTime(_loc2_);
         }
         if(_loc3_ == 1)
         {
            this.giftMediator.getLoginTime(_loc2_);
         }
      }
      
      public function received_50758(param1:ByteArray) : void
      {
         ZLog.add("50758：签到返回");
         var _loc2_:int = param1.readDouble();
         var _loc3_:int = param1.readDouble();
         var _loc4_:Boolean = param1.readByte() == 0 ? false : true;
         this.giftMediator.showRegistrationData(_loc2_,_loc3_,_loc4_);
         var _loc5_:int = param1.readByte();
         var _loc6_:String = param1.readUTF();
         this.giftMediator.setQianDao(_loc5_,_loc6_);
      }
      
      public function received_53062(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         ZLog.add("53062：返回所开启的活动");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.push([param1.readInt(),"","",param1.readUTF(),param1.readByte()]);
            _loc6_++;
         }
         this.huodongMediator.received_openHuodongList(_loc3_,_loc5_,_loc2_);
      }
      
      public function received_52056(param1:ByteArray) : void
      {
         var _loc4_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         ZLog.add("52056：返回活动进度");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc5_:int = param1.readInt();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = param1.readInt();
            _loc8_ = param1.readByte();
            _loc4_ = this.huodongMediator.getParms(_loc7_,_loc8_,param1);
            _loc3_[_loc3_.length] = [_loc7_,_loc8_,_loc4_];
            _loc6_++;
         }
         this.huodongMediator.received_huodongJindu(_loc2_,_loc3_);
      }
      
      public function received_52054(param1:ByteArray) : void
      {
         ZLog.add("52054：返回领取活动兑换成功");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.huodongMediator.received_huodongDuihuanCG(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_52058(param1:ByteArray) : void
      {
         /*
          * Decompilation error
          * Code may be obfuscated
          * Tip: You can try enabling "Deobfuscate code" option in Settings
          * Error type: ExecutionException (java.lang.StackOverflowError)
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to error");
      }
      
      public function permitFunction(param1:int, param2:Boolean, param3:Boolean) : void
      {
         if(param3)
         {
            if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
            }
         }
         switch(param1)
         {
            case 2060:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitYunCheng(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShowYunCheng();
               }
               break;
            case 2061:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitXunZhang(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestXunZhang();
               }
               break;
            case 2062:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitZhanQi(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestZhanQi();
               }
               break;
            case 2063:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitXiuWei(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestXiuWei();
               }
               break;
            case 2064:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitZhanHun(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestZhanHun();
               }
               break;
            case 2065:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitXunZhangYangChen(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestXunZhangYangChen();
               }
               break;
            case 2066:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitBaGua(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShowBaGua();
               }
               break;
            case 2067:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitQiShangQuan(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.showQiShangQuan();
               }
               break;
            case 2068:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitShenZhaoJing(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShenZhaoJing();
               }
               break;
            case 2069:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitZiXiaShenGong(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShowZiXiaShenGong();
               }
               break;
            case 2070:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitJiuJian(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShowDugujiujianPanel();
               }
               break;
            case 2071:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitJiuYang(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestJiuYang();
               }
               break;
            case 2072:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitXiSuiJing(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestXiSuiJing();
               }
               break;
            case 2073:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitJiuYin(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShowJiuYinZhenJing();
               }
               break;
            case 2074:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitFeiLong(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestFeiLong();
               }
               break;
            case 2075:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitWuXingQuan(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestWuXingQuan();
               }
               break;
            case 2076:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitLiuMaiShenJian(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestLiuMai();
               }
               break;
            case 2077:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitXiangLong(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShowXiangLongShiBaZhang();
               }
               break;
            case 2078:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitJinZhongZhao(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestJinZhongZhao();
               }
               break;
            case 2079:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitTaiXuanShenGong(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestTaiXuanShenGong();
               }
               break;
            case 2080:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitBeiMingShenGong(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestBeiMingShenGong();
               }
               break;
            case 2081:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitQiMenZhen(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShowQiMenZhen();
               }
               break;
            case 2082:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitSiLingZhen(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestSiLingZhen();
               }
               break;
            case 2083:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitShiBaTongRen(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShiBaTongRen();
               }
               break;
            case 2084:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitWuXingZhen(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestWuXingZhen();
               }
               break;
            case 2085:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitAnQi(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShowAnQiPanel();
               }
               break;
            case 2086:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitDongXiao(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestDongXiao();
               }
               break;
            case 2087:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitBow(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShowBowPanel();
               }
               break;
            case 2088:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitChuanGong(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestChuanGong();
               }
               break;
            case 2089:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitJingJie(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestJingJie();
               }
               break;
            case 2090:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitYiJinJing(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestYiJinJing();
               }
               break;
            case 2091:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitWuXingZhiRen(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestWuXingZhiRen();
               }
               break;
            case 2092:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitDanTian(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestShowDantianPanel();
               }
               break;
            case 2093:
               GameState["gongneng" + param1] = param2;
               GameInstance.uiInstance.charAttribute.permitTianFu(param2);
               if(param3)
               {
                  GameInstance.uiInstance.charAttribute.requestTianFu();
               }
         }
         if(param3)
         {
            GameInstance.uiInstance.charAttribute.parent.setChildIndex(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.charAttribute.parent.numChildren - 1);
         }
      }
      
      public function received_50796(param1:ByteArray) : void
      {
         ZLog.add("50796：新闻公告");
         var _loc2_:String = param1.readUTF();
         this.giftMediator.setNewSpaper(_loc2_);
      }
      
      public function received_50798(param1:ByteArray) : void
      {
         ZLog.add("50798：宝箱闪动");
         var _loc2_:int = param1.readByte();
         this.giftMediator.shanDong(_loc2_);
      }
      
      public function received_40042(param1:ByteArray) : void
      {
         var n:int;
         var i:int;
         var r:Array = null;
         var timer:Timer = null;
         var timerComplete:Function = null;
         var o:Object = null;
         var giftItems:String = null;
         var strArr:Array = null;
         var j:int = 0;
         var arr:Array = null;
         var goods:Goods = null;
         var $data:ByteArray = param1;
         timerComplete = function(param1:TimerEvent):void
         {
            giftMediator.getActive(r);
            timer.removeEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
            timer = null;
         };
         ZLog.add("40042：收到活动");
         r = [];
         n = $data.readByte();
         i = 0;
         while(i < n)
         {
            o = {};
            o.activityTiem = $data.readUTF();
            o.name = $data.readUTF();
            o.grade = $data.readShort();
            o.promulgator = $data.readUTF();
            o.npcid = $data.readInt();
            o.time = $data.readUTF();
            o.hortation = $data.readByte();
            o.particular = $data.readUTF();
            o.type = $data.readByte();
            o.gradeestimate = GameInstance.mainCharData.attributeInfo.lv >= o.grade ? true : false;
            o.timeestimate = $data.readByte() == 0 ? false : true;
            if(this.giftMediator.isALLActive)
            {
               if(o.gradeestimate)
               {
                  r.push(o);
               }
            }
            else
            {
               r.push(o);
            }
            giftItems = $data.readUTF();
            o.giftItems = [];
            if(giftItems != "")
            {
               strArr = giftItems.split(";");
               j = 0;
               while(j < strArr.length)
               {
                  arr = strArr[j].split("*");
                  goods = new Goods(int(arr[0]));
                  o.giftItems.push([goods.id,goods.res.name,int(arr[1])]);
                  j++;
               }
            }
            i++;
         }
         timer = new Timer(150,1);
         timer.start();
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
      }
      
      public function received_40044(param1:ByteArray) : void
      {
      }
      
      public function received_40022(param1:ByteArray) : void
      {
         var n:int;
         var i:int;
         var r:Array = null;
         var timer:Timer = null;
         var timerComplete:Function = null;
         var o:Object = null;
         var $data:ByteArray = param1;
         timerComplete = function(param1:TimerEvent):void
         {
            giftMediator.BossRefurBish(r);
            timer.removeEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
            timer = null;
         };
         ZLog.add("40022：收到boss刷新");
         r = [];
         n = $data.readByte();
         i = 0;
         while(i < n)
         {
            o = {};
            o.id = $data.readInt();
            o.name = $data.readUTF();
            o.grade = $data.readShort();
            o.map = $data.readUTF();
            o.time = $data.readUTF();
            o.sceneId = $data.readInt();
            o.bossX = $data.readInt();
            o.bossY = $data.readInt();
            o.say = $data.readByte();
            o.particular = $data.readUTF();
            o.pip = $data.readUTF();
            o.pipId = $data.readInt();
            o.isOnLine = $data.readByte();
            o.blood = $data.readByte();
            if(o.blood <= 0)
            {
               o.blood = 0;
               o.fettle = 1;
            }
            else
            {
               o.fettle = 2;
            }
            o.skill = $data.readUTF();
            o.challenge = 1;
            o.liQiGrade = $data.readInt();
            o.liQiExp = $data.readInt();
            if(o.grade - GameInstance.mainCharData.attributeInfo.lv < -10)
            {
               o.color = 1;
            }
            else if(o.grade - GameInstance.mainCharData.attributeInfo.lv < -5)
            {
               o.color = 2;
            }
            else if(o.grade - GameInstance.mainCharData.attributeInfo.lv <= 5)
            {
               o.color = 3;
            }
            else if(o.grade - GameInstance.mainCharData.attributeInfo.lv > 10)
            {
               o.color = 5;
            }
            else if(o.grade - GameInstance.mainCharData.attributeInfo.lv > 5)
            {
               o.color = 4;
            }
            r.push(o);
            i++;
         }
         timer = new Timer(150,1);
         timer.start();
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
      }
      
      public function received_53782(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         ZLog.add("53782：收到活跃度");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Boolean = param1.readByte() == 0 ? false : true;
         var _loc5_:int = param1.readShort();
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc9_ = {};
            _loc9_.label = param1.readUTF();
            _loc9_.res = param1.readUTF();
            _loc9_.grade = param1.readUTF();
            _loc9_.per = param1.readInt();
            _loc6_.push(_loc9_);
            _loc7_++;
         }
         var _loc8_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < 4)
         {
            _loc10_ = param1.readInt();
            _loc11_ = param1.readInt();
            _loc12_ = param1.readByte() == 0 ? false : true;
            _loc8_[_loc7_] = [new Goods(_loc10_),_loc11_,_loc12_];
            _loc7_++;
         }
         this.giftMediator.setHuoYue(_loc2_,_loc3_,_loc4_,_loc6_,_loc8_);
      }
      
      public function received_53784(param1:ByteArray) : void
      {
         ZLog.add("铜银紫金钻石宝箱返回");
         var _loc2_:int = param1.readByte();
         this.giftMediator.getGiftComplete(_loc2_);
      }
      
      public function received_53786(param1:ByteArray) : void
      {
         ZLog.add("领取时间奖励返回");
      }
      
      public function received_53788(param1:ByteArray) : void
      {
         ZLog.add("53788：上线未签到");
         var _loc2_:int = param1.readByte();
         this.giftMediator.upLine(_loc2_);
      }
      
      public function received_53094(param1:ByteArray) : void
      {
         ZLog.add("53094 显示 装备回收 面板");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         PipeManager.sendMsg(PipeConstants.SHOW_ZHUANGBEI_HUISHOU_PANEL,{
            "type":_loc2_,
            "goodsID":_loc3_,
            "goodsNum":_loc4_
         });
      }
      
      public function received_56032(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         ZLog.add("56032: 返回累计登录奖励数据");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = {};
            _loc5_.day = param1.readByte();
            _loc5_.goodarr = [];
            _loc6_ = param1.readByte();
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc8_ = {};
               _loc8_.id = param1.readInt();
               _loc8_.count = param1.readInt();
               _loc5_.goodarr.push(_loc8_);
               _loc7_++;
            }
            _loc5_.enabled = param1.readByte();
            _loc5_.islingqu = param1.readByte();
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.giftMediator.showLeijiDenglu(_loc3_);
      }
      
      public function received_56036(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         this.giftMediator.showLeijidengluTab(_loc2_,_loc3_);
      }
      
      public function received_58552(param1:ByteArray) : void
      {
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         ZLog.add("58552: 返回日常活动、精彩副本、热血PK信息");
         var _loc2_:int = param1.readByte();
         this.giftMediator.typeId = _loc2_;
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc8_ = [];
            _loc9_ = {};
            _loc9_.gjId = param1.readInt();
            _loc9_.id = param1.readByte();
            _loc9_.name = param1.readUTF();
            _loc9_.time = param1.readUTF();
            _loc9_.type = param1.readUTF();
            _loc9_.condition = param1.readUTF();
            _loc9_.neirong = param1.readUTF();
            _loc9_.cishuTotal = Boolean(param1.readByte() == 1);
            if(_loc9_.cishuTotal)
            {
               _loc9_.cishuNow = param1.readInt();
               _loc9_.cishuMax = param1.readInt();
            }
            _loc9_.jiangliTotal = param1.readByte();
            _loc10_ = 0;
            while(_loc10_ < _loc9_.jiangliTotal)
            {
               _loc11_ = {};
               _loc11_.jiangliType = param1.readByte();
               _loc8_.push(_loc11_);
               _loc10_++;
            }
            _loc9_.typeAry = _loc8_;
            _loc9_.btn = Boolean(param1.readByte() == 1);
            if(_loc9_.btn)
            {
               _loc9_.btnType = param1.readByte();
               if(_loc9_.btnType == 1)
               {
                  _loc9_.NPCid = param1.readInt();
               }
               else if(_loc9_.btnType == 2)
               {
                  _loc9_.btnTypePanel = param1.readInt();
               }
            }
            _loc9_.huore = Boolean(param1.readByte() == 1);
            _loc9_.kaiqi = Boolean(param1.readByte() == 1);
            if(_loc9_.kaiqi)
            {
               _loc9_.addKaiqi = Boolean(param1.readByte() == 1);
            }
            _loc9_.guaji = Boolean(param1.readByte() == 1);
            if(_loc9_.guaji)
            {
               _loc9_.guajiJihuo = Boolean(param1.readByte() == 1);
            }
            _loc4_.push(_loc9_);
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         this.giftMediator.page = _loc6_;
         var _loc7_:int = param1.readInt();
         this.giftMediator.showHuodong(_loc4_);
         this.giftMediator.setPageCount(_loc6_,_loc7_);
         this.giftMediator.onShowLv(false);
      }
      
      public function received_58554(param1:ByteArray) : void
      {
         ZLog.add("58554 新开启日常活动、精彩副本、热血PK");
         var _loc2_:int = param1.readByte();
         var _loc3_:String = param1.readUTF();
         this.giftMediator.setActiveHodong(_loc2_,_loc3_);
      }
      
      public function received_58556(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("58556 返回挂机界面信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = {};
            _loc7_.gjId = param1.readInt();
            _loc7_.name = param1.readUTF();
            _loc7_.time = param1.readInt();
            _loc7_.yuanbao = param1.readInt();
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.giftMediator.setGuajiPanel(_loc2_,_loc3_,_loc5_);
         this.giftMediator.onShowLv(true);
      }
      
      public function received_58558(param1:ByteArray) : void
      {
         ZLog.add("58558 返回增加挂机栏信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.giftMediator.addGuajilanNum(_loc2_,_loc3_);
      }
      
      public function received_72610(param1:ByteArray) : void
      {
         ZLog.add("72610 : 返回压岁钱按钮");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         GameInstance.uiInstance.mainUI.setYaSuiQianBtnVisible(_loc2_ == 1,_loc3_);
      }
      
      public function received_78802(param1:ByteArray) : void
      {
         ZLog.add("78802 越南 新手活动优化");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         this.giftMediator.setYNActiveHodong(_loc2_,_loc3_);
      }
      
      public function received_81422(param1:ByteArray) : void
      {
         ZLog.add("81422：返回消费面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         this.giftMediator.setXiaoFei(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_81462(param1:ByteArray) : void
      {
         ZLog.add("81462：返回消费面板信息");
         var _loc2_:Object = new Object();
         _loc2_.xxx = param1.readInt();
         _loc2_.yyy = param1.readInt();
         _loc2_.xxxx = param1.readInt();
         _loc2_.yyyy = param1.readInt();
         this.giftMediator.setHuoDongXiaoFeiData(_loc2_);
      }
      
      public function received_81522(param1:ByteArray) : void
      {
         var _loc3_:Object = null;
         var _loc6_:int = 0;
         ZLog.add("81522:返回武神战练信息");
         var _loc2_:Object = new Object();
         var _loc4_:Array = [];
         _loc2_.yeshu = param1.readByte();
         _loc2_.yeshuMax = param1.readByte();
         _loc2_.paiming = param1.readInt();
         var _loc5_:int = param1.readByte();
         while(_loc6_ < _loc5_)
         {
            _loc3_ = new Object();
            _loc3_.num = param1.readInt();
            _loc3_.name = param1.readUTF();
            _loc3_.fenzhi = param1.readInt();
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         _loc2_.arr = _loc4_;
         _loc2_.boolingqv = param1.readByte();
         _loc2_.wanjia = param1.readInt();
         this.giftMediator.setwushenzhanlian(_loc2_);
      }
      
      public function received_81632(param1:ByteArray) : void
      {
         ZLog.add("81632:返回周期财禄面板信息 ");
         var _loc2_:Object = {};
         var _loc3_:Object = {};
         var _loc4_:Array = [];
         _loc2_.time = param1.readUTF();
         _loc2_.yuanbao = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = {};
            _loc3_.name = param1.readInt();
            _loc3_.enabled = param1.readInt();
            _loc3_.id = param1.readInt();
            _loc3_.count = param1.readInt();
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         _loc2_.arr = _loc4_;
         this.giftMediator.setZhouqicailuPanel(_loc2_);
      }
      
      public function received_81662(param1:ByteArray) : void
      {
         ZLog.add("81662:返回金钱树面板信息 ");
         var _loc2_:Object = {};
         var _loc3_:Object = {};
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:int = param1.readInt();
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = {};
            _loc3_.paiming = param1.readInt();
            _loc3_.name = param1.readUTF();
            _loc3_.num = param1.readInt();
            _loc4_.push(_loc3_);
            _loc7_++;
         }
         _loc2_.jindu = param1.readInt();
         _loc2_.maxjindu = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc3_ = {};
            _loc3_.btntype = param1.readBoolean();
            _loc5_.push(_loc3_);
            _loc9_++;
         }
         _loc2_.arr = _loc4_;
         _loc2_.arr2 = _loc5_;
         this.giftMediator.setjinqianshu(_loc2_);
      }
      
      public function received_81712(param1:ByteArray) : void
      {
         ZLog.add("81712:开学排行榜信息 ");
         var _loc2_:Object = {};
         var _loc3_:Object = {};
         var _loc4_:Array = [];
         var _loc5_:int = param1.readInt();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = {};
            _loc3_.paiming = param1.readInt();
            _loc3_.name = param1.readUTF();
            _loc3_.jifen = param1.readInt();
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         _loc2_.arr = _loc4_;
         _loc2_.end = param1.readByte();
         this.giftMediator.setkaixuepaihangbang(_loc2_);
      }
      
      public function received_81742(param1:ByteArray) : void
      {
         ZLog.add("81742:器材排行榜信息 ");
         var _loc2_:Object = {};
         var _loc3_:Object = {};
         var _loc4_:Array = [];
         var _loc5_:int = param1.readInt();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = {};
            _loc3_.paiming = param1.readInt();
            _loc3_.name = param1.readUTF();
            _loc3_.jifen = param1.readInt();
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         _loc2_.arr = _loc4_;
         _loc2_.end = param1.readByte();
         this.giftMediator.setqicaipaihangbang(_loc2_);
      }
      
      public function received_81752(param1:ByteArray) : void
      {
         ZLog.add("81752：返回返利面板信息");
         var _loc2_:Object = new Object();
         _loc2_.yuanbao = param1.readInt();
         _loc2_.jinpiao = param1.readInt();
         _loc2_.xiaoyuanbao = param1.readInt();
         _loc2_.xiaojianpiao = param1.readInt();
         _loc2_.yuanbaolingjiangcishu = param1.readInt();
         _loc2_.jinpiaolingjiangcishu = param1.readInt();
         this.giftMediator.setHuoDongFanliData(_loc2_);
      }
      
      public function received_81762(param1:ByteArray) : void
      {
         ZLog.add("81762：返回夫妻同心面板");
         var _loc2_:Object = new Object();
         this.giftMediator.setFuqitongxinData(_loc2_);
      }
      
      public function received_81766(param1:ByteArray) : void
      {
         ZLog.add("81766:夫妻同心排行榜信息 ");
         var _loc2_:Object = {};
         var _loc3_:Object = {};
         var _loc4_:Array = [];
         var _loc5_:int = param1.readInt();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = {};
            _loc3_.paiming = param1.readInt();
            _loc3_.name = param1.readUTF();
            _loc3_.jifen = param1.readInt();
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         _loc2_.arr = _loc4_;
         _loc2_.end = param1.readByte();
         this.giftMediator.setfuqitongxinpaihangbang(_loc2_);
      }
      
      public function received_81822(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         ZLog.add("81822:返回六派竞技积分 ");
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < 6)
         {
            _loc3_ = param1.readInt();
            _loc2_.push(_loc3_);
            _loc4_++;
         }
         _loc2_.push(param1.readByte());
         this.giftMediator.setliupaijingjiPanel(_loc2_);
      }
      
      public function received_81842(param1:ByteArray) : void
      {
         ZLog.add("81842:返回迎宾周礼 ");
         var _loc2_:Array = [];
         _loc2_.push(param1.readByte());
         _loc2_.push(param1.readByte());
         _loc2_.push(param1.readByte());
         this.giftMediator.setyingbinzhouliPanel(_loc2_);
      }
      
      public function received_81892(param1:ByteArray) : void
      {
         ZLog.add("81892:返回迎宾周礼 ");
         var _loc2_:Array = [];
         var _loc3_:Object = {};
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = {};
            _loc3_.type = param1.readInt();
            _loc3_.goodID = param1.readInt();
            _loc3_.count = param1.readInt();
            _loc3_.hot = param1.readByte();
            _loc3_.price = param1.readInt();
            _loc2_.push(_loc3_);
            _loc7_++;
         }
         this.giftMediator.setZhenbaogePanel(_loc4_,_loc5_,_loc2_);
      }
      
      public function received_82040(param1:ByteArray) : void
      {
         ZLog.add("82040:播放烟花 ");
         HighEffectManager.set2016YanHuaEffect(60);
      }
      
      public function received_82102(param1:ByteArray) : void
      {
         ZLog.add("82102:200级装备效果 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.PLAYER);
         AvatarManager.AddEar_By_200Zhuangbei(_loc4_,11114,_loc3_);
      }
      
      public function received_82112(param1:ByteArray) : void
      {
         var _loc4_:Object = null;
         ZLog.add("82112:优惠周期 面板数据 ");
         var _loc2_:Object = {};
         _loc2_.time = param1.readUTF();
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < 7)
         {
            _loc4_ = {};
            _loc4_.onlyId = param1.readInt();
            _loc4_.shuzhi = param1.readInt();
            _loc4_.itemId = param1.readInt();
            _loc4_.itemNum = param1.readInt();
            _loc4_.isLingqu = param1.readInt();
            _loc3_.push(_loc4_);
            _loc5_++;
         }
         _loc2_.ary = _loc3_;
         this.giftMediator.setYouhuizhouqiPanel(_loc2_);
      }
      
      public function received_82132(param1:ByteArray) : void
      {
         ZLog.add("82132:优惠周期 面板数据 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         this.giftMediator.setOulePanel(_loc2_,_loc3_);
      }
      
      public function received_82142(param1:ByteArray) : void
      {
         var _loc2_:Object = null;
         ZLog.add("82142:英雄名称排行榜信息 ");
         var _loc3_:Array = [];
         var _loc4_:int = param1.readInt();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = {};
            _loc2_.paiming = param1.readInt();
            _loc2_.name = param1.readUTF();
            _loc2_.jifen = param1.readInt();
            _loc3_.push(_loc2_);
            _loc5_++;
         }
         _loc3_.sortOn("paiming",Array.NUMERIC);
         var _loc6_:Object = {};
         _loc6_.arr = _loc3_;
         _loc6_.isLingqu = param1.readInt();
         this.giftMediator.setyingxiongmingchengPanel(_loc6_);
      }
      
      public function received_82146(param1:ByteArray) : void
      {
         ZLog.add("82146:巅峰周期 面板数据 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.giftMediator.setDianfengzhouqiPanel(_loc2_,_loc3_);
      }
      
      public function received_82148(param1:ByteArray) : void
      {
         ZLog.add("82148:庆祝0606 面板数据 ");
         var _loc2_:int = param1.readInt();
         this.giftMediator.setQingzhu0606Panel(_loc2_);
      }
      
      public function received_82150(param1:ByteArray) : void
      {
         var _loc6_:Array = null;
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         ZLog.add("82150:神风 面板数据 ");
         var _loc2_:Object = {};
         _loc2_.type = param1.readInt();
         _loc2_.cishu = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = param1.readInt();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = [];
            _loc8_ = param1.readInt();
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc7_ = {};
               _loc7_.onlyId = param1.readInt();
               _loc7_.itemId = param1.readInt();
               _loc7_.itemNum = param1.readInt();
               _loc6_.push(_loc7_);
               _loc9_++;
            }
            _loc3_[_loc5_] = _loc6_;
            _loc5_++;
         }
         _loc2_.itemArr = _loc3_;
         _loc2_.time = param1.readUTF();
         if(_loc2_.type == 1 || _loc2_.type == 2)
         {
            this.giftMediator.setShenfengPanel(_loc2_);
         }
         else if(_loc2_.type == 11 || _loc2_.type == 12 || _loc2_.type == 13 || _loc2_.type == 14 || _loc2_.type == 15 || _loc2_.type == 16 || _loc2_.type == 17 || _loc2_.type == 18)
         {
            this.giftMediator.setWulinshendibaoPanel(_loc2_);
         }
         else if(_loc2_.type == 21 || _loc2_.type == 22 || _loc2_.type == 23 || _loc2_.type == 24 || _loc2_.type == 25 || _loc2_.type == 26)
         {
            this.giftMediator.setChaoJiWuLinDaBaoPanel(_loc2_);
         }
      }
      
      public function received_82144(param1:ByteArray) : void
      {
         ZLog.add("82144:加密 ");
         GameInstance.mainCharData.attributeInfo.random1 = param1.readInt();
         GameInstance.mainCharData.attributeInfo.random2 = param1.readInt();
         GameInstance.mainCharData.attributeInfo.random3 = param1.readUTF();
      }
      
      public function received_82152(param1:ByteArray) : void
      {
         ZLog.add("82152：测试");
         var _loc2_:int = param1.readInt();
         GameInstance.mainCharData.attributeInfo.random_str = OtherConst.CESHI.substr(_loc2_,20);
      }
      
      public function received_82202(param1:ByteArray) : void
      {
         ZLog.add("82182：每天优惠");
         var _loc2_:Object = {};
         var _loc3_:ByteArray = param1;
         _loc2_.time = _loc3_.readUTF();
         _loc2_.jifen = _loc3_.readInt();
         var _loc4_:int = _loc3_.readByte();
         var _loc5_:Array = [];
         var _loc6_:Object = {};
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            _loc6_ = {};
            _loc6_.buyid = _loc3_.readInt();
            _loc6_.id = _loc3_.readInt();
            _loc6_.count = _loc3_.readInt();
            _loc5_.push(_loc6_);
            _loc7_++;
         }
         _loc2_.arr = _loc5_;
         this.giftMediator.setMeitianyouhui2Panel(_loc2_);
      }
      
      public function received_82184(param1:ByteArray) : void
      {
         ZLog.add("82184:腾天羽 面板数据 ");
         var _loc2_:int = param1.readInt();
         this.giftMediator.setTengtianyuPanel(_loc2_);
      }
      
      public function received_82186(param1:ByteArray) : void
      {
         var _loc4_:Object = null;
         ZLog.add("82186:五毒圣阵 面板数据 ");
         var _loc2_:Object = {};
         _loc2_.type = param1.readInt();
         _loc2_.biaoti = param1.readUTF();
         _loc2_.time = param1.readUTF();
         _loc2_.miaoshu = param1.readUTF();
         _loc2_.cishu = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = {};
            _loc4_.onlyId = param1.readInt();
            _loc4_.txt1 = param1.readUTF();
            _loc4_.txt2 = param1.readUTF();
            _loc5_.push(_loc4_);
            _loc6_++;
         }
         _loc2_.arr = _loc5_;
         if(_loc2_.type == 12)
         {
            this.giftMediator.setFeishengjingjiePanel(_loc2_);
            return;
         }
         if(_loc2_.type == 13)
         {
            this.giftMediator.setV303Panel(_loc2_);
            return;
         }
         if(_loc2_.type < 5)
         {
            this.giftMediator.setHuodongPanel(_loc2_);
         }
         else
         {
            this.giftMediator.setHuodong2Panel(_loc2_);
         }
      }
      
      public function received_82242(param1:ByteArray) : void
      {
         ZLog.add("82242:返回当天充值数量(统一) ");
         var _loc2_:int = param1.readInt();
         GameInstance.mainCharData.moneyInfo.chongzhiNum = _loc2_;
         if(Fun.isVisible(GameInstance.uiInstance._liuyueyuanmanPanel))
         {
            GameInstance.uiInstance.$liuyueyuanmanPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._liuyueqingzhuPanel))
         {
            GameInstance.uiInstance.$liuyueqingzhuPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._meitianchongzhilibaoPanel))
         {
            GameInstance.uiInstance.$meitianchongzhilibaoPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._v300Panel))
         {
            GameInstance.uiInstance.$v300Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._moshizhouqiPanel))
         {
            GameInstance.uiInstance.$moshizhouqiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._bayuetouPanel))
         {
            GameInstance.uiInstance.$bayuetouPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shenqizhouqiPanel))
         {
            GameInstance.uiInstance.$shenqizhouqiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._1908Panel))
         {
            GameInstance.uiInstance.$1908Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qixihuodongPanel))
         {
            GameInstance.uiInstance.$qixihuodongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shijian902Panel))
         {
            GameInstance.uiInstance.$shijian902Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._yulanjiePanel))
         {
            GameInstance.uiInstance.$yulanjiePanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._chongjiuhuodongPanel))
         {
            GameInstance.uiInstance.$chongjiuhuodongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._wulinzhenyuanPanel))
         {
            GameInstance.uiInstance.$wulinzhenyuanPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._xuanwuxingjunPanel))
         {
            GameInstance.uiInstance.$xuanwuxingjunPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._wangzhezhengxiongPanel))
         {
            GameInstance.uiInstance.$wangzhezhengxiongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._baihuxingjunPanel))
         {
            GameInstance.uiInstance.$baihuxingjunPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._zhongqiu2017Panel))
         {
            GameInstance.uiInstance.$zhongqiu2017Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qinglongxingjunPanel))
         {
            GameInstance.uiInstance.$qinglongxingjunPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._lihejuePanel))
         {
            GameInstance.uiInstance.$lihejuePanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._meitianchongzhilibao2Panel))
         {
            GameInstance.uiInstance.$meitianchongzhilibao2Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._zhuquexingjunPanel))
         {
            GameInstance.uiInstance.$zhuquexingjunPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._20171020Panel))
         {
            GameInstance.uiInstance.$20171020Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._suixinxiaofeiPanel))
         {
            GameInstance.uiInstance.$suixinxiaofeiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._liunianhuodongPanel))
         {
            GameInstance.uiInstance.$liunianhuodongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._liunianpeibanPanel))
         {
            GameInstance.uiInstance.$liunianpeibanPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._yuenan0601Panel))
         {
            GameInstance.uiInstance.$0601Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qinglongxingjunfuwenPanel))
         {
            GameInstance.uiInstance.$qinglongxingjunfuwenPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._yuenan2017jiaoshijiePanel))
         {
            GameInstance.uiInstance.$yuenan2017jiaoshijiePanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shuanglongzhanPanel))
         {
         }
         if(Fun.isVisible(GameInstance.uiInstance._shuangLongZhan2Panel))
         {
            GameInstance.uiInstance.shuangLongZhan2Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shuangLongZhan3Panel))
         {
            GameInstance.uiInstance.shuangLongZhan3Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._1205shijianPanel))
         {
            GameInstance.uiInstance.$1205shijianPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._1212shijianPanel))
         {
            GameInstance.uiInstance.$1212shijianPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._1219shijianPanel))
         {
            GameInstance.uiInstance.$1219shijianPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._1226shijianPanel))
         {
            GameInstance.uiInstance.$1226shijianPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._yinshechudongPanel))
         {
            GameInstance.uiInstance.$yinshechudongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shengdanchongmanPanel))
         {
            GameInstance.uiInstance.$shengdanchongmanPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._wanshixingPanel))
         {
            GameInstance.uiInstance.$wanshixingPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qianghuajinshenPanel))
         {
            GameInstance.uiInstance.$qianghuajinshenPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qianghuajinshenPanel))
         {
            GameInstance.uiInstance.$qianghuajinshenPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._tianRenHePanel))
         {
            GameInstance.uiInstance.tianRenHePanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._rongQingAiYiPanel))
         {
            GameInstance.uiInstance.rongQingAiYiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._fuNvJie2018Panel))
         {
            GameInstance.uiInstance.fuNvJie2018Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._jinShenZhouQiPanel))
         {
            GameInstance.uiInstance.jinShenZhouQiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._baiQiaoKeLiPanel))
         {
            GameInstance.uiInstance.baiQiaoKeLiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._huangJinZhouQiPanel))
         {
            GameInstance.uiInstance.huangJinZhouQiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._tianRenHe2Panel))
         {
            GameInstance.uiInstance.tianRenHe2Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qiangHuaJinShen2Panel))
         {
            GameInstance.uiInstance.qiangHuaJinShen2Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qiangHuaJinShen3Panel))
         {
            GameInstance.uiInstance.qiangHuaJinShen3Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._yurenjie2018Panel))
         {
            GameInstance.uiInstance.yurenjie2018Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._changNianChongZhiPanel))
         {
            GameInstance.uiInstance.changNianChongZhiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._hanShiJiePanel))
         {
            GameInstance.uiInstance.hanShiJiePanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._xiongwangdaliPanel))
         {
            GameInstance.uiInstance.xiongwangdaliPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._laoDongJie2018))
         {
            GameInstance.uiInstance.laoDongJie2018.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._nantianhaoqiPanel))
         {
            GameInstance.uiInstance.nantianhaoqiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._banBenYouHui))
         {
            GameInstance.uiInstance.banBenYouHui.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._liXia2018))
         {
            GameInstance.uiInstance.liXia2018.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._huoDong0519Panel))
         {
            GameInstance.uiInstance.huoDong0519Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._tianXiaWuGongChuShaoLinPanel))
         {
            GameInstance.uiInstance.tianXiaWuGongChuShaoLinPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._chaoJiZhouQiPanel))
         {
            GameInstance.uiInstance.chaoJiZhouQiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._yueXiaoFeiYueLingJiangPanel))
         {
            GameInstance.uiInstance.yueXiaoFeiYueLingJiangPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._taoHuaZhiJingPanel))
         {
            GameInstance.uiInstance.taoHuaZhiJingPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._quanZhenXiaoYaoPanel))
         {
            GameInstance.uiInstance.quanZhenXiaoYaoPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._feiShengShenBaoPanel))
         {
            GameInstance.uiInstance.feiShengShenBaoPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._daGengXinHuoDongPanel))
         {
            GameInstance.uiInstance.daGengXinHuoDongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._wangZheZhouQiPanel))
         {
            GameInstance.uiInstance.wangZheZhouQiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._wangZheZhiBangHDPanel))
         {
            GameInstance.uiInstance.wangZheZhiBangHDPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._huanYingBaYuePanel))
         {
            GameInstance.uiInstance.huanYingBaYuePanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._yuLanZhouQiPanel))
         {
            GameInstance.uiInstance.yuLanZhouQiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._yuLanZhiEnPanel))
         {
            GameInstance.uiInstance.yuLanZhiEnPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._guoQingZhouQiPanel))
         {
            GameInstance.uiInstance.guoQingZhouQiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._guoQingZengSongPanel))
         {
            GameInstance.uiInstance.guoQingZengSongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shuangJiuHuoDongPanel))
         {
            GameInstance.uiInstance.shuangJiuHuoDongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._zhongQiuZengSongPanel))
         {
            GameInstance.uiInstance.zhongQiuZengSongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._zhongQiuJie2018Panel))
         {
            GameInstance.uiInstance.zhongQiuJie2018Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._zhongQiuZhouQiPanel))
         {
            GameInstance.uiInstance.zhongQiuZhouQiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qiuTianLiWuPanel))
         {
            GameInstance.uiInstance.qiuTianLiWuPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shuangShiHuoDongPanel))
         {
            GameInstance.uiInstance.shuangShiHuoDongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._yingjiefunvjiePanel))
         {
            GameInstance.uiInstance.yingjiefunvjiePanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._2018wanShengYePanel))
         {
            GameInstance.uiInstance.wanShengYePanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._gongFaYouHuiPanel))
         {
            GameInstance.uiInstance.gongFaYouHuiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._baoShiYangChengPanel))
         {
            GameInstance.uiInstance.baoShiYangChengPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._meiRiChongZhiPanel))
         {
            GameInstance.uiInstance.meiRiChongZhiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shengRiZhouQiPanel2018))
         {
            GameInstance.uiInstance.shengRiZhouQiPanel2018.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shengRiYuKuaiPanel))
         {
            GameInstance.uiInstance.shengRiYuKuaiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shiTuJiePanel))
         {
            GameInstance.uiInstance.shiTuJiePanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._tebierizi))
         {
            GameInstance.uiInstance.tebierizi.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._nianDi2018Dong))
         {
            GameInstance.uiInstance.nianDi2018Dong.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._jiangHuZhanPanel))
         {
            GameInstance.uiInstance.jiangHuZhanPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._zhuangWangGuiTianPanel))
         {
            GameInstance.uiInstance.zhuangWangGuiTianPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._zhuangWangCiShuPanel))
         {
            GameInstance.uiInstance.zhuangWangCiShuPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._zhuangWangJiePanel))
         {
            GameInstance.uiInstance.zhuangWangJiePanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._chuYi2019Panel))
         {
            GameInstance.uiInstance.chuYi2019Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._chuEr2019Panel))
         {
            GameInstance.uiInstance.chuEr2019Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._chuSan2019Panel))
         {
            GameInstance.uiInstance.chuSan2019Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._xiongWangJie2019Panel))
         {
            GameInstance.uiInstance.xiongWangJie2019Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shengGanHuiPanel))
         {
            GameInstance.uiInstance.shengGanHuiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._liuYueDi2019))
         {
            GameInstance.uiInstance.liuYueDi2019.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qiYueDi2019))
         {
            GameInstance.uiInstance.qiYueDi2019.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qixijie2019))
         {
            GameInstance.uiInstance.qixijie2019.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._guoqingjie2019))
         {
            GameInstance.uiInstance.guoqingjie2019.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._xiongzhanbang))
         {
            GameInstance.uiInstance.xiongzhanbang.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._wanshengjie2019Panel))
         {
            GameInstance.uiInstance.wanshengjie2019Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._baNianZhiMengPanel))
         {
            GameInstance.uiInstance.baNianZhiMengPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._xinNianKuaiLe2019Panel))
         {
            GameInstance.uiInstance.xinNianKuaiLe2019Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._chunjieyi))
         {
            GameInstance.uiInstance.chunjieyi.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._chunjieer))
         {
            GameInstance.uiInstance.chunjieer.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._chunjiesan))
         {
            GameInstance.uiInstance.chunjiesan.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._qianggou16Panel))
         {
            GameInstance.uiInstance.qianggou16Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._tianxiaqizhenPanel))
         {
            GameInstance.uiInstance.tianxiaqizhenPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._tianxiaqizhen2Panel))
         {
            GameInstance.uiInstance.tianxiaqizhen2Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._cailugungunPanel))
         {
            GameInstance.uiInstance.cailugungunPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._shuangsiyouhuiPanel))
         {
            GameInstance.uiInstance.shuangsiyouhuiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._yuRenJie2019Panel))
         {
            GameInstance.uiInstance.yuRenJie2019Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._tehui2021Panel))
         {
            GameInstance.uiInstance.tehui2021Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._chunJieSiPanel))
         {
            GameInstance.uiInstance.chunJieSiPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._laYue28Panel))
         {
            GameInstance.uiInstance.laYue28Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._laYue29Panel))
         {
            GameInstance.uiInstance.laYue29Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._laYue30Panel))
         {
            GameInstance.uiInstance.laYue30Panel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._leiChongLiWuPanel))
         {
            GameInstance.uiInstance.leiChongLiWuPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._lianXuLeiChongPanel))
         {
            GameInstance.uiInstance.lianXuLeiChongPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
         if(Fun.isVisible(GameInstance.uiInstance._zhenPinZhiMengVariantPanel))
         {
            GameInstance.uiInstance._zhenPinZhiMengVariantPanel.setNum(GameInstance.mainCharData.moneyInfo.chongzhiNum);
         }
      }
      
      public function received_82262(param1:ByteArray) : void
      {
         ZLog.add("82262:六月底返回 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.giftMediator.setLiuyuediPanel(_loc2_,_loc3_);
      }
      
      public function received_82302(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("82302: 首充返回 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:Object = {};
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc7_ = new Object();
            _loc7_.id = param1.readInt();
            _loc7_.num = param1.readInt();
            _loc4_.push(_loc7_);
            _loc6_++;
         }
         _loc5_.ar = _loc4_;
         _loc5_.num = _loc2_;
         this.giftMediator.setShouchongshijianPanel(_loc5_);
      }
      
      public function received_82312(param1:ByteArray) : void
      {
         ZLog.add("82312: 同乐飞升境界 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(param1.readByte());
            _loc4_++;
         }
         this.giftMediator.setTonglefeishengjingjiePanel(_loc3_);
      }
      
      public function received_82362(param1:ByteArray) : void
      {
         ZLog.add("82362: 欢迎维系 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.giftMediator.setHuangyingweixiPanel(_loc2_,_loc3_);
      }
      
      public function received_82382(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         ZLog.add("82382: 返回开学气球面板信息 ");
         var _loc2_:Object = {};
         var _loc3_:Object = {};
         var _loc4_:Array = [];
         _loc2_.lanqiqiunum = param1.readInt();
         _loc2_.huangqiqiunum = param1.readInt();
         _loc2_.hongqiqiunum = param1.readInt();
         _loc5_ = param1.readByte();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = {};
            _loc3_.name = param1.readUTF();
            _loc3_.mingci = param1.readByte();
            _loc3_.num = param1.readInt();
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         _loc2_.lanqiqiuArr = _loc4_;
         _loc4_ = [];
         _loc5_ = param1.readByte();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = {};
            _loc3_.name = param1.readUTF();
            _loc3_.mingci = param1.readByte();
            _loc3_.num = param1.readInt();
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         _loc2_.huangqiqiuArr = _loc4_;
         _loc4_ = [];
         _loc5_ = param1.readByte();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = {};
            _loc3_.name = param1.readUTF();
            _loc3_.mingci = param1.readByte();
            _loc3_.num = param1.readInt();
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         _loc2_.hongqiqiuArr = _loc4_;
         _loc4_ = [];
         _loc5_ = param1.readByte();
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = {};
            _loc3_.mingci = param1.readByte();
            _loc3_.name = param1.readByte();
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         _loc2_.zongpaiming = _loc4_;
         this.giftMediator.setKaixueqiqiuPanel(_loc2_);
      }
      
      public function received_82402(param1:ByteArray) : void
      {
         ZLog.add("82402: 货真价实 ");
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < 7)
         {
            _loc2_.push(param1.readInt());
            _loc3_++;
         }
         this.giftMediator.sethuozhenjiashiPanel(_loc2_);
      }
      
      public function received_82432(param1:ByteArray) : void
      {
         ZLog.add("82432: 王者活动 ");
         var _loc2_:Array = [];
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.push(param1.readByte());
            _loc4_++;
         }
         this.giftMediator.setwangzhehuodongPanel(_loc2_);
      }
      
      public function received_82434(param1:ByteArray) : void
      {
         ZLog.add("82434: 10月优惠周期 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(param1.readByte());
            _loc4_++;
         }
         this.giftMediator.set10yueyouhuizhouqiPanel(_loc3_);
      }
      
      public function received_82462(param1:ByteArray) : void
      {
         ZLog.add("82462: 赠送女人面板刷新 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:Object = {};
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = {};
            _loc4_.name = param1.readUTF();
            _loc4_.mingci = param1.readInt();
            _loc4_.num = param1.readInt();
            _loc3_.push(_loc4_);
            _loc5_++;
         }
         _loc4_ = {};
         _loc4_.jifen = param1.readInt();
         _loc4_.arr = _loc3_;
         this.giftMediator.setZengsongnvrenPanel(_loc4_);
      }
      
      public function received_82482(param1:ByteArray) : void
      {
         ZLog.add("82482: 返回化妆大赛面板 ");
         var _loc2_:Object = {};
         _loc2_.piaoshu = param1.readInt();
         _loc2_.mingci = param1.readInt();
         _loc2_.pageMax = param1.readInt();
         this.giftMediator.setHuazhuangdasaiPanel(_loc2_);
      }
      
      public function received_82484(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         ZLog.add("82484: 返回化妆大赛当前页数的信息 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = new Object();
            _loc6_.piaoshu = param1.readInt();
            _loc6_.mingci = param1.readInt();
            _loc6_.name = param1.readUTF();
            _loc6_.qu = param1.readUTF();
            _loc6_.zaixian = param1.readByte();
            if(_loc6_.zaixian != 1)
            {
               _loc3_.push(_loc6_);
            }
            else
            {
               _loc6_.id = param1.readInt();
               _loc6_.partyID = param1.readByte();
               _loc7_ = param1.readByte();
               _loc6_.equipArr = [];
               _loc8_ = 0;
               _loc9_ = 0;
               while(_loc9_ < _loc7_)
               {
                  _loc10_ = param1.readInt();
                  _loc6_.equipArr[_loc6_.equipArr.length] = new Goods(_loc10_);
                  if(SpecialGoodsID.getSpecialAvatarType(_loc10_) > 0)
                  {
                     _loc8_ = SpecialGoodsID.getSpecialAvatarType(_loc10_);
                  }
                  _loc9_++;
               }
               _loc6_.usingFashion = _loc8_;
               _loc6_.isOnMount = param1.readByte();
               if(_loc6_.isOnMount)
               {
                  _loc6_.mountID = param1.readInt();
               }
               else
               {
                  param1.readInt();
               }
               _loc6_.useAvatarType = param1.readInt();
               _loc6_.isFeixing = param1.readByte() == 1;
               _loc6_.isFeixing = false;
               _loc3_.push(_loc6_);
            }
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         this.giftMediator.setHuazhuangdasaiList(_loc3_,_loc5_);
      }
      
      public function received_82492(param1:ByteArray) : void
      {
         ZLog.add("82492: 返回七天累计充值积分");
         var _loc2_:int = param1.readInt();
         this.giftMediator.setGanenliunianLeijizhi(_loc2_);
      }
      
      public function received_82522(param1:ByteArray) : void
      {
         ZLog.add("82522: 内力盖世详情信息");
         var _loc2_:Object = {};
         _loc2_.qinglongdui = param1.readInt();
         _loc2_.xuanwudui = param1.readInt();
         _loc2_.ziji = param1.readInt();
         var _loc3_:Object = {};
         _loc2_.len = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.len)
         {
            _loc3_ = {};
            _loc3_.mingci = param1.readByte();
            _loc3_.name = param1.readUTF();
            _loc3_.jifen = param1.readInt();
            _loc4_.push(_loc3_);
            _loc5_++;
         }
         _loc2_.arr = _loc4_;
         this.giftMediator.setNeiligaishiPanel(_loc2_);
      }
      
      public function received_82572(param1:ByteArray) : void
      {
         ZLog.add("82572: 下雪通知");
         this.giftMediator.setXiaXueEef();
      }
      
      public function received_82612(param1:ByteArray) : void
      {
         ZLog.add("82612: 培养巅峰兽");
         var _loc2_:Array = [];
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.push(param1.readByte());
            _loc4_++;
         }
         this.giftMediator.setDianfengshouPanel(_loc2_);
      }
      
      public function received_82716(param1:ByteArray) : void
      {
         ZLog.add("82716：返回版本优惠");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = param1.readInt();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_.push(param1.readByte());
            _loc5_++;
         }
         this.giftMediator.setBanBenYouHuiData(_loc2_,_loc3_);
      }
      
      public function received_83024(param1:ByteArray) : void
      {
         ZLog.add("83024：返回水果累计次数");
         var _loc2_:int = param1.readInt();
         this.giftMediator.setShuiGuoLeiJiPanel(_loc2_);
      }
      
      public function received_83032(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("83032：返回水果累计次数");
         var _loc2_:Object = new Object();
         _loc2_.num1 = param1.readInt();
         var _loc3_:int = param1.readByte();
         _loc2_.arr = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.rank = param1.readByte();
            _loc5_.name = param1.readUTF();
            _loc2_.arr.push(_loc5_);
            _loc4_++;
         }
         _loc2_.num2 = param1.readInt();
         _loc2_.num3 = param1.readInt();
         this.giftMediator.setZhiZunZhengDuoData(_loc2_);
      }
      
      public function received_83042(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("83042：返回争夺战数据");
         var _loc2_:Object = new Object();
         var _loc3_:int = param1.readInt();
         _loc2_.arr = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.name = param1.readUTF();
            _loc5_.rank = param1.readInt();
            _loc2_.arr.push(_loc5_);
            _loc4_++;
         }
         _loc2_.rank = param1.readInt();
         _loc2_.score = param1.readInt();
         this.giftMediator.setZhengDuoZhanData(_loc2_);
      }
      
      public function received_83072(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("83072：返回美酒排行数据");
         var _loc2_:Object = new Object();
         _loc2_.type = param1.readByte();
         var _loc3_:int = param1.readInt();
         _loc2_.arr = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.name = param1.readUTF();
            _loc5_.rank = param1.readInt();
            _loc2_.arr.push(_loc5_);
            _loc4_++;
         }
         _loc2_.rank = param1.readInt();
         _loc2_.score = param1.readInt();
         if(_loc2_.type == 1)
         {
            this.giftMediator.setMeiJiuPaiHangData(_loc2_);
         }
         else if(_loc2_.type == 2)
         {
            this.giftMediator.setXingXingPaiHangData(_loc2_);
         }
         else if(_loc2_.type == 3)
         {
            this.giftMediator.setLieShouPaiHangData(_loc2_);
         }
         else if(_loc2_.type == 4)
         {
            this.giftMediator.setFuNvJiePaiHangData(_loc2_);
         }
         else if(_loc2_.type == 5)
         {
            this.giftMediator.setLieShouPaiHang2Data(_loc2_);
         }
      }
      
      public function received_83074(param1:ByteArray) : void
      {
         ZLog.add("83074：飘花瓣");
         HighEffectManager.fenFlower_start(30);
      }
      
      public function received_83078(param1:ByteArray) : void
      {
         ZLog.add("83078：放烟花");
         var _loc2_:int = param1.readInt();
         this.giftMediator.setFangYanHuaData(_loc2_);
      }
      
      public function received_83092(param1:ByteArray) : void
      {
         ZLog.add("83092：返回周一快乐累计充值数量");
         var _loc2_:int = param1.readInt();
         this.giftMediator.setZhouyikuaileData(_loc2_);
      }
      
      public function received_83094(param1:ByteArray) : void
      {
         ZLog.add("83094：返回周末热闹累计充值数量");
         var _loc2_:int = param1.readInt();
         this.giftMediator.setZhoumorenaoData(_loc2_);
      }
      
      public function received_83098(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         ZLog.add("83098：返回周末热闹累计充值数量");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 77)
         {
            _loc3_ = param1.readInt();
            _loc4_ = param1.readInt();
         }
         else
         {
            _loc3_ = param1.readInt();
         }
         this.giftMediator.setteshuleijiData(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_83182(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc2_:Object = new Object();
         _loc2_.index = param1.readByte();
         _loc2_.name = param1.readUTF();
         _loc2_.time = param1.readUTF();
         _loc2_.currProgress = param1.readInt();
         _loc2_.totleProgress = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         _loc2_.arr1 = new Array();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.receivePoint = param1.readByte();
            _loc5_.goodsID = param1.readInt();
            _loc5_.canReceie = param1.readByte();
            _loc5_.isReceie = param1.readByte();
            _loc2_.arr1.push(_loc5_);
            _loc4_++;
         }
         _loc2_.addStr = param1.readUTF();
         _loc2_.freeGoods = param1.readInt();
         _loc2_.isReceiveFreeGoods = param1.readByte();
         _loc3_ = param1.readByte();
         _loc2_.arr2 = new Array();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.goodsID = param1.readInt();
            _loc2_.arr2.push(_loc5_);
            _loc4_++;
         }
         this.giftMediator.setShengJieDaHuiKuiData(_loc2_);
      }
      
      public function received_83188(param1:ByteArray) : void
      {
         var _loc2_:Object = new Object();
         _loc2_.index = param1.readByte();
         _loc2_.active = param1.readByte();
         this.giftMediator.setShengJieDaHuiKuiIsActive(_loc2_);
      }
      
      public function received_83230(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.curPro = param1.readInt();
            _loc5_.maxPro = param1.readInt();
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.giftMediator.setLiDongJie2023(_loc3_);
      }
   }
}

