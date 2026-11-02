package com.tgame.moudels.synthesize.view.panelOperctor
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.ItemSynthesizePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   
   public class stoneSynthesize extends BaseSynthesize
   {
      
      private static var _stoneSynthesize:stoneSynthesize;
      
      private var itemDataArr:Array = [];
      
      private var isShowFalertMsg:Boolean = true;
      
      private var isItemLast:Boolean = false;
      
      public function stoneSynthesize()
      {
         super();
      }
      
      public static function getStoneSynthesize() : stoneSynthesize
      {
         if(!_stoneSynthesize)
         {
            _stoneSynthesize = new stoneSynthesize();
         }
         return _stoneSynthesize;
      }
      
      override public function addListener() : void
      {
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SETSTONEBTN_CLICK,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_STARTBTN_CLICK,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_USE_LUCKSTONE_COUNT,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_GETSTONEBTN_CLICK,this.mainCharSynthesizeHandle);
      }
      
      public function setStoneSynthesizeMaterial(param1:Object) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Goods = null;
         var _loc11_:int = 0;
         var _loc12_:Goods = null;
         var _loc13_:Goods = null;
         if(!super.equip)
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc3_:Boolean = true;
         var _loc4_:Boolean = true;
         var _loc5_:Boolean = true;
         this.isItemLast = false;
         var _loc6_:int = 1;
         while(_loc6_ <= 3)
         {
            _loc8_ = int(param1["id" + _loc6_]);
            _loc9_ = int(param1["id" + _loc6_ + "Num"]);
            if(_loc8_ != 0)
            {
               _loc10_ = new Goods(_loc8_);
               _loc10_.count = _loc9_;
               _loc2_.push(_loc10_);
               _loc11_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc8_,true);
               if(_loc10_.id == super.equip.id)
               {
                  _loc9_ += 1;
               }
               if(_loc11_ >= _loc9_ && _loc6_ == 1)
               {
                  _loc3_ = false;
                  this.isItemLast = true;
               }
               if(_loc11_ >= _loc9_ && _loc6_ == 2)
               {
                  _loc4_ = false;
                  this.isItemLast = true;
               }
               if(_loc11_ >= _loc9_ && _loc6_ == 3)
               {
                  _loc5_ = false;
                  this.isItemLast = true;
               }
            }
            else
            {
               _loc2_.push(null);
            }
            _loc6_++;
         }
         var _loc7_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
         super.itemSynthesizePanel.setStoneSynthesizeMaterial(_loc2_[0],_loc2_[1],_loc2_[2],_loc7_,_loc3_,_loc4_,_loc5_);
         if(param1.nextLevelData != 1)
         {
            _loc12_ = new Goods(param1.nextLevelData);
            _loc12_.is_use = 0;
            this.itemDataArr = _loc2_;
            _loc13_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(super.equip.id);
            _loc13_.is_use = 0;
            _loc13_.count = 1;
            super.itemSynthesizePanel.setStoneSynthesizeEquip(_loc13_,_loc12_);
         }
         else
         {
            if(this.isShowFalertMsg)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该宝石等级已最高"),false);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该宝石等级已最高"),false);
            }
            this.panelClose();
         }
      }
      
      public function panelClose() : void
      {
         itemSynthesizePanel.getStoneSynthesizeEquip();
         super.closePanel();
      }
      
      public function getbackItem() : void
      {
         var _loc1_:Goods = null;
         if(super.equip)
         {
            this.isShowFalertMsg = false;
            _loc1_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(super.equip.position);
            this.itemToPanel(_loc1_,false);
         }
      }
      
      private function mainCharSynthesizeHandle(param1:BaseEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:Goods = null;
         switch(param1.type)
         {
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SETSTONEBTN_CLICK:
               super.chickItemToPanelFun = this.setItem;
               super.openBackpack();
               super.changeMouseStatus();
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_STARTBTN_CLICK:
               if(!this.isItemLast)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"材料不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"材料不足"),false);
                  return;
               }
               if(!super.equip)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入宝石"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入宝石"),false);
                  return;
               }
               if(super.zhenQi > GameInstance.mainCharData.attributeInfo.gqNow)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("真气不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("真气不足"),false);
                  return;
               }
               _loc2_ = {};
               _loc2_.XY = super.equip.position;
               _loc2_.ID = super.equip.id;
               _loc2_.item1 = this.itemDataArr[0] ? this.itemDataArr[0].id : 0;
               _loc2_.item2 = this.itemDataArr[1] ? this.itemDataArr[1].id : 0;
               _loc2_.item3 = this.itemDataArr[2] ? this.itemDataArr[2].id : 0;
               _loc2_.xingYunJingNum = BaseSynthesize.xingYunJingNum;
               BaseSynthesize.addLoadBuffer();
               BaseSynthesize.sendMsgFun.send_50119(_loc2_);
               SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("新宝石合成中");
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_USE_LUCKSTONE_COUNT:
               _loc3_ = param1.data;
               BaseSynthesize.xingYunJingNum = _loc3_.num;
               if(BaseSynthesize.xingYunJingNum > 0)
               {
                  if(_loc3_.isSetMaterial)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"使用幸运晶数量",[BaseSynthesize.xingYunJingNum,BaseSynthesize.xingYunJingNum * OtherConst.XINGYUNJING_JILV]),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"使用幸运晶数量",[BaseSynthesize.xingYunJingNum,BaseSynthesize.xingYunJingNum * OtherConst.XINGYUNJING_JILV]),false);
                  }
               }
               super.setExpendGasAndProbability(null);
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_GETSTONEBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.panelClose();
               _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
               _loc4_.count = 0;
               super.itemSynthesizePanel.setStoneSynthesizeMaterial(null,null,null,_loc4_);
         }
      }
      
      private function setItem(param1:ItemFace) : void
      {
         var _loc2_:Goods = null;
         if(param1 == null || !Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
         {
            return;
         }
         if(param1.getBaseItem() is Goods)
         {
            if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW)
            {
               this.isShowFalertMsg = true;
               _loc2_ = param1.getBaseItem() as Goods;
               this.itemToPanel(_loc2_);
            }
         }
      }
      
      private function itemToPanel(param1:Goods, param2:Boolean = true) : void
      {
         var _loc3_:Object = null;
         if(Boolean(param1) && Boolean(param1.res) && param1.res.kind == 6)
         {
            if(super.equip)
            {
               if(super.equip.id != param1.id)
               {
                  this.panelClose();
                  return;
               }
            }
            super.equip = param1;
            _loc3_ = {};
            _loc3_.XY = param1.position;
            _loc3_.ID = param1.id;
            _loc3_.type = 7;
            BaseSynthesize.tempData = _loc3_;
            BaseSynthesize.sendMsgFun.send_50125(_loc3_);
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            super.mouseToNormal();
         }
         else if(param2)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("该物品不是宝石"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该物品不是宝石"),false);
         }
         else
         {
            this.panelClose();
         }
      }
   }
}

