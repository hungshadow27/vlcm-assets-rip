package com.tgame.moudels.Item.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.staticdata.CoolingType;
   import com.tgame.common.staticdata.DrugsKind;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Girl;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.PureGirl;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.common.vo.character.info.MoneyInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.common.vo.item.MountSkill;
   import com.tgame.common.vo.item.WalkShop;
   import com.tgame.common.vo.item.WalkShopDetail;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.manager.TopTipManager;
   import com.tgame.moudels.Item.model.vo.KuaFuBagVO;
   import com.tgame.moudels.Item.view.Item_BackpackMediator;
   import com.tgame.moudels.Item.view.Item_DepotMediator;
   import com.tgame.moudels.Item.view.Item_ItemChangeMediator;
   import com.tgame.moudels.Item.view.Item_KuaFuBagMediator;
   import com.tgame.moudels.Item.view.Item_MainCharAttrMediator;
   import com.tgame.moudels.Item.view.Item_MainCharRideAttrMediator;
   import com.tgame.moudels.Item.view.Item_MainCharShopListMediator;
   import com.tgame.moudels.Item.view.Item_MainCharShopMediator;
   import com.tgame.moudels.Item.view.Item_NPCShopMediator;
   import com.tgame.moudels.Item.view.Item_RepairMediator;
   import com.tgame.moudels.Item.view.Item_RideAttrMediator;
   import com.tgame.moudels.Item.view.Item_RideDepotMediator;
   import com.tgame.moudels.Item.view.Item_TradeMediator;
   import com.tgame.moudels.Item.view.Item_ZhanhundaiMediator;
   import com.tgame.moudels.fight.model.Fight_proxy;
   import com.tgame.moudels.login.view.*;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.manager.CDFaceManager;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Item_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Item_MsgReceivedProxy";
      
      private var _itemProxy:Item_ItemProxy;
      
      private var _itemTipProxy:Item_TipProxy;
      
      private var _backPackMediator:Item_BackpackMediator;
      
      private var _depotMediator:Item_DepotMediator;
      
      private var _charAttrPanel:Item_MainCharAttrMediator;
      
      private var _mainCharWalkShop:Item_MainCharShopMediator;
      
      private var _mainCharRideDepot:Item_RideDepotMediator;
      
      private var _walkShopListPanel:Item_MainCharShopListMediator;
      
      private var _tradePanel:Item_TradeMediator;
      
      private var _npcShop:Item_NPCShopMediator;
      
      private var _rideAttrPanel:Item_RideAttrMediator;
      
      private var _mainCharRidePanel:Item_MainCharRideAttrMediator;
      
      private var _itemChangeMediator:Item_ItemChangeMediator;
      
      private var _repairPanel:Item_RepairMediator;
      
      private var _msgSenderProxy:Item_MsgSenderProxy;
      
      private var _kuaFuBag:Item_KuaFuBagMediator;
      
      private var _zhanhundai:Item_ZhanhundaiMediator;
      
      private var BUFF_P:String = "BUFF";
      
      private var time1:Timer;
      
      private var time2:Timer;
      
      private var time3:Timer;
      
      public function Item_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      protected function get repairPanelMeditor() : Item_RepairMediator
      {
         if(this._repairPanel == null)
         {
            this._repairPanel = facade.retrieveMediator(Item_RepairMediator.NAME) as Item_RepairMediator;
         }
         return this._repairPanel;
      }
      
      protected function get mainCharRidePanel() : Item_MainCharRideAttrMediator
      {
         if(this._mainCharRidePanel == null)
         {
            this._mainCharRidePanel = facade.retrieveMediator(Item_MainCharRideAttrMediator.NAME) as Item_MainCharRideAttrMediator;
         }
         return this._mainCharRidePanel;
      }
      
      protected function get itemChangeMediator() : Item_ItemChangeMediator
      {
         if(this._itemChangeMediator == null)
         {
            this._itemChangeMediator = facade.retrieveMediator(Item_ItemChangeMediator.NAME) as Item_ItemChangeMediator;
         }
         return this._itemChangeMediator;
      }
      
      protected function get rideAttrPanel() : Item_RideAttrMediator
      {
         if(this._rideAttrPanel == null)
         {
            this._rideAttrPanel = facade.retrieveMediator(Item_RideAttrMediator.NAME) as Item_RideAttrMediator;
         }
         return this._rideAttrPanel;
      }
      
      protected function get charAttrPanel() : Item_MainCharAttrMediator
      {
         if(this._charAttrPanel == null)
         {
            this._charAttrPanel = facade.retrieveMediator(Item_MainCharAttrMediator.NAME) as Item_MainCharAttrMediator;
         }
         return this._charAttrPanel;
      }
      
      protected function get mainCharWalkShop() : Item_MainCharShopMediator
      {
         if(this._mainCharWalkShop == null)
         {
            this._mainCharWalkShop = facade.retrieveMediator(Item_MainCharShopMediator.NAME) as Item_MainCharShopMediator;
         }
         return this._mainCharWalkShop;
      }
      
      protected function get backPackMediator() : Item_BackpackMediator
      {
         if(this._backPackMediator == null)
         {
            this._backPackMediator = facade.retrieveMediator(Item_BackpackMediator.NAME) as Item_BackpackMediator;
         }
         return this._backPackMediator;
      }
      
      protected function get depotMediator() : Item_DepotMediator
      {
         if(this._depotMediator == null)
         {
            this._depotMediator = facade.retrieveMediator(Item_DepotMediator.NAME) as Item_DepotMediator;
         }
         return this._depotMediator;
      }
      
      protected function get mainCharRideDepot() : Item_RideDepotMediator
      {
         if(this._mainCharRideDepot == null)
         {
            this._mainCharRideDepot = facade.retrieveMediator(Item_RideDepotMediator.NAME) as Item_RideDepotMediator;
         }
         return this._mainCharRideDepot;
      }
      
      protected function get walkShopList() : Item_MainCharShopListMediator
      {
         if(this._walkShopListPanel == null)
         {
            this._walkShopListPanel = facade.retrieveMediator(Item_MainCharShopListMediator.NAME) as Item_MainCharShopListMediator;
         }
         return this._walkShopListPanel;
      }
      
      protected function get tradePanel() : Item_TradeMediator
      {
         if(this._tradePanel == null)
         {
            this._tradePanel = facade.retrieveMediator(Item_TradeMediator.NAME) as Item_TradeMediator;
         }
         return this._tradePanel;
      }
      
      protected function get npcShop() : Item_NPCShopMediator
      {
         if(this._npcShop == null)
         {
            this._npcShop = facade.retrieveMediator(Item_NPCShopMediator.NAME) as Item_NPCShopMediator;
         }
         return this._npcShop;
      }
      
      public function get itemTipProxy() : Item_TipProxy
      {
         if(this._itemTipProxy == null)
         {
            this._itemTipProxy = facade.retrieveProxy(Item_TipProxy.NAME) as Item_TipProxy;
         }
         return this._itemTipProxy;
      }
      
      public function get msgSenderProxy() : Item_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      public function get kuaFuBag() : Item_KuaFuBagMediator
      {
         if(this._kuaFuBag == null)
         {
            this._kuaFuBag = facade.retrieveMediator(Item_KuaFuBagMediator.NAME) as Item_KuaFuBagMediator;
         }
         return this._kuaFuBag;
      }
      
      public function get zhanhundai() : Item_ZhanhundaiMediator
      {
         if(this._zhanhundai == null)
         {
            this._zhanhundai = facade.retrieveMediator(Item_ZhanhundaiMediator.NAME) as Item_ZhanhundaiMediator;
         }
         return this._zhanhundai;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([10024,10026,10076,10176,10178,50102,10040,10044,10042,11190,11192,11194,13002,11198,50054,13006,13012,13017,10824,10828,10840,10842,10844,10846,10838,13008,13020,10882,10180,50062,10078,13018,13016,11196,11212,11214,49990,10280,50222,50224,10170,50140,50142,50132,10282,53052,53202,53204,53772,53774,49994,53092,55902,11180,53206,60222,60224,60226,60228,60230,60232,59778,49996,72986,10006,10008,83076],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10024,10026,10076,10176,10178,50102,10040,10044,10042,11190,11192,11194,13002,11198,50054,13006,13012,13017,10824,10828,10840,10842,10844,10846,10838,13008,13020,10882,10180,50062,10078,13018,13016,11196,11212,11214,49990,10280,50222,50224,10170,50140,50142,50132,10282,53052,53202,53204,53772,53774,49994,53092,55902,11180,53206,60222,60224,60226,60228,60230,60232,59778,49996,72986,10006,10008,83076],NAME);
      }
      
      private function get itemProxy() : Item_ItemProxy
      {
         if(!this._itemProxy)
         {
            this._itemProxy = facade.retrieveProxy(Item_ItemProxy.NAME) as Item_ItemProxy;
         }
         return this._itemProxy;
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
      
      public function received_10024(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         ZLog.add("10024：主角包裹道具");
         var _loc2_:int = param1.readShort();
         GameInstance.mainCharData.goodsInfo.goodsBagArr.length = 0;
         GameInstance.mainCharData.goodsInfo.goodsOfQuickBar.length = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            _loc5_ = param1.readShort();
            _loc7_ = param1.readShort();
            _loc6_ = param1.readInt();
            _loc9_ = param1.readByte();
            _loc10_ = param1.readByte();
            _loc11_ = param1.readInt();
            _loc12_ = param1.readByte();
            _loc13_ = param1.readByte();
            _loc8_ = new Goods(_loc4_,_loc5_,_loc7_);
            _loc8_.quality = _loc9_;
            _loc8_.bind = _loc10_;
            _loc8_.roleID = GameInstance.mainChar.id;
            _loc8_.count = _loc6_;
            _loc8_.curr_durability = _loc11_;
            _loc8_.strengthen_grade = _loc12_;
            _loc8_.isShowDestroyPanel = _loc13_ == 1;
            GameInstance.mainCharData.goodsInfo.goodsBagArr.push(_loc8_);
            if(_loc7_ != 0)
            {
               ExchangePositionManager.addGoodsOfQuickBar(_loc8_);
            }
            _loc3_++;
         }
         if(ReloginManager.isInKuafu)
         {
            this.kuaFuBag.updateGoods(GameInstance.mainCharData.goodsInfo.goodsBagArr);
            this.itemTipProxy.removeTipAll();
         }
         else
         {
            this.backPackMediator.showItemBag(ExchangePositionManager.bagCount - 1);
            this.itemTipProxy.removeTipAll();
            ExchangePositionManager.getShortIndexItem();
            PipeManager.sendMsg(PipeConstants.GOODS_CHANGED);
            TaskTracker.updateTaskUI();
         }
      }
      
      public function received_10026(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Goods = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         ZLog.add("10026：主角仓库道具");
         var _loc2_:int = param1.readShort();
         GameInstance.mainCharData.goodsInfo.goodsDepotArr.length = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            _loc5_ = param1.readShort();
            _loc6_ = param1.readInt();
            _loc8_ = param1.readByte();
            _loc9_ = param1.readByte();
            _loc10_ = param1.readInt();
            _loc11_ = param1.readByte();
            _loc7_ = new Goods(_loc4_,_loc5_);
            _loc7_.quality = _loc8_;
            _loc7_.bind = _loc9_;
            _loc7_.roleID = GameInstance.mainChar.id;
            _loc7_.count = _loc6_;
            _loc7_.curr_durability = _loc10_;
            _loc7_.isShowDestroyPanel = _loc11_ == 1;
            GameInstance.mainCharData.goodsInfo.goodsDepotArr.push(_loc7_);
            _loc3_++;
         }
         this.itemTipProxy.removeTipAll();
         this.depotMediator.showItemDepot(ExchangePositionManager.depotCount - 1);
      }
      
      public function received_10040(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         ZLog.add("10040：初始化身上装备信息");
         var _loc2_:int = param1.readInt();
         GameInstance.mainCharData.goodsInfo.goodsBodyArr.length = 0;
         GameInstance.mainCharData.goodsInfo.goodsBodyDict = new Dictionary();
         GameInstance.mainCharData.goodsInfo.YNsbtrArr.length = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readShort();
            _loc4_ = new Goods(_loc5_,_loc6_);
            _loc4_.roleID = GameInstance.mainChar.id;
            _loc4_.strengthen_grade = param1.readByte();
            _loc4_.quality = param1.readByte();
            _loc4_.bind = param1.readByte();
            _loc4_.curr_durability = param1.readInt();
            _loc4_.isFullStar = param1.readByte();
            _loc4_.strengthen_total = param1.readByte();
            _loc4_.isTuteng = param1.readByte();
            _loc4_.isBaoshiTOP = param1.readByte();
            _loc4_.isNiuBi = param1.readByte();
            _loc4_.isFullTianshen = param1.readByte();
            _loc4_.isSiShengShou = param1.readByte();
            _loc4_.isFullStone = param1.readByte();
            GameInstance.mainCharData.goodsInfo.goodsBodyArr.push(_loc4_);
            GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc4_.res.position] = _loc4_;
            if(ItemPositionRange.POSITION_SHIBALUOHAN_ARR.indexOf(_loc4_.res.position) != -1)
            {
               GameInstance.mainCharData.goodsInfo.YNsbtrArr.push(_loc4_);
            }
            _loc3_++;
         }
         this.charAttrPanel.showBodyItem();
      }
      
      public function received_10044(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         ZLog.add("10044：初始化身上装备信息跟着10040");
         var _loc2_:int = param1.readInt();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readShort();
            _loc4_ = new Goods(_loc5_,_loc6_);
            _loc4_.roleID = GameInstance.mainChar.id;
            _loc4_.strengthen_grade = param1.readByte();
            _loc4_.quality = param1.readByte();
            _loc4_.bind = param1.readByte();
            _loc4_.curr_durability = param1.readInt();
            _loc4_.isFullStar = param1.readByte();
            _loc4_.strengthen_total = param1.readByte();
            _loc4_.isTuteng = param1.readByte();
            _loc4_.isBaoshiTOP = param1.readByte();
            _loc4_.isNiuBi = param1.readByte();
            _loc4_.isFullTianshen = param1.readByte();
            _loc4_.isSiShengShou = param1.readByte();
            _loc4_.isFullStone = param1.readByte();
            GameInstance.mainCharData.goodsInfo.goodsBodyArr.push(_loc4_);
            GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc4_.res.position] = _loc4_;
            _loc3_++;
         }
         this.charAttrPanel.showBodyItem();
      }
      
      public function received_10006(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         ZLog.add("10006：初始化身上装备信息跟着10044");
         var _loc2_:int = param1.readInt();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readShort();
            _loc4_ = new Goods(_loc5_,_loc6_);
            _loc4_.roleID = GameInstance.mainChar.id;
            _loc4_.strengthen_grade = param1.readByte();
            _loc4_.quality = param1.readByte();
            _loc4_.bind = param1.readByte();
            _loc4_.curr_durability = param1.readInt();
            _loc4_.isFullStar = param1.readByte();
            _loc4_.strengthen_total = param1.readByte();
            _loc4_.isTuteng = param1.readByte();
            _loc4_.isBaoshiTOP = param1.readByte();
            _loc4_.isNiuBi = param1.readByte();
            _loc4_.isFullTianshen = param1.readByte();
            _loc4_.isSiShengShou = param1.readByte();
            _loc4_.isFullStone = param1.readByte();
            GameInstance.mainCharData.goodsInfo.goodsBodyArr.push(_loc4_);
            GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc4_.res.position] = _loc4_;
            _loc3_++;
         }
         this.charAttrPanel.showBodyItem();
      }
      
      public function received_10008(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         ZLog.add("10008：初始化身上装备信息跟着10006");
         var _loc2_:int = param1.readInt();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readShort();
            _loc4_ = new Goods(_loc5_,_loc6_);
            _loc4_.roleID = GameInstance.mainChar.id;
            _loc4_.strengthen_grade = param1.readByte();
            _loc4_.quality = param1.readByte();
            _loc4_.bind = param1.readByte();
            _loc4_.curr_durability = param1.readInt();
            _loc4_.isFullStar = param1.readByte();
            _loc4_.strengthen_total = param1.readByte();
            _loc4_.isTuteng = param1.readByte();
            _loc4_.isBaoshiTOP = param1.readByte();
            _loc4_.isNiuBi = param1.readByte();
            _loc4_.isFullTianshen = param1.readByte();
            _loc4_.isSiShengShou = param1.readByte();
            _loc4_.isFullStone = param1.readByte();
            GameInstance.mainCharData.goodsInfo.goodsBodyArr.push(_loc4_);
            GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc4_.res.position] = _loc4_;
            _loc3_++;
         }
         this.charAttrPanel.showBodyItem();
      }
      
      public function received_10042(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Goods = null;
         ZLog.add("10042：初始化摊位道具信息");
         var _loc2_:int = param1.readShort();
         GameInstance.mainCharData.goodsInfo.goodsWalkShopArr.length = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            _loc5_ = param1.readShort();
            _loc6_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readInt();
            _loc10_ = new Goods(_loc4_,_loc5_);
            _loc10_.roleID = GameInstance.mainChar.id;
            _loc10_.count = _loc6_;
            _loc10_.saleCopper = _loc8_;
            _loc10_.saleGold = _loc9_;
            _loc10_.quality = param1.readByte();
            _loc10_.bind = param1.readByte();
            _loc10_.curr_durability = param1.readInt();
            GameInstance.mainCharData.goodsInfo.goodsWalkShopArr.push(_loc10_);
            _loc3_++;
         }
         this.mainCharWalkShop.showWalkShops();
      }
      
      public function received_13002(param1:ByteArray) : void
      {
         ZLog.add("13002：接收物品上架信息");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:Goods = new Goods(_loc3_,_loc2_);
         _loc7_.roleID = GameInstance.mainChar.id;
         _loc7_.count = _loc4_;
         _loc7_.saleCopper = _loc5_;
         _loc7_.saleGold = _loc6_;
         _loc7_.quality = param1.readByte();
         _loc7_.bind = param1.readByte();
         GameInstance.mainCharData.goodsInfo.goodsWalkShopArr.push(_loc7_);
         this.mainCharWalkShop.showWalkShops();
      }
      
      public function received_10076(param1:ByteArray) : void
      {
         ZLog.add("10076：道具挪动失败");
         var _loc2_:String = NetWorkManager.readGILMsg(param1);
         NoticeManager.notify(NoticeManager.ALERT,_loc2_);
      }
      
      public function received_10176(param1:ByteArray) : void
      {
         var _loc11_:Goods = null;
         var _loc12_:int = 0;
         ZLog.add("10176：更新或在索引处增加物品");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readByte();
         var _loc10_:GoodsInfo = GameInstance.mainCharData.goodsInfo;
         if(ItemPositionRange.inBag(_loc2_))
         {
            _loc11_ = _loc10_.getGoodsByPosition_bag(_loc2_);
            if(_loc11_ != null)
            {
               _loc10_.deleteGoods_bag(_loc11_);
            }
         }
         else if(ItemPositionRange.inStorage(_loc2_))
         {
            _loc11_ = _loc10_.getGoodsByPosition_Depot(_loc2_);
            if(_loc11_ != null)
            {
               _loc10_.deleteGoods_Depot(_loc11_);
            }
         }
         else if(ItemPositionRange.inKuafuBag(_loc2_))
         {
            _loc11_ = _loc10_.getGoodsByPosition_KuafuBag(_loc2_);
            if(_loc11_ != null)
            {
               _loc10_.deleteGoods_KuafuBag(_loc11_);
            }
         }
         else
         {
            _loc11_ = _loc10_.getGoodsByPosition(_loc2_);
            if(_loc11_ != null)
            {
               _loc10_.deleteGoods(_loc11_);
            }
         }
         _loc12_ = 0;
         if(_loc11_ != null && _loc11_.quickbarindex != 0)
         {
            _loc12_ = _loc11_.quickbarindex;
            ExchangePositionManager.deleteGoodsOfQuickBar(_loc11_);
         }
         _loc12_ = 0;
         if(_loc11_ != null && _loc11_.quickbarindex != 0)
         {
            _loc12_ = _loc11_.quickbarindex;
            ExchangePositionManager.deleteGoodsOfQuickBar(_loc11_);
         }
         _loc11_ = new Goods(_loc4_,_loc2_,_loc3_);
         _loc11_.bind = _loc7_;
         _loc11_.curr_durability = _loc8_;
         _loc11_.quality = _loc6_;
         _loc11_.roleID = GameInstance.mainChar.id;
         _loc11_.count = _loc5_;
         _loc11_.isShowDestroyPanel = _loc9_ == 1;
         if(ItemPositionRange.inBag(_loc2_))
         {
            GameInstance.mainCharData.goodsInfo.goodsBagArr.push(_loc11_);
            if(ReloginManager.isInKuafu)
            {
               this.kuaFuBag.updateGoods(GameInstance.mainCharData.goodsInfo.goodsBagArr);
            }
            else
            {
               this.backPackMediator.showItemBag(ExchangePositionManager.bagCount - 1);
               this.backPackMediator.checkFirstDrug(_loc11_);
            }
         }
         else if(ItemPositionRange.inStorage(_loc2_))
         {
            GameInstance.mainCharData.goodsInfo.goodsDepotArr.push(_loc11_);
            this.depotMediator.showItemDepot(ExchangePositionManager.depotCount - 1);
         }
         else if(ItemPositionRange.inKuafuBag(_loc2_))
         {
            GameInstance.mainCharData.goodsInfo.goodsBagKuaArr.push(_loc11_);
            this.kuaFuBag.updateGoods(GameInstance.mainCharData.goodsInfo.goodsBagKuaArr);
         }
         this.itemTipProxy.removeTip(_loc2_);
         PipeManager.sendMsg(PipeConstants.GOODS_CHANGED);
         TaskTracker.updateTaskUI();
         if(Fun.isVisible(GameInstance.uiInstance._stonePanel) || Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel) || Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel) || Fun.isVisible(GameInstance.uiInstance._kongMingLockPanel1) || Fun.isVisible(GameInstance.uiInstance._kongMingLockPanel2) || Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
         {
            PipeManager.sendMsg(PipeConstants.NEW_ITEM_TO_BACKPACK,_loc11_);
         }
         if(_loc11_.res.kind == GoodsKind.K3 && _loc11_.res.drug_kind == DrugsKind.HP)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_RECOVER_HP_NOEN,"complete");
         }
         if(_loc11_.res.kind == GoodsKind.K3 && _loc11_.res.drug_kind == DrugsKind.MP)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_RECOVER_MP_NOEN,"complete");
         }
         if(_loc11_.res.kind == GoodsKind.K3 && _loc11_.res.drug_kind == DrugsKind.SP)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_RECOVER_SP_NOEN,"complete");
         }
         if(GameInstance.mainCharData.goodsInfo.isBagFull())
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_BACKPACK_FULL);
         }
         if(_loc11_.quickbarindex != 0)
         {
            ExchangePositionManager.addGoodsOfQuickBar(_loc11_);
         }
         if(_loc11_.quickbarindex != 0 || _loc12_ != _loc11_.quickbarindex)
         {
            ExchangePositionManager.getShortIndexItem();
         }
         if(_loc11_.res.kind == GoodsKind.K2)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_TUOXIA_ZHUANBEI_SU);
         }
      }
      
      public function received_10180(param1:ByteArray) : void
      {
         var _loc12_:Array = null;
         ZLog.add("10180：更新身上的装备");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readByte();
         var _loc9_:int = param1.readByte();
         if(ItemPositionRange.inBody(_loc2_))
         {
            GameInstance.mainCharData.goodsInfo.deleteGoodsByPosition_Body(_loc2_);
         }
         else
         {
            GameInstance.mainCharData.goodsInfo.deleteGoodsByPosition(_loc2_);
         }
         var _loc10_:Goods = new Goods(_loc3_,_loc2_);
         _loc10_.bind = _loc6_;
         _loc10_.quality = _loc5_;
         _loc10_.roleID = GameInstance.mainChar.id;
         _loc10_.strengthen_grade = _loc4_;
         _loc10_.isFullStar = _loc8_;
         _loc10_.curr_durability = _loc7_;
         _loc10_.strengthen_total = _loc9_;
         _loc10_.isTuteng = param1.readByte();
         _loc10_.isBaoshiTOP = param1.readByte();
         _loc10_.isNiuBi = param1.readByte();
         _loc10_.isFullTianshen = param1.readByte();
         _loc10_.isSiShengShou = param1.readByte();
         _loc10_.isFullStone = param1.readByte();
         GameInstance.mainCharData.goodsInfo.goodsBodyArr.push(_loc10_);
         if(ItemPositionRange.POSITION_SHIBALUOHAN_ARR.indexOf(_loc10_.res.position) != -1)
         {
            GameInstance.mainCharData.goodsInfo.deleteGoodsByPosition_SBTR(_loc10_.res.position);
            GameInstance.mainCharData.goodsInfo.YNsbtrArr.push(_loc10_);
            _loc12_ = GameInstance.mainCharData.goodsInfo.YNsbtrArr;
            GameInstance.uiInstance.charAttribute.showYNequipselect();
         }
         GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc10_.res.position] = _loc10_;
         this.charAttrPanel.setZhanhunUpdata();
         if(ItemPositionRange.POSITION_XUNZHANG_ALL.indexOf(_loc2_) != -1)
         {
            this.charAttrPanel.showCharAttribute();
         }
         if(ItemPositionRange.POSITION_ZHANQI_ALL.indexOf(_loc2_) != -1)
         {
            this.charAttrPanel.showCharAttribute_Zhanqi();
         }
         if(_loc2_ == ItemPositionRange.POSTION_JINZHONGZHAO1 || _loc2_ == ItemPositionRange.POSTION_JINZHONGZHAO2)
         {
            this.charAttrPanel.showCharAttribute_jinzhongzhao();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_CHAOFANTUOSU || _loc2_ == ItemPositionRange.POSTION_NIEPANCHONGSHENG || _loc2_ == ItemPositionRange.POSTION_JINGJIE_XUANYUANSHENJIAN)
         {
            this.charAttrPanel.showCharAttribute_jingjie();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_BAGUAHULU)
         {
            this.charAttrPanel.showCharAttribute_bagua();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_XIANGLONGSHIBAZHANG1 || _loc2_ == ItemPositionRange.POSTION_20180926XUNZHANG_15 || _loc2_ == ItemPositionRange.POSTION_XIANGLONGSHIBAZHANG2 || _loc2_ == ItemPositionRange.POSTION_20180926XUNZHANG_16)
         {
            this.charAttrPanel.showCharAttribute_xlsbz();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_SILINGZHEN1 || _loc2_ == ItemPositionRange.POSTION_SILINGZHEN2)
         {
            this.charAttrPanel.showCharAttribute_silingzhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_WUXINGZHENZHUXUNZHANG)
         {
            this.charAttrPanel.showCharAttribute_wuxingzhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI1 || _loc2_ == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI2 || _loc2_ == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI3 || _loc2_ == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI4 || _loc2_ == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI5 || _loc2_ == ItemPositionRange.POSTION_WUXINGZHEN_BAJIAOSHAN)
         {
            this.charAttrPanel.showCharAttribute_wuxingzhenXz();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_ANQI_DUOMINGCHIZHEN || _loc2_ == ItemPositionRange.POSTION_20171115KONGQUEYUPEI)
         {
            this.charAttrPanel.showCharAttribute_AnQi();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_BOW_ZHUANGBEI1 || _loc2_ == ItemPositionRange.POSTION_BOW_ZHUANGBEI2)
         {
            this.charAttrPanel.showCharAttribute_bow();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_ZHENFA_ZHUANGBEI1 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_ZHUANGBEI2 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_ZHUANGBEI3 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_ZHUANGBEI4)
         {
            this.charAttrPanel.showCharAttribute_tianmenzhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_HANBINGSHENZHANG_LILONG || _loc2_ == ItemPositionRange.POSTION_HANBINGSHENZHANG_BINGJINGCHUI)
         {
            this.charAttrPanel.showCharAttribute_hanbingshenzhang();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_HUTAOZHEN_ZHENHUNXUNZHANG1 || _loc2_ == ItemPositionRange.POSTION_HUTAOZHEN_ZHENHUNXUNZHANG2 || _loc2_ == ItemPositionRange.POSTION_HUTAOZHEN_ZHENHUNXUNZHANG3 || _loc2_ == ItemPositionRange.POSTION_HUTAOZHEN_ZHENHUNXUNZHANG4)
         {
            this.charAttrPanel.showCharAttribute_hutaozhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE1 || _loc2_ == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE2 || _loc2_ == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE3 || _loc2_ == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE4 || _loc2_ == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE5)
         {
            this.charAttrPanel.showCharAttribute_qinlonggong();
         }
         else if(_loc2_ > 11000 && _loc2_ < 11031)
         {
            this.charAttrPanel.showCharAttribute_aojianshenjiangji();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_AOJIANSHENJIANGJI_MINGJIAOJIAOZHU || _loc2_ == ItemPositionRange.POSTION_AOJIANSHENJIANGJI_TULONGDAO || _loc2_ == ItemPositionRange.POSTION_AOJIANSHENJIANGJI_YITIANJIAN)
         {
            this.charAttrPanel.showCharAttribute_mingjiaozhangwuji();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING1 || _loc2_ == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING2 || _loc2_ == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING3 || _loc2_ == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING4)
         {
            this.charAttrPanel.showCharAttribute_juezhanguangmingding();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_ZHENFA_YUNLONGZHEN1 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_YUNLONGZHEN2 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_YUNLONGZHEN3 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_YUNLONGZHEN4)
         {
            this.charAttrPanel.showCharAttribute_yunlongzhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_ZHENFA_CHANGSHEZHEN1 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_CHANGSHEZHEN2 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_CHANGSHEZHEN3 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_CHANGSHEZHEN4)
         {
            this.charAttrPanel.showCharAttribute_changshezhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_YIJINJING_DONGFANG1 || _loc2_ == ItemPositionRange.POSTION_YIJINJING_NANFANG2 || _loc2_ == ItemPositionRange.POSTION_YIJINJING_XIFANG3 || _loc2_ == ItemPositionRange.POSTION_YIJINJING_BEIFANG4 || _loc2_ == ItemPositionRange.POSTION_XICHUANHONGMIANBAIHUAPAO || _loc2_ == ItemPositionRange.POSTION_20171115NIZHUANYIJINJING)
         {
            this.charAttrPanel.showCharAttribute_yijinjing();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_XUANTIEJIANFA_QIAN || _loc2_ == ItemPositionRange.POSTION_XUANTIEJIANFA_HOU || _loc2_ == ItemPositionRange.POSTION_XUANTIEJIANFA_HUFA || _loc2_ == ItemPositionRange.POSTION_XUANTIEJIANFA_ZHONG)
         {
            this.charAttrPanel.showCharAttribute_xuantiejianfa();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_ZHENFA_YANYUEZHEN1 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_YANYUEZHEN2 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_YANYUEZHEN3 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_YANYUEZHEN4)
         {
            this.charAttrPanel.showCharAttribute_yanyuezhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN1 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN2 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN3 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN4)
         {
            this.charAttrPanel.showCharAttribute_xuanxiangzhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN1 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN2 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN3 || _loc2_ == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN4)
         {
            this.charAttrPanel.showCharAttribute_heyizhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_CANHEZHI_CANHEWUJUE)
         {
            this.charAttrPanel.showCharAttribute_canhezhi();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_JIUQUHUANGHE_LIANHUAN)
         {
            this.charAttrPanel.showCharAttribute_jiuquhuanghezhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_XIANTIANGONG_XIANTIANQIJUE)
         {
            this.charAttrPanel.showCharAttribute_xiantiangong();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_CHANGSHENGJUE_NIFANXIANJUE || _loc2_ == ItemPositionRange.POSTION_CHANGSHENGJUE_SHENMOFU || _loc2_ == ItemPositionRange.POSTION_MIETIANPAO)
         {
            this.charAttrPanel.showCharAttribute_changshengjue();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_TAIXUANSHENGONG_QINGMULINGQUAN || _loc2_ == ItemPositionRange.POSTION_TAIXUANSHENGONG_DUGUQIUBAI || _loc2_ == ItemPositionRange.POSTION_TAIXUANSHENGONG_FENGQINGYANG || _loc2_ == ItemPositionRange.POSTION_TAIXUANSHENGONG_LINGHUCHONG)
         {
            this.charAttrPanel.showCharAttribute_taixuanshengong();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_GUILIUZHEN_SHIHUNTIANGUI)
         {
            this.charAttrPanel.showCharAttribute_guiliuzhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_XUEDAO_SHIXUEKUANGDAO || _loc2_ == ItemPositionRange.POSTION_XUEDAO_MINGHUN || _loc2_ == ItemPositionRange.POSTION_XUEDAO_SIPO || _loc2_ == ItemPositionRange.POSTION_XUEDAO_TAOWU)
         {
            this.charAttrPanel.showCharAttribute_xuedaoxinfa();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_XUEYINJUEXING_ZIQI1 || _loc2_ == ItemPositionRange.POSTION_XUEYINJUEXING_ZIQI2 || _loc2_ == ItemPositionRange.POSTION_XUEYINJUEXING_ZIQI3)
         {
            this.charAttrPanel.showCharAttribute_xueyinjuexing();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_QIMENZHEN_CIYUANHU || _loc2_ == ItemPositionRange.POSTION_QIMENZHEN_LONGZUZHISHEN)
         {
            this.charAttrPanel.showCharAttribute_qimenzhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_BIHAICHAOSHENGQU_HANGUANG)
         {
            this.charAttrPanel.showCharAttribute_bihaichaoshengqu();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_BAZHENTU_SUIHUNYINXUE || _loc2_ == ItemPositionRange.POSTION_BAZHENTU_SUIHUNZHISHANG)
         {
            this.charAttrPanel.showCharAttribute_bazhentu();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_LINGXIYIZHI_XUEWU)
         {
            this.charAttrPanel.showCharAttribute_lingxiyizhi();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_JINGANGFUMOQUAN_FENGLEI)
         {
            this.charAttrPanel.showCharAttribute_jingangfumoquan();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_SHICONG_MOSHENFU)
         {
            this.charAttrPanel.showCharAttribute_shicong();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_MODAO || _loc2_ == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_JULONGZHIJI || _loc2_ == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_CHANGHONGJIANZHU || _loc2_ == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_BINGPOJIANZHU || _loc2_ == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_ZIYUNJIANZHU || _loc2_ == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_YUHUAJIANZHU || _loc2_ == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_BENLEIJIANZHU || _loc2_ == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_QINGGUANGJIANZHU || _loc2_ == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_QUANFENGJIANZHU)
         {
            this.charAttrPanel.showCharAttribute_zhenwuqijiezhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_XIUWEI_BINGJINGHU)
         {
            this.charAttrPanel.showCharAttribute_xiuwei();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_GANJIANGMOYE_RIYUESHENJIAN || _loc2_ == ItemPositionRange.POSTION_GANJIANGMOYE_XIALVTUMO)
         {
            this.charAttrPanel.showCharAttribute_ganjiangmoye();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_WUXINGQUAN_LIANYAOHU_ID)
         {
            this.charAttrPanel.showCharAttribute_wuxingquan();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_CHIXUEMOZHEN_MOJIAN_ID || _loc2_ == ItemPositionRange.POSTION_CHIXUEMOZHEN_XIELONGMOJIAN_ID)
         {
            this.charAttrPanel.showCharAttribute_chixuemozhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_ROUSHEN_LIUJINYANMO_ID)
         {
            this.charAttrPanel.showCharAttribute_roushen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_BEIDOUQIXINGZHEN_SHUSHANSHENQI)
         {
            this.charAttrPanel.showCharAttribute_beidouqixingzhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_HUASHANLUNJIAN_NIYAN)
         {
            this.charAttrPanel.showCharAttribute_huashanlunjian();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_BEIMINGSHENGONG_DIHUANGYUXI || _loc2_ == ItemPositionRange.POSTION_BEIMINGSHENGONG_LIUXINGLUO || _loc2_ == ItemPositionRange.POSTION_LIHEJUEDAFAXUNZHANG)
         {
            this.charAttrPanel.showCharAttribute_beimingshengong();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_FUMOZHANGFA_TIANLONG)
         {
            this.charAttrPanel.showCharAttribute_fumozhangfa();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_JIUYINZHENJING_SHIHUNQI)
         {
            this.charAttrPanel.showCharAttribute_jiuyinzhenjing();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_DUGUJIUJIAN_LONGHUNJIAN || _loc2_ == ItemPositionRange.POSTION_DUGUJIUJIAN_SHOUWEIHUDUN)
         {
            this.charAttrPanel.showCharAttribute_dugujiujian();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_YUNCHENG_SHENGXIAOFUBENLING)
         {
            this.charAttrPanel.showCharAttribute_yuncheng();
         }
         else if(_loc2_ == ItemPositionRange.POSITION_JGFMQ1 || _loc2_ == ItemPositionRange.POSTION_20180926XUNZHANG_17)
         {
            this.charAttrPanel.showCharAttribute_jingangfumoquan();
         }
         else if(_loc2_ == ItemPositionRange.POSITION_JGFMQ2 || _loc2_ == ItemPositionRange.POSTION_20180926XUNZHANG_14)
         {
            this.charAttrPanel.showCharAttribute_jingangfumoquan();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_QIANKUNJIA)
         {
            this.charAttrPanel.showCharAttribute_YNDouzhuanxingyi();
         }
         else if(ItemPositionRange.POSITION_LLZB.indexOf(_loc2_) != -1)
         {
            this.charAttrPanel.showCharAttribute_YNliulongzhuangbei();
         }
         else if(ItemPositionRange.POSITION_JINFENGDIAO.indexOf(_loc2_) != -1)
         {
            this.charAttrPanel.showCharAttribute_YNJinfengdiao();
         }
         else if(ItemPositionRange.POSITION_WUXINGZHIREN.indexOf(_loc2_) != -1)
         {
            this.charAttrPanel.showCharAttribute_wuxingzhiren2();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_QISHAZHEN_ZIYANSHENQI || ItemPositionRange.POSTION_QISHAZHEN_SHENQI.indexOf(_loc2_) != -1)
         {
            this.charAttrPanel.showCharAttribute_qishazhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_XINGXIUZHEN_BEIMINGZHIREN)
         {
            this.charAttrPanel.showCharAttribute_xingxiuzhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_MINGYUEZHANG)
         {
            this.charAttrPanel.showCharAttribute_rijinlun();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_20171115RONGQINGAIYI)
         {
            this.charAttrPanel.showCharAttribute_mingyugong();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_20171115XISUIHUAYUANJUE)
         {
            this.charAttrPanel.showCharAttribute_xisuijing();
         }
         else if(ItemPositionRange.POSTION_WUHUNXITONG_EQUIP.indexOf(_loc2_) != -1)
         {
            this.charAttrPanel.showCharAttribute_wuhun();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_SIJUEJIANZHEN_BADAO)
         {
            this.charAttrPanel.showCharAttribute_sijuejianzhen();
         }
         else if(_loc2_ == ItemPositionRange.POSTION_SIJUEJIANZHEN_BADAO)
         {
            this.charAttrPanel.showCharAttribute_guihun();
         }
         this.itemTipProxy.removeTip(_loc2_);
         PipeManager.sendMsg(PipeConstants.GOODS_CHANGED);
         TaskTracker.updateTaskUI();
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_NEW_GOOD_EQUIP,{
            "str":"complete",
            "goods":_loc10_
         });
         var _loc11_:GoodsRes = _loc10_.res;
         if(_loc11_.position < 2 || _loc11_.position > 22)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_PEIDAI_WUQI_SU);
         }
         if(_loc11_.position > 2 && _loc11_.position < 7 || _loc11_.position == 12 || _loc11_.position == 21 || _loc11_.position == 22)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_PEIDAI_HUJU_SU);
         }
         if(_loc11_.position > 7 || _loc11_.position < 13)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_PEIDAI_SHIPIN_SU);
         }
      }
      
      public function received_10078(param1:ByteArray) : void
      {
         ZLog.add("10078：接收更新或在索引处增加物品[坐骑身上]信息");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readByte();
         var _loc8_:PureMount = GameInstance.mainCharData.mountInfo.getMount(_loc4_);
         if(ItemPositionRange.inBag(_loc2_))
         {
            _loc8_.mountGoodsInfo.deleteGoodsByPosition_Bag(_loc2_);
         }
         else
         {
            _loc8_.mountGoodsInfo.deleteGoodsByPosition(_loc2_);
         }
         var _loc9_:Goods = new Goods(_loc3_,_loc2_);
         _loc9_.bind = _loc7_;
         _loc9_.quality = _loc6_;
         _loc9_.roleID = GameInstance.mainChar.id;
         _loc9_.mountID = _loc4_;
         _loc9_.strengthen_grade = _loc5_;
         _loc8_.mountGoodsInfo.addGoods(_loc9_);
         if(_loc4_ == GameInstance.mainCharData.mountInfo.selectedMountID)
         {
            this.mainCharRidePanel.show();
            this.msgSenderProxy.send_50031([GameInstance.mainChar.id,GameInstance.mainCharData.mountInfo.selectedMountID]);
         }
         this.itemTipProxy.removeTip(_loc2_);
      }
      
      public function received_10178(param1:ByteArray) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:Goods = null;
         var _loc10_:PureMount = null;
         var _loc11_:PureGirl = null;
         ZLog.add("10178：删除索引处的物品");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         if(_loc3_ == 0)
         {
            if(ItemPositionRange.inZhanhundaiBag(_loc2_))
            {
               GameInstance.mainCharData.goodsInfo.deleteGoodsByPosition_ZhanHunDai(_loc2_);
               this.zhanhundai.updateGoods(GameInstance.mainCharData.goodsInfo.goodsZhanhundaiArr);
            }
            else
            {
               if(ItemPositionRange.inBag(_loc2_))
               {
                  _loc5_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition_bag(_loc2_);
               }
               else if(ItemPositionRange.inStorage(_loc2_))
               {
                  _loc5_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition_Depot(_loc2_);
               }
               else if(ItemPositionRange.inKuafuBag(_loc2_))
               {
                  _loc5_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition_KuafuBag(_loc2_);
               }
               else if(ItemPositionRange.POSITION_SHIBALUOHAN_ARR.indexOf(_loc2_) != -1)
               {
                  _loc7_ = GameInstance.mainCharData.goodsInfo.YNsbtrArr;
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_.length)
                  {
                     _loc9_ = _loc7_[_loc8_] as Goods;
                     if(_loc2_ == _loc9_.res.position)
                     {
                        _loc5_ = _loc9_;
                        break;
                     }
                     _loc8_++;
                  }
               }
               else
               {
                  _loc5_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc2_);
               }
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_NEW_GOOD_EQUIP,{
                  "str":"complete",
                  "goods":_loc5_
               });
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_TASK_PRIZE_EQUIP,{
                  "str":"complete",
                  "goods":_loc5_
               });
               if(_loc5_ == null)
               {
                  return;
               }
               _loc6_ = _loc5_.res.drug_kind;
               if(ItemPositionRange.inBag(_loc2_))
               {
                  GameInstance.mainCharData.goodsInfo.deleteGoodsByPosition_Bag(_loc2_);
               }
               else if(ItemPositionRange.inStorage(_loc2_))
               {
                  GameInstance.mainCharData.goodsInfo.deleteGoodsByPosition_Depot(_loc2_);
               }
               else if(ItemPositionRange.inKuafuBag(_loc2_))
               {
                  GameInstance.mainCharData.goodsInfo.deleteGoodsByPosition_KuafuBag(_loc2_);
               }
               else
               {
                  GameInstance.mainCharData.goodsInfo.deleteGoodsByPosition(_loc2_);
               }
               this.backPackMediator.showItemBag(ExchangePositionManager.bagCount - 1);
               this.depotMediator.showItemDepot(ExchangePositionManager.depotCount - 1);
               this.mainCharWalkShop.showWalkShops();
               if(_loc5_.res.kind == 2)
               {
               }
               if(ReloginManager.isInKuafu)
               {
                  this.kuaFuBag.updateGoods(GameInstance.mainCharData.goodsInfo.goodsBagArr);
               }
               else
               {
                  this.kuaFuBag.updateGoods(GameInstance.mainCharData.goodsInfo.goodsBagKuaArr);
               }
               this.itemTipProxy.removeTip(_loc2_);
               PipeManager.sendMsg(PipeConstants.GOODS_CHANGED);
               TaskTracker.updateTaskUI();
               if(_loc5_.quickbarindex != 0)
               {
                  ExchangePositionManager.deleteGoodsOfQuickBar(_loc5_);
                  ExchangePositionManager.getShortIndexItem();
               }
               if(_loc6_ > 0)
               {
                  if(GameInstance.mainCharData.goodsInfo.findDrugGoods(DrugsKind.HP).length == 0 && _loc6_ == DrugsKind.HP)
                  {
                     NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_RECOVER_HP_NOEN);
                  }
                  if(GameInstance.mainCharData.goodsInfo.findDrugGoods(DrugsKind.MP).length == 0 && _loc6_ == DrugsKind.MP)
                  {
                     NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_RECOVER_MP_NOEN);
                  }
                  if(GameInstance.mainCharData.goodsInfo.findDrugGoods(DrugsKind.SP).length == 0 && _loc6_ == DrugsKind.SP)
                  {
                     NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_RECOVER_SP_NOEN);
                  }
               }
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_BACKPACK_FULL,"complete");
            }
         }
         else if(_loc3_ == 1)
         {
            _loc10_ = GameInstance.mainCharData.mountInfo.getMount(_loc4_);
            _loc10_.mountGoodsInfo.deleteGoodsByPosition(_loc2_);
            if(_loc4_ == GameInstance.mainCharData.mountInfo.selectedMountID)
            {
               this.mainCharRidePanel.show();
               this.msgSenderProxy.send_50031([GameInstance.mainChar.id,GameInstance.mainCharData.mountInfo.selectedMountID]);
            }
         }
         else if(_loc3_ == 2)
         {
            _loc11_ = GameInstance.mainCharData.girlInfo.getGirl(_loc4_);
            _loc11_.girlGoodsInfo.deleteGoodsByPosition(_loc2_);
         }
      }
      
      public function received_50102(param1:ByteArray) : void
      {
         var _loc33_:Object = null;
         var _loc36_:Object = null;
         var _loc38_:String = null;
         var _loc118_:Object = null;
         var _loc121_:int = 0;
         var _loc122_:int = 0;
         var _loc123_:String = null;
         var _loc124_:String = null;
         var _loc125_:Number = NaN;
         var _loc126_:Date = null;
         ZLog.add("50102：装备动态提示信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readByte();
         var _loc9_:String = param1.readUTF();
         var _loc10_:int = param1.readByte();
         var _loc11_:String = param1.readUTF();
         var _loc12_:int = param1.readDouble();
         var _loc13_:int = param1.readDouble();
         var _loc14_:String = param1.readUTF();
         var _loc15_:String = param1.readUTF();
         var _loc16_:int = param1.readInt();
         var _loc17_:String = param1.readUTF();
         var _loc18_:String = param1.readUTF();
         var _loc19_:int = param1.readInt();
         var _loc20_:String = param1.readUTF();
         var _loc21_:Object = new Object();
         _loc21_.append = _loc19_;
         _loc21_.quality = _loc8_;
         _loc21_.is11Star = _loc10_;
         _loc21_.attr2 = _loc18_;
         _loc21_.hp = param1.readByte();
         _loc21_.sp = param1.readByte();
         _loc21_.mp = param1.readByte();
         _loc21_.attack = param1.readByte();
         _loc21_.defence = param1.readByte();
         _loc21_.crt = param1.readByte();
         _loc21_.dodge = param1.readByte();
         _loc21_.attackspeed = param1.readByte();
         var _loc22_:Object = new Object();
         _loc22_.isBaoshiTop = param1.readByte();
         _loc22_.attr3 = param1.readUTF();
         var _loc23_:String = param1.readUTF();
         var _loc24_:Number = param1.readDouble();
         var _loc25_:String = param1.readUTF();
         var _loc26_:int = param1.readInt();
         var _loc27_:String = param1.readUTF();
         var _loc28_:int = param1.readInt();
         var _loc29_:String = param1.readUTF();
         var _loc30_:String = param1.readUTF();
         var _loc31_:Object = new Object();
         _loc31_.charName = _loc29_;
         _loc31_.attr = _loc30_;
         var _loc32_:int = param1.readByte();
         if(_loc32_)
         {
            _loc121_ = param1.readInt();
            _loc122_ = param1.readInt();
            _loc123_ = param1.readUTF();
            _loc124_ = param1.readUTF();
            _loc125_ = param1.readDouble();
            _loc33_ = new Object();
            _loc33_.skill1 = _loc121_;
            _loc33_.skill2 = _loc122_;
            _loc33_.nanfangName = _loc123_;
            _loc33_.nvfangName = _loc124_;
            _loc33_.time = _loc125_;
         }
         var _loc34_:Object = new Object();
         _loc34_.attr = param1.readUTF();
         var _loc35_:String = "";
         if(_loc24_ > 0)
         {
            _loc126_ = new Date();
            _loc126_.setTime(_loc24_);
            _loc35_ = _loc126_.fullYear + LanResManager.getLanCommonTextWords("年") + (_loc126_.month + 1) + LanResManager.getLanCommonTextWords("月") + _loc126_.date + LanResManager.getLanCommonTextWords("日") + _loc126_.hours + LanResManager.getLanCommonTextWords("时") + _loc126_.minutes + LanResManager.getLanCommonTextWords("分") + _loc126_.seconds + LanResManager.getLanCommonTextWords("秒");
         }
         var _loc37_:int = param1.readByte();
         if(_loc37_ == 1)
         {
            _loc36_ = new Object();
            _loc38_ = param1.readUTF();
            _loc36_.charName = _loc38_;
         }
         var _loc39_:Object = {
            "jindu":_loc14_,
            "shuxing":_loc15_
         };
         var _loc40_:int = param1.readByte();
         var _loc41_:int = param1.readByte();
         var _loc42_:String = param1.readUTF();
         var _loc43_:String = param1.readUTF();
         var _loc44_:String = param1.readUTF();
         var _loc45_:int = param1.readByte();
         var _loc46_:String = param1.readUTF();
         var _loc47_:String = param1.readUTF();
         var _loc48_:String = param1.readUTF();
         var _loc49_:String = param1.readUTF();
         var _loc50_:String = param1.readUTF();
         var _loc51_:String = param1.readUTF();
         var _loc52_:int = param1.readByte();
         var _loc53_:int = param1.readByte();
         var _loc54_:String = param1.readUTF();
         var _loc55_:int = param1.readByte();
         var _loc56_:int = param1.readByte();
         var _loc57_:int = param1.readByte();
         var _loc58_:int = param1.readByte();
         var _loc59_:int = param1.readByte();
         var _loc60_:int = param1.readByte();
         var _loc61_:int = param1.readByte();
         var _loc62_:int = param1.readByte();
         var _loc63_:int = param1.readByte();
         var _loc64_:int = param1.readByte();
         var _loc65_:int = param1.readByte();
         var _loc66_:int = param1.readByte();
         var _loc67_:int = param1.readByte();
         var _loc68_:int = param1.readByte();
         var _loc69_:int = param1.readByte();
         var _loc70_:int = param1.readByte();
         var _loc71_:int = param1.readByte();
         var _loc72_:int = param1.readByte();
         var _loc73_:int = param1.readByte();
         var _loc74_:int = param1.readByte();
         var _loc75_:int = param1.readByte();
         var _loc76_:int = param1.readByte();
         var _loc77_:int = param1.readByte();
         var _loc78_:int = param1.readByte();
         var _loc79_:int = param1.readByte();
         var _loc80_:int = param1.readByte();
         var _loc81_:int = param1.readByte();
         var _loc82_:int = param1.readByte();
         var _loc83_:int = param1.readByte();
         var _loc84_:String = param1.readUTF();
         var _loc85_:String = param1.readUTF();
         var _loc86_:String = param1.readUTF();
         var _loc87_:String = param1.readUTF();
         var _loc88_:String = param1.readUTF();
         var _loc89_:String = param1.readUTF();
         var _loc90_:String = param1.readUTF();
         var _loc91_:int = param1.readByte();
         var _loc92_:int = param1.readByte();
         var _loc93_:String = param1.readUTF();
         var _loc94_:String = param1.readUTF();
         var _loc95_:String = param1.readUTF();
         var _loc96_:String = param1.readUTF();
         var _loc97_:String = param1.readUTF();
         var _loc98_:String = param1.readUTF();
         var _loc99_:String = param1.readUTF();
         var _loc100_:String = param1.readUTF();
         var _loc101_:String = param1.readUTF();
         var _loc102_:String = param1.readUTF();
         var _loc103_:String = param1.readUTF();
         var _loc104_:String = param1.readUTF();
         var _loc105_:String = param1.readUTF();
         var _loc106_:String = param1.readUTF();
         var _loc107_:String = param1.readUTF();
         var _loc108_:int = param1.readByte();
         var _loc109_:String = param1.readUTF();
         var _loc110_:int = param1.readInt();
         var _loc111_:Boolean = Boolean(param1.readByte() == 1);
         var _loc112_:int = param1.readByte();
         var _loc113_:Object = new Object();
         if(_loc112_ == 1)
         {
            _loc113_.bo = _loc112_;
            _loc113_.nanName = param1.readUTF();
            _loc113_.nvName = param1.readUTF();
            _loc113_.time = param1.readDouble();
         }
         var _loc114_:int = param1.readInt();
         var _loc115_:String = "";
         var _loc116_:int = 0;
         while(_loc116_ < _loc114_)
         {
            _loc115_ += String(param1.readByte());
            _loc115_ = _loc115_ + ";";
            _loc116_++;
         }
         var _loc117_:Object = {
            "len":_loc114_,
            "jindu":_loc115_
         };
         var _loc119_:Boolean = param1.readByte() == 1;
         if(_loc119_)
         {
            _loc118_ = new Object();
            _loc118_.name1 = param1.readUTF();
            _loc118_.name2 = param1.readUTF();
            _loc118_.time = param1.readDouble();
         }
         var _loc120_:Array = [_loc6_,_loc7_,_loc9_,_loc11_,_loc21_,_loc22_,_loc4_,_loc5_,_loc3_,_loc23_,_loc35_,_loc25_,_loc27_,_loc26_,_loc28_,_loc31_,_loc33_,_loc34_,_loc36_,_loc20_,_loc2_,_loc17_,_loc13_,_loc39_,_loc16_,_loc40_,_loc41_,_loc42_,_loc43_,_loc44_,_loc45_,_loc109_,_loc110_,_loc111_,_loc113_,_loc46_,_loc108_,_loc47_,_loc107_,_loc48_,_loc49_,_loc50_,_loc117_,_loc118_,_loc51_,_loc52_,_loc53_,_loc54_,_loc55_,_loc56_,_loc57_,_loc58_,_loc59_,_loc60_,_loc61_,_loc62_,_loc63_,_loc64_,_loc65_,_loc66_,_loc67_,_loc68_,_loc69_,_loc70_,_loc71_,_loc72_,_loc73_,_loc74_,_loc75_,_loc76_,_loc77_,_loc78_,_loc79_,_loc80_,_loc81_,_loc82_,_loc83_,_loc12_,_loc84_,_loc85_,_loc86_,_loc87_,_loc88_,_loc89_,_loc90_,_loc91_,_loc92_,_loc93_,_loc94_,_loc95_,_loc96_,_loc97_,_loc98_,_loc99_,_loc100_,_loc101_,_loc102_,_loc103_,_loc104_,_loc105_,_loc106_];
         this.itemTipProxy.updateItemTip(_loc120_);
      }
      
      public function received_50132(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         ZLog.add("50132：装备动态错误提示信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readInt();
         var _loc7_:String = "";
         var _loc8_:String = "";
         var _loc9_:String = "";
         var _loc10_:String = "";
         var _loc11_:String = "";
         var _loc12_:String = "";
         var _loc13_:Array = [_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc3_,_loc4_,_loc2_,_loc11_,_loc12_];
         this.itemTipProxy.updateItemTip(_loc13_);
      }
      
      public function received_11190(param1:ByteArray) : void
      {
         ZLog.add("11190：激活包裹信息");
         var _loc2_:int = param1.readByte();
         GameInstance.mainCharData.attributeInfo.bagCount = _loc2_;
         this.backPackMediator.r_activeBag(_loc2_);
      }
      
      public function received_11192(param1:ByteArray) : void
      {
         ZLog.add("11192：激活仓库信息");
         var _loc2_:int = param1.readByte();
         GameInstance.mainCharData.attributeInfo.depotCount = _loc2_;
         this.depotMediator.r_activeDepot(_loc2_);
      }
      
      public function received_59778(param1:ByteArray) : void
      {
         ZLog.add("59778：角色杀死玩家更新当前魔血值");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:AttributeInfo = GameInstance.mainCharData.attributeInfo;
         _loc4_.moxueNow = _loc2_;
         _loc4_.moxueMax = _loc3_;
         if(_loc4_.moxueMax > 0)
         {
            if(_loc4_.moxueNow >= _loc4_.moxueMax)
            {
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_MOXUE_FULL);
            }
            else
            {
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_MOXUE_FULL,"complete");
            }
         }
         GameInstance.uiInstance.mainUI.setMoxueValue(_loc4_.moxueNow,_loc4_.moxueMax);
      }
      
      public function received_49996(param1:ByteArray) : void
      {
         ZLog.add("49996：接收主角单一属性变化信息");
         var _loc2_:int = param1.readByte();
         switch(_loc2_)
         {
            case 1:
               GameInstance.mainCharData.attributeInfo.prestige_fuQi = param1.readInt();
               break;
            case 2:
               GameInstance.mainCharData.attributeInfo.prestige_gongXunZhi = param1.readInt();
               break;
            case 3:
               GameInstance.mainCharData.attributeInfo.prestige_jiFenZhi = param1.readInt();
               break;
            case 4:
               GameInstance.mainCharData.attributeInfo.prestige_WuHunZhi = param1.readInt();
         }
      }
      
      public function received_49990(param1:ByteArray) : void
      {
         var _loc11_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:AttributeInfo = null;
         var _loc14_:MoneyInfo = null;
         var _loc15_:BitmapData = null;
         var _loc16_:Object = null;
         var _loc17_:Object = null;
         var _loc18_:BitmapData = null;
         ZLog.add("49990：接收主角单一属性变化信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:SceneCharacter = GameInstance.scene.getCharByID(_loc3_,_loc2_);
         if(_loc8_ == null)
         {
            return;
         }
         var _loc9_:Boolean = _loc8_.isMainChar();
         var _loc10_:int = 0;
         while(_loc10_ < _loc4_)
         {
            _loc11_ = param1.readInt();
            _loc12_ = param1.readDouble();
            if(_loc9_)
            {
               PipeManager.sendMsg(PipeConstants.MAIN_CHAR_SINGLE_ATTR_TIP,[_loc11_,_loc12_]);
            }
            if(_loc8_.data is Player)
            {
               _loc13_ = (_loc8_.data as Player).attributeInfo;
               _loc14_ = (_loc8_.data as Player).moneyInfo;
            }
            else if(_loc8_.data is Monster)
            {
               _loc13_ = (_loc8_.data as Monster).attributeInfo;
            }
            else if(_loc8_.data is Girl)
            {
               _loc13_ = (_loc8_.data as Girl).attributeInfo;
            }
            switch(_loc11_)
            {
               case 1:
                  _loc6_ = true;
                  _loc13_.ap = _loc12_;
                  break;
               case 2:
                  _loc6_ = true;
                  _loc13_.dp = _loc12_;
                  break;
               case 3:
                  _loc6_ = true;
                  _loc13_.cp = _loc12_;
                  break;
               case 4:
                  _loc6_ = true;
                  _loc13_.ev = _loc12_;
                  break;
               case 5:
                  _loc6_ = true;
                  _loc13_.adx = _loc12_;
                  break;
               case 6:
                  _loc6_ = true;
                  _loc13_.mdx = _loc12_;
                  if(_loc8_.isMainChar())
                  {
                     GameInstance.mainCharData.moveSpeed = _loc13_.mdx;
                     if(!GameInstance.mainCharData.isInAutoFly)
                     {
                        if((GameInstance.mainChar.data as BaseCharacter).avatarInfo.isYouyong)
                        {
                           GameInstance.mainChar.setSpeed(OtherConst.YOUYONG_SUDU);
                        }
                        else if((GameInstance.mainChar.data as BaseCharacter).avatarInfo.isFuQiJingJiFeiDaDiao)
                        {
                           GameInstance.mainChar.setSpeed(200);
                        }
                        else
                        {
                           GameInstance.mainChar.setSpeed(_loc13_.mdx);
                        }
                     }
                  }
                  else if((_loc8_.data as BaseCharacter).avatarInfo.isYouyong)
                  {
                     _loc8_.setSpeed(OtherConst.YOUYONG_SUDU);
                  }
                  else if((_loc8_.data as BaseCharacter).avatarInfo.isFuQiJingJiFeiDaDiao)
                  {
                     GameInstance.mainChar.setSpeed(200);
                  }
                  else
                  {
                     _loc8_.setSpeed(_loc13_.mdx);
                  }
                  break;
               case 7:
                  _loc6_ = true;
                  _loc13_.hpMax = _loc12_;
                  _loc8_.setHeadFaceBar(_loc13_.hpNow,_loc13_.hpMax);
                  break;
               case 16:
                  _loc6_ = true;
                  _loc13_.hpNow = _loc12_;
                  _loc8_.setHeadFaceBar(_loc13_.hpNow,_loc13_.hpMax);
                  break;
               case 8:
                  _loc6_ = true;
                  _loc13_.mpMax = _loc12_;
                  break;
               case 9:
                  _loc6_ = true;
                  _loc13_.ppMax = _loc12_;
                  break;
               case 10:
                  _loc6_ = true;
                  _loc13_.points_action = _loc12_;
                  _loc7_ = true;
                  break;
               case 11:
                  _loc6_ = true;
                  _loc13_.lv = _loc12_;
                  break;
               case 12:
                  _loc6_ = true;
                  _loc13_.expNow = _loc12_;
                  break;
               case 14:
                  _loc6_ = true;
                  _loc13_.gqNow = _loc12_;
                  if(_loc9_)
                  {
                     if(_loc13_.gqNow >= _loc13_.gqMax)
                     {
                        NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_ZHENGQI_FULL);
                     }
                     else
                     {
                        NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_ZHENGQI_FULL,"complete");
                     }
                  }
                  break;
               case 15:
                  _loc6_ = true;
                  _loc13_.prestige_chengzhan = _loc12_;
                  break;
               case 17:
                  _loc6_ = true;
                  _loc13_.mpNow = _loc12_;
                  break;
               case 18:
                  _loc6_ = true;
                  _loc13_.ppNow = _loc12_;
                  break;
               case 20:
                  break;
               case 42:
                  _loc5_ = true;
                  if(_loc14_.copper > _loc12_)
                  {
                     TSoundManager.playShortSound(ResPathManager.SOUND_UI_MONEY_GO);
                  }
                  else if(_loc14_.copper < _loc12_)
                  {
                     TSoundManager.playShortSound(ResPathManager.SOUND_UI_MONEY_COME);
                  }
                  _loc14_.copper = _loc12_;
                  break;
               case 43:
                  _loc5_ = true;
                  _loc14_.gold = _loc12_;
                  break;
               case 44:
                  _loc5_ = true;
                  _loc14_.gifts = _loc12_;
                  break;
               case 45:
                  _loc5_ = true;
                  _loc14_.depotCopper = _loc12_;
                  break;
               case 64:
                  _loc5_ = true;
                  _loc14_.jinpiao = _loc12_;
                  break;
               case 68:
                  _loc6_ = true;
                  _loc13_.prestige_fuqijingji = _loc12_;
                  break;
               case 69:
                  _loc6_ = true;
                  _loc13_.zhanchang_jifen = _loc12_;
                  break;
               case 70:
                  (_loc8_.data as Player).banghuiInfo.banggong = _loc12_;
                  break;
               case 71:
                  _loc6_ = true;
                  _loc13_.prestige_lunjian = _loc12_;
                  break;
               case 72:
                  _loc6_ = true;
                  _loc13_.prestige_shitu = _loc12_;
                  break;
               case 73:
                  _loc6_ = true;
                  _loc13_.add2_bj = _loc12_;
                  break;
               case 74:
                  _loc6_ = true;
                  _loc13_.add2_aq = _loc12_;
                  break;
               case 75:
                  _loc6_ = true;
                  _loc13_.add2_daq = _loc12_;
                  break;
               case 76:
                  _loc6_ = true;
                  _loc13_.add2_dgj = _loc12_;
                  break;
               case 77:
                  _loc6_ = true;
                  _loc13_.add2_ddt = _loc12_;
                  break;
               case 78:
                  _loc6_ = true;
                  _loc13_.jinzhongzhaoCount = _loc12_;
                  _loc15_ = RslLoaderManager.getInstance("ui.char.jinzhongzhao");
                  if(_loc13_.jinzhongzhaoCount == 0)
                  {
                     _loc16_ = {
                        "color":16711680,
                        "bmdNum":_loc13_.jinzhongzhaoCount,
                        "bmd":_loc15_
                     };
                  }
                  else
                  {
                     _loc16_ = {
                        "color":16776960,
                        "bmdNum":_loc13_.jinzhongzhaoCount,
                        "bmd":_loc15_
                     };
                  }
                  _loc8_.setHeadFaceBar(_loc13_.hpNow,_loc13_.hpMax,_loc16_);
                  break;
               case 79:
                  _loc6_ = true;
                  _loc13_.wuxingZhanyiKaijia = _loc12_;
                  if(_loc13_.wuxingZhanyiKaijia > 0)
                  {
                     _loc18_ = RslLoaderManager.getInstance("ui.char.wuxingzhanyikaijia." + _loc13_.wuxingZhanyiKaijia);
                     _loc17_ = {
                        "isShowBmd":true,
                        "bmd":_loc18_
                     };
                  }
                  else
                  {
                     _loc18_ = RslLoaderManager.getInstance("ui.char.wuxingzhanyikaijia.1");
                     _loc17_ = {
                        "isShowBmd":false,
                        "bmd":_loc18_
                     };
                  }
                  _loc8_.setHeadFaceBar(_loc13_.hpNow,_loc13_.hpMax,null,_loc17_);
                  break;
               case 126:
                  _loc6_ = true;
                  (_loc8_.data as Player).attributeInfo.shengsifuCount = _loc12_;
                  AvatarManager.updateShensifuAvatar(_loc8_,_loc12_);
                  break;
               case 127:
                  _loc6_ = true;
                  (_loc8_.data as Player).attributeInfo.wuCaiXianZhenCount = _loc12_;
                  AvatarManager.updateWuCaiXianZhenAvatar(_loc8_,_loc12_);
                  break;
               case 80:
                  _loc6_ = true;
                  _loc13_.prestige_zhizungongxun = _loc12_;
                  break;
               case 81:
                  _loc6_ = true;
                  _loc13_.prestige_shenshengzhandouli = _loc12_;
                  break;
               case 124:
                  _loc6_ = true;
                  (_loc8_.data as Player).attributeInfo.zhenlongqiHeiCount = _loc12_;
                  AvatarManager.updateZhenLongqiHeiAvatar(_loc8_,_loc12_);
                  break;
               case 125:
                  _loc6_ = true;
                  (_loc8_.data as Player).attributeInfo.zhenlongqiBaiCount = _loc12_;
                  AvatarManager.updateZhenLongqiBaiAvatar(_loc8_,_loc12_);
                  break;
               case 128:
                  _loc6_ = true;
                  _loc13_.fabaoNow = _loc12_;
                  break;
               case 129:
                  _loc6_ = true;
                  _loc13_.fabaoMax = _loc12_;
                  break;
               case 130:
                  _loc6_ = true;
                  _loc13_.lingliNow = _loc12_;
                  break;
               case 231:
                  _loc6_ = true;
                  (_loc8_.data as Player).attributeInfo.xisuijingCount = _loc12_;
                  AvatarManager.updateFenTianNuQiAvatar(_loc8_,_loc12_);
                  break;
               case 232:
                  _loc6_ = true;
                  _loc13_.jinzhongzhaoCount = _loc12_;
                  _loc15_ = RslLoaderManager.getInstance("ui.char.jinzhongzhao1");
                  if(_loc13_.jinzhongzhaoCount == 0)
                  {
                     _loc16_ = {
                        "color":16711680,
                        "bmdNum":_loc13_.jinzhongzhaoCount,
                        "bmd":_loc15_
                     };
                  }
                  else
                  {
                     _loc16_ = {
                        "color":16776960,
                        "bmdNum":_loc13_.jinzhongzhaoCount,
                        "bmd":_loc15_
                     };
                  }
                  _loc8_.setHeadFaceBar(_loc13_.hpNow,_loc13_.hpMax,_loc16_);
                  break;
               case 3000:
                  _loc6_ = true;
                  _loc13_.wufang = _loc12_;
                  GameInstance.uiInstance.kungFuPanel.setWufang(_loc13_.wufang);
                  HeadFaceManager.updateCharSkillLevel(GameInstance.mainChar.id,GameInstance.mainCharData.skillInfo.skillLevel);
            }
            _loc10_++;
         }
         if(_loc5_ && _loc9_)
         {
            this.backPackMediator.updateMoney();
            this.depotMediator.updateMoney();
         }
         if(_loc6_)
         {
            if(_loc9_)
            {
               PipeManager.sendMsg(PipeConstants.CHANGED_MAINCHAR_BASE_ATTR,_loc7_);
            }
            else if(_loc8_ == GameInstance.lockOnChar)
            {
               PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,GameInstance.lockOnChar);
            }
         }
      }
      
      public function received_11198(param1:ByteArray) : void
      {
         ZLog.add("11198：接收坐骑挪动信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 2 || _loc3_ == 3)
         {
         }
      }
      
      public function received_13017(param1:ByteArray) : void
      {
         ZLog.add("13017：接收主角摊位名信息");
         var _loc2_:String = param1.readUTF();
         this.mainCharWalkShop.updateShopName(_loc2_);
      }
      
      public function received_13008(param1:ByteArray) : void
      {
         ZLog.add("13008：接收坐骑上架信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.mainCharWalkShop.addMount(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_13006(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc8_:WalkShop = null;
         ZLog.add("13006：接收展示摊位列表信息");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readByte();
         var _loc6_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = new WalkShop();
            _loc8_.roleID = param1.readInt();
            _loc8_.roleName = param1.readUTF();
            _loc8_.roleLevel = param1.readUnsignedByte();
            _loc8_.shopName = param1.readUTF();
            _loc8_.saleGoodCount = param1.readByte();
            _loc8_.saleMountCount = param1.readByte();
            _loc6_.push(_loc8_);
            _loc5_++;
         }
         var _loc7_:int = param1.readShort();
         this.walkShopList.updateList(_loc6_,_loc2_,_loc3_,_loc7_);
      }
      
      public function received_13012(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:Goods = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:PureMount = null;
         ZLog.add("13012：接收某个玩家摊位详情信息");
         var _loc2_:WalkShopDetail = new WalkShopDetail();
         _loc2_.roleID = param1.readInt();
         _loc2_.roleName = param1.readUTF();
         _loc2_.roleLevel = param1.readByte();
         _loc2_.shopName = param1.readUTF();
         _loc2_.saleGoodCount = param1.readByte();
         _loc3_ = 0;
         while(_loc3_ < _loc2_.saleGoodCount)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readShort();
            _loc5_ = new Goods(_loc6_,_loc7_);
            _loc5_.roleID = _loc2_.roleID;
            _loc5_.count = param1.readInt();
            _loc4_ = new Object();
            _loc4_.label = _loc5_.id;
            _loc4_.index = _loc7_;
            _loc4_.item = _loc5_;
            _loc4_.copper = param1.readInt();
            _loc4_.silver = param1.readInt();
            _loc5_.quality = param1.readByte();
            _loc5_.strengthen_grade = param1.readByte();
            _loc5_.isFullStar = param1.readByte();
            _loc2_.goods.push(_loc4_);
            _loc3_++;
         }
         _loc2_.saleMountCount = param1.readByte();
         _loc3_ = 0;
         while(_loc3_ < _loc2_.saleMountCount)
         {
            _loc6_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readUTF();
            _loc10_ = new PureMount(_loc8_);
            _loc10_.id = _loc6_;
            _loc10_.name = _loc9_;
            _loc4_ = new Object();
            _loc4_.label = _loc10_.id;
            _loc4_.ride = _loc10_;
            _loc4_.copper = param1.readInt();
            _loc4_.silver = param1.readInt();
            _loc2_.mounts.push(_loc4_);
            _loc3_++;
         }
         this.walkShopList.updateDetail(_loc2_);
      }
      
      public function received_13212(param1:ByteArray) : void
      {
         ZLog.add("13212：接收某个玩家摊位详情错误信息");
         this.walkShopList.clear();
      }
      
      public function received_13016(param1:ByteArray) : void
      {
         ZLog.add("13016：接收修改摊位名信息");
         var _loc2_:String = param1.readUTF();
         this.mainCharWalkShop.updateShopName(_loc2_);
      }
      
      public function received_13018(param1:ByteArray) : void
      {
         ZLog.add("13018：接收更新追加挂售信息信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:String = param1.readUTF();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:String = "<textformat leading=\'3\'>";
         var _loc10_:String = "</textformat> <p>";
         var _loc11_:String = "<font color=\'#";
         var _loc12_:String = "\'>";
         var _loc13_:String = "</font>";
         var _loc14_:String = _loc9_ + _loc11_ + "08FF52" + _loc12_ + _loc2_ + ":" + _loc3_ + ":" + _loc4_ + _loc13_ + _loc11_ + "ffffff" + _loc12_ + LanResManager.getLanTextWords(this,"挂售信息",[_loc11_ + "318AA5" + _loc12_ + _loc5_ + _loc13_,_loc6_,_loc11_ + "DE9618" + _loc12_ + _loc7_ + _loc13_,_loc11_ + "DE9618" + _loc12_ + _loc8_ + _loc13_]) + _loc13_ + _loc10_;
         this.mainCharWalkShop.showSaleConfig(_loc14_);
      }
      
      public function received_10824(param1:ByteArray) : void
      {
         ZLog.add("10824：接收别人的申请交易信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         this.tradePanel.receivedOtherCharTrade(_loc2_,_loc3_);
      }
      
      public function received_10828(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         ZLog.add("10828：接收交易是否成功信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 1)
         {
            _loc4_ = param1.readUTF();
            _loc5_ = param1.readShort();
            this.tradePanel.r_openTradePanel(_loc2_,_loc4_,_loc5_);
         }
         else
         {
            _loc6_ = param1.readUTF();
            GameInstance.uiInstance.mainUI.setSysTip(_loc6_);
         }
      }
      
      public function received_10840(param1:ByteArray) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:GoodsRes = null;
         var _loc11_:String = null;
         ZLog.add("10840：接收交易结果信息");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            _loc3_ = param1.readDouble();
            _loc4_ = param1.readDouble();
            GameInstance.uiInstance.mainUI.setSysTip(LanResManager.getLanCommonTextWords("您获得铜钱") + "：" + _loc3_);
            GameInstance.uiInstance.mainUI.setSysTip(LanResManager.getLanCommonTextWords("您获得元宝") + "：" + _loc4_);
            _loc5_ = param1.readInt();
            if(_loc5_ > 0)
            {
               GameInstance.uiInstance.mainUI.setSysTip(LanResManager.getLanCommonTextWords("您获得坐骑") + "：" + _loc5_);
            }
            _loc6_ = param1.readByte();
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc8_ = param1.readInt();
               _loc9_ = param1.readInt();
               _loc10_ = GoodsResManager.getGoodsRes(_loc8_);
               GameInstance.uiInstance.mainUI.setSysTip(LanResManager.getLanTextWords(this,"获得物品",[_loc10_.name,_loc9_]));
               _loc7_++;
            }
         }
         else
         {
            _loc11_ = NetWorkManager.readGILMsg(param1);
            GameInstance.uiInstance.mainUI.setSysTip(_loc11_);
         }
         this.tradePanel.closeTrade();
      }
      
      public function received_10842(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Goods = null;
         var _loc12_:Object = null;
         ZLog.add("10842：接收更新角色交易物品信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc5_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readByte();
            _loc8_ = param1.readShort();
            _loc9_ = param1.readShort();
            _loc10_ = param1.readInt();
            _loc11_ = new Goods(_loc6_,_loc9_);
            _loc11_.roleID = _loc2_;
            _loc11_.count = _loc10_;
            _loc11_.quality = _loc7_;
            _loc12_ = new Object();
            _loc12_.item = _loc11_;
            _loc12_.id = _loc11_.id;
            _loc12_.label = _loc11_.res.name;
            _loc12_.tradeIndex = _loc8_;
            _loc5_.push(_loc12_);
            _loc4_++;
         }
         this.tradePanel.addGoods(_loc2_,_loc5_);
      }
      
      public function received_10844(param1:ByteArray) : void
      {
         ZLog.add("10844：接收更新角色交易金钱信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Number = param1.readDouble();
         var _loc4_:int = param1.readDouble();
         this.tradePanel.updateMoney(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_10846(param1:ByteArray) : void
      {
         ZLog.add("10846：接收更新角色交易坐骑信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.tradePanel.updateMount(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_10838(param1:ByteArray) : void
      {
         ZLog.add("10838：接收玩家交易锁定状态信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         this.tradePanel.updateTradeStatus(_loc2_,_loc3_);
      }
      
      public function received_10882(param1:ByteArray) : void
      {
         ZLog.add("10882：接收购买NPC道具成功信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Number = param1.readDouble();
         var _loc6_:Goods = new Goods(_loc3_);
         _loc6_.count = _loc4_;
         GameInstance.uiInstance.mainUI.setSysTip(LanResManager.getLanTextWords(this,"购买物品",[_loc6_.res.name,_loc6_.count,_loc5_]));
      }
      
      public function received_10884(param1:ByteArray) : void
      {
         ZLog.add("10884：接收售卖NPC道具成功信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:Goods = new Goods(_loc3_);
         _loc6_.count = _loc4_;
         GameInstance.uiInstance.mainUI.setSysTip(LanResManager.getLanTextWords(this,"出售物品",[_loc6_.res.name,_loc6_.count,_loc5_]));
      }
      
      public function received_50062(param1:ByteArray) : void
      {
         var _loc8_:Goods = null;
         var _loc9_:int = 0;
         var _loc12_:MountSkill = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         ZLog.add("50062：收到其他玩家坐骑详细信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:PureMount = new PureMount(_loc3_);
         _loc5_.name = param1.readUTF();
         _loc5_.mountAttributeInfo.menghuan = param1.readInt() / 10000;
         _loc5_.mountAttributeInfo.menghuan_wuxing = param1.readInt() / 10000;
         _loc5_.mountAttributeInfo.menghuan_jineng = param1.readInt() / 10000;
         _loc5_.mountAttributeInfo.menghuan_qianli = param1.readInt() / 10000;
         _loc5_.mountAttributeInfo.menghuan_mhd = param1.readInt();
         _loc5_.mountAttributeInfo.quality = param1.readByte();
         _loc5_.mountAttributeInfo.savvy = param1.readInt();
         _loc5_.mountAttributeInfo.identity = param1.readInt();
         _loc5_.mountAttributeInfo.lv = param1.readShort();
         _loc5_.mountAttributeInfo.expNow = param1.readDouble();
         _loc5_.mountAttributeInfo.expMax = param1.readDouble();
         _loc5_.mountAttributeInfo.energyNow = param1.readInt();
         _loc5_.mountAttributeInfo.energyMax = param1.readInt();
         _loc5_.mountAttributeInfo.fightNow = param1.readInt();
         _loc5_.mountAttributeInfo.fightMax = param1.readInt();
         _loc5_.mountAttributeInfo.points_attackNow = param1.readInt();
         _loc5_.mountAttributeInfo.points_attackMin = param1.readInt();
         _loc5_.mountAttributeInfo.points_attackMax = param1.readInt();
         _loc5_.mountAttributeInfo.points_attackFujia = param1.readInt();
         _loc5_.mountAttributeInfo.points_defenceNow = param1.readInt();
         _loc5_.mountAttributeInfo.points_defenceMin = param1.readInt();
         _loc5_.mountAttributeInfo.points_defenceMax = param1.readInt();
         _loc5_.mountAttributeInfo.points_defenceFujia = param1.readInt();
         _loc5_.mountAttributeInfo.points_stongNow = param1.readInt();
         _loc5_.mountAttributeInfo.points_stongMin = param1.readInt();
         _loc5_.mountAttributeInfo.points_stongMax = param1.readInt();
         _loc5_.mountAttributeInfo.points_stongFujia = param1.readInt();
         _loc5_.mountAttributeInfo.points_flyNow = param1.readInt();
         _loc5_.mountAttributeInfo.points_flyMin = param1.readInt();
         _loc5_.mountAttributeInfo.points_flyMax = param1.readInt();
         _loc5_.mountAttributeInfo.points_flyFujia = param1.readInt();
         var _loc6_:int = param1.readByte();
         var _loc7_:Array = [];
         _loc9_ = 0;
         while(_loc9_ < _loc6_)
         {
            _loc14_ = param1.readInt();
            _loc15_ = param1.readShort();
            _loc8_ = new Goods(_loc14_,_loc15_);
            _loc8_.mountID = _loc4_;
            _loc8_.roleID = _loc2_;
            _loc8_.strengthen_grade = param1.readByte();
            _loc8_.quality = param1.readByte();
            _loc7_.push(_loc8_);
            _loc9_++;
         }
         _loc5_.mountGoodsInfo.goodsBagArr = _loc7_;
         var _loc10_:int = param1.readByte();
         var _loc11_:Object = {};
         _loc9_ = 0;
         while(_loc9_ < _loc10_)
         {
            _loc16_ = param1.readInt();
            _loc17_ = _loc9_ + 1;
            _loc12_ = new MountSkill(_loc16_,_loc17_);
            _loc12_.lv = param1.readShort();
            _loc12_.nowLvJianChengStr = param1.readUTF();
            _loc12_.nextLvUpUseZhenQi = param1.readShort();
            _loc12_.nextLvUpUseCopper = param1.readInt();
            _loc12_.nextLvJianChengStr = param1.readUTF();
            _loc12_.isOther = 1;
            _loc11_[_loc12_.id] = _loc12_;
            _loc9_++;
         }
         _loc5_.mountSkillInfo.skillObj = _loc11_;
         _loc5_.mountAttributeInfo.append_hp = param1.readDouble();
         _loc5_.mountAttributeInfo.append_mp = param1.readDouble();
         _loc5_.mountAttributeInfo.append_pp = param1.readDouble();
         _loc5_.mountAttributeInfo.append_ap = param1.readDouble();
         _loc5_.mountAttributeInfo.append_dp = param1.readDouble();
         _loc5_.mountAttributeInfo.append_cp = param1.readDouble();
         _loc5_.mountAttributeInfo.append_ev = param1.readDouble();
         _loc5_.mountAttributeInfo.append_adx = param1.readDouble();
         _loc5_.mountAttributeInfo.append_mdx = param1.readDouble();
         _loc5_.mountAttributeInfo.menghuan_append_hp = param1.readDouble();
         _loc5_.mountAttributeInfo.menghuan_append_mp = param1.readDouble();
         _loc5_.mountAttributeInfo.menghuan_append_pp = param1.readDouble();
         _loc5_.mountAttributeInfo.menghuan_append_ap = param1.readDouble();
         _loc5_.mountAttributeInfo.menghuan_append_dp = param1.readDouble();
         _loc5_.mountAttributeInfo.menghuan_append_cp = param1.readDouble();
         _loc5_.mountAttributeInfo.menghuan_append_ev = param1.readDouble();
         _loc5_.mountAttributeInfo.menghuan_append_adx = param1.readDouble();
         _loc5_.mountAttributeInfo.menghuan_append_mdx = param1.readDouble();
         var _loc13_:int = param1.readByte();
         if(_loc13_ == 1)
         {
            _loc5_.mountAttributeInfo.superMountType = param1.readByte();
            _loc5_.mountAttributeInfo.superMpunt_hp = param1.readDouble();
            _loc5_.mountAttributeInfo.superMpunt_mp = param1.readDouble();
            _loc5_.mountAttributeInfo.superMpunt_pp = param1.readDouble();
            _loc5_.mountAttributeInfo.superMpunt_ap = param1.readDouble();
            _loc5_.mountAttributeInfo.superMpunt_dp = param1.readDouble();
            _loc5_.mountAttributeInfo.superMpunt_cp = param1.readDouble();
            _loc5_.mountAttributeInfo.superMpunt_ev = param1.readDouble();
            _loc5_.mountAttributeInfo.superMpunt_adx = param1.readInt();
            _loc5_.mountAttributeInfo.superMpunt_mdx = param1.readInt();
         }
         _loc5_.mountAttributeInfo.menghuanShendanJihuo = param1.readByte();
         this.rideAttrPanel.initRideDetail(_loc5_);
      }
      
      public function received_11212(param1:ByteArray) : void
      {
         ZLog.add("11212：接收主角获取新物品信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:GoodsRes = GoodsResManager.getGoodsRes(_loc2_);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"获得新物品",[_loc3_,_loc4_.name]),false);
      }
      
      public function received_11214(param1:ByteArray) : void
      {
         ZLog.add("11214：接收主角失去物品信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:GoodsRes = GoodsResManager.getGoodsRes(_loc2_);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"失去物品",[_loc3_,_loc4_.name]),false);
         if(_loc2_ == 9760)
         {
            this.backPackMediator.use_LKZX();
         }
      }
      
      public function received_10280(param1:ByteArray) : void
      {
         ZLog.add("10280：接收设置主技能信息");
         var _loc2_:int = param1.readInt();
         ExchangePositionManager.setInitMainSkill(_loc2_);
         var _loc3_:SkillRes = SkillResManager.getSkillRes(_loc2_);
         if(!_loc3_)
         {
            return;
         }
         Fight_proxy.mainChar_skillID = _loc2_;
         Fight_proxy.mainChar_skillDistance = _loc3_.distance * 25;
      }
      
      public function received_10282(param1:ByteArray) : void
      {
         ZLog.add("10282：接收设置坐骑主技能信息");
         var _loc2_:int = param1.readInt();
         ExchangePositionManager.setRideMainSkill(_loc2_);
      }
      
      public function received_50222(param1:ByteArray) : void
      {
         ZLog.add("50222：接收修理价格信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.repairPanelMeditor.showPrice(_loc2_,_loc3_);
      }
      
      public function received_50224(param1:ByteArray) : void
      {
         var _loc3_:String = null;
         ZLog.add("50224：接收修理返回信息");
         var _loc2_:int = param1.readByte();
         if(_loc2_)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_REPAIR);
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_NEJIU_ZREO,"complete");
            this.repairPanelMeditor.closeWindow();
         }
         else
         {
            _loc3_ = NetWorkManager.readGILMsg(param1);
            GameInstance.uiInstance.mainUI.setSysTip(_loc3_);
         }
      }
      
      public function received_10170(param1:ByteArray) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:Array = null;
         ZLog.add("10170：接收装备耐久变化信息");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         if(ItemPositionRange.inBody(_loc2_))
         {
            _loc5_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition_Body(_loc2_);
         }
         else
         {
            _loc5_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc2_);
         }
         if(!_loc5_)
         {
            return;
         }
         _loc5_.curr_durability = _loc4_;
         this.itemTipProxy.removeTip(_loc2_);
         if(_loc5_.curr_durability == 0)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"耐久度为0",[_loc5_.res.name]),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"耐久度为0",[_loc5_.res.name]),false);
            _loc6_ = GameInstance.mainCharData.goodsInfo.findBodyDurabilityIsZoreGoods();
            if(_loc6_.length > 0)
            {
               NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_NEJIU_ZREO,_loc6_);
            }
         }
      }
      
      public function received_50140(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         ZLog.add("50140：初始化主角道具CD");
         _loc2_ = param1.readShort();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readShort();
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            if(_loc6_ > 0)
            {
               CDFaceManager.cdPlay(null,0,0,_loc5_,_loc5_ - _loc6_,[CoolingType.GOODS + "_" + _loc4_]);
            }
            _loc3_++;
         }
         _loc2_ = param1.readShort();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc7_ = param1.readInt();
            _loc6_ = param1.readInt();
            if(_loc6_ > 0)
            {
               _loc8_ = new Goods(_loc7_,0,0,_loc6_);
               CDFaceManager.cdPlay(_loc8_.getID(),_loc8_.getCoolingtime(),_loc8_.getCoolingtime() - _loc6_,0,0,[]);
            }
            _loc3_++;
         }
      }
      
      public function received_50142(param1:ByteArray) : void
      {
         ZLog.add("50142：主角触发道具CD");
         var _loc2_:int = param1.readInt();
         var _loc3_:Goods = new Goods(_loc2_);
         CDFaceManager.cdPlay(_loc3_.getID(),_loc3_.getCoolingtime(),0,_loc3_.getPublicCoolingtime(),0,[_loc3_.getPublicCoolingtimeClass()]);
      }
      
      public function received_53052(param1:ByteArray) : void
      {
         ZLog.add("53052：脚本调入包裹 播发特效");
         var _loc2_:int = param1.readInt();
         var _loc3_:AvatarParamData = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BAOWU),AvatarPartType.MAGIC);
         GameInstance.mainChar.loadAvatarPart(_loc3_);
         GameInstance.mainChar.showAttackFace("",0,LanResManager.getLanCommonTextWords("获得宝物") + "!",AttackFace.DEFAULT_FOUNT_SIZE_14,AttackFace.DEFAULT_FOUNT_COLOR_YELLOW);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("获得宝物"));
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("获得宝物"));
      }
      
      public function received_53202(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:int = 0;
         var _loc10_:Goods = null;
         var _loc11_:int = 0;
         ZLog.add("53202：跨服包裹初始化");
         var _loc2_:KuaFuBagVO = new KuaFuBagVO();
         _loc2_.zhangchangLine = param1.readByte();
         _loc2_.exp = param1.readDouble();
         _loc2_.shengwang = param1.readInt();
         _loc2_.copper = param1.readInt();
         _loc2_.zhenqi = param1.readShort();
         var _loc3_:int = param1.readShort();
         var _loc7_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc6_ = param1.readInt();
            _loc5_ = new Goods(_loc6_);
            _loc5_.position = param1.readShort();
            _loc5_.quickbarindex = param1.readShort();
            _loc5_.count = param1.readShort();
            _loc5_.quality = param1.readByte();
            _loc5_.bind = param1.readByte();
            _loc5_.curr_durability = param1.readInt();
            _loc7_[_loc7_.length] = _loc5_;
            _loc4_++;
         }
         _loc2_.zhanchangJifen = param1.readInt();
         _loc2_.yuanbao = param1.readInt();
         var _loc8_:int = param1.readShort();
         var _loc9_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc8_)
         {
            _loc11_ = param1.readInt();
            _loc10_ = new Goods(_loc11_);
            _loc10_.count = param1.readShort();
            _loc9_.push(_loc10_);
            _loc4_++;
         }
         _loc2_.weiWang = param1.readInt();
         _loc2_.gongXun = param1.readInt();
         _loc2_.wuhun = param1.readInt();
         GameInstance.mainCharData.goodsInfo.goodsBagKuaJiangliArr = _loc9_;
         this.kuaFuBag.updateJiangliData();
         _loc2_.goodsArr = _loc7_;
         GameInstance.mainCharData.goodsInfo.goodsBagKuaArr = _loc2_.goodsArr;
         this.kuaFuBag.initBagData(_loc2_);
      }
      
      public function received_53204(param1:ByteArray) : void
      {
         ZLog.add("53204：跨服收益");
         var _loc2_:int = param1.readByte();
         var _loc3_:Number = param1.readDouble();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readShort();
         var _loc7_:* = param1.readInt();
         var _loc8_:* = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         this.kuaFuBag.updateData(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc9_,_loc10_,_loc7_,_loc8_,_loc11_);
      }
      
      public function received_53206(param1:ByteArray) : void
      {
         ZLog.add("53206：跨服收益奖励物品是否领取成功");
         var _loc2_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc2_)
         {
            this.kuaFuBag.moveItem();
         }
      }
      
      public function received_53772(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Goods = null;
         ZLog.add("53772：道具兑换查询返回");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 0)
         {
            return;
         }
         _loc3_ = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = {};
            _loc6_.id = param1.readInt();
            _loc6_.count = param1.readInt();
            _loc6_.yb = param1.readInt();
            _loc7_ = new Goods(_loc6_.id);
            _loc6_.name = _loc7_.res.name;
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.itemChangeMediator.setChangeItem(_loc2_,_loc4_);
      }
      
      public function received_53774(param1:ByteArray) : void
      {
         ZLog.add("53774：道具兑换结果");
         var _loc2_:int = param1.readByte();
         this.itemChangeMediator.itemChangeComplete(_loc2_);
      }
      
      public function received_49994(param1:ByteArray) : void
      {
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _loc13_:Goods = null;
         var _loc14_:Goods = null;
         ZLog.add("49994：切换剑广播");
         var _loc2_:int = param1.readInt();
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_,SceneCharacterType.PLAYER);
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Player = _loc3_.data as Player;
         var _loc5_:AvatarInfo = _loc4_.avatarInfo;
         var _loc6_:AttributeInfo = _loc4_.attributeInfo;
         var _loc7_:int = 1;
         var _loc8_:int = param1.readInt();
         var _loc9_:GoodsRes = GoodsResManager.getGoodsRes(_loc8_);
         _loc5_.useIng_Weapon_id = _loc8_;
         if(_loc9_ != null)
         {
            if(_loc7_ == 1)
            {
               _loc10_ = AvatarManager.dressAvatarData(_loc5_,_loc9_.position,_loc9_.id_m,_loc6_.getSex());
               if(ReloginManager.isInGongcheng)
               {
                  if(_loc9_.position == ItemPositionRange.POSTION_YLZR)
                  {
                     if(!_loc3_.isMainChar())
                     {
                        GameInstance.scene.addAlwaysShowChar(_loc3_);
                     }
                  }
               }
               else if(ReloginManager.isInKuafu)
               {
                  if(_loc9_.position == ItemPositionRange.POSTION_STDRJ)
                  {
                     if(!_loc3_.isMainChar())
                     {
                        GameInstance.scene.addAlwaysShowChar(_loc3_);
                     }
                  }
               }
            }
            else
            {
               _loc10_ = AvatarManager.taskOffAvatarData(_loc5_,_loc9_.position,_loc9_.id_m,_loc6_.getSex());
               if(ReloginManager.isInGongcheng)
               {
                  if(_loc9_.position == ItemPositionRange.POSTION_YLZR)
                  {
                     if(!_loc3_.isMainChar())
                     {
                        GameInstance.scene.removeAlwaysShowChar(_loc3_);
                     }
                  }
               }
               else if(ReloginManager.isInKuafu)
               {
                  if(_loc9_.position == ItemPositionRange.POSTION_STDRJ)
                  {
                     if(!_loc3_.isMainChar())
                     {
                        GameInstance.scene.removeAlwaysShowChar(_loc3_);
                     }
                  }
               }
               if(GameInstance.mainCharData.goodsInfo.isBagFull())
               {
                  NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_BACKPACK_FULL);
               }
            }
            AvatarManager.updateMainAvatar(_loc3_,_loc10_);
            if(_loc3_.isMainChar())
            {
               if(_loc9_.position == ItemPositionRange.POSTION_STDRJ)
               {
                  _loc11_ = int(GameInstance.mainCharData.goodsInfo.goodsBodyArr.length);
                  _loc12_ = int(_loc11_ - 1);
                  while(_loc12_ >= 0)
                  {
                     _loc13_ = GameInstance.mainCharData.goodsInfo.goodsBodyArr[_loc12_] as Goods;
                     if(_loc13_.res.position == ItemPositionRange.POSTION_STDRJ)
                     {
                        GameInstance.mainCharData.goodsInfo.goodsBodyArr.splice(_loc12_,1);
                        delete GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc13_.res.position];
                     }
                     _loc12_--;
                  }
                  if(_loc7_ == 1)
                  {
                     _loc14_ = new Goods(_loc8_);
                     GameInstance.mainCharData.goodsInfo.goodsBodyArr.push(_loc14_);
                     GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc14_.res.position] = _loc14_;
                  }
                  if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
                  {
                     GameInstance.uiInstance._charAttribute.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
                  }
               }
               else if(_loc9_.position == ItemPositionRange.POSTION_YLZR)
               {
                  _loc11_ = int(GameInstance.mainCharData.goodsInfo.goodsBodyArr.length);
                  _loc12_ = int(_loc11_ - 1);
                  while(_loc12_ >= 0)
                  {
                     _loc13_ = GameInstance.mainCharData.goodsInfo.goodsBodyArr[_loc12_] as Goods;
                     if(_loc13_.res.position == ItemPositionRange.POSTION_YLZR)
                     {
                        GameInstance.mainCharData.goodsInfo.goodsBodyArr.splice(_loc12_,1);
                        delete GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc13_.res.position];
                     }
                     _loc12_--;
                  }
                  if(_loc7_ == 1)
                  {
                     _loc14_ = new Goods(_loc8_);
                     GameInstance.mainCharData.goodsInfo.goodsBodyArr.push(_loc14_);
                     GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc14_.res.position] = _loc14_;
                  }
                  if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
                  {
                     GameInstance.uiInstance._charAttribute.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
                  }
               }
               else if(_loc9_.position == ItemPositionRange.POSTION_SHENQI || _loc9_.position == ItemPositionRange.POSTION_AOJIAN || _loc9_.position == ItemPositionRange.POSTION_GJMY || _loc9_.position == ItemPositionRange.POSITION_LONGYA || _loc9_.position == ItemPositionRange.POSITION_YAYUEDAO || _loc9_.position == ItemPositionRange.POSITION_XUANTIEZHONGJIAN || _loc9_.position == ItemPositionRange.POSITION_GUANGMINGZHANG || _loc9_.position == ItemPositionRange.POSITION_HUIMIE || _loc9_.position == ItemPositionRange.POSITION_ZHUMOZHANG || _loc9_.position == ItemPositionRange.POSITION_CHIYAN || _loc9_.position == ItemPositionRange.POSITION_FENGTIANJI || _loc9_.position == ItemPositionRange.POSITION_TIANJING || _loc9_.position == ItemPositionRange.POSITION_TIANZHU || _loc9_.position == ItemPositionRange.POSITION_PANGUKAITIANFU || _loc9_.position == ItemPositionRange.POSITION_TIANDI || _loc9_.position == ItemPositionRange.POSITION_HANQIBINGPO || _loc9_.position == ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN || _loc9_
               .position == ItemPositionRange.POSITION_CHUANGSHI || _loc9_.position == ItemPositionRange.POSITION_SUILIESHIFU || _loc9_.position == ItemPositionRange.POSITION_MOYUAN || _loc9_.position == ItemPositionRange.POSITION_CHENGJIECHANGJI || _loc9_.position == ItemPositionRange.POSITION_TIANXIEJIAN || _loc9_.position == ItemPositionRange.POSITION_JUNZIJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEJIAN || _loc9_.position == ItemPositionRange.POSITION_FENGBAODAO || _loc9_.position == ItemPositionRange.POSITION_FENGYUN || _loc9_.position == ItemPositionRange.POSITION_SHENGDAN2015 || _loc9_.position == ItemPositionRange.POSITION_FENGSHA || _loc9_.position == ItemPositionRange.POSITION_FENGYIJIAN || _loc9_.position == ItemPositionRange.POSITION_LEXINJI || _loc9_.position == ItemPositionRange.POSITION_FENGYINGJIAN || _loc9_.position == ItemPositionRange.POSITION_ZHENFENGJIAN || _loc9_.position == ItemPositionRange.POSITION_FENGYUNJIAN || _loc9_.position == ItemPositionRange.POSITION_BINGFENGJIAN || _loc9_
               .position == ItemPositionRange.POSITION_HONGLEIZHANGU || _loc9_.position == ItemPositionRange.POSITION_SANDENGGUFO || _loc9_.position == ItemPositionRange.POSITION_FONUJI || _loc9_.position == ItemPositionRange.POSITION_FENGYINJIAN || _loc9_.position == ItemPositionRange.POSITION_TIANMAJIAN || _loc9_.position == ItemPositionRange.POSITION_WUHUNJIAN || _loc9_.position == ItemPositionRange.POSITION_ZHENTIANJIAN || _loc9_.position == ItemPositionRange.POSITION_TIANXUE || _loc9_.position == ItemPositionRange.POSITION_XIONGJIJIAN || _loc9_.position == ItemPositionRange.POSITION_WUJINJIAN || _loc9_.position == ItemPositionRange.POSITION_SHUNTIANJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEQICANG || _loc9_.position == ItemPositionRange.POSITION_BIXUEJIAN || _loc9_.position == ItemPositionRange.POSITION_QINGFENGJIAN || _loc9_.position == ItemPositionRange.POSITION_WUYIJIAN || _loc9_.position == ItemPositionRange.POSITION_SHIJIANSHENQI || _loc9_.position == ItemPositionRange.POSITION_HUOLINJIAN || _loc9_
               .position == ItemPositionRange.POSITION_ZHUIHUNJI || _loc9_.position == ItemPositionRange.POSITION_BIYUDAO || _loc9_.position == ItemPositionRange.POSITION_WUWOZHANG || _loc9_.position == ItemPositionRange.POSITION_YEHUOHONGLIAN || _loc9_.position == ItemPositionRange.POSITION_MINGYUEDAO || _loc9_.position == ItemPositionRange.POSITION_QINGFENGJIAN2 || _loc9_.position == ItemPositionRange.POSITION_ZHIZUNJIAN || _loc9_.position == ItemPositionRange.POSITION_BAOLEIJI || _loc9_.position == ItemPositionRange.POSITION_MINGSHENGZHANG || _loc9_.position == ItemPositionRange.POSITION_ZUNSHIJIAN || _loc9_.position == ItemPositionRange.POSITION_RENZHEZHANG || _loc9_.position == ItemPositionRange.POSITION_ZHIZHEJIAN || _loc9_.position == ItemPositionRange.POSITION_YANGMINGJIAN || _loc9_.position == ItemPositionRange.POSITION_XIWANGJIAN || _loc9_.position == ItemPositionRange.POSITION_XUEJINGJIAN || _loc9_.position == ItemPositionRange.POSITION_XUANBINGJIAN || _loc9_.position == ItemPositionRange.POSITION_PINGANJIAN || _loc9_
               .position == ItemPositionRange.POSITION_QINGHUAJIAN || _loc9_.position == ItemPositionRange.POSITION_YUXUJIAN || _loc9_.position == ItemPositionRange.POSITION_YUQINGSHAN || _loc9_.position == ItemPositionRange.POSITION_HUOMODAO || _loc9_.position == ItemPositionRange.POSITION_YIHEJI || _loc9_.position == ItemPositionRange.POSITION_ERHEJIAN || _loc9_.position == ItemPositionRange.POSITION_SANHEDAO || _loc9_.position == ItemPositionRange.POSITION_MIEHUSHAN || _loc9_.position == ItemPositionRange.POSITION_QINGMINGDAO || _loc9_.position == ItemPositionRange.POSITION_HUOXINGFU || _loc9_.position == ItemPositionRange.POSITION_SHENZAO || _loc9_.position == ItemPositionRange.POSITION_KAITIANGONG || _loc9_.position == ItemPositionRange.POSITION_YANWENFENGMO || _loc9_.position == ItemPositionRange.POSITION_LINGLONGZI || _loc9_.position == ItemPositionRange.POSITION_SHASHENJIAN || _loc9_.position == ItemPositionRange.POSITION_DUANQINGJI || _loc9_.position == ItemPositionRange.POSITION_NULONG || _loc9_
               .position == ItemPositionRange.POSITION_QINIAN || _loc9_.position == ItemPositionRange.POSITION_ZHUXIAN || _loc9_.position == ItemPositionRange.POSITION_HANBING || _loc9_.position == ItemPositionRange.POSITION_POSHAN || _loc9_.position == ItemPositionRange.POSITION_HAIYU || _loc9_.position == ItemPositionRange.POSITION_TIANMINGDAO || _loc9_.position == ItemPositionRange.POSITION_JINGTIANYIJI || _loc9_.position == ItemPositionRange.POSITION_JINGLEIJUEDAO || _loc9_.position == ItemPositionRange.POSITION_YINGXIONGJIAN || _loc9_.position == ItemPositionRange.POSITION_CHANGSHENGJIAN || _loc9_.position == ItemPositionRange.POSITION_GUIYINGGONG || _loc9_.position == ItemPositionRange.POSITION_JINGLEIZHANG || _loc9_.position == ItemPositionRange.POSITION_HUNDUN || _loc9_.position == ItemPositionRange.POSITION_DINGHUN || _loc9_.position == ItemPositionRange.POSITION_WUJI || _loc9_.position == ItemPositionRange.POSITION_HUOXINGJIAN || _loc9_.position == ItemPositionRange.POSITION_WANGZHEFU || _loc9_
               .position == ItemPositionRange.POSITION_DUOMINGDAO || _loc9_.position == ItemPositionRange.POSITION_XIAOSHEN || _loc9_.position == ItemPositionRange.POSITION_WANSHI || _loc9_.position == ItemPositionRange.POSITION_ZHONGQIU || _loc9_.position == ItemPositionRange.POSITION_SHENJIAN || _loc9_.position == ItemPositionRange.POSITION_YUHUAZHANG || _loc9_.position == ItemPositionRange.POSITION_BANIANGONG || _loc9_.position == ItemPositionRange.POSITION_BANIANJIAN || _loc9_.position == ItemPositionRange.POSITION_BANIANJI || _loc9_.position == ItemPositionRange.POSITION_2019SHENDAN || _loc9_.position == ItemPositionRange.POSITION_2019GENGZI || _loc9_.position == ItemPositionRange.POSITION_2019FEIHUA || _loc9_.position == ItemPositionRange.POSITION_2019XIONGWANG || _loc9_.position == ItemPositionRange.POSITION_2020XUEHUAN || _loc9_.position == ItemPositionRange.POSITION_2020BADAO || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN01 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN02 || _loc9_
               .position == ItemPositionRange.POSITION_2020BAOJIAN03 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN04 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN05 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN06 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN07 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN08 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN09 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN10 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN11 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN12 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN13 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN14 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN15 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN16 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN17 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN18 || _loc9_
               .position == ItemPositionRange.POSITION_2020BAOJIAN19 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN20 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN21 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN22 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN23 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN24 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN25 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN26 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN27 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN28 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN29 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN30 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN31 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN32 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN33 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN34 || _loc9_
               .position == ItemPositionRange.POSITION_2020BAOJIAN35 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN36 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN37 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN38 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN39 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN40 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN41 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN42 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN43 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN44 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN45 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN46 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN47 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN48 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN49 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN50 || _loc9_
               .position == ItemPositionRange.POSITION_2020BAOJIAN51 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN52 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN53 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN54 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN55 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN56 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN57 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN58 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN59 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN60 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN61 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN62 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN63 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN64 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN65 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN66 || _loc9_
               .position == ItemPositionRange.POSITION_2020BAOJIAN67 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN68 || _loc9_.position == ItemPositionRange.POSITION_2020BAOJIAN69 || _loc9_.position >= ItemPositionRange.POSITION_NB_WEAPON_ARR[0] && _loc9_.position <= ItemPositionRange.POSITION_NB_WEAPON_ARR[ItemPositionRange.POSITION_NB_WEAPON_ARR.length - 1])
               {
                  if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
                  {
                     GameInstance.uiInstance._charAttribute.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
                  }
               }
            }
         }
         if(_loc2_ == GameInstance.lookPlayerID && Boolean(GameInstance.lookPlayerID))
         {
            GameInstance.lookPlayerData.avatarInfo = _loc5_;
         }
      }
      
      public function received_53092(param1:ByteArray) : void
      {
         ZLog.add("53092：接收特殊物品使用的弹出面板数据");
         var _loc2_:int = param1.readShort();
         var _loc3_:String = param1.readUTF();
         this.backPackMediator.useSpecialItem(_loc2_,_loc3_);
      }
      
      public function received_55902(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:McBaseItem = null;
         ZLog.add("55902：初始化战魂袋包裹信息");
         GameInstance.mainCharData.goodsInfo.goodsZhanhundaiArr.length = 0;
         var _loc2_:int = param1.readShort();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            _loc5_ = new McBaseItem(_loc4_);
            _loc5_.position = param1.readShort();
            _loc5_.quickbarindex = param1.readShort();
            _loc5_.shuliang = param1.readShort();
            _loc5_.name = param1.readUTF();
            _loc5_.dengji = param1.readByte();
            _loc5_.quality = param1.readByte();
            _loc5_.daojuId = param1.readInt();
            _loc5_.dangqianJingyan = param1.readInt();
            _loc5_.zuidaJingyan = param1.readInt();
            _loc5_.tunshiJingyan = param1.readInt();
            _loc5_.isSuoding = param1.readByte();
            _loc5_.bind = param1.readByte();
            _loc5_.miaoshu = param1.readUTF();
            GameInstance.mainCharData.goodsInfo.goodsZhanhundaiArr.push(_loc5_);
            _loc3_++;
         }
         this.zhanhundai.updateGoods(GameInstance.mainCharData.goodsInfo.goodsZhanhundaiArr);
      }
      
      public function received_11180(param1:ByteArray) : void
      {
         var _loc17_:McBaseItem = null;
         ZLog.add("11180：更新或在索引处增加物品");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readShort();
         var _loc5_:int = param1.readShort();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readByte();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         var _loc13_:int = param1.readByte();
         var _loc14_:int = param1.readByte();
         var _loc15_:String = param1.readUTF();
         var _loc16_:GoodsInfo = GameInstance.mainCharData.goodsInfo;
         _loc17_ = _loc16_.getMcByPosition(_loc3_);
         if(_loc17_ != null)
         {
            _loc16_.deleteGoods(_loc17_);
         }
         _loc17_ = new McBaseItem(_loc2_,_loc3_,_loc4_);
         _loc17_.position = _loc3_;
         _loc17_.quickbarindex = _loc4_;
         _loc17_.shuliang = _loc5_;
         _loc17_.name = _loc6_;
         _loc17_.dengji = _loc7_;
         _loc17_.quality = _loc8_;
         _loc17_.daojuId = _loc9_;
         _loc17_.dangqianJingyan = _loc10_;
         _loc17_.zuidaJingyan = _loc11_;
         _loc17_.tunshiJingyan = _loc12_;
         _loc17_.isSuoding = _loc13_;
         _loc17_.bind = _loc14_;
         _loc17_.miaoshu = _loc15_;
         if(ItemPositionRange.inZhanhundaiBag(_loc3_))
         {
            GameInstance.mainCharData.goodsInfo.goodsZhanhundaiArr.push(_loc17_);
            this.zhanhundai.updateGoods(GameInstance.mainCharData.goodsInfo.goodsZhanhundaiArr);
         }
      }
      
      public function received_60222(param1:ByteArray) : void
      {
         ZLog.add("60222：返回背包锁状态");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:Boolean = false;
         if(_loc3_ == 0)
         {
            _loc4_ = false;
         }
         else
         {
            _loc4_ = true;
         }
         this.backPackMediator.setSafeLockState(_loc2_);
         this.backPackMediator.setSafeLock(_loc4_);
      }
      
      public function received_60224(param1:ByteArray) : void
      {
         ZLog.add("60224：返回创建密码");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.backPackMediator.safeUnlockClose();
            this.backPackMediator.setSafeLockState(0);
            this.backPackMediator.setSafeLock(true);
         }
      }
      
      public function received_60226(param1:ByteArray) : void
      {
         ZLog.add("60226：返回修改密码");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.backPackMediator.updateSafePanelClose();
            this.backPackMediator.setSafeLockState(0);
            this.backPackMediator.setSafeLock(true);
         }
      }
      
      public function received_60228(param1:ByteArray) : void
      {
         ZLog.add("60228：返回验证结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.backPackMediator.safeUnlockClose();
            this.backPackMediator.setSafeLockState(1);
            this.backPackMediator.setSafeLock(1);
         }
      }
      
      public function received_60230(param1:ByteArray) : void
      {
         ZLog.add("60230：返回锁定结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.backPackMediator.setSafeLockState(0);
         }
         else
         {
            this.backPackMediator.setSafeLockState(1);
         }
      }
      
      public function received_60232(param1:ByteArray) : void
      {
         ZLog.add("60232：返回遗忘密码结果");
         var _loc2_:int = param1.readInt();
         this.backPackMediator.posuo(_loc2_);
      }
      
      public function received_72986(param1:ByteArray) : void
      {
         ZLog.add("72986：返回越南 捕鱼结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            GameInstance.mainChar.stopMove();
            TopTipManager.getInstance().removeTip(MainCharSeachPathManager.AUTO_FIND_PATH_TEXT);
            KeyboardManager.enable = false;
            GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
            this.time1 = new Timer(10000,1);
            this.time1.start();
            this.LoadingBar(1);
            this.time1.addEventListener(TimerEvent.TIMER_COMPLETE,this.onEnterFarme);
         }
      }
      
      internal function LoadingBar(param1:int) : void
      {
         SmallLoadingBar.close();
         var _loc2_:String = "";
         var _loc3_:int = 0;
         if(param1 == 1)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("正在撒饵．．．");
            _loc3_ = 10000;
         }
         else if(param1 == 2)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("正在撒网．．．");
            _loc3_ = 19000;
         }
         else if(param1 == 3)
         {
            _loc2_ = LanResManager.getLanCommonTextWords("正在收网．．．");
            _loc3_ = 29000;
         }
         SynthesizeMsg.SynthesizeSmallLoadingBarMsg = _loc2_;
         SmallLoadingBar.showLoading(SynthesizeMsg.SynthesizeSmallLoadingBarMsg,_loc3_);
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         this.addBuff(10616);
         this.time1.stop();
         this.time1.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onEnterFarme);
         this.time1 = null;
         this.LoadingBar(2);
         this.time2 = new Timer(20000,1);
         this.time2.start();
         this.time2.addEventListener(TimerEvent.TIMER_COMPLETE,this.onEnterFarme2);
      }
      
      private function onEnterFarme2(param1:Event) : void
      {
         this.delBuff(10616);
         this.time2.stop();
         this.time2.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onEnterFarme2);
         this.time2 = null;
         this.addBuff(10617);
         this.LoadingBar(3);
         this.time3 = new Timer(30000,1);
         this.time3.start();
         this.time3.addEventListener(TimerEvent.TIMER_COMPLETE,this.onEnterFarme3);
      }
      
      private function onEnterFarme3(param1:Event) : void
      {
         this.delBuff(10617);
         this.time3.stop();
         this.time3.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onEnterFarme3);
         this.time3 = null;
         GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
         KeyboardManager.enable = true;
      }
      
      internal function addBuff(param1:int) : void
      {
         var _loc2_:AvatarParamData = null;
         var _loc4_:int = 0;
         var _loc5_:MapTile = null;
         if(param1 == 10617)
         {
            _loc2_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.buyu1),AvatarPartType.MAGIC_RING);
         }
         else
         {
            _loc2_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.buyu2),AvatarPartType.MAGIC_RING);
         }
         _loc2_.id = this.BUFF_P + param1;
         var _loc3_:int = 0;
         while(_loc3_ < 8)
         {
            _loc4_ = GameInstance.mainChar.avatar.logicAngle;
            switch(_loc4_)
            {
               case 0:
                  _loc5_ = SceneCache.mapTiles[GameInstance.mainChar.tile_x + "_" + (GameInstance.mainChar.tile_y + 100 / 25)];
                  if(_loc5_.isYouyong)
                  {
                     _loc2_.offsetY = 100;
                  }
                  break;
               case 1:
                  _loc5_ = SceneCache.mapTiles[GameInstance.mainChar.tile_x - 100 / 25 + "_" + (GameInstance.mainChar.tile_y + 100 / 25)];
                  if(_loc5_.isYouyong)
                  {
                     _loc2_.offsetX = -100;
                     _loc2_.offsetY = 100;
                  }
                  break;
               case 2:
                  _loc5_ = SceneCache.mapTiles[GameInstance.mainChar.tile_x - 100 / 25 + "_" + GameInstance.mainChar.tile_y];
                  if(_loc5_.isYouyong)
                  {
                     _loc2_.offsetX = -100;
                  }
                  break;
               case 3:
                  _loc5_ = SceneCache.mapTiles[GameInstance.mainChar.tile_x - 100 / 25 + "_" + (GameInstance.mainChar.tile_y - 100 / 25)];
                  if(_loc5_.isYouyong)
                  {
                     _loc2_.offsetX = -100;
                     _loc2_.offsetY = -100;
                  }
                  break;
               case 4:
                  _loc5_ = SceneCache.mapTiles[GameInstance.mainChar.tile_x + "_" + (GameInstance.mainChar.tile_y - 100 / 25)];
                  if(_loc5_.isYouyong)
                  {
                     _loc2_.offsetY = -100;
                  }
                  break;
               case 5:
                  _loc5_ = SceneCache.mapTiles[GameInstance.mainChar.tile_x + 100 / 25 + "_" + (GameInstance.mainChar.tile_y - 100 / 25)];
                  if(_loc5_.isYouyong)
                  {
                     _loc2_.offsetX = 100;
                     _loc2_.offsetY = -100;
                  }
                  break;
               case 6:
                  _loc5_ = SceneCache.mapTiles[GameInstance.mainChar.tile_x + 100 / 25 + "_" + GameInstance.mainChar.tile_y];
                  if(_loc5_.isYouyong)
                  {
                     _loc2_.offsetX = 100;
                  }
                  break;
               case 7:
                  _loc5_ = SceneCache.mapTiles[GameInstance.mainChar.tile_x + 100 / 25 + "_" + (GameInstance.mainChar.tile_y + 100 / 25)];
                  if(_loc5_.isYouyong)
                  {
                     _loc2_.offsetX = 100;
                     _loc2_.offsetY = 100;
                  }
            }
            if(_loc5_.isYouyong)
            {
               break;
            }
            if(_loc4_ == 7)
            {
               _loc4_ = -1;
            }
            GameInstance.mainChar.setAngle(_loc4_ + 1);
            GameInstance.mainChar.avatar.logicAngle = _loc4_ + 1;
            _loc3_++;
         }
         GameInstance.mainChar.loadAvatarPart(_loc2_);
      }
      
      internal function delBuff(param1:int) : void
      {
         GameInstance.mainChar.removeAvatarPartByID(this.BUFF_P + param1);
      }
      
      public function received_83076(param1:ByteArray) : void
      {
         ZLog.add("83076：返回开启花灯礼物结果");
         var _loc2_:int = param1.readByte();
         SmallLoadingBar.close();
      }
   }
}

