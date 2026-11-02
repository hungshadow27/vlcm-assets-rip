package com.tgame.moudels.synthesize.view.panelOperctor
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.equipMosaic.EquipMosaic;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.ItemSynthesizePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   
   public class equipSynthesize extends BaseSynthesize
   {
      
      private static var _equipSynthesize:equipSynthesize;
      
      private var isUseZhenHunFu:Boolean = false;
      
      private var isUseZhenXingFu:Boolean = false;
      
      private var tempEquip:Goods;
      
      private var isShowFalertMsg:Boolean = true;
      
      private var nextLevelGoods:Goods;
      
      private var isShowTip:Boolean = false;
      
      public function equipSynthesize()
      {
         super();
      }
      
      public static function getEquipSynthesize() : equipSynthesize
      {
         if(!_equipSynthesize)
         {
            _equipSynthesize = new equipSynthesize();
         }
         return _equipSynthesize;
      }
      
      public function setEquipSynthesizeEquip(param1:Object) : void
      {
         if(!super.equip)
         {
            return;
         }
         if(param1.nextLevelData != 1)
         {
            this.nextLevelGoods = null;
            this.nextLevelGoods = new Goods(param1.nextLevelData);
            this.nextLevelGoods.is_use = 0;
            this.nextLevelGoods.roleID = OtherConst.NEXT_ITEM_ROLE_ID;
            this.nextLevelGoods.position = super.equip.position;
            super.itemSynthesizePanel.setEquipSynthesizeEquip(super.equip,this.nextLevelGoods);
         }
         else
         {
            if(this.isShowFalertMsg)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该装备等级已最高"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该装备等级已最高"),false);
            }
            this.panelClose();
         }
      }
      
      override public function addListener() : void
      {
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SETEQUIPBTN_CLICK,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENXINGFU,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENHUNFU,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_LUCKSTONE_COUNT,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_STARTBTN_CLICK,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_GETEQUIPBTN_CLICK,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_KEEP,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_NEXT_IS_SHOW,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_OPTION,this.mainCharSynthesizeHandle);
      }
      
      private function mainCharSynthesizeHandle(param1:BaseEvent) : void
      {
         var next:Function = null;
         var obj:Object = null;
         var b:Boolean = false;
         var e:BaseEvent = param1;
         next = function(param1:FAlertEvent = null):void
         {
            if(Boolean(param1) && param1.eventData != FAlert.OK)
            {
               return;
            }
            if(nextLevelGoods.res.limit_grade <= GameInstance.mainCharData.attributeInfo.lv)
            {
               showTip();
            }
            else
            {
               itemSynthesizePanel.showLevelLessPanel(nextLevelGoods.res.name,nextLevelGoods.res.limit_grade);
            }
         };
         switch(e.type)
         {
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SETEQUIPBTN_CLICK:
               super.chickItemToPanelFun = this.setItem;
               super.openBackpack();
               super.changeMouseStatus();
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_GETEQUIPBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.panelClose();
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENXINGFU:
               this.isUseZhenXingFu = e.data as Boolean;
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENHUNFU:
               this.isUseZhenHunFu = e.data as Boolean;
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_LUCKSTONE_COUNT:
               obj = e.data;
               BaseSynthesize.xingYunJingNum = obj.num;
               if(BaseSynthesize.xingYunJingNum > 0)
               {
                  if(obj.isSetMaterial)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"使用幸运晶数量",[BaseSynthesize.xingYunJingNum,BaseSynthesize.xingYunJingNum * OtherConst.XINGYUNJING_JILV]),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"使用幸运晶数量",[BaseSynthesize.xingYunJingNum,BaseSynthesize.xingYunJingNum * OtherConst.XINGYUNJING_JILV]),false);
                  }
               }
               super.setExpendGasAndProbability(null);
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_STARTBTN_CLICK:
               if(!super.equip)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                  return;
               }
               if(super.zhenQi > GameInstance.mainCharData.moneyInfo.copper)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("铜币不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("铜币不足"),false);
                  return;
               }
               if(!ItemPositionRange.inBag(super.equip.position))
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  return;
               }
               if(equip.bind == 0)
               {
                  if(BaseSynthesize.isBind == 1)
                  {
                     FAlert.show(LanResManager.getLanTextWords(this,"绑定提示",[StaticValue.WHITE_HTML]),"",2,next);
                  }
                  else if(BaseSynthesize.isXingYunJingBind == 1 && BaseSynthesize.xingYunJingNum > 0)
                  {
                     FAlert.show(LanResManager.getLanTextWords(this,"绑定提示",[StaticValue.WHITE_HTML]),"",2,next);
                  }
                  else
                  {
                     next();
                  }
               }
               else
               {
                  next();
               }
               break;
            case ItemSynthesizePanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_KEEP:
               this.showTip();
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_NEXT_IS_SHOW:
               this.isShowTip = e.data as Boolean;
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_OPTION:
               b = e.data as Boolean;
               if(b)
               {
                  this.send50117();
               }
         }
      }
      
      public function panelClose() : void
      {
         this.isUseZhenHunFu = this.isUseZhenXingFu = false;
         if(equip)
         {
            itemSynthesizePanel.getEquipSynthesizeEquip();
         }
         super.closePanel();
      }
      
      public function getbackItem() : void
      {
         var _loc1_:Goods = null;
         if(super.equip)
         {
            this.isShowFalertMsg = false;
            _loc1_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(super.equip.position);
            this.itemToPanel(_loc1_);
         }
      }
      
      private function showTip() : void
      {
         if(!this.isShowTip)
         {
            if(!this.isUseZhenXingFu || !this.isUseZhenHunFu)
            {
               itemSynthesizePanel.showEquipSynthesizeTip();
            }
            else
            {
               this.send50117();
            }
         }
         else
         {
            this.send50117();
         }
      }
      
      private function send50117() : void
      {
         var _loc1_:Object = {};
         _loc1_.XY = equip.position;
         _loc1_.ID = equip.id;
         _loc1_.zhenXingFuNum = this.isUseZhenXingFu ? 1 : 0;
         _loc1_.zhenHunFuNum = this.isUseZhenHunFu ? 1 : 0;
         _loc1_.xingYunJingNum = BaseSynthesize.xingYunJingNum;
         BaseSynthesize.addLoadBuffer();
         BaseSynthesize.sendMsgFun.send_50117(_loc1_);
         SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanTextWords(this,"新装备合成中");
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
            if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW)
            {
               _loc2_ = param1.getBaseItem() as Goods;
               this.itemToPanel(_loc2_);
               this.isShowFalertMsg = true;
            }
         }
      }
      
      private function itemToPanel(param1:Goods) : void
      {
         var _loc2_:Object = null;
         if(param1)
         {
            if(!ItemPositionRange.inBag(param1.position))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
               return;
            }
         }
         if(Boolean(param1 && param1.res) && Boolean(param1.res.kind == 2) && EquipMosaic.getEquipMosaicData(param1.id) > 1)
         {
            super.equip = param1;
            _loc2_ = {};
            _loc2_.XY = param1.position;
            _loc2_.ID = param1.id;
            _loc2_.type = 5;
            BaseSynthesize.tempData = _loc2_;
            BaseSynthesize.sendMsgFun.send_50125(_loc2_);
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            super.mouseToNormal();
         }
         else if(!param1)
         {
            this.panelClose();
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该装备不能合成为更高级的装备"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该装备不能合成为更高级的装备"),false);
         }
      }
   }
}

