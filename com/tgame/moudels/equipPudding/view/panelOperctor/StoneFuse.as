package com.tgame.moudels.equipPudding.view.panelOperctor
{
   import com.fireice.alert.FAlert;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.equipMosaic.EquipMosaic;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.EquipPuddingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   
   public class StoneFuse extends BaseStrengthen
   {
      
      private static var _stoneFuse:StoneFuse;
      
      private var isClickStone:Boolean = false;
      
      private var tempEquip:Goods;
      
      private var tempStone:Goods;
      
      private var isInStone:Boolean = false;
      
      private var isInEquip:Boolean = false;
      
      public function StoneFuse()
      {
         super();
      }
      
      public static function getStoneFuse() : StoneFuse
      {
         if(_stoneFuse == null)
         {
            _stoneFuse = new StoneFuse();
         }
         return _stoneFuse;
      }
      
      public function panelClose() : void
      {
         var _loc1_:Goods = null;
         if(super.equip)
         {
            this.getEquip();
         }
         if(super.stone)
         {
            this.getStone();
         }
         super.closePanel();
      }
      
      public function stoneSelete(param1:Array) : void
      {
         super.equipPuddingPanel.showStoneFuseStoneAttributeBestrow(param1);
      }
      
      private function getEquip() : void
      {
         var _loc1_:Goods = null;
         this.isInEquip = false;
         if(!this.isInStone)
         {
            PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         }
         super.zhenQi = super.gaiLv = 0;
         super.setExpendGasAndProbability(null);
         if(super.equip)
         {
            super.equip = null;
            _loc1_ = super.equipPuddingPanel.getStoneFuseEquip();
            this.tempEquip = _loc1_;
         }
         if(!super.stone)
         {
            BaseStrengthen.resumMouseStatus();
         }
         super.itemToBackage();
      }
      
      public function getStone() : void
      {
         var _loc1_:Goods = null;
         this.isInStone = false;
         if(!this.isInEquip)
         {
            PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         }
         if(super.stone)
         {
            super.stone = null;
            _loc1_ = super.equipPuddingPanel.getStoneFuseStone();
            this.tempStone = _loc1_;
         }
         if(!super.equip)
         {
            BaseStrengthen.resumMouseStatus();
         }
         super.itemToBackage();
      }
      
      public function getbackItem() : void
      {
         var _loc1_:Goods = null;
         if(super.equip)
         {
            this.isClickStone = false;
            _loc1_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(super.equip.position);
            this.itemToPanel(_loc1_);
         }
         if(super.stone)
         {
            this.isClickStone = true;
            _loc1_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(super.stone.position);
            this.itemToPanel(_loc1_);
         }
      }
      
      override public function addListener() : void
      {
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_SETEQUIPBTN_CLICK,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_STARTBTN_CLICK,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_USELUCKSTONE,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_SETSTONE,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_CANCEL,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_OK,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_GETEQUIPBTN_CLICK,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_GETSTONE,this.mainCharEquipPuddingHandle);
      }
      
      private function mainCharEquipPuddingHandle(param1:BaseEvent) : void
      {
         var _loc2_:Goods = null;
         var _loc4_:Object = null;
         var _loc5_:Goods = null;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_SETEQUIPBTN_CLICK:
               this.isClickStone = false;
               super.chickItemToPanelFun = this.setItem;
               super.openBackpack();
               super.changeMouseStatus(true);
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_GETEQUIPBTN_CLICK:
               this.getEquip();
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_STARTBTN_CLICK:
               if(!super.stone)
               {
                  FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请放入宝石") + "</font>");
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"请放入宝石");
                  return;
               }
               if(!super.equip)
               {
                  FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请放入装备") + "</font>");
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"请放入装备");
                  return;
               }
               if(super.zhenQi > GameInstance.mainCharData.attributeInfo.gqNow)
               {
                  FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("真气不足") + "</font>");
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"真气不足");
                  return;
               }
               _loc3_.equipXY = super.equip.position;
               _loc3_.equipID = super.equip.id;
               _loc3_.stoneXY = super.stone.position;
               _loc3_.stoneID = super.stone.id;
               _loc3_.xingYunJingNum = BaseStrengthen.xingYunJingNum;
               BaseStrengthen.addLoadBuffer();
               BaseStrengthen.sendMsgFun.send_50111(_loc3_);
               SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("宝石融合中");
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_USELUCKSTONE:
               _loc4_ = param1.data;
               BaseStrengthen.xingYunJingNum = _loc4_.num;
               if(BaseStrengthen.xingYunJingNum > 0)
               {
                  if(_loc4_.isSetMaterial)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"您选择使用了" + BaseStrengthen.xingYunJingNum + "个幸运晶，本次强化操作成功率将增加" + BaseStrengthen.xingYunJingNum * OtherConst.XINGYUNJING_JILV + "%");
                     NoticeManager.notify(NoticeManager.FOOT,"您选择使用了" + BaseStrengthen.xingYunJingNum + "个幸运晶，本次强化操作成功率将增加" + BaseStrengthen.xingYunJingNum * OtherConst.XINGYUNJING_JILV + "%");
                  }
               }
               super.setExpendGasAndProbability(null);
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_SETSTONE:
               this.isClickStone = true;
               super.chickItemToPanelFun = this.setItem;
               super.openBackpack();
               super.changeMouseStatus(true);
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_GETSTONE:
               this.getStone();
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_CANCEL:
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_OK:
               _loc5_ = param1.data as Goods;
               _loc3_.equipXY = this.equip.position;
               _loc3_.equipID = this.equip.id;
               _loc3_.newStoneXY = this.stone.position;
               _loc3_.newStoneID = this.stone.id;
               _loc3_.oldStoneID = _loc5_.id;
               _loc3_.xingYunJingNum = BaseStrengthen.xingYunJingNum;
               BaseStrengthen.sendMsgFun.send_50115(_loc3_);
         }
      }
      
      private function setItem(param1:ItemFace) : void
      {
         var _loc2_:Goods = null;
         if(param1 == null || !Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
         {
            return;
         }
         if(param1.getBaseItem() is Goods)
         {
            if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW)
            {
               _loc2_ = param1.getBaseItem() as Goods;
               this.itemToPanel(_loc2_);
            }
         }
      }
      
      private function itemToPanel(param1:Goods) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Goods = null;
         if(!param1)
         {
            if(this.isClickStone)
            {
               this.getStone();
            }
            else
            {
               this.panelClose();
            }
            return;
         }
         if(!this.isClickStone && param1.res.kind == 2 && EquipMosaic.getEquipMosaicData(param1.id) > 1)
         {
            super.equip = param1;
            super.equipPuddingPanel.setStoneFuseEquip(param1);
            _loc2_ = {};
            _loc2_.XY = param1.position;
            _loc2_.ID = param1.id;
            _loc2_.type = 4;
            BaseStrengthen.tempData = _loc2_;
            if(super.stone)
            {
               BaseStrengthen.sendMsgFun.send_50125(_loc2_);
            }
            this.isInEquip = true;
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            super.mouseToNormal();
         }
         else if(this.isClickStone && param1.res.kind == 6)
         {
            super.stone = param1;
            _loc3_ = new Goods(param1.id);
            _loc3_.count = 1;
            super.equipPuddingPanel.setStoneFuseStone(_loc3_);
            if(super.equip)
            {
               BaseStrengthen.sendMsgFun.send_50125(BaseStrengthen.tempData);
            }
            this.isInStone = true;
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            super.mouseToNormal();
         }
         else if(this.isClickStone && !this.isInStone)
         {
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("对不起，该物品不是宝石，不能放入宝石框") + "</font>");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("对不起，该物品不是宝石，不能放入宝石框"));
         }
         else if(!this.isClickStone && !this.isInEquip)
         {
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("对不起，该物品不能融合宝石") + "</font>");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("对不起，该物品不能融合宝石"));
         }
      }
   }
}

